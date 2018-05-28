From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 May 2018 21:45:18 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/elf2flt: replace hard-links with
 copies to fix rpath
In-Reply-To: <cover.1527536710.git.yann.morin.1998@free.fr>
References: <cover.1527536710.git.yann.morin.1998@free.fr>
Message-ID: <99b5f16248ada22680df533f78869bcf552e06d9.1527536710.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
Changes v1 -> v2:
  - use copies, not shell wrappers  (Arnout)
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
-- 
2.14.1
