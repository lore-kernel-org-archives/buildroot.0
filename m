From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Apr 2017 00:14:27 +0200
Subject: [Buildroot] [PATCH v6 1/2] e2fsprogs: refactor to fix conflicts
 with busybox and util-linux
In-Reply-To: <1676973985.18543033.1491929963459.JavaMail.zimbra@datacom.ind.br>
References: <3eeb7e24-fcc2-8d75-e0e8-141eeaceab70@mind.be>
 <1491824995-19670-1-git-send-email-casantos@datacom.ind.br>
 <2282fd1a-5a83-0b42-4417-3aedf252d28b@mind.be>
 <1676973985.18543033.1491929963459.JavaMail.zimbra@datacom.ind.br>
Message-ID: <d478a120-5823-895e-c211-fe7e5a4f3017@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-04-17 18:59, Carlos Santos wrote:
>> From: "Arnout Vandecappelle" <arnout@mind.be>
>> To: "Carlos Santos" <casantos@datacom.ind.br>, buildroot at buildroot.org
>> Cc: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, "Yann E
>> . MORIN" <yann.morin.1998@free.fr>
>> Sent: Monday, April 10, 2017 9:45:05 AM
>> Subject: Re: [PATCH v6 1/2] e2fsprogs: refactor to fix conflicts with busybox and util-linux
[snip]
>>  Wow, you're changing way too much here in a single patch... Changing the
>> config into a menuconfig may be a good idea (we more or less decided that
>> starting from 5 suboptions it should be a menuconfig), but it certainly should
>> be a separate patch.
>>
>> I propose that you split up into:
>>
>> - config -> menuconfig
>>
>> - update upstream URL (with as commit log: "e2fsprogs.sf.net redirects to
>> e2fsprogs.sourceforge.net, so use that URL directly")
>>
>> - don't build uuid tools
>>
>> - remove options for basic set
>>
>> - add help text for remaining options
>>
>> - move from /usr/{bin,sbin} to /{bin,sbin}
>>
>> - whatever you're doing with host-e2fsprogs and for which no explanation is
>> given in the commit message
>>
>> I may have missed something that also needs to be split off, but this patch is
>> too complicated to detect even that :-)
> 
> Sorry, no.
> 
> I made a deep overhauling because the original recipe was so messy that
> small changes did not work. It is now reasonable to artificially split the
> change in seven patches now to end up with exactly the same result. It's
> harder to implement, test and review, considering all possible options I
> need to deal with:

 I agree that it's a little bit harder to implement, but not to test and review.
And it's pretty likely that you will not get the same result, because proper
review will be done, problems will be discovered, and you end up with a
different result :-)

 If you don't split this up, don't expect the patch to be applied for the next
year or so. The review burden is simply too high.

 In addition, most of the splits I mentioned hardly take any effort, and they
result in very simple patches that can be applied quickly. I can imagine that
you'll still have a quite big patch after that that does all the complicated
stuff, but that complicated patch will be half the size of this one.


> - glibc, musl or uClibc

 Doing a 'test-pkg -p e2fsprogs -r 10' takes about 5 minutes. Just about the
time it takes to write the commit message :-)

> - shared-only, static-only or shared/static libraries

 test-pkg covers this.

> - split or merged /bin|sbin and /usr/bin|sbin (triggered by systemd).

 This will actually be simplified by splitting up, because only the "move from
/usr/{bin,sbin} to /{bin,sbin}" part is affected by it.

[snip]
>>>  config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
>>>  	bool "e4defrag"
>>>  	depends on !BR2_nios2 # fallocate not implemented
>>>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # sync_file_range not impl
>>> +	help
>>> +	  Online defragmenter for ext4 filesystem
>>>  
>>>  comment "e4defrag needs a glibc or musl toolchain"
>>>  	depends on BR2_TOOLCHAIN_USES_UCLIBC
>>
>> Hm, looks like there is a
>> 	depends on !BR2_nios2
>> missing here...
> 
> Ok

 I should have been explicit, probably: that bit is completely unrelated, so it
should be a separate patch!

[snip]
>>> -# we don't have a host-util-linux
>>> -HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf
>>> +
>>> +HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux
>>
>> Actually I'm not sure if we really want to depend on host-util-linux... Why
>> should we?
> 
> Because host-e2fsprogs now ues libblkid and libuuid from util-linux.

 But you removed the select BR2_PACKAGE_UTIL_LINUX_LIBUUID... So for target, we
sometimes do use the libuuid from e2fsprogs? /me is confused...

> This prevents overriding them with e2fsprogs' ones, which may cause
> problems for other packages.
> ---
>>> +HOST_E2FSPROGS_CONF_OPTS = \
>>> +	--disable-defrag \
>>> +	--disable-fuse2fs \
>>> +	--bindir=$(HOST_DIR)/bin \
>>> +	--sbindir=$(HOST_DIR)/sbin \
>>> +	--enable-symlink-install \
>>> +	--disable-libblkid \
>>> +	--disable-libuuid \
>         ^^^^^^^^^^^^^^^^^^^^
>               Here
>>> +	--disable-e2initrd-helper \
>>> +	--disable-testio-debug \
>>> +	--disable-rpath
>>>  
>>> -ifeq ($(BR2_PACKAGE_E2FSPROGS_FUSE2FS),y)
>>> -E2FSPROGS_CONF_OPTS += --enable-fuse2fs
>>> -E2FSPROGS_DEPENDENCIES += libfuse
>>> -else
>>> -E2FSPROGS_CONF_OPTS += --disable-fuse2fs
>>> -endif
>>
>> Don't change this, it was better like that.
> 
> No, it was not. My change keeps all --enable/disable- together,
> improving readability.

 Begging to differ... Splitting up the DEPENDENCIES from the CONF_OPTS is less
readable.

 I actually don't consider the $(if $(...),--enable,--disable) construct very
readable. But it's historically like that so no need to change it.

> ---8<---
>>> -ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
>>> -# util-linux libuuid pulls in libintl if needed, so ensure we also
>>> -# link against it, otherwise static linking fails
>>> -E2FSPROGS_CONF_ENV += LIBS=-lintl
>>> -endif
>>
>> Why can this be removed? IIUC, e2fsprogs will now use the uuid from util-linux
>> if that is enabled, and will not use uuid at all if not. Correct? So if
>> util-linux libuuid is enabled, this is still needed, no?
> 
> Hum, adding a uClibc build to the test set. In fact the test can be
> 
>     ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_STATIC_LIBS),yy)

 Yes, but not really needed to change it. If you do, it should be a separate
patch :-).

> 
>>> -define E2FSPROGS_TARGET_MKE2FS_SYMLINKS
>>> -	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext2
>>> -	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext3
>>> -	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext4
>>> -	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext4dev
>>
>> Can you explain why this is no longer needed? I don't see how any of your other
>> changes could obviate this one...
>>
>> If it actually wasn't needed to begin with, please also make it a separate
>> patch with a good explanation.
> 
> Perhaps it was needed by old versions of e2fsprogs but with v1.43.4 the
> symlinks are created (see the --enable-symlink-install in *_CONF_OPTS).
> 
> Also, fsck.ext4dev and mkfs.ext4dev were dropped in v1.43.4, according
> to the release notes.

 OK. Include this explanation in the commit log of the patch removing the symlinks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
