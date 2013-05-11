From: Anders Darander <anders.darander@gmail.com>
Date: Sat, 11 May 2013 06:38:45 +0200
Subject: [Buildroot] [PATCH 3/5] am33x-cm3: add FW for suspend/resume
Message-ID: <CAE4k239uzqJGVwGSsP7AtrQrbcKqNbe3f1P5ix33U8rpge96EA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(Resend a as I first sent from an unsubcribed email).

Arnout Vandecappelle <arnout@mind.be> wrote:

>On 09/05/13 22:31, Anders Darander wrote:
>> From: Anders Darander <anders@chargestorm.se>
>>
>> Without this firmware, the beaglebone won't be able to reboot
>correctly.
>>
>> Signed-off-by: Anders Darander <anders@chargestorm.se>
>[snip]
>> diff --git a/package/am33x-cm3/am33x-cm3.mk
>b/package/am33x-cm3/am33x-cm3.mk
>> new file mode 100644
>> index 0000000..6180157
>> --- /dev/null
>> +++ b/package/am33x-cm3/am33x-cm3.mk
>> @@ -0,0 +1,26 @@
>> +#############################################################
>> +#
>> +# am33x-cm3
>> +#
>> +#############################################################
>> +
>> +# SHA1 corresponds to tag "AM335xPSP_04.06.00.10-rc1"
>> +AM33X_CM3_VERSION = 27ca4643e422245a95723de1df0247a00eada45b
>
>  If it is a tag, then use the tag, not the sha1.

Ok, I'll double check that the tag exists and update the patch.

>> +AM33X_CM3_SITE = git://arago-project.org/git/projects/am33x-cm3.git
>> +AM33X_CM3_METHOD = git
>
>  Since the site starts with git://, the method is git by default.

I didn't get the fetcher to actually try git unless I added the method
explicitly. All my previous ?ries ended with wget errors.

>However, if the site supports http, we prefer to use that. Some company
>
>firewalls block git.

Ok I'll lade if I can find out if http is available.

>> +AM33X_CM3_LICENSE = TI-BSD
>
>I don't really like this license name. Either it's BSD (then it should
>specify 2-, 3- or 4-clause), or it is not. In the latter case, it would
>
>be something like "TI Open Source license (BSD-like)".

To be honest, I merely used what TI is using in their own BSP. I'll see
what it reads like.

>> +AM33X_CM3_LICENSE_FILES = License.txt
>> +
>> +define AM33X_CM3_BUILD_CMDS
>> + $(MAKE) CC="$(TARGET_CC)" CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
>all
>
>Does it work with $(TARGET_CONFIGURE_OPTS) instead of CC=? If not, then
>
>please also pass the CFLAGS and LDFLAGS - they may be important.
>
>However, now I think about it - this is abusing the cross-compiler for
>the Cortex-A8 to generate code for the Cortex-M3, correct? In that
>case,
>passing CFLAGS and LDFLAGS is probably not a good idea. But it would
>also
>be good to add a note about what is happening here.

I'll add a comment on this. Once again, the technique is taken from the
TI's BSP.

>> +endef
>> +
>> +# Not all of the firmware files are used
>> +define AM33X_CM3_INSTALL_TARGET_CMDS
>> + $(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/
>> + $(INSTALL) -m 0644 $(@D)/bin/am335x-pm-firmware.bin
>$(TARGET_DIR)/lib/firmware
>
>  We normally create directories with the -D option to install, so:
>
> $(INSTALL) -m 0644 -D  $(@D)/bin/am335x-pm-firmware.bin \
> $(TARGET_DIR)/lib/firmware/am335x-pm-firmware.bin

Ok, I'll fix that.

>> + $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/init.d
>> + $(INSTALL) -m 0755 package/am33x-cm3/am335x-pm-firmware-load
>$(TARGET_DIR)/etc/init.d/S93-am335x-pm-firwmare-load
>
>  init scripts are installed by a separate variable,
>AM33X_CM3_INSTALL_INIT_SYSV. And of course, the same remark about the
>-D
>option applies.

Thanks, I'm fox that too.

Does that make it install when using busybox init also?

Thanks for the feedback!

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB          Tel: +46 702 44 84 36
Laxholmstorget 3        Email: anders at chargestorm.se
602 21 Norrk?ping       Web: www.chargestorm.se

Sent from my Android phone with K-9 Mail. Please excuse my brevity.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130511/aa443ece/attachment.html>
