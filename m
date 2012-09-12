From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Wed, 12 Sep 2012 03:05:26 +0300
Subject: [Buildroot] [PATCH 5/9] firefox: installing default extensions
 needs host-unzip dependency
In-Reply-To: <504FBA20.9010602@mind.be>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-6-git-send-email-stefan.froberg@petroprogram.com>
 <504FBA20.9010602@mind.be>
Message-ID: <504FD1C6.6090109@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

12.9.2012 1:24, Arnout Vandecappelle kirjoitti:
> On 09/05/12 16:29, Stefan Fr?berg wrote:
>>
>> Signed-off-by: Stefan Fr?berg<stefan.froberg@petroprogram.com>
>> ---
>>   package/Config.in                       |    1 +
>>   package/unzip/Config.in                 |    8 ++++
>>   package/unzip/unzip-respect-flags.patch |   23 +++++++++++
>>   package/unzip/unzip.mk                  |   66
>> +++++++++++++++++++++++++++++++
>>   4 files changed, 98 insertions(+), 0 deletions(-)
>>   create mode 100644 package/unzip/Config.in
>>   create mode 100644 package/unzip/unzip-respect-flags.patch
>>   create mode 100644 package/unzip/unzip.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index e129522..636caf8 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -13,6 +13,7 @@ source "package/gzip/Config.in"
>>   endif
>>   source "package/lzop/Config.in"
>>   source "package/lzma/Config.in"
>> +source "package/unzip/Config.in"
>>   source "package/xz/Config.in"
>>   endmenu
>>
>> diff --git a/package/unzip/Config.in b/package/unzip/Config.in
>> new file mode 100644
>> index 0000000..f4fc111
>> --- /dev/null
>> +++ b/package/unzip/Config.in
>> @@ -0,0 +1,8 @@
>> +config BR2_PACKAGE_UNZIP
>> +    bool "unzip"
>> +    help
>> +      The UnZip package contains ZIP extraction utilities. These are
>> useful for extracting files from
>> +      ZIP archives. ZIP archives are created with PKZIP or Info-ZIP
>> utilities, primarily in a DOS
>> +      environment.
>
>  Wordwrap at 80 columns
>
Ok

>> +
>> +      http://downloads.sourceforge.net/infozip/
>> diff --git a/package/unzip/unzip-respect-flags.patch
>> b/package/unzip/unzip-respect-flags.patch
>> new file mode 100644
>> index 0000000..35c8314
>> --- /dev/null
>> +++ b/package/unzip/unzip-respect-flags.patch
>> @@ -0,0 +1,23 @@
>
>  Please add a comment at the top of the patch.
>
> - Why is it needed
>
> - Upstream status, if applicable
>
> - Signed-of-by line
>
>  Also upstreaming the patch would be useful.
>
Okay

>> +diff -Naur unzip60.org/unix/Makefile unzip60/unix/Makefile
>> +--- unzip60.org/unix/Makefile    2012-09-02 21:29:55.944176704 +0300
>> ++++ unzip60/unix/Makefile    2012-09-02 21:31:20.276176583 +0300
>> +@@ -808,8 +808,8 @@
>> + # systems.)
>> + linux:        unix_make
>> +     @echo 'NOTE:  use linux_noasm target for non-Intel Linux
>> compiles.'
>> +-    $(MAKE) unzips CC=gcc LD=gcc AS=gcc\
>> +-     CFLAGS="-O3 -Wall -DASM_CRC"\
>> ++    $(MAKE) unzips CC=$(CC) LD=$(CC) AS=$(CC)\
>
>  $(CC) should be quoted: "$(CC)"
>
>> ++     CFLAGS="$(CFLAGS) -DASM_CRC"\
>> +      AF="-Di386 $(AF)" CRCA_O=crc_gcc$O
>> + # GRR:  this echo is pointless; if user gets this far, no
>> difference to install
>> + #    @echo 'Be sure to use the install_asm target rather than the
>> install target'
>> +@@ -819,7 +819,7 @@
>> + # Linux (Posix, approximately SysV):  virtually any version since
>> before 0.96,
>> + # for any platform.  Change "-O" to "-O3" or whatever, as desired...
>> + linux_noasm:    unix_make
>> +-    $(MAKE) unzips CC=gcc LD=gcc CFLAGS="-O -Wall"
>> ++    $(MAKE) unzips CC=$(CC) LD=$(CC) CFLAGS="$(CFLAGS)"
>
>  Same here.
>
>  Wouldn't it be easier to run this $(MAKE) unzips command from the .mk
> file,
> instead of going through the linux[_noasm] target?
>
Ummm....
Yea, I guess so
>> +
>> + # Linux with lcc compiler:  __inline__ (stat.h) not recognized, and
>> must edit
>> + # /usr/include/gnu/types.h to get rid of "long long" if __LCC__
>> defined.  -O3
>> diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
>> new file mode 100644
>> index 0000000..fdfbe9f
>> --- /dev/null
>> +++ b/package/unzip/unzip.mk
>> @@ -0,0 +1,66 @@
>> +###################################################################
>> +#
>> +# unzip
>> +#
>> +# quickly hacked from:
>> +# http://www.linuxfromscratch.org/blfs/view/svn/general/unzip.html
>> +###################################################################
>> +
>> +UNZIP_MAJOR_VERSION = 6
>> +UNZIP_MINOR_VERSION = 0
>> +UNZIP_VERSION = $(UNZIP_MAJOR_VERSION).$(UNZIP_MINOR_VERSION)
>> +UNZIP_SOURCE = unzip$(UNZIP_MAJOR_VERSION)$(UNZIP_MINOR_VERSION).tar.gz
>
>  Why not just call it version 60?  Then the _SOURCE line isn't
> needed.
>
Ok

>> +UNZIP_SITE = http://downloads.sourceforge.net/infozip
>> +UNZIP_LICENSE = Info-ZIP
>> +UNZIP_LICENSE_FILES = LICENSE
>> +
>> +# No point of doing optimized build for host version,
>> +# so we build host version without any x86 specific asm stuff
>> +define HOST_UNZIP_BUILD_CMDS
>> +    (cd $(@D); \
>> +    sed -i -e 's/CFLAGS="-O -Wall/&  -DNO_LCHMOD/' unix/Makefile ; \
>
>  This isn't needed anymore with the patch above, right?
>

That -DNO_LCHMOD is needed. I remember build process starting
complaining about it.

>> +    $(MAKE) -f unix/Makefile linux_noasm )
>> +endef
>> +
>> +define HOST_UNZIP_INSTALL_CMDS
>> +    (cd $(@D); \
>> +    $(MAKE) prefix=$(HOST_DIR)/usr install )
>
>  We normally use $(MAKE) -C $(@D) instead of cd $(@D)
>
>> +endef
>> +
>> +# If you do have busybox installed in your target (like most do)
>> +# and if you have by accident also enabled unzip support in
>> +# your busybox configuration file, then guess what happens
>> +# after insallation of the real unzip application ?
>> +#
>> +# Yep, UNZIP_INSTALL_TARGET_CMDS will happily
>> +# write to your unzip ->  /bin/busybox symlink
>> +# and overwrite your busybox ... :-(
>> +#
>> +# That's why I included this as an primitive safety mechanism.
>> +# Improvement are wellcome
>
>  AFAIK, install removes a symlink before installing, so busybox
> itself shouldn't be overwritten.  To make sure the full unzip is
> installed instead of the busybox unzip, you do:
>

But when I chrooted inside target system after building
it just spew unzip version stuff out and it had overwrited my busybox
binary.

> UNZIP_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
>
>  That way, busybox is installed first and unzip will overwrite
> the busybox symlink.  It's done like that for a lot of packages.
>
Ok, Ill try and see.

>> +
>> +ifneq ($(BR2_PACKAGE_BUSYBOX),y)
>> +ifeq ($(BR2_i386),y) || ($(BR2_x86_64),y)
>> +# Intel x86 asm optimized version
>> +define UNZIP_BUILD_CMDS
>> +    (cd $(@D);\
>> +    sed -i -e 's/DASM"/DASM -DNO_LCHMOD"/' unix/Makefile;\
>> +    $(MAKE) -f unix/Makefile $(TARGET_MAKE_ENV)
>> $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -DNO_LCHMOD"
>> CC=$(TARGET_CC) LD=$(TARGET_LD) AS=$(TARGET_AS) linux )
>
>  CC="$(TARGET_CC)" should be quoted.  But anyway, it's already in
> $(TARGET_CONFIGURE_OPTS) so that can be left out.  For the CFLAGS,
> I believe it's possible to use CFLAGS+=-DNO_LCHMOD.
>
Ok. Ill make a new patch after I have had some sleep.

Thank you for taking time with these.
I really appreciate it.

Stefan

P.S:

Have you had time to check firefox patch #9 ? The gnash patch ?

I have somehow managed to broke my sytem config
(maybe some change I recently made to mesa3d package)
and now I can't build it anymore.
:-(

It start's complaining about missing
 -lselinux, security library used by Fedora that gnash  is not even
using ...
:-(

> [snip]
>
>  Regards,
>  Arnout
>
