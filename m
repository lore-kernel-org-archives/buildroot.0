From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 May 2020 11:52:46 +0200
Subject: [Buildroot] [PATCH 05/11] package/pkg-generic.mk: rework
 pkg_size logic with the "installed" step
In-Reply-To: <20200501204441.GA15673@scaer>
References: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
 <20200430095249.782597-6-thomas.petazzoni@bootlin.com>
 <20200501204441.GA15673@scaer>
Message-ID: <20200502115246.059d990e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for taking the time to review this stuff!

On Fri, 1 May 2020 22:44:41 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I don't understand wy tht can't be achieved in the instrumentation hooks
> mechanism:
> 
>     $(if $(filter start-configure,$(1)-$(2)),\
>         $(call step_pkg_size_before,$(TARGET_DIR))\
>         $(call step_pkg_size_before,$(STAGING_DIR),-staging)\
>         $(call step_pkg_size_before,$(HOST_DIR),-host))
> 
>     $(if $(filter end-install,$(1)-$(2)),\
>         $(call step_pkg_size_after,$(TARGET_DIR))\
>         $(call step_pkg_size_after,$(STAGING_DIR),-staging)\
>         $(call step_pkg_size_after,$(HOST_DIR),-host))
> 
> Of course, it means you have to add a call the instrumentation hooks
> from the new 'install' step.

This wouldn't work for the configure step. See the code:

$(BUILD_DIR)/%/.stamp_configured:
	@$(call step_start,configure)
	@$(call MESSAGE,"Configuring")
	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))

The hooks are called *before* we populate the per package directories.
But we need to capture the list of files *after* we populate the per
package directories.

In addition, I don't really understand why we use those global
instrumentation hooks within the generic infra itself. It is just a lot
clearer to me to make those function calls directly than to have this
indirection through hooks.

For me, it's like using hooks for the configure, build or install steps
of a generic package. For example, do we typically do:

ifeq ($(something),y)
define FOO_BUILD_THIS
	...
endef
endif

define FOO_BUILD_CMDS
	... do stuff ...
	$(FOO_BUILD_THIS)
endef

or this:

define FOO_BUILD_CMDS
	... do stuff ...
endef

ifeq ($(something),y)
define FOO_BUILD_THIS
	...
endef
FOO_POST_BUILD_HOOKS += FOO_BUILD_THIS
endef

We typically do the former, because there is no point in using hooks in
this situation. Hooks are useful to inject some logic to a step of
logic you don't have control over. When you have control over that step
of logic, hooks are kind of useless.

That being said, if you have a proposal to solve the ordering of things
in the configure step between the instrumentation hook and the
per-package directory population, I'm definitely fine with changing to
use instrumentation hooks.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
