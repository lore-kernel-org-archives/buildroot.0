From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Jul 2012 10:08:13 +0200
Subject: [Buildroot] [PATCH] Added local package support.
In-Reply-To: <CAMkyJgA3+icHUKQ6AS==QQG--RuuptTjgy3KSdJvcwiAPxF3Rg@mail.gmail.com>
References: <20120724042408.GA11558@sapphire.tkos.co.il>
 <1343247448-19993-1-git-send-email-avishorp@gmail.com>
 <50107EAF.3030302@mind.be>
 <CAMkyJgA3+icHUKQ6AS==QQG--RuuptTjgy3KSdJvcwiAPxF3Rg@mail.gmail.com>
Message-ID: <50124C6D.8050608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Please keep the list in CC]

On 07/26/12 16:56, Avishay Orpaz wrote:
> Hi Arnout, thanks for the comments. I'll repost the patch when fixed.
>
> 2012/7/26 Arnout Vandecappelle <arnout at mind.be <mailto:arnout@mind.be>>
>
>     On 07/25/12 22:17, Avishay Orpaz wrote:
>
>         From: Avishay O<avishorp at gmail.com <mailto:avishorp@gmail.com>>
>
>         Local packages are packages that are local to the build and not distributed with buildroot.
>         They are placed in a directory named "locals" (by default) and follow the same rules
>         as other packages (Config.in,<pkgname>.mk, patches ..). Their configuration options
>         are automatically collected and placed under the "Local Packages" menu in x/menu/.../config.
>
>
>       I'm going to give comments on this patch, even though I'm not sure if I would
>     want to have this feature in buildroot.
>
>
> Why? I think it's very convinient to leave buildroot untouched (and easy to upgrade) and put the system specific
> packages in a different place.

  That is currently usually done by (manually) adding a packages/<company name>/
directory which contains all the local packages, with a manually created
Config.in.  So what this patch adds is mainly to build Config.in automatically.

>Anyway, if you don't intend to include the patch please let me know so I won't bother to
> make corrections.

  That's why I said immediately that I'm not a big fan of this feature.

  What do the others think?

  Regards,
  Arnout


  [Quoting the rest of the message because it was not posted on the list]

>
>
>
>         ---
>            Makefile          |   48 ++++++++++++++++++++++++++++++------------------
>            package/Config.in |    4 ++++
>            2 files changed, 34 insertions(+), 18 deletions(-)
>
>         diff --git a/Makefile b/Makefile
>         index 639fdaa..e9342e9 100644
>         --- a/Makefile
>         +++ b/Makefile
>         @@ -192,6 +192,7 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
>
>            BUILD_DIR:=$(BASE_DIR)/build
>
>         +LOCAL_PACKAGES_DIR:=locals
>
>
>       Please use <space>=<space> for variable assignments.  The BUILD_DIR above
>     is historical.
>
> OK.
>
>       Is there an added value to define a variable for this?
>
> I thinks it's good to keep things configurable when possible. I'm actually using such method to build multiple systems
> with a single buildroot copy.
>
>       Also, I'd call the directory 'local' rather than 'locals'.
>
> OK.
>
>
>
>            ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>
>         @@ -315,6 +316,9 @@ endif
>
>            include package/*/*.mk
>
>         +# Include local packages
>         +include $(LOCAL_PACKAGES_DIR)/*/*.mk
>
>
>       Can you verify if this still works when the LOCAL_PACKAGES_DIR is
>     empty or doesn't exist?
>
> It does.
>
>
>         +
>            include boot/common.mk <http://common.mk>
>            include target/Makefile.in
>            include linux/linux.mk <http://linux.mk>
>         @@ -565,43 +569,51 @@ COMMON_CONFIG_ENV = \
>                  KCONFIG_TRISTATE=$(BUILD_DIR)/__buildroot-config/tristate.__config \
>                  BUILDROOT_CONFIG=$(CONFIG_DIR)__/.config
>
>         -xconfig: $(BUILD_DIR)/buildroot-config/__qconf outputmakefile
>         +LOCALS_CONFIG_FILE = .locals.Config.in <http://locals.Config.in>
>         +
>         +$(LOCALS_CONFIG_FILE):
>         +       rm -f $(@)
>         +       find $(LOCAL_PACKAGES_DIR)  \
>         +       -regex '^$(LOCAL_PACKAGES_DIR)/[^/]*/__Config.in$$' \
>         +       -exec cat {} \;>>  $@ || true
>
>
>       There is no real need to generate this file automatically.  I'd keep it
>     manually maintained, like for the normal packages.
>
> It's for convenience. The local package directory is very dynamic. In my opinion, if you want to add a package to the
> project just put it there and it will show up.
>
>       Also we normally don't create _any_ file outside $(O), so that the buildroot
>     source itself can be read-only.  This file is of course a special case,
>     because it belongs with the locals directory.
>
> The problem is that the kconfig configuration files don't expand environment variables, so it's impossible to include a
> Config.in file from a variable directory. Anyway, the .config is created in the invocation directory.
>
>
>         +
>         +xconfig: $(BUILD_DIR)/buildroot-config/__qconf outputmakefile $(LOCALS_CONFIG_FILE)
>                  @mkdir -p $(BUILD_DIR)/buildroot-config
>                  @$(COMMON_CONFIG_ENV) $<  $(CONFIG_CONFIG_IN)
>
>         -gconfig: $(BUILD_DIR)/buildroot-config/__gconf outputmakefile
>         +gconfig: $(BUILD_DIR)/buildroot-config/__gconf outputmakefile $(LOCALS_CONFIG_FILE)
>                  @mkdir -p $(BUILD_DIR)/buildroot-config
>                  @$(COMMON_CONFIG_ENV) srctree=$(TOPDIR) $<  $(CONFIG_CONFIG_IN)
>
>         -menuconfig: $(BUILD_DIR)/buildroot-config/__mconf outputmakefile
>         +menuconfig: $(BUILD_DIR)/buildroot-config/__mconf outputmakefile $(LOCALS_CONFIG_FILE)
>                  @mkdir -p $(BUILD_DIR)/buildroot-config
>                  @$(COMMON_CONFIG_ENV) $<  $(CONFIG_CONFIG_IN)
>
>         -nconfig: $(BUILD_DIR)/buildroot-config/__nconf outputmakefile
>         +nconfig: $(BUILD_DIR)/buildroot-config/__nconf outputmakefile $(LOCALS_CONFIG_FILE)
>                  @mkdir -p $(BUILD_DIR)/buildroot-config
>                  @$(COMMON_CONFIG_ENV) $<  $(CONFIG_CONFIG_IN)
>
>         -config: $(BUILD_DIR)/buildroot-config/__conf outputmakefile
>         +config: $(BUILD_DIR)/buildroot-config/__conf outputmakefile $(LOCALS_CONFIG_FILE)
>                  @mkdir -p $(BUILD_DIR)/buildroot-config
>                  @$(COMMON_CONFIG_ENV) $<  $(CONFIG_CONFIG_IN)
>
>         -oldconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile
>         +oldconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile $(LOCALS_CONFIG_FILE)
>                  mkdir -p $(BUILD_DIR)/buildroot-config
>                  @$(COMMON_CONFIG_ENV) $<  --oldconfig $(CONFIG_CONFIG_IN)
>
>         -randconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile
>         +randconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile $(LOCALS_CONFIG_FILE)
>                  @mkdir -p $(BUILD_DIR)/buildroot-config
>                  @$(COMMON_CONFIG_ENV) $<  --randconfig $(CONFIG_CONFIG_IN)
>
>         -allyesconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile
>         +allyesconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile $(LOCALS_CONFIG_FILE)
>                  @mkdir -p $(BUILD_DIR)/buildroot-config
>                  @$(COMMON_CONFIG_ENV) $<  --allyesconfig $(CONFIG_CONFIG_IN)
>
>         -allnoconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile
>         +allnoconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile $(LOCALS_CONFIG_FILE)
>                  @mkdir -p $(BUILD_DIR)/buildroot-config
>                  @$(COMMON_CONFIG_ENV) $<  --allnoconfig $(CONFIG_CONFIG_IN)
>
>         -randpackageconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile
>         +randpackageconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile $(LOCALS_CONFIG_FILE)
>                  @mkdir -p $(BUILD_DIR)/buildroot-config
>                  @grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config>  $(CONFIG_DIR)/.config.nopkg
>                  @$(COMMON_CONFIG_ENV) \
>         @@ -609,7 +621,7 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile
>                          $<  --randconfig $(CONFIG_CONFIG_IN)
>                  @rm -f $(CONFIG_DIR)/.config.nopkg
>
>         -allyespackageconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile
>         +allyespackageconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile $(LOCALS_CONFIG_FILE)
>                  @mkdir -p $(BUILD_DIR)/buildroot-config
>                  @grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config>  $(CONFIG_DIR)/.config.nopkg
>                  @$(COMMON_CONFIG_ENV) \
>         @@ -617,7 +629,7 @@ allyespackageconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile
>                          $<  --allyesconfig $(CONFIG_CONFIG_IN)
>                  @rm -f $(CONFIG_DIR)/.config.nopkg
>
>         -allnopackageconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile
>         +allnopackageconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile $(LOCALS_CONFIG_FILE)
>                  @mkdir -p $(BUILD_DIR)/buildroot-config
>                  @grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config>  $(CONFIG_DIR)/.config.nopkg
>                  @$(COMMON_CONFIG_ENV) \
>         @@ -625,19 +637,19 @@ allnopackageconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile
>                          $<  --allnoconfig $(CONFIG_CONFIG_IN)
>                  @rm -f $(CONFIG_DIR)/.config.nopkg
>
>         -silentoldconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile
>         +silentoldconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile $(LOCALS_CONFIG_FILE)
>                  @mkdir -p $(BUILD_DIR)/buildroot-config
>                  $(COMMON_CONFIG_ENV) $<  --silentoldconfig $(CONFIG_CONFIG_IN)
>
>         -defconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile
>         +defconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile $(LOCALS_CONFIG_FILE)
>                  @mkdir -p $(BUILD_DIR)/buildroot-config
>                  @$(COMMON_CONFIG_ENV) $<  --defconfig$(if $(BR2_DEFCONFIG),=$(BR2___DEFCONFIG)) $(CONFIG_CONFIG_IN)
>
>         -%_defconfig: $(BUILD_DIR)/buildroot-config/__conf $(TOPDIR)/configs/%_defconfig outputmakefile
>         +%_defconfig: $(BUILD_DIR)/buildroot-config/__conf $(TOPDIR)/configs/%_defconfig outputmakefile
>         $(LOCALS_CONFIG_FILE)
>                  @mkdir -p $(BUILD_DIR)/buildroot-config
>                  @$(COMMON_CONFIG_ENV) $<  --defconfig=$(TOPDIR)/configs/__$@ $(CONFIG_CONFIG_IN)
>
>         -savedefconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile
>         +savedefconfig: $(BUILD_DIR)/buildroot-config/__conf outputmakefile $(LOCALS_CONFIG_FILE)
>                  @mkdir -p $(BUILD_DIR)/buildroot-config
>                  @$(COMMON_CONFIG_ENV) $<  --savedefconfig=$(CONFIG_DIR)/__defconfig $(CONFIG_CONFIG_IN)
>
>         @@ -664,7 +676,7 @@ endif
>            clean:
>                  rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
>                          $(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
>         -               $(LEGAL_INFO_DIR)
>         +               $(LEGAL_INFO_DIR) $(LOCALS_CONFIG_FILE)
>
>
>       This shouldn't be cleaned in the clean target, but in the distclean target.
>
> The $(LOCALS_CONFIG_FILE) should be considered as a runtime temporary file, not a configuration file. It's not like
> .config or so.
>
>
>
>            distclean: clean
>            ifeq ($(DL_DIR),$(TOPDIR)/dl)
>         @@ -760,5 +772,5 @@ print-version:
>
>            include docs/manual/manual.mk <http://manual.mk>
>
>         -.PHONY: $(noconfig_targets)
>         +.PHONY: $(noconfig_targets) $(LOCALS_CONFIG_FILE)
>
>         diff --git a/package/Config.in b/package/Config.in
>         index f664b8e..06a779c 100644
>         --- a/package/Config.in
>         +++ b/package/Config.in
>         @@ -695,4 +695,8 @@ source "package/vim/Config.in"
>            endif
>            endmenu
>
>         +menu "Local Packages"
>         +source ".locals.Config.in <http://locals.Config.in>"
>         +endmenu
>         +
>            endmenu
>
>
>     .locals.Config.in <http://locals.Config.in> should also be included in the .gitignore.
>
> OK.
>
>       Regards,
>       Arnout
>     --
>     Arnout Vandecappelle                               arnout at mind be
>     Senior Embedded Software Architect                 +32-16-286540
>     Essensium/Mind http://www.mind.be
>     G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
>     LinkedIn profile: http://www.linkedin.com/in/__arnoutvandecappelle <http://www.linkedin.com/in/arnoutvandecappelle>
>     GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
