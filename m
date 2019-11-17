From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Nov 2019 17:56:10 +0100
Subject: [Buildroot] [PATCH 1/1] core: load a global.mk file if it
 exists to override global vars
In-Reply-To: <06c9840e-2577-dc81-c0ab-f9301b5bcce7@mojix.com>
References: <06c9840e-2577-dc81-c0ab-f9301b5bcce7@mojix.com>
Message-ID: <b1825789-a7c2-234d-5da6-41ddc34806ae@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Florent,

 Thank you for this contribution. I'm going to reject it, but it's very useful
to have a discussion about it.

On 17/11/2019 17:12, Florent VIARD (Mojix) wrote:
> 
> For example, this can be useful to permanently set a
> BR2_EXTERNAL without having to use the "env var" at least once.
> 
> The global.mk file has to be located inside TOPDIR.
> 
> Example:
> -- global.mk --
> BR2_EXTERNAL = ext-myproject

 It would be more logical to use $(TOPDIR)/ext-myproject here.


> It can also probably be used for BR2_VERSION customization or to add

 Why would you want to customize BR2_VERSION?

> global variables to be used in custom config files.

 Both of those can be set in any of the external .mk files, or in local.mk.


> 
> To give a little bit of context of the genesis of this change:
> - I have a project using buildroot for a custom product.
> - I have an "ext-myproject" folder at the root of TOPDIR that is an
> external folder.
> - All the configs, scripts or vendor specific packages are located
> inside this external folder.
> 
> Like that, the project is kind of "out-of-tree", with everything located
> in a specific dir, and the buildroot original file/folders stay clean.
> So, it is more easy to merge updated versions.

 That's not how external was expected to be used. If you include your external
inside the Buildroot tree, there's little point in making it external. You could
just as well create a directory package/mojix and put your custom packages
there, and configs/mojix_* and board/mojix for the rest.

 And in this situation, you can in fact easily put the BR2_EXTERNAL =
ext-myproject in the Buildroot Makefile in your repo. Merging that with an
updated Buildroot is still going to be trivial.

 The way an external is expected to be used is as follows:

- buildroot as a subdirectory (probably submodule) of the external;
- external includes a Makefile or other script to call into buildroot.

 I'll append an example Makefile that I've used for some project. It would
actually be nice to include something like that in Buildroot, and more
importantly to add the above statements as proper documentation, but I've never
gotten around to that...


> The issue solved by this change is that, currently, path to external
> folder(s) has to be manually set through the env var at least once by
> everyone in the team after a checkout and eventually again after a make
> distclean. Because, the BR2_EXTERNAL path settings are saved within the
> "output" folder.
> 
> Using the global.mk file, i can setup the BR2_EXTERNAL and save/commit
> it with the project, so that anyone can start building with a single
> "make" without non obvious manipulation.

 Two times make, actually: "make foo_defconfig" and "make" :-)


> As a side effect of this change, using this can help overcome a
> regression in
> buildroot that I have noticed:
> External paths are supposed to be absolute or relative, but a change
> pushed a few years ago, automatically change external relative path to
> absolute before generating the temporary files.

 Err, that sounds like the right thing to do, so what exactly is the regression?
If there really is a regression, we'll want to fix it.

 As noted, I've marked your patch as Rejected in patchwork. If others disagree
with me, we can still go back to [1] and set it to New again.

> 
> Signed-off-by: Florent Viard <fviard@cxignited.com>

 The e-mail address in your Signed-off-by should be the same as the author
address (i.e. the From of the mail).

> ---
> Makefile | 3 +++
> 1 file changed, 3 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index c78c2cbcf6..f2c43ef40f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -170,6 +170,9 @@ export CDPATH :=
> BASE_DIR := $(CANONICAL_O)
> $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
> 
> +# Include the global override file if one is provided
> +# This is useful, for example, to allow the user to permanently set
> BR2_EXTERNAL

 This was line-wrapped. Did you use git send-email?

 Regards,
 Arnout

> +-include $(TOPDIR)/global.mk
> 
> # Handling of BR2_EXTERNAL.
> #

[1] http://patchwork.ozlabs.org/patch/1196387/


---------
# Top-level Makefile for an external Buildroot project
#
# Copyright (c) 2015 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

CURDIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

# The directory in which this Makefile resides is used as BR2_EXTERNAL
export BR2_EXTERNAL := $(CURDIR)

# Put downloads in this directory instead of in the Buildroot directory
ifeq ($(BR2_DL_DIR),)
BR2_DL_DIR = $(CURDIR)/dl
endif
export BR2_DL_DIR

# Output directory: if called from $(CURDIR), under output/, otherwise
# under the current directory
ifeq ($(realpath $(CURDIR)),$(realpath .))
OUTPUT_BASEDIR = $(CURDIR)/output
else
OUTPUT_BASEDIR = .
endif

-include $(OUTPUT_BASEDIR)/currentconfig

MAKE_BUILDROOT = $(MAKE) -C $(CURDIR)/buildroot O=$(OUTPUT_BASEDIR)/$(CONFIG)

.PHONY: _all
_all:
        $(MAKE_BUILDROOT) $(all)

# On first run, force selecting a config
ifeq ($(CONFIG),)
_all: requireconfig
requireconfig:
        $(error First select a configuration)
endif

# Build an existing configuration
CONFIGS = $(patsubst %_defconfig,%,$(notdir $(wildcard
$(CURDIR)/configs/*_defconfig)))
.PHONY: $(CONFIGS)
$(CONFIGS): CONFIG=$*
$(CONFIGS): %: $(CURDIR)/configs/%_defconfig
        @mkdir -p $(OUTPUT_BASEDIR)
        $(MAKE_BUILDROOT) $(CONFIG)_defconfig
        @echo "CONFIG ?= $(CONFIG)" > $(OUTPUT_BASEDIR)/currentconfig
        $(MAKE_BUILDROOT)

REAL_TARGETS = Makefile $(OUTPUT_BASEDIR)/currentconfig

# Anything else is passed on to buildroot
all := $(filter-out $(CONFIGS) $(new_targets) $(REAL_TARGETS),$(MAKECMDGOALS))

.PHONY: $(all)
$(all): _all
        @:

Makefile:;
$(OUTPUT_BASEDIR)/currentconfig:;
