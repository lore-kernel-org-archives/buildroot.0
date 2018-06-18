From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jun 2018 10:07:39 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/elf2flt: replace
 hard-links with copies to fix rpath
Message-ID: <20180618080627.0AD3088E63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31bdd82f84a79e7acef54a6c9ff48d7281a5ecc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Do for elf2flt what we did for binutils: replace the hardlinks (which
break rpath handling) with copies of the individaul tools.

See previous commit (package/binutils: switch from symlinks to copies
and commit f9cffb6af4 (binutils: replace hard-links with soft-links to
fix rpath) for the complete story.

Fixes: #11031.

Reported-by: Christophe Priouzeau <christophe.priouzeau@st.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Christophe Priouzeau <christophe.priouzeau@st.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b37069340010f4d26c3baa741f2dc996014b7c66)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elf2flt/elf2flt.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 995dfedebd..557f94d338 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -29,4 +29,20 @@ endif
 
 HOST_ELF2FLT_CONF_ENV = LIBS="$(HOST_ELF2FLT_LIBS)"
 
+# Hardlinks between binaries in different directories cause a problem
+# with rpath fixup, so we de-hardlink those binaries, and replace them
+# with copies instead. Note that elf2flt will rename ld to ld.real
+# before installing its own ld, but we already took care of the
+# original ld from binutils so that it is already de-hardlinked. So
+# ld is now the one from elf2flt, and we want to de-hardlinke it.
+ELF2FLT_TOOLS = elf2flt flthdr ld
+define HOST_ELF2FLT_FIXUP_HARDLINKS
+	$(foreach tool,$(ELF2FLT_TOOLS),\
+		rm -f $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/$(tool) && \
+		cp -a $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-$(tool) \
+			$(HOST_DIR)/$(GNU_TARGET_NAME)/bin/$(tool)
+	)
+endef
+HOST_ELF2FLT_POST_INSTALL_HOOKS += HOST_ELF2FLT_FIXUP_HARDLINKS
+
 $(eval $(host-autotools-package))
