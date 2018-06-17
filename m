From: Dan Walkes <danwalkes@trellis-logic.com>
Date: Sun, 17 Jun 2018 12:32:08 -0600
Subject: [Buildroot] [PATCH 1/1] package/hidapi: select glibc gconv libs
 copy
In-Reply-To: <20180617180709.y3czlfck7hh53biz@tarshish>
References: <1529257913-9183-1-git-send-email-danwalkes@trellis-logic.com>
 <20180617180709.y3czlfck7hh53biz@tarshish>
Message-ID: <CAAhKrJ13vgXZmyetZnYQCzcNHm7Uk-FihOWc3kjYOYBH-AM-gQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

>> diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
>> index f6a31ba..d02ec23 100644
>> --- a/package/hidapi/Config.in
>> +++ b/package/hidapi/Config.in
>> @@ -5,6 +5,7 @@ config BR2_PACKAGE_HIDAPI
>>       select BR2_PACKAGE_LIBUSB
>>       select BR2_PACKAGE_LIBGUDEV
>>       select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>> +     select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
>
> This does not work for external toolchains.
>
> Maybe just add a comment in the help text saying that fully featured build
> requires BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY.
>
>>       help
>>         HIDAPI is a multi-platform library which allows an application
>>         to interface with USB and Bluetooth HID-Class devices on
>

Sure, I could resubmit the patch with this text in addition:

---
diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
index d02ec23..7d79dab 100644
--- a/package/hidapi/Config.in
+++ b/package/hidapi/Config.in
@@ -11,6 +11,9 @@ config BR2_PACKAGE_HIDAPI
          to interface with USB and Bluetooth HID-Class devices on
          Windows, Linux, and Mac OS X.

+         When using an external toolchain configuration
BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY must be configured
+         to support parsing of USB string descriptors.
+
          http://www.signal11.us/oss/hidapi/

 comment "hidapi needs udev /dev management and a toolchain w/ NPTL threads"
---

Should I also add this comment to the kodi/Config.in at [1] as I used
this as the example?

[1]: https://github.com/buildroot/buildroot/commit/48a717343deabbf9aa8b09f0c2b6944bcb5a81d9
