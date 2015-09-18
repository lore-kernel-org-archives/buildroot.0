From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 18 Sep 2015 09:36:43 +0100
Subject: [Buildroot] [PATCH v2] libseccomp: Add new config option to
 build and install tests
In-Reply-To: <1442564371-10498-1-git-send-email-markos.chandras@imgtec.com>
References: <55FAF226.9080800@imgtec.com>
 <1442564371-10498-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <55FBCD1B.8050509@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On 09/18/2015 09:19 AM, Markos Chandras wrote:
> Add new config option to allow building and installing the libseccomp
> testsuite on the target. It's useful for testing the kernels'
> seccomp behavior for the target architecture.
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com> Tested-by:
Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ file output/target/usr/libseccomp/tests/01-sim-allow
output/target/usr/libseccomp/tests/01-sim-allow: ELF 32-bit MSB
executable, MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked (uses
shared libs), for GNU/Linux 2.6.32, with unknown capability 0x41000000 =
0xf676e75, with unknown capability 0x10000 = 0x70403, stripped

Regards,

Vincent.

> ---
> changes since v1:
> - Drop compile hook for tests and use MAKE_OPTS instead
> ---
>  package/libseccomp/Config.in     |  9 +++++++++
>  package/libseccomp/libseccomp.mk | 16 ++++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
> index 4c34c5466592..760a6f321142 100644
> --- a/package/libseccomp/Config.in
> +++ b/package/libseccomp/Config.in
> @@ -15,6 +15,15 @@ config BR2_PACKAGE_LIBSECCOMP
>  
>  	  https://github.com/seccomp/libseccomp
>  
> +config BR2_PACKAGE_LIBSECCOMP_TESTS
> +	bool "Install libseccomp tests"
> +	depends on BR2_PACKAGE_BASH && BR2_PACKAGE_LIBSECCOMP
> +	help
> +	  Build and install the libseccomp testsuite.
> +
> +comment "libseccomp testsuite needs bash as running shell"
> +	depends on !BR2_PACKAGE_BASH && BR2_PACKAGE_LIBSECCOMP
> +
>  comment "libseccomp needs a toolchain w/ headers >= 3.12"
>  	depends on BR2_aarch64 || BR2_mips || BR2_mipsel || BR2_mips64 || \
>  		BR2_mips64el || BR2_i386 || BR2_x86_64
> diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
> index a188298006b1..5ebd8c54ac1f 100644
> --- a/package/libseccomp/libseccomp.mk
> +++ b/package/libseccomp/libseccomp.mk
> @@ -17,4 +17,20 @@ define LIBSECCOMP_FIXUP_M4_DIR
>  endef
>  LIBSECCOMP_POST_EXTRACT_HOOKS += LIBSECCOMP_FIXUP_M4_DIR
>  
> +ifeq ($(BR2_PACKAGE_LIBSECCOMP_TESTS),y)
> +
> +LIBSECCOMP_MAKE_OPTS += check-build
> +
> +define LIBSECCOMP_TESTS_INSTALL
> +	mkdir -p $(TARGET_DIR)/usr/libseccomp/{tests,tools} && \
> +	for x in tests tools; do \
> +		find $(@D)/$$x -maxdepth 1 \( -name "*.tests" -o -perm -a=x \) \
> +			-type f -exec cp {} $(TARGET_DIR)/usr/libseccomp/$$x/ \; ; \
> +	done
> +endef
> +
> +LIBSECCOMP_POST_INSTALL_TARGET_HOOKS += LIBSECCOMP_TESTS_INSTALL
> +
> +endif
> +
>  $(eval $(autotools-package))
> 
