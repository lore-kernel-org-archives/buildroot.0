From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Thu, 5 Dec 2019 09:44:35 +0000
Subject: [Buildroot] [PATCH v8 1/2] package/compiler-rt: new package
In-Reply-To: <CANQCQpZ8NaqR44gnCSL0L=qCAng46kJ4JzONrFMCP5AsZQjMFQ@mail.gmail.com>
References: <20191023214636.17284-1-matthew.weber@rockwellcollins.com>
 <CANQCQpZ8NaqR44gnCSL0L=qCAng46kJ4JzONrFMCP5AsZQjMFQ@mail.gmail.com>
Message-ID: <5ba4bcdf-0c34-6e59-dc50-5b8c16a390b1@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,
I have a few questions about your compiler-rt patch, see below.

On 27/10/2019 19:31, Matthew Weber wrote:
> On Wed, Oct 23, 2019 at 4:46 PM Matt Weber
> <matthew.weber@rockwellcollins.com> wrote:
>>
>> This patch adds support for the compiler-rt (CLANG runtime) library.
>> It builds a set of static libraries and installs them into the
>> CLANG/LLVM toolchain resource folder.
>>
>> diff --git a/package/compiler-rt/compiler-rt.mk b/package/compiler-rt/compiler-rt.mk
>> new file mode 100644
>> index 0000000000..3d2cbcbff5
>> --- /dev/null
>> +++ b/package/compiler-rt/compiler-rt.mk
>> @@ -0,0 +1,37 @@
>> +################################################################################
>> +#
>> +# compiler-rt
>> +#
>> +################################################################################
>> +
>> +# Compiler-RT should be bumped together with LLVM and Clang as the run-time is
>> +# tied to the version of those tools
>> +COMPILER_RT_VERSION = 9.0.0
>> +COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
>> +COMPILER_RT_SITE = http://llvm.org/releases/$(COMPILER_RT_VERSION)
>> +COMPILER_RT_LICENSE = NCSA MIT
>> +COMPILER_RT_LICENSE_FILES = LICENSE.TXT
>> +COMPILER_RT_DEPENDENCIES = host-clang llvm
>> +
>> +COMPILER_RT_INSTALL_STAGING = YES
>> +COMPILER_RT_INSTALL_TARGET = NO
>> +
>> +COMPILER_RT_CONF_OPTS=-DCOMPILER_RT_STANDALONE_BUILD=OFF \
>> +       -DCOMPILER_RT_STANDALONE_BUILD=ON \
>> +       -DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
>> +       -DLLVM_CONFIG_PATH=$(HOST_DIR)/usr/bin/llvm-config
>> +

You set both:

    -DCOMPILER_RT_STANDALONE_BUILD=OFF
    -DCOMPILER_RT_STANDALONE_BUILD=ON

Presumably you just mean the second?

>> +# The installation of the target runtime libraries defaults to DESTDIR, however
>> +# host-clang resources directory needs a link so Clang can find the runtime
>> +# libraries in the same location they would be if built as part of the Clang
>> +# build. The "resources" directory is loosely documented and seems to be
>> +# assumed, as compiler-rt is usually build at the same time as Clang and not
>> +# standalone.
>> +define COMPILER_RT_SETUP_RUNTIME_LIBS
>> +       mkdir -p $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib
>> +       ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/lib/linux $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib/linux
>> +       ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/share $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/share
>> +endef
>> +COMPILER_RT_POST_INSTALL_STAGING_HOOKS += COMPILER_RT_SETUP_RUNTIME_LIBS
>> +

The second of those symlinks should only go up three directories.

Also, why do you create symlinks into $(HOST_DIR) from a "target" package?
Why not just add host-compiler-rt logic and depend on "host-compiler-rt"
where appropriate? Then you could remove this define entirely. I'd also add:
    
    HOST_COMPILER_RT_CONF_OPTS = $(COMPILER_RT_CONF_OPTS)

The default target is still the same. I'm testing this at the minute.

Thanks,
Thomas Preston
