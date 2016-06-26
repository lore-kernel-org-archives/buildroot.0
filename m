From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Jun 2016 00:07:20 +0200
Subject: [Buildroot] [PATCH v7] openblas: new package
In-Reply-To: <1466764011-10998-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1466764011-10998-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <12aeb9fe-c292-b386-1b1b-fddf6f195e73@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24-06-16 12:26, Vicente Olivert Riera wrote:
> OpenBLAS is optimised for specific CPU models, which don't fully match
> with the GCC code generation options. Therefore, we can't automatically
> select BR2_PACKAGE_OPENBLAS_TARGET based on the CPU choice. Instead, let
> the user select the TARGET name, but offer a sensible default. Other
> possible solutions were deemed too complicated: adding choice options in
> the ambiguous cases, or only making the option user-visible when there
> is ambiguity.

 Unfortunately, the arch dependencies are not going enough, they're going to
lead to build failures. E.g. br-arm-basic.config and
br-mips32r6-el-hf-glibc.config don't have a corresponding TARGET. So we will
need something better after all...

 So, I think the easiest is to do the following. Make the option with all the
defaults a blind option, move it out of the condition, call it
BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET. Then do

config BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
	bool
	default y if BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET != ""

 And finally, inside the condition:

config BR2_PACKAGE_OPENBLAS_TARGET
	string "OpenBLAS target CPU"
	default BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET

 Can you try that?

> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[snip]

> +define OPENBLAS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) $(OPENBLAS_MAKE_OPTS) \
> +		-C $(@D)
> +endef
> +
> +define OPENBLAS_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(OPENBLAS_MAKE_OPTS) \

 Minor nit: I prefer to repeat the same options here as for the build, i.e.
include TARGET_CONFIGURE_OPTS.

 Actually, maybe you should just initialize

OPENBLAS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)


 Regards,
 Arnout

> +		-C $(@D) install PREFIX=$(STAGING_DIR)/usr
> +endef
> +
> +define OPENBLAS_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(OPENBLAS_MAKE_OPTS) \
> +		-C $(@D) install PREFIX=$(TARGET_DIR)/usr
> +endef
> +
> +$(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
