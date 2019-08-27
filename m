From: =?UTF-8?Q?Alejandro_Gonz=c3=a1lez?= <alejandro.gonzalez.correo@gmail.com>
Date: Tue, 27 Aug 2019 12:56:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/iputils: add configs to select
 which binaries are built
In-Reply-To: <afec5004-19b6-58d1-e818-e4af4303411d@mind.be>
References: <20190826173751.13832-1-alejandro.gonzalez.correo@gmail.com>
 <afec5004-19b6-58d1-e818-e4af4303411d@mind.be>
Message-ID: <f2bfc0d5-e5a5-216b-08b7-7fd5a7ceaa0f@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout. Thank you very much for your insightful comment.

El 26/8/19 a las 23:33, Arnout Vandecappelle escribi?:
>  Hi Alejandro,
> 
> On 26/08/2019 19:37, Alejandro Gonz?lez wrote:
>> By default, the iputils build script might build binaries which are
>> useless for certain applications, like tftpd. Those binaries will bloat
>> the target filesystem unless a post-build script removes them manually,
>> which is cumbersome and doesn't shorten build times.
> 
>  Generally, we only add such options if the space savings are significant. Could
> you indicate how much can be saved? It's sufficient to just compare the size of
> 1 tool with the size of all together (and for good measure, the total filesystem
> size as well).

Of course! I have just taken some numbers on a Buildroot toolchain I have already
set up for a project. It uses GCC 8.3 configured to optimize for speed for the
aarch64 arquitecture, with v8 floating point operations, musl C library, and the
latest binutils version offered by buildroot. The binaries are stripped from debugging
symbols, and the host is an usual amd64 laptop. All of the measures have been taken
with the same configuration, same host PC and the same Buildroot version, with this
patch applied.

These were the commands I've executed to measure the sizes, in the order that is shown:
$ make menuconfig
(Here I changed the relevant iputils configs. I left the rest as they were)
$ make iputils-dirclean
(To force iputils to rebuild with the latest config)
$ rm -rf target/ && find -name ".stamp_target_installed" -exec rm -f {} \;
(To force the target filesystem files to be regenerated from stratch)
$ make
$ du --block-size=1024 --summarize --apparent-size target/
(To measure the total size of the target files)

I've repeated them three times, to get three different measures. Without iputils
selected, the target folder size was 34669 KiB. With iputils selected, but only
the ping binary selected, the size increased to 34732 KiB (34732 - 34669 = 63 KiB
more). WIth every iputils option selected, the size jumped to 34888 KiB (34888 -
34669 = 219 additional KiB). It might seem that ~200 KiB are not worth optimizing
in general, but if we take into account that by only selecting the ping binary we
can save a 71.2% of the full iputils package size, one might agree that in relative
terms the savings are notorious.

On the other hand, I've been thinking that reducing the target filesystem size
would not be the only use of this patch (let's be honest, ~200 KiB are not much
these days :-) ). I've noticed that upstream recently disabled building tftpd by
default: https://github.com/iputils/iputils/commit/737d8a91e394518d2ccdaf398bb16283eb8e4a81 .
The day that a version with this commit in it comes to Buildroot, there might be
users who complain about iputils no longer shipping the tftpd implementation they
use for PXE booting, and that could make the updating process more difficult if
Buildroot doesn't enable the corresponding build flag manually. And other binaries
in the package may suffer the same fate; we don't know. This patch implicitly provides a
"line of defense" against such potentially breaking upgrades with no end user and
Buildroot developers effort, and my opinion is that this might be its most compelling
reason to apply. Moreover, the generic security advantage of reducing the attack
surface by only having the networking daemons you need installed apply, too. And,
if someone is still using the relic of RARP these days, he or she will find useful
being able to select the rarpd daemon for building.

Should I edit the commit description to reflect these other potential reaasons for
this patch?

> [snip]
>> +config BR2_PACKAGE_IPUTILS_NINFOD
>> +	bool "ninfod"
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # ninfod requires <pthread.h>
> 
>  It also requires a crypto package, according to the .mk file. So you should add
> something like:
> 
> 	select BR2_PACKAGE_NETTLE if !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_OPENSSL
> 
(snip)
>  Since no dependencies need to be added here, we generally prefer the following
> pattern:
> 
> IPUTILS_CONF_OPTS = \
> 	-DBUID_ARPING=$(if $(BR2_PACKAGE_IPUTILS_ARPING),true,false) \
> 	...
> 
> (but it's not so important)
> 
>  On the other hand, we also like it if a condition is checked only once, and all
> modifications that need to be done for that condition are collected below it. So
> you'd have something like:
> 
> ifeq ($(BR2_PACKAGE_IPUTILS_ARPING),y)
> IPUTILS_CONF_OPTS += -DBUILD_ARPING=true
> ... define hook
> ... add arping to permissions
> else
> IPUTILS_CONF_OPTS += -DBUILD_ARPING=false
> endif
> 
>  However, the "add arping to permissions" bit is not so easy to do :-(
> 
> [snip]
>>  ifeq ($(BR2_PACKAGE_LIBCAP),y)
>>  IPUTILS_CONF_OPTS += -DUSE_CAP=true
>>  IPUTILS_DEPENDENCIES += libcap
>> @@ -49,57 +111,74 @@ IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
>>  IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
> 
>  This bit can be removed since it's already handled by the Config.in.
> 
(snip)
>>  # move iputils binaries to the same location as where Busybox installs
>>  # the corresponding applets, so that we have a single version of the
>>  # tools (from iputils)
>> -define IPUTILS_MOVE_BINARIES
>> +define IPUTILS_MOVE_ARPING_BINARY
>>  	mv $(TARGET_DIR)/usr/bin/arping $(TARGET_DIR)/usr/sbin/arping
>> +endef
>> +ifeq ($(BR2_PACKAGE_IPUTILS_ARPING),y)
> 
>  For hooks, we generally also put the hook definition inside the condition. So
> just move the ifeq just before the define.
> 
>> +IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_ARPING_BINARY
>> +endif
>> +
>> +define IPUTILS_MOVE_PING_BINARY
>>  	$(if $(BR2_ROOTFS_MERGED_USR),,\
> 
>  This could be simplified together with the ping condition, into:
> 
> ifeq ($(BR2_PACKAGE_IPUTILS_PING):$(BR2_ROOTFS_MERGED_USR),y:)
> define IPUTILS_MOVE_PING_BINARY
> 	mv $(TARGET_DIR)/usr/bin/ping $(TARGET_DIR)/bin/ping)
> endef
> IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_PING_BINARY
> endif
> 

I agree on that with those refactorings the code could look more elegant.
I appreciate you took some time to explain them, and I will apply them
in the next version of this patch.

(snip)
>>  # handle permissions ourselves
>>  IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
>>  ifeq ($(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),y)
>>  define IPUTILS_PERMISSIONS
>> -	/usr/sbin/arping      f 755 0 0 - - - - -
>> -	/usr/bin/clockdiff    f 755 0 0 - - - - -
>> -	|xattr cap_net_raw+p
>> -	/bin/ping             f 755 0 0 - - - - -
>> -	|xattr cap_net_raw+p
>> -	/usr/bin/traceroute6  f 755 0 0 - - - - -
>> -	|xattr cap_net_raw+p
>> +	$(if $(BR2_PACKAGE_IPUTILS_ARPING),y,\
> 
>  I guess you haven't tested this, because it's wrong :-) $(if ...) is not like
> ifeq, it can only check for non-empty. So if should be
> 
> 	$(if $(BR2_PACKAGE_IPUTILS_ARPING),\
> 

Indeed, my tests didn't show up my mistake there. I've noticed it on other parts of the
code and fixed them before submitting, but I forgot about that one. Thank you for
pointing that out! :-)

> 
>  This is getting pretty ugly though... But I don't see an easy way to make it
> better.
> 
>  Regards,
>  Arnout

Agreed. I'm open to more suggestions about how can I make this better.

Regards.
