From: Bradford Barr <bradford@density.io>
Date: Wed, 27 Sep 2017 10:34:28 -0400
Subject: [Buildroot] [PATCH 1/2] tbb: new package
In-Reply-To: <46645181-5119-65dd-e023-afc2a39e0f6c@mind.be>
References: <20170926203504.22326-1-bradford@density.io>
 <20170926203504.22326-2-bradford@density.io>
 <46645181-5119-65dd-e023-afc2a39e0f6c@mind.be>
Message-ID: <CAPpUvYj01wU8u0GpJqyc_hJZAEn+fkFEyLBr+g0ddRMODoUDmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bah, this is an old version of the patch. The newer one is still bad.
I'll rework and resubmit. I'll try to make sure my future patches are
cleaner.

Thanks,
B

On Tue, Sep 26, 2017 at 5:31 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Hi Bradford,
>
> On 26-09-17 22:35, Bradford Barr wrote:
>> From: bradford barr <bradford@density.io>
>>
>> Intel Threading Building Blocks (TBB), is a C++ library to help developers
>> write highly parallelized applications. OpenCV uses it to accelerate some of
>> it's more heavy weight procedures.
>>
>> Signed-off-by: bradford barr <bradford@density.io>
> [snip]
>> diff --git a/package/tbb/0001-prevent-thumb.patch b/package/tbb/0001-prevent-thumb.patch
>
>  Package patches need a description (basically a commit message) and another
> signed-off-by. The latter is needed because both the license and the submission
> path may be different for a package patch.
>
>  Ideally, you generate patches from the upstream git repository, with git
> format-patch. Don't forget to add -N to format-patch to avoid getting [1/2] in
> the Subject line.
>
>> new file mode 100644
>> index 0000000..942f7f4
>> --- /dev/null
>> +++ b/package/tbb/0001-prevent-thumb.patch
>> @@ -0,0 +1,15 @@
>> +diff -Naur tbb-2017_U8/build/linux.gcc.inc b/build/linux.gcc.inc
>> +--- tbb-2017_U8/build/linux.gcc.inc  2017-09-22 15:57:33.000000000 -0400
>> ++++ b/build/linux.gcc.inc    2017-09-25 14:46:39.584066690 -0400
>> +@@ -115,11 +115,6 @@
>> +     LIB_LINK_FLAGS += -mcpu=v9 -m64
>> + endif
>> +
>> +-# automatically generate "IT" instructions when compiling for Thumb ISA
>> +-ifeq (armv7,$(arch))
>> +-    CPLUS_FLAGS    += -Wa,-mimplicit-it=thumb
>> +-endif
>> +-
>> + #------------------------------------------------------------------------------
>> + # Setting assembler data.
>> + #------------------------------------------------------------------------------
>> diff --git a/package/tbb/0002-cross-compiler.patch b/package/tbb/0002-cross-compiler.patch
>> new file mode 100644
>> index 0000000..60a4eb3
>> --- /dev/null
>> +++ b/package/tbb/0002-cross-compiler.patch
>> @@ -0,0 +1,14 @@
>> +diff -Naur tbb-2017_U8/build/linux.gcc.inc b/build/linux.gcc.inc
>> +--- tbb-2017_U8/build/linux.gcc.inc  2017-09-25 14:58:24.593148831 -0400
>> ++++ b/build/linux.gcc.inc    2017-09-25 15:08:17.032422555 -0400
>> +@@ -32,8 +32,8 @@
>> + EXPORT_KEY = -Wl,--version-script,
>> + LIBDL = -ldl
>> +
>> +-CPLUS = g++
>> +-CONLY = gcc
>> ++CPLUS = arm-linux-gnueabihf-g++
>> ++CONLY = arm-linux-gnueabihf-gcc
>
>  That can't be right, it would only support ARM builds.
>
>  However, this patch shouldn't be needed, since you pass CPLUS and CONLY on the
> command line explicitly.
>
>> + LIB_LINK_FLAGS = $(DYLIB_KEY) -Wl,-soname=$(BUILDING_LIBRARY)
>> + LIBS += -lpthread -lrt
>> + LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
>> diff --git a/package/tbb/Config.in b/package/tbb/Config.in
>> new file mode 100644
>> index 0000000..d2c8c04
>> --- /dev/null
>> +++ b/package/tbb/Config.in
>> @@ -0,0 +1,13 @@
>> +config BR2_PACKAGE_TBB
>> +     bool "tbb"
>> +     depends on BR2_TOOLCHAIN_HAS_THREADS
>> +     help
>> +       Intel(R) Threading Building Blocks (Intel(R) TBB) lets you easily
>> +       write parallel C++ programs that take full advantage of multicore
>> +       performance, that are portable, composable and have future-proof
>> +       scalability.
>> +
>> +       https://www.threadingbuildingblocks.org/
>> +
>> +comment "tbb needs a toolchain w/ threads"
>> +     depends on !BR2_TOOLCHAIN_HAS_THREADS
>> diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
>> new file mode 100644
>> index 0000000..7e73cb4
>> --- /dev/null
>> +++ b/package/tbb/tbb.hash
>> @@ -0,0 +1,3 @@
>> +# Locally calculated
>> +sha256  c6462217d4ecef2b44fce63cfdf31f9db4f6ff493869899d497a5aef68b05fc5  tbb-2018_U1.tar.gz
>
>  Only include the hash for the version we have.
>
>  Also, please add a hash for the LICENSE file. That allows us to detect when the
> license changes (it sometimes happens...).
>
>
>
>> +sha256  1b1357f280e750d42506212adad02f85ac07c9d3e3c0813104f9122ef350497f  tbb-2017_U8.tar.gz
>> diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
>> new file mode 100644
>> index 0000000..d9ac4c8
>> --- /dev/null
>> +++ b/package/tbb/tbb.mk
>> @@ -0,0 +1,35 @@
>> +################################################################################
>> +#
>> +# tbb
>> +#
>> +################################################################################
>> +
>> +TBB_VERSION = 2017_U8
>> +TBB_SITE = $(call github,01org,tbb,$(TBB_VERSION))
>> +TBB_INSTALL_STAGING = YES
>> +TBB_LICENSE = Apache-2.0
>> +TBB_LICENSE_FILES = LICENSE
>> +
>> +define TBB_BUILD_CMDS
>> +     $(MAKE) $(TARGET_CONFIGURE_OPTS) CPLUS=$(HOSTCXX) CONLY=$(HOSTCC) arch=$(BR2_ARCH) -C $(@D) tbb
>
>  Usually when the build system requires the target architecture to be specified,
> there are limitations on which architectures are supported, or you may have to
> translate BR2_ARCH to something that the build system understands. Have you used
> test-pkg to explore all the different configurations we support?
>
>> +endef
>> +
>> +define TBB_INSTALL_STAGING_CMDS
>> +     mkdir -p $(STAGING_DIR)/usr/include/tbb
>> +     cp -a $(@D)/include/* $(STAGING_DIR)/usr/include/tbb
>> +     for f in $$(find $(@D)/build/linux_*_release -type f -iname "libtbb.so*"); do \
>
>  Ideally, you would use _debug instead of _release if BR2_ENABLE_DEBUG=y, but
> that's not so important.
>
>> +             if grep -q -v INPUT $$f; then \
>
>  That grep requires some explanation...
>
>> +                     $(INSTALL) -D -m 0755 $$f $(STAGING_DIR)/usr/lib ; \
>
>  Aren't there symlinks to be installed?
>
>> +             fi \
>> +     done
>
>  You only install dynamic libraries. So either the package must depend on
> !BR2_STATIC_LIBS, or you have to install static and/or dynamic libs depending on
> the configuration chosen.
>
>  Regards,
>  Arnout
>
>> +endef
>> +
>> +define TBB_INSTALL_TARGET_CMDS
>> +     for f in $$(find $(@D)/build/linux_*_release -type f -iname "libtbb.so*"); do \
>> +             if grep -q -v INPUT $$f; then \
>> +                     $(INSTALL) -D -m 0755 $$f $(TARGET_DIR)/usr/lib ; \
>> +             fi \
>> +     done
>> +endef
>> +
>> +$(eval $(generic-package))
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
