From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jun 2010 11:27:29 +0200
Subject: [Buildroot] [git commit master 1/1] Add generic functions to
	enable/set/disable options in kconfig files
Message-ID: <20100623092836.A10CF81886@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0802370746a91943ec44cbd67363525f72c873e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
1.7.1
