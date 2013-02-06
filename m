From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 06 Feb 2013 16:24:32 -0300
Subject: [Buildroot] [PATCHv3] util-linux: disable installing binaries
 by default
In-Reply-To: <511295FF.30002@mind.be>
References: <1360158623-19010-1-git-send-email-gustavo@zacarias.com.ar>
 <511295FF.30002@mind.be>
Message-ID: <5112ADF0.5010104@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/06/2013 02:42 PM, Arnout Vandecappelle wrote:
>> +config BR2_PACKAGE_UTIL_LINUX_BINARIES
>> +    bool "install utilities"
>> +    select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>> +    select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> 
>  Why is libmount selected? It wasn't selected before when you built just
> one binary, e.g. mount. Same for the other two, actually. Of course,
> it's possible that configure adds them implicitly anyway, I don't know
> that.

Because i'm explicitly disabling it otherwise in util-linux.mk
Don't want to hit build breakages by guessing what configure wants/needs
and if it's handled properly (maybe it is with this version and maybe
not in newer ones).

>> +    select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>> +    help
>> +      Install util-linux binaries.
> 
>  Maybe it's worth mentioning that selecting this option installs some
> binaries even if nothing is selected below.

"Install the basic set of util-linux binaries" ?
I'm not quite original making up a more verbose description at the moment.

> [snip]
>> @@ -87,6 +87,41 @@ HOST_UTIL_LINUX_CONF_OPT += \
>>       --disable-fallocate --disable-unshare --disable-rename \
>>       --disable-schedutils --disable-wall --disable-partx
>>
>> +# Avoid the basic utilities if we just want the libraries
>> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES),y)
>> +define UTIL_LINUX_INSTALL_BINARIES
>> +    $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
>> +endef
>> +endif
> 
>  Shouldn't there be an else here instead of endif? If you do a top-level
> install, there is no need to explicitly go into the subdirectories as well.

Noted for the next rev.
Regards.
