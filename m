From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 6 Nov 2014 15:12:09 +0000
Subject: [Buildroot] [PATCH v2] exiv2: new package
In-Reply-To: <545B8ECE.9000208@sensefly.com>
References: <1415285886-11117-1-git-send-email-nicolas.serafini@sensefly.com>
 <545B8ECE.9000208@sensefly.com>
Message-ID: <545B8FC9.30305@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Serafini,

On 11/06/2014 03:07 PM, Nicolas Serafini wrote:
> Hi all,
> 
> Do not take into account this patch I was a little to fast.
> 
> v3 is comming

if you have an account in patchwork, you can change the state of your
own patches. So, when you send a new version of a patch, you can mark
the old one as superseded, for instance.

Or, if your patch is not ok are you have been asked to do some changes,
you can set the state to "Changes requested".

If you do that, people will not "waste" their time testing those patches
because they will know you are going to submit an updated version.

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com

> 
> Thanks,
> 
> Nicolas
> 
> Le 06. 11. 14 15:58, Nicolas Serafini a ?crit :
>> Add support for Exiv2 library and utility to manage image metadata
>>
>> Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
>>
>> ---
>> Changes v1 -> v2:
>>    - Make conditional GPLv2+/commercial license
>>    - Wrap Config.in to 72 columns
>>    - Leave default value for package source
>>
>> Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
>> ---
>>   package/Config.in        |  1 +
>>   package/exiv2/Config.in  | 34 ++++++++++++++++++++++++++++++++++
>>   package/exiv2/exiv2.hash |  4 ++++
>>   package/exiv2/exiv2.mk   | 33 +++++++++++++++++++++++++++++++++
>>   4 files changed, 72 insertions(+)
>>   create mode 100644 package/exiv2/Config.in
>>   create mode 100644 package/exiv2/exiv2.hash
>>   create mode 100644 package/exiv2/exiv2.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 28cf703..6abf344 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -625,6 +625,7 @@ menu "Graphics"
>>       source "package/adwaita-icon-theme/Config.in"
>>       source "package/atk/Config.in"
>>       source "package/cairo/Config.in"
>> +    source "package/exiv2/Config.in"
>>       source "package/fltk/Config.in"
>>       source "package/fontconfig/Config.in"
>>       source "package/freetype/Config.in"
>> diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
>> new file mode 100644
>> index 0000000..ada25fb
>> --- /dev/null
>> +++ b/package/exiv2/Config.in
>> @@ -0,0 +1,34 @@
>> +config BR2_PACKAGE_EXIV2
>> +    bool "exiv2"
>> +    help
>> +      Exiv2 is a C++ library and a command line utility to manage
>> +      image metadata.
>> +      It provides fast and easy read and write access to the Exif,
>> +      IPTC and XMP metadata of images in various formats.
>> +
>> +      Exiv2 is available with GPLv2+ or commercial license.
>> +
>> +      http://www.exiv2.org/
>> +
>> +if BR2_PACKAGE_EXIV2
>> +
>> +config BR2_PACKAGE_EXIV2_COMMERCIAL
>> +    bool "Enable commercial"
>> +    help
>> +      Build the commercial version for closed source project.
>> +      A commercial license request is needed.
>> +      http://www.exiv2.org/download.html#license
>> +
>> +config BR2_PACKAGE_EXIV2_PNG
>> +    bool "PNG image support"
>> +    select BR2_PACKAGE_ZLIB
>> +    help
>> +      Build with PNG image support
>> +
>> +config BR2_PACKAGE_EXIV2_XMP
>> +    bool "XMP support"
>> +    select BR2_PACKAGE_EXPAT
>> +    help
>> +      Build with XMP support
>> +
>> +endif
>> diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
>> new file mode 100644
>> index 0000000..d4f8c60
>> --- /dev/null
>> +++ b/package/exiv2/exiv2.hash
>> @@ -0,0 +1,4 @@
>> +# From http://www.exiv2.org/download.html
>> +md5 b8a23dc56a98ede85c00718a97a8d6fc exiv2-0.24.tar.gz
>> +# Locally calculated
>> +sha256
>> f4a443e6c7fb9d9f5e787732f76969a64c72c4c04af69b10ed57f949c2dfef8e
>> exiv2-0.24.tar.gz
>> diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
>> new file mode 100644
>> index 0000000..83c5e07
>> --- /dev/null
>> +++ b/package/exiv2/exiv2.mk
>> @@ -0,0 +1,33 @@
>> +################################################################################
>>
>> +#
>> +# exiv2
>> +#
>> +################################################################################
>>
>> +
>> +EXIV2_VERSION = 0.24
>> +EXIV2_SITE = http://www.exiv2.org
>> +EXIV2_INSTALL_STAGING = YES
>> +
>> +ifeq ($(BR2_PACKAGE_EXIV2_COMMERCIAL),y)
>> +EXIV2_LICENSE = commercial
>> +EXIV2_CONF_OPTS += --enable-commercial --disable-nls --disable-lensdata
>> +else
>> +EXIV2_LICENSE = GPLv2+ or commercial
>> +EXIV2_LICENSE_FILES = COPYING
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_EXIV2_PNG),y)
>> +EXIV2_CONF_OPTS += --with-zlib=$(STAGING_DIR)
>> +EXIV2_DEPENDENCIES += zlib
>> +else
>> +EXIV2_CONF_OPTS += --without-zlib
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_EXIV2_XMP),y)
>> +EXIV2_CONF_OPTS += --enable-xmp --with-expat=$(STAGING_DIR)/usr/lib
>> +EXIV2_DEPENDENCIES += expat
>> +else
>> +EXIV2_CONF_OPTS += --disable-xmp
>> +endif
>> +
>> +$(eval $(autotools-package))
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
