From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 23:05:17 +0100
Subject: [Buildroot] Issue with host packages and DL_TOOLS_DEPENDENCIES
Message-ID: <20191210230517.25be6a63@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

While working on
https://patchwork.ozlabs.org/project/buildroot/list/?series=147671, I
realized that we have an issue with how DL_TOOLS_DEPENDENCIES is
calculated and host packages.

Here is a snippet of code from package/pkg-generic.mk, inside
inner-generic-package:

ifeq ($$($$($(2)_KCONFIG_VAR)),y)
[...]
ifeq ($$($(2)_SITE_METHOD),svn)
DL_TOOLS_DEPENDENCIES += svn
else ifeq ($$($(2)_SITE_METHOD),git)
DL_TOOLS_DEPENDENCIES += git
else ifeq ($$($(2)_SITE_METHOD),bzr)
DL_TOOLS_DEPENDENCIES += bzr
else ifeq ($$($(2)_SITE_METHOD),scp)
DL_TOOLS_DEPENDENCIES += scp ssh
else ifeq ($$($(2)_SITE_METHOD),hg)
DL_TOOLS_DEPENDENCIES += hg
else ifeq ($$($(2)_SITE_METHOD),cvs)
DL_TOOLS_DEPENDENCIES += cvs
endif # SITE_METHOD

DL_TOOLS_DEPENDENCIES += $$(call extractor-system-dependency,$$($(2)_SOURCE))
[...]
endif

So it means that the DL_TOOLS_DEPENDENCIES calculation is inside the
KCONFIG_VAR_$(2) condition, which means it is only true for target
packages (and a few lucky host packages that have a corresponding
Config.in option).

Due to this, if you have a host package that needs a given extractor,
or bzr, or svn, then it is not listed in DL_TOOLS_DEPENDENCIES, and
will not be checked by the support/dependencies/ logic.

We would need to recursively take into account the dependencies of the
current package while calculating this, so that host packages are
properly accounted for.

What do you think ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
