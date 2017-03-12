From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Mar 2017 16:15:43 +0100
Subject: [Buildroot] [PATCH 2/2] Makefile: add check of binaries
	architecture
In-Reply-To: <1489331191-32663-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1489331191-32663-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1489331191-32663-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170312151543.GC3739@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-12 16:06 +0100, Thomas Petazzoni spake thusly:
> As shown recently by the firejail example, it is easy to miss that a
> package builds and installs binaries without actually cross-compiling
> them: they are built for the host architecture instead of the target
> architecture.
> 
> This commit adds a small helper script, check-bin-arch, called from
> the main Makefile as a TARGET_FINALIZE_HOOKS, to verify that all ELF
> binaries have been built for the correct CPU architecture.

That is not possible in all situations.

For example, I have a board here with a kind of co-processor of a
different architecture; the firmware for that co-processor is loaded
at runtime. It is an ELF file, and it is in target/.

So I don't think it is possible to check that all ELF files are for the
Buildroot-known target.

We already discussed this a while ago and came to the same conclusiong
back then.

Regards,
Yann E. MORIN.

> Example output with the firejail package enabled, when building for an
> ARM target:
> 
> support/scripts/check-bin-arch .../buildroot/output/target .../buildroot/output/host/usr/bin/arm-linux-gnueabihf- "ARM"
> ERROR: .../buildroot/output/target/usr/bin/firemon architecture is 'Advanced Micro Devices X86-64', should be 'ARM'
> ERROR: .../buildroot/output/target/usr/bin/firejail architecture is 'Advanced Micro Devices X86-64', should be 'ARM'
> ERROR: .../buildroot/output/target/usr/bin/firecfg architecture is 'Advanced Micro Devices X86-64', should be 'ARM'
> ERROR: .../buildroot/output/target/usr/lib/firejail/libconnect.so architecture is 'Advanced Micro Devices X86-64', should be 'ARM'
> ERROR: .../buildroot/output/target/usr/lib/firejail/faudit architecture is 'Advanced Micro Devices X86-64', should be 'ARM'
> ERROR: .../buildroot/output/target/usr/lib/firejail/ftee architecture is 'Advanced Micro Devices X86-64', should be 'ARM'
> ERROR: .../buildroot/output/target/usr/lib/firejail/libtrace.so architecture is 'Advanced Micro Devices X86-64', should be 'ARM'
> ERROR: .../buildroot/output/target/usr/lib/firejail/libtracelog.so architecture is 'Advanced Micro Devices X86-64', should be 'ARM'
> Makefile:665: recipe for target 'target-finalize' failed
> make[1]: *** [target-finalize] Error 1
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile                       | 10 ++++++++++
>  support/scripts/check-bin-arch | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100755 support/scripts/check-bin-arch
> 
> diff --git a/Makefile b/Makefile
> index fb2c235..3cb1f7a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -649,6 +649,16 @@ endef
>  TARGET_FINALIZE_HOOKS += PURGE_LOCALES
>  endif
>  
> +READELF_ARCH_NAME = $(call qstrip,$(BR2_READELF_ARCH_NAME))
> +
> +ifneq ($(READELF_ARCH_NAME),)
> +define CHECK_BIN_ARCH
> +	support/scripts/check-bin-arch $(TARGET_DIR) \
> +		$(TARGET_CROSS) "$(READELF_ARCH_NAME)"
> +endef
> +TARGET_FINALIZE_HOOKS += CHECK_BIN_ARCH
> +endif
> +
>  $(TARGETS_ROOTFS): target-finalize
>  
>  target-finalize: $(PACKAGES)
> diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
> new file mode 100755
> index 0000000..de11a71
> --- /dev/null
> +++ b/support/scripts/check-bin-arch
> @@ -0,0 +1,30 @@
> +#!/bin/sh
> +
> +# This script looks at all files in the target filesystem, and for
> +# those that are ELF files, verifies that they have been built for the
> +# correct architecture.
> +
> +TARGET_DIR=$1
> +TARGET_CROSS=$2
> +READELF_ARCH_NAME=$3
> +
> +exitcode=0
> +
> +for f in $(find ${TARGET_DIR} -type f) ; do
> +    # Skip non-ELF files
> +    if ! file -b ${f} | grep -q "ELF " ; then
> +	continue
> +    fi
> +
> +    # Get architecture using readelf
> +    farchname=$(${TARGET_CROSS}readelf -h ${f} | \
> +		       grep '^  Machine:' | \
> +		       sed 's/^  Machine: *\(.*\)/\1/')
> +
> +    if test "${farchname}" != "${READELF_ARCH_NAME}" ; then
> +	echo "ERROR: ${f} architecture is '${farchname}', should be '${READELF_ARCH_NAME}'"
> +	exitcode=1
> +    fi
> +done
> +
> +exit ${exitcode}
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
