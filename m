From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jun 2010 20:50:11 +0200
Subject: [Buildroot] [PATCH 07/10] Add generic functions to
	enable/set/disable options in kconfig files
In-Reply-To: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
Message-ID: <05a52574ff3974399cbab54443dec91898a62d59.1276454802.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The KCONFIG_ENABLE_OPT, KCONFIG_SET_OPT and KCONFIG_DISABLE_OPT are
new make functions to respectively enable, set and disable options in
Kconfig-like files (as used by the kernel, uClibc or Busybox).

They can be used as follows :

 $(call KCONFIG_ENABLE_OPT,CONFIG_FOOBAR,/path/to/.config)
 $(call KCONFIG_SET_OPT,CONFIG_BARFOO,foobar,/path/to/.config)
 $(call KCONFIG_DISABLE_OPT,CONFIG_FARBOO,/path/to/.config)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index cdf49f8..b702c49 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -40,6 +40,21 @@ UPPERCASE = $(strip $(eval __tmp := $1) \
 			$(__tmp)))) \
      $(__tmp))
 
+define KCONFIG_ENABLE_OPT
+       $(SED) "/$(1)/d" $(2)
+       echo "$(1)=y" >> $(2)
+endef
+
+define KCONFIG_SET_OPT
+       $(SED) "/$(1)/d" $(3)
+       echo "$(1)=$(2)" >> $(3)
+endef
+
+define KCONFIG_DISABLE_OPT
+       $(SED) "/$(1)/d" $(2)
+       echo "# $(1) is not set" >> $(2)
+endef
+
 # Define extrators for different archive suffixes
 INFLATE.bz2 = $(BZCAT)
 INFLATE.gz  = $(ZCAT)
-- 
1.7.0.4
