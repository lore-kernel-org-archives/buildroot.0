From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Tue, 5 Jul 2016 11:46:55 +0200
Subject: [Buildroot] [PATCH 1/2 v2] spidermonkey185: New package.
In-Reply-To: <CAGduivxXrJYZRt28=TOTbtBcZ4yd5jYO1NkTV1M8fMgCbni-_w@mail.gmail.com>
References: <20160520162929.04ca1b1b@free-electrons.com>
 <1465483576-28267-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <1465483576-28267-2-git-send-email-nicolas.cavallari@green-communications.fr>
 <CAGduivxXrJYZRt28=TOTbtBcZ4yd5jYO1NkTV1M8fMgCbni-_w@mail.gmail.com>
Message-ID: <7a047c02-21c4-0dc9-7e76-74e8335768d6@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/07/2016 23:37, Maxime Hadjinlian wrote:
> Hi Nicolas, all,
> 
> Thanks for your patch, I look forward to have spidermonkey, because we
> can then update polkit, which is a long standing issue for me.
> My comments are inline.
> 
> Some of your patches did not apply on the sources, I would recommend
> that you  extract the sources, then move the directory somehere and do
> a 'git init' then 'git add . && git commit -m "init"' and work in that
> directory, when you are finished you can use 'git format-patch HEAD~n'
> and collect your patch in a mailbox format.

It works for me. How/why does it fails for you ?

>>> spidermonkey185 1.0.0 Patching

Applying 0001-remove-unused-pkgconfg-nspr-dependency.patch using patch:
patching file js/src/mozjs185.pc.in

Applying 0002-make-shlib-synlink-relative.patch using patch:
patching file js/src/Makefile.in

Applying 0003-remove-forced-armv5.patch using patch:
patching file js/src/configure.in

Applying 0004-regenerate-configure.patch using patch:
patching file js/src/configure

Applying 0005-Fix-jsval_layout-on-64-bit-big-endian-platforms.patch
using patch:
patching file js/src/jsval.h
patching file js/src/jsvalue.h

Applying
0006-Remove-bad-static-assert-fix-strict-aliasing-warnings.patch using
patch:
patching file js/src/jsval.h
patching file js/src/jsvalue.h

Applying
0007-Avoid-missing-cacheFlush-support-error-on-exotic-platforms.patch
using patch:
patching file js/src/Makefile.in


> Don't forget to add your SoB to the patches.

I added SoB lines to patches that I wrote. Should i add SoB to patches
that i didn't write, but merely picked from upstream and
backported/refreshed ?

> I have marked your two patches as "Changes Requested", you only have
> to resend your patches when they are amended (of course you don't have
> to agree on all the comments, feel free to discuss).
> 
> On Thu, Jun 9, 2016 at 4:46 PM, Nicolas Cavallari
> <nicolas.cavallari@green-communications.fr> wrote:
>> This is the old 1.8.5 branch of spidermonkey, used in Firefox 4.
>> It is rather unmaintained, but some software still depend on it,
>> such as couchdb.
>>
>> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>> ---
>> v1 -> v2:
>> * Moved package to Libraries/Other
>> * Tried to make the package reconfigurable, but stopped when the patch
>>   grew even larger than previous patches.  Instead, simplified the patch
>>   to not force a specific arm version, to make the configure patch smaller.
>> * Added patches to fix DESTDIR being embedded in the symlink and
>>   remove the leftover nspr dependency.
>> * Added comment on why we define symbols for the host compiler.
>> * Added upstream patches to fix problems on various architectures,
>>   taking inspiration for the patches that Debian uses.
>> * Disabled the JIT on sparc64 because that does not compile.
>> * Added host-perl and host-python, because they are used to build.
>> * Changed license as per Arnout suggestion
>>
>>  package/Config.in                                  |   1 +
>>  ...01-remove-unused-pkgconfg-nspr-dependency.patch |  18 +
>>  .../0002-make-shlib-synlink-relative.patch         |  21 +
>>  .../spidermonkey185/0003-remove-forced-armv5.patch |  40 ++
>>  .../0004-regenerate-configure.patch                | 470 +++++++++++++++++++++
>>  ...val_layout-on-64-bit-big-endian-platforms.patch |  90 ++++
>>  ...tatic-assert-fix-strict-aliasing-warnings.patch |  93 ++++
>>  ...heFlush-support-error-on-exotic-platforms.patch |  33 ++
>>  package/spidermonkey185/Config.in                  |  14 +
>>  package/spidermonkey185/spidermonkey185.hash       |   2 +
>>  package/spidermonkey185/spidermonkey185.mk         |  33 ++
>>  11 files changed, 815 insertions(+)
>>  create mode 100644 package/spidermonkey185/0001-remove-unused-pkgconfg-nspr-dependency.patch
>>  create mode 100644 package/spidermonkey185/0002-make-shlib-synlink-relative.patch
>>  create mode 100644 package/spidermonkey185/0003-remove-forced-armv5.patch
>>  create mode 100644 package/spidermonkey185/0004-regenerate-configure.patch
>>  create mode 100644 package/spidermonkey185/0005-Fix-jsval_layout-on-64-bit-big-endian-platforms.patch
>>  create mode 100644 package/spidermonkey185/0006-Remove-bad-static-assert-fix-strict-aliasing-warnings.patch
>>  create mode 100644 package/spidermonkey185/0007-Avoid-missing-cacheFlush-support-error-on-exotic-platforms.patch
>>  create mode 100644 package/spidermonkey185/Config.in
>>  create mode 100644 package/spidermonkey185/spidermonkey185.hash
>>  create mode 100644 package/spidermonkey185/spidermonkey185.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index ae74f17..4729b63 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1284,6 +1284,7 @@ endif
>>         source "package/protobuf-c/Config.in"
>>         source "package/qhull/Config.in"
>>         source "package/qlibc/Config.in"
>> +       source "package/spidermonkey185/Config.in"
>>         source "package/startup-notification/Config.in"
>>         source "package/tz/Config.in"
>>         source "package/tzdata/Config.in"
>> diff --git a/package/spidermonkey185/0001-remove-unused-pkgconfg-nspr-dependency.patch b/package/spidermonkey185/0001-remove-unused-pkgconfg-nspr-dependency.patch
>> new file mode 100644
>> index 0000000..cef1aae
>> --- /dev/null
>> +++ b/package/spidermonkey185/0001-remove-unused-pkgconfg-nspr-dependency.patch
>> @@ -0,0 +1,18 @@
>> +From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>> +
>> +Remove the dependency on nspr.
>> +
>> +This dependency was removed when spidermonkey was extracted from the
>> +mozilla code base.  This is probably a left-over, since it is not used.
>> +
>> +Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>> +
>> +--- spidermonkey185-1.0.0/js/src/mozjs185.pc.in        2016-05-23 13:41:28.430466213 +0200
>> ++++ spidermonkey185-1.0.0/js/src/mozjs185.pc.in        2016-05-23 13:42:00.727558977 +0200
>> +@@ -5,6 +5,5 @@
>> + Name: SpiderMonkey 1.8.5
>> + Description: The Mozilla library for JavaScript 1.8.5
>> + Version: %MOZILLA_VERSION%
>> +-Requires: nspr >= 4.7
>> + Libs: -L${libdir} -lmozjs185
>> + Cflags: -I${includedir}/js
>> diff --git a/package/spidermonkey185/0002-make-shlib-synlink-relative.patch b/package/spidermonkey185/0002-make-shlib-synlink-relative.patch
>> new file mode 100644
>> index 0000000..c6bdce9
> 
> When I quickly grepped through the source, you can still find:
> js/jsd/jsd_xpc.h:47:#include "nspr.h"
> 
> Won't that cause trouble ? Since we have libnspr, why don't we add the
> dependencies and be done with it ?

Anything outside of js/src is ignored.  Specifically, js/jsd has no
complete build system (there is Makefile.in, but no configure script),
so it cannot cause any problem.

And why should we re-add libnspr when upstream did massive patches to
get rid of it, even if they missed some places ?

>> diff --git a/package/spidermonkey185/0003-remove-forced-armv5.patch b/package/spidermonkey185/0003-remove-forced-armv5.patch
>> new file mode 100644
>> index 0000000..f68bc92
>> --- /dev/null
>> +++ b/package/spidermonkey185/0003-remove-forced-armv5.patch
>> @@ -0,0 +1,40 @@
>> +From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>> +
>> +Do not force an ARM variant.
>> +
>> +Buildroot already passes the correct CFLAGS.
>> +
>> +Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>> +
>> +--- spidermonkey185-1.0.0/js/src/configure.in  2016-05-23 17:10:59.166657848 +0200
>> ++++ spidermonkey185-1.0.0/js/src/configure.in  2016-05-23 17:11:21.987444482 +0200
>> +@@ -4654,12 +4654,6 @@
>> + dnl ========================================================
>> + MOZ_ARG_HEADER(Individual module options)
>> +
>> +-dnl Setup default CPU arch for arm target
>> +-case "$target_cpu" in
>> +-  arm*)
>> +-    MOZ_ARM_ARCH=armv7
>> +-  ;;
>> +-esac
>> + dnl ========================================================
>> + dnl = Enable building the Thumb2 instruction set
>> + dnl ========================================================
>> +@@ -4714,16 +4708,6 @@
>> +       AC_MSG_ERROR([--with-cpu-arch=armv7 is not supported for non-ARM CPU architectures])
>> +     ;;
>> +   esac
>> +-else
>> +-  case "$target_cpu" in
>> +-    arm*)
>> +-      if test "$GNU_CC"; then
>> +-        CFLAGS="$CFLAGS -march=armv5te -mthumb-interwork -msoft-float"
>> +-        CXXFLAGS="$CXXFLAGS -march=armv5te -mthumb-interwork -msoft-float"
>> +-        ASFLAGS="$ASFLAGS -march=armv5te -mthumb-interwork -msoft-float"
>> +-      fi
>> +-      ;;
>> +-  esac
>> + fi
>> +
>> + AC_SUBST(MOZ_THUMB2)
> Can't you patch the configure straight away so we don't have the ugly
> patch that rewrite the configure script ?

I can. I considered that, but I though it was too ugly, especially
having line numbers in error messages that do not match the script.

>> [...]
>> diff --git a/package/spidermonkey185/spidermonkey185.mk b/package/spidermonkey185/spidermonkey185.mk
>> new file mode 100644
>> index 0000000..1ccc274
>> --- /dev/null
>> +++ b/package/spidermonkey185/spidermonkey185.mk
>> @@ -0,0 +1,33 @@
>> +################################################################################
>> +#
>> +# Spidermonkey (1.8.5)
>> +#
>> +################################################################################
>> +
>> +SPIDERMONKEY185_VERSION = 1.0.0
>> +SPIDERMONKEY185_SITE = http://ftp.mozilla.org/pub/js
>> +SPIDERMONKEY185_SOURCE = js185-${SPIDERMONKEY185_VERSION}.tar.gz
>> +
>> +SPIDERMONKEY185_INSTALL_STAGING = YES
>> +
>> +SPIDERMONKEY185_DEPENDENCIES = host-python host-perl
>> +
>> +SPIDERMONKEY185_LICENSE = MPLv1.1 or GPLv2.0+ or LGPLv2.1+
>> +
>> +SPIDERMONKEY185_SUBDIR = js/src
> Don't put empty lines between all these lines. I would put the SUBDIR
> option right below the SOURCE option.

ok

>> +
>> +# This define is used by jscpucfg.cpp which is normally used to runtime-detect
>> +# the system endianess.
>> +SPIDERMONKEY185_CONF_ENV = \
>> +       HOST_CXXFLAGS="$(HOST_CXXFLAGS) -DFORCE_$(BR2_ENDIAN)_ENDIAN"
>> +
>> +# Mozilla mixes up target, host and build.  See the comment in configure.in
>> +# around line 360.  Also, nanojit fails to build on sparc64 with
>> +# #error "unknown nanojit architecture", so disable the JIT.
>> +SPIDERMONKEY185_CONF_OPTS = \
>> +               --target=$(GNU_TARGET_NAME) \
>> +               --build=$(GNU_TARGET_NAME) \
>> +               --host=$(GNU_HOST_NAME) \
>> +               $(if $(BR2_sparc64),--disable-tracejit)
> In your patch, there's two tab here so the indent is off.

ok
