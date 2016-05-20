From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Fri, 20 May 2016 15:59:59 +0200
Subject: [Buildroot] [RFC/PATCH next 1/2] spidermonkey185: New package.
In-Reply-To: <8a47e77d-4c65-ef5f-1ab0-851a332f2be7@mind.be>
References: <1463673580-10676-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <8a47e77d-4c65-ef5f-1ab0-851a332f2be7@mind.be>
Message-ID: <573F185F.8060206@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/05/2016 01:09, Arnout Vandecappelle wrote:
> On 05/19/16 17:59, Nicolas Cavallari wrote:
>> This is the old 1.8.5 branch of spidermonkey, used in Firefox 4.
>> It is rather unmaintained, but some software still depend on it.
> 
>  Mention couchdb explicitly here.

ok.

>>  package/Config.in                                  |    1 +
>>  .../0001-fix-arm-compiler-flags.patch              |  340 ++
>>  .../0002-regenerate-configure.patch                | 5397 ++++++++++++++++++++
> 
>  Ouch! Is it really necessary to add this? Usually it's possible to regenerate
> the configure script with recent automake by making some small modifications to
> the AC_INIT etc. calls.

Given how ugly and huge the configure.in script is, i think it would
be a bit hard. I'll try.

>> diff --git a/package/Config.in b/package/Config.in
>> index 8668612..89caf32 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -762,6 +762,7 @@ menu "External python modules"
>>  endmenu
>>  endif
>>  	source "package/ruby/Config.in"
>> +	source "package/spidermonkey185/Config.in"
> 
>  It feels a bit weird to put this in scripting languages, but I don't really
> know a better place for it.

... Probably Libraries/Other ? It's a bit strange since it has a
javascript shell which is not installed on the target by 'make install'


> 
>>  	source "package/tcl/Config.in"
>>  if BR2_PACKAGE_TCL
>>  menu "Tcl libraries/modules"
>> diff --git a/package/spidermonkey185/0001-fix-arm-compiler-flags.patch b/package/spidermonkey185/0001-fix-arm-compiler-flags.patch
>> new file mode 100644
>> index 0000000..b0e188d
>> --- /dev/null
>> +++ b/package/spidermonkey185/0001-fix-arm-compiler-flags.patch
>> @@ -0,0 +1,340 @@
>> +# HG changeset patch
>> +# User Mike Hommey <mh+mozilla@glandium.org>
>> +# Date 1304348823 -7200
>> +# Node ID e38cec9f833829a6137c03f4f1d282aca4063fcd
>> +# Parent  6322e8f7cb2dd4e393b7ad18acbc09f1bae69771
>> +Bug 626035 - Modify the way arm compiler flags are set in configure
>> +[nicolas.cavallari: refresh the patch]
> 
>  This needs a better explanation why the patch is needed. Since this is such a
> huge patch with unclear purpose, and since we know all the relevant ARM
> information at the buildroot level, and since it's not upstreamable anyway
> because it's such an old version, I'd prefer to do a minimal patch that just
> removes things that can't be worked around, and pass all the relevant info
> through CPPFLAGS or environment variables.

I should have left a link to the bug report.
Basically, on arm, the build system forced armv5 in thumb mode, for no
reason.
If the (normally upstream ?) patch is too ugly, i'll try to do
something simpler.

>> +
>> +From: https://bug626035.bmoattachments.org/attachment.cgi?id=529479
>> +
> [snip] Phew, glad I got rid of that :-)
>> diff --git a/package/spidermonkey185/Config.in b/package/spidermonkey185/Config.in
>> new file mode 100644
>> index 0000000..a5ec455
>> --- /dev/null
>> +++ b/package/spidermonkey185/Config.in
>> @@ -0,0 +1,15 @@
>> +config BR2_PACKAGE_SPIDERMONKEY185
>> +	bool "spidermonkey (1.8.5)"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>> +	depends on BR2_USE_MMU # fork in executable tools.
> 
>  I believe v8 has much stricter arch requirements, and also atomics/sync
> requirements.

Spidermonkey seems to use inline assembly on linux on arches were the
JIT is supported.
I'll try to figure out the arch requirements, but i don't think there
are many. the JIT isn't mandatory.


>> +SPIDERMONKEY185_INSTALL_STAGING = YES
>> +SPIDERMONKEY185_INSTALL_TARGET = YES
> 
>  This is the default -> remove

done.

I've also spotted dependencies on python and perl on the host.

>> +
>> +SPIDERMONKEY185_LICENSE = \
>> +	MPL-1.1/GPL-2.0/LGPL-2.1 (Mostly), \
>> +	MIT variants (libffi+, v8, mkdepend), \
>> +	BSD-2c/BSD-3c (various parts), public domain (some tests)
> 
>  We only specify the license of the things actually installed to target (or
> host). So not the build utils (mkdepend), not the things that are not installed
> (tests). The Mostly can also be removed. The / is not clear, you either use ,
> for and, or ' or ' for or. BSD, MIT and public domain can be left out if the
> combined work (i.e. the binary) is anyway MPL/GPL - but they have to be included
> if it's for separate scripts. For historical reasons, we use MPLv1.1, GPLv2 and
> LGPLv2.1. Are all of them without +?
> 
>  Are there no license files at all?

Not in the spidermonkey tarball.

From what i understand, spidermonkey is a part of the mozilla code
base. It also has been released as a standalone package, but not
really properly. Hence no license, all stuff in a js/ subdirectory,
some dependencies left on nspr and other weirdnesses.

I'll try to sort out the licenses, without cheating by looking at
debian's copyright file.

>> +
>> +SPIDERMONKEY185_CONF_ENV = \
>> +	HOST_CXXFLAGS="$(HOST_CXXFLAGS) -DFORCE_$(BR2_ENDIAN)_ENDIAN"
> 
>  That doesn't look right: forcing target endianness in the host flags?

The build system compiles a jscpucfg.cpp for the host.  The program
outputs a C header file on standart output.  It does things like
determining whether the (host) architecture is little, big endian or
mixed endian by runtime-testing it.

When cross compiling, it does funky things:  If
-DFORCE_BIG/LITTLE_ENDIAN isn't given, jscpucfg.cpp includes a header
file which is normally part of nspr but not included in the
spidermonkey tarball, so this fails.  And it appears that this header
file seems to be unused.

I'll add a comment.

>> +SPIDERMONKEY185_CONF_OPTS = \
>> +		--target=$(GNU_TARGET_NAME) \
>> +		--build=$(GNU_TARGET_NAME) \
>> +		--host=$(GNU_HOST_NAME)
> 
>  This is already passed by the default _CONFIGURE_CMDS.

Actually, not. Buildroot passes the correct value, but spidermonkey
needs incorrect values. See this gem in configure.in:

# Note:
#   In Mozilla, we use the names $target, $host and $build
incorrectly, but are
#   too far gone to back out now. See Bug 475488:
#     - When we say $target, we mean $host, that is, the system on which
#       Mozilla will be run.
#     - When we say $host, we mean $build, that is, the system on
which Mozilla
#       is built.
#     - $target (in its correct usage) is for compilers who generate
code for a
#       different platform than $host, so it would not be used by Mozilla.

I'll add a comment.

>> +
>> +# This dependency does not make sense outside of the mozilla code base.
> 
>  How so? Either the libraries depend on libnspr so the dependency has to be
> there, or they don't so the dependency should be removed - also within the
> mozilla code base.

The dependency is simply not used on Linux.  This is probably a
difference between the extracted spidermonkey source code and the
mozilla code base.  There are even some migration scripts that replace
references to nspr by alternatives.

>> +define SPIDERMONKEY185_FIX_PC_NSPR_DEPENDENCY
>> +	sed -i -re 's/nspr >= 4.7//' \
>> +		$(STAGING_DIR)/usr/lib/pkgconfig/mozjs185.pc
> 
>  I think I prefer a patch to .pc.in instead.

ok.

> 
>> +endef
>> +
>> +SPIDERMONKEY185_POST_INSTALL_STAGING_HOOKS += \
>> +	SPIDERMONKEY185_FIX_PC_NSPR_DEPENDENCY
>> +
>> +
>> +# These symlinks are created absolute with DESTDIR embedded into it.
> 
>  Eek...
> 
>> +# Make them relative so they work on the target.
> 
>  We probably want to do that in staging as well (for the long-term goal of
> relocatable HOST_DIR). And perhaps it's easier to do that with a patch than with
> a hook - in particular if you manage to get AUTORECONF to work.

I'll try.  There are variable indirections in there.

> 
>> +define SPIDERMONKEY185_FIX_SHLIB_SYMLINK
>> +	ln -fs libmozjs185.so.1.0.0 $(TARGET_DIR)/usr/lib/libmozjs185.so
>> +	ln -fs libmozjs185.so.1.0.0 $(TARGET_DIR)/usr/lib/libmozjs185.so.1.0
>> +endef
>> +
>> +SPIDERMONKEY185_POST_INSTALL_TARGET_HOOKS += \
>> +	SPIDERMONKEY185_FIX_SHLIB_SYMLINK
>> +
>> +$(eval $(autotools-package))
>> +
>> +# Hack so configure/make is run inside the js/src subdirectory.
>> +SPIDERMONKEY185_SRCDIR = $(SPIDERMONKEY185_DIR)/js/src/
> 
>  Just do
> SPIDERMONKEY185_SUBDIR = js/src
> (not a hack at all).

Done.
