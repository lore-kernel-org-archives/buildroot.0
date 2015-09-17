From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 17 Sep 2015 18:02:30 +0100
Subject: [Buildroot] [PATCH] libseccomp: Add new config option to build
 and install tests
In-Reply-To: <1442498020-661-1-git-send-email-markos.chandras@imgtec.com>
References: <1442498020-661-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <55FAF226.9080800@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On 09/17/2015 02:53 PM, Markos Chandras wrote:
[snip]
> diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
> index a188298006b1..6edf96f92bfa 100644
> --- a/package/libseccomp/libseccomp.mk
> +++ b/package/libseccomp/libseccomp.mk
> @@ -17,4 +17,23 @@ define LIBSECCOMP_FIXUP_M4_DIR
>  endef
>  LIBSECCOMP_POST_EXTRACT_HOOKS += LIBSECCOMP_FIXUP_M4_DIR
>  
> +ifeq ($(BR2_PACKAGE_LIBSECCOMP_TESTS),y)
> +
> +define LIBSECCOMP_TESTS_BUILD
> +	$(MAKE) -C $(@D)/tests check-build

You should be adding $(TARGET_MAKE_ENV) in front of $(MAKE). Anyway,
there is a better solution which will make this define unnecessary. See
comments below.

> +endef

Instead of doing a define to build the tests, you can change the target
and use the 'check-build' one, which will not only build the tests and
tools, but also will trigger the 'all' target. So:

ifeq ($(BR2_PACKAGE_LIBSECCOMP_TESTS),y)
# The 'check-build' target builds the tests and tools, and also
# triggers the 'all' target.
LIBSECCOMP_MAKE_OPTS += check-build

> +define LIBSECCOMP_TESTS_INSTALL
> +	mkdir -p $(TARGET_DIR)/usr/libseccomp/{tests,tools} && \
> +	for x in tests tools; do \
> +		find $(@D)/$$x -maxdepth 1 \( -name "*.tests" -o -perm -a=x \) \
> +			-type f -exec cp {} $(TARGET_DIR)/usr/libseccomp/$$x/ \; ; \
> +	done
> +endef
> +

I would remove this empty line since you are adding to the hooks
variable the define immediately above.

> +LIBSECCOMP_POST_BUILD_HOOKS += LIBSECCOMP_TESTS_BUILD

This post-build hook is not needed since the define has been replaced by
the LIBSECCOMP_MAKE_OPTS line.

> +LIBSECCOMP_POST_INSTALL_TARGET_HOOKS += LIBSECCOMP_TESTS_INSTALL
> +

And I would remove this empty line as well.

Regards,

Vincent.

> +endif
> +
>  $(eval $(autotools-package))
> 
