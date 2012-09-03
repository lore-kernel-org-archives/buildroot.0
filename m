From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 03 Sep 2012 18:17:22 +0200
Subject: [Buildroot] Please help with pkg infrastructure
Message-ID: <1346689042.29515.6.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to simplify our custom buildroot packages that define the
build rules for our internal software packages. So far these packages
duplicate a lot of akward code in their .mk files. I'd like to move this
to a central place. So what I did is to add code like this to
package/raumfeld/raumfeld.mk:


-------------------------------------------------------------------------

################################################################################
# inner-raumfeld-autotools-package
#
#  argument 1 is the lowercase package name
#  argument 2 is the uppercase package name
#  argument 3 is the package directory prefix
################################################################################

define inner-raumfeld-autotools-package


ifndef $(2)_BRANCH
  $(2)_BRANCH = $(call qstrip,$(BR2_PACKAGE_RAUMFELD_BRANCH))
endif

ifndef $(2)_MODULE
  $(2)_MODULE = $($(1))
endif

ifndef $(2)_VERSION
  $(2)_VERSION = $($(2)_BRANCH)
endif


# Call the generic autotools package infrastructure to generate the necessary
# make targets
$(call inner-autotools-package,$(1),$(2),$(2),$(3),target)


################################################################################
# raumfeld-autotools-package
#   -- the target generator macro for Raumfeld autotools packages
################################################################################

raumfeld-autotools-package = $(call inner-raumfeld-autotools-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir))


################################################################################
################################################################################

include package/raumfeld/*/*.mk

-------------------------------------------------------------------------


As you can probably guess the idea here is to define PKG_BRANCH, PKG_MODULE
and PKG_VERSION with default values but still leave the possibility to
override these from the respective pkg.mk files.

So what am I doing wrong here, because PKG_VERSION ends up being
"undefined" instead of defaulting to the value of
$BR2_PACKAGE_RAUMFELD_BRANCH ?


Thanks for your help,
Sven
