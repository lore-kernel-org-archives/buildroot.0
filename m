From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Nov 2016 12:22:36 +0100
Subject: [Buildroot] [PATCH v2 3/3] pru-sample: add sample PRU
	application
In-Reply-To: <1480096200-20475-3-git-send-email-ash.charles@savoirfairelinux.com>
References: <1479324273-13589-1-git-send-email-ash.charles@savoirfairelinux.com>
 <1480096200-20475-3-git-send-email-ash.charles@savoirfairelinux.com>
Message-ID: <1a270629-34f9-06f6-fb58-25455e61900d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-11-16 18:50, Ash Charles wrote:
> As suggested [1], provide a sample application demonstrating how to use
> the PRU toolchain (specifically, the ti-cgt-pru and
> pru-software-support packages) within buildroot.  This sample is taken
> from PRU Lab #4 for the AM335x [2, 3].

 The intention here was not to create a new package, but rather to allow the
installation of the examples provided in pru-software-support. I.e. add a config
option "PRU_SOFTWARE_SUPPORT_INSTALL_EXAMPLES". Or rather, add a
pru-software-support target package for the examples (the firmware files are to
be installed on the target so it has to be a target package).

 Obviously, only 1 firmware binary can be installed. So you have the following
options:
- Support only one example.
- Add config options for all the examples and let the user select it.
- Install examples, but not as am335x-pru0-fw, but in a pru-examples
subdirectory, leaving it up to the user to copy/link it to the correct name for
firmware loading. Mention in the help text how to do that.

 I'm in favour of the last option. Among other things, it makes it easier to
support other SoCs than the AM335x.


> 
> Note: No special userspace tools are needed to load PRU firmware. The
> Linux kernel loads the specifically-named files as normal kernel
> firmware.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2016-November/178050.html
> [2] http://processors.wiki.ti.com/index.php/PRU_Training:_Hands-on_Labs
> [3] https://git.ti.com/pru-software-support-package/pru-software-support-package/trees/v4.0.2/labs/lab_4
> 
> Signed-off-by: Ash Charles <ash.charles@savoirfairelinux.com>

[snip]
> +config BR2_PACKAGE_PRU_SAMPLE
> +	bool "PRU sample firmware"
> +	depends on BR2_PACKAGE_HOST_PRU_SOFTWARE_SUPPORT
> +	help
> +	  Sample PRU firmware extracted from lab #4 from the TI
> +	  example code. See
> +	  http://processors.wiki.ti.com/index.php/PRU_Training:_Hands-on_Labs

 This is a useful URL, make sure you keep it somewhere.

> diff --git a/package/pru-sample/pru-sample.mk b/package/pru-sample/pru-sample.mk
> new file mode 100644
> index 0000000..19cdf02
> --- /dev/null
> +++ b/package/pru-sample/pru-sample.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# pru-sample
> +#
> +################################################################################
> +
> +PRU_SAMPLE_VERSION = 0.1
> +PRU_SAMPLE_SITE = package/pru-sample/src
> +PRU_SAMPLE_SITE_METHOD = local
> +PRU_SAMPLE_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
> +
> +define PRU_SAMPLE_BUILD_CMDS
> +        $(MAKE) PRU_CGT=$(TI_CGT_PRU_DIR) -C $(@D)
> +endef
> +
> +define PRU_SAMPLE_INSTALL_TARGET_CMDS
> +        mkdir -p $(TARGET_DIR)/lib/firmware/
> +        $(INSTALL) -m 0644 $(@D)/pru0.out $(TARGET_DIR)/lib/firmware/am335x-pru0-fw

 Add -D to the install command, then the mkdir above isn't needed.


 Regards,
 Arnout

> +        $(INSTALL) -m 0644 $(@D)/pru1.out $(TARGET_DIR)/lib/firmware/am335x-pru1-fw
> +endef
> +
> +$(eval $(generic-package))
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
