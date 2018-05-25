From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 May 2018 22:43:02 +0200
Subject: [Buildroot] [PATCH 2/2] package/elf2flt: replace hard-links with
 script wrappers to fix rpath
In-Reply-To: <cover.1527280948.git.yann.morin.1998@free.fr>
References: <cover.1527280948.git.yann.morin.1998@free.fr>
Message-ID: <59b3d35d7c805ebee29dc7185ea63e55aca768ca.1527280948.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do for elf2flt what we did for binutils: replace the hardlinks (which
break rpath handling) with script wrappers.

See previous commit (package/binutils: switch from symlinks to script
wrappers) and commit f9cffb6af4 (binutils: replace hard-links with
soft-links to fix rpath) for the complete story.

Fixes: #11031.

Reported-by: Christophe Priouzeau <christophe.priouzeau@st.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 package/elf2flt/elf2flt.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 995dfedebd..6ce5cd34a2 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -29,4 +29,21 @@ endif
 
 HOST_ELF2FLT_CONF_ENV = LIBS="$(HOST_ELF2FLT_LIBS)"
 
+# Hardlinks between binaries in different directories cause a problem
+# # with rpath fixup, so we de-hardlink those binaries, and replace them
+# with wrapper scripts. ld and ld.real are already wrappers, but they
+# point to the binutils, so we have to replace them with wrappers to
+# the elf2flt ones.
+ELF2FLT_TOOLS = elf2flt flthdr ld ld.real
+define HOST_ELF2FLT_FIXUP_HARDLINKS
+	$(foreach tool,$(ELF2FLT_TOOLS),\
+		rm -f $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/$(tool) && \
+		printf '#!/usr/bin/env bash\nexec -a "$${0}" "$${0%%/*}/%s-$${0##*/}" "$${@}"\n' \
+			../../bin/$(GNU_TARGET_NAME) \
+			>$(HOST_DIR)/$(GNU_TARGET_NAME)/bin/$(tool)
+	)
+	chmod +x $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/*
+endef
+HOST_ELF2FLT_POST_INSTALL_HOOKS += HOST_ELF2FLT_FIXUP_HARDLINKS
+
 $(eval $(host-autotools-package))
-- 
2.14.1
