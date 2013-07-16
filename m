From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 16 Jul 2013 10:46:39 -0500
Subject: [Buildroot] [RFC 1/3] a10disp: new package
In-Reply-To: <20130716102113.49645177@skate>
References: <1373778632-16531-1-git-send-email-spenser@gillilanding.com>
 <1373778632-16531-2-git-send-email-spenser@gillilanding.com>
 <20130716102113.49645177@skate>
Message-ID: <CAEBucnATvZt+cFeu3HGV-gQxiTTuPGYnfzbK8zVaXEitq0aLPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> Dear Spenser Gilliland,
>
> Great to see the beginning of the work on Allwinner devices!

> I'd make this a little bit more explicit:
>
>           Program to change the display mode on Allwinner ARM SOCs
>           running the linux-sunxi kernel (and not the mainline kernel).

Will fix.

>> +
>> +       http://github.com/hglm/a10disp
>> +
>> +comment "a10disp requires the linux kernel"
>> +     depends on !(BR2_LINUX_KERNEL) && BR2_arm
>
> Parenthesis not needed.

Will fix.

>> diff --git a/package/a10disp/a10disp.mk b/package/a10disp/a10disp.mk
>> new file mode 100644
>> index 0000000..bac515a
>> --- /dev/null
>> +++ b/package/a10disp/a10disp.mk
>> @@ -0,0 +1,21 @@
>> +################################################################################
>> +#
>> +# a10disp
>> +#
>> +################################################################################
>> +
>> +A10DISP_VERSION = a899cc6dcf
>> +A10DISP_SITE = http://github.com/hglm/a10disp/tarball/$(A10DISP_VERSION)
>> +
>> +A10DISP_DEPENDENCIES = linux
>> +
>> +define A10DISP_BUILD_CMDS
>> +   cp -f $(LINUX_DIR)/include/video/sunxi_disp_ioctl.h $(@D)/
>> +   cd $(@D) && $(TARGET_CC) -Wall -O a10disp.c -o a10disp
>
> Tabs preferred for indentation here. Also, hardcoding the -Wall and -O
> flags is not really great. Instead, can we do something like:

Sometimes I think vim is randomly choosing indentation for me.  Will fix.

>         cp -f $(LINUX_DIR)/include/video/sunxi_disp_ioctl.h $(@D)/
>         $(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/a10disp $(@D)/a10disp.c
>
>> +endef
>> +
>> +define A10DISP_INSTALL_TARGET_CMDS
>> +     $(INSTALL) -m 0755 $(@D)/a10disp $(TARGET_DIR)/usr/bin/
>
>         $(INSTALL) -D -m 0755 $(@D)/a10disp $(TARGET_DIR)/usr/bin/a10disp

Will fix.

Thanks,
Spenser
