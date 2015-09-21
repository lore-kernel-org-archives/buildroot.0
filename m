From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 21 Sep 2015 11:40:18 +0100
Subject: [Buildroot] [PATCH v3] libseccomp: Add new config option to
 build and install tests
In-Reply-To: <1442827716-8802-1-git-send-email-markos.chandras@imgtec.com>
References: <20150920144637.25230558@free-electrons.com>
 <1442827716-8802-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <55FFDE92.9010901@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

could you please mark your previous patch as superseded?

http://patchwork.ozlabs.org/patch/519170/

On 09/21/2015 10:28 AM, Markos Chandras wrote:
> Add new config option to allow building and installing the libseccomp
> testsuite on the target. It's useful for testing the kernels'
> seccomp behavior for the target architecture.
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture. All fine. Binary files built for the
right architecture and no more .py files installed on target. Checked
that now the tests and tools are installed in /usr/share/libseccomp/.

Regards,

Vincent.

> ---
> changes since v2:
> - Move installation path for tests to /usr/share/libseccomp
> - Do not install python files. We don't support python + libseccomp
> at the moment so there is no point in installing these tests yet.
> 
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
> index a188298006b1..e6e578b85561 100644
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
> +	mkdir -p $(TARGET_DIR)/usr/share/libseccomp/{tests,tools} && \
> +	for x in tests tools; do \
> +		find $(@D)/$$x -maxdepth 1 \( -name "*.tests" -o -perm -a=x \) -a ! -name "*.py" \
> +			-type f -exec cp {} $(TARGET_DIR)/usr/share/libseccomp/$$x/ \; ; \
> +	done
> +endef
> +
> +LIBSECCOMP_POST_INSTALL_TARGET_HOOKS += LIBSECCOMP_TESTS_INSTALL
> +
> +endif
> +
>  $(eval $(autotools-package))
> 
