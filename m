From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  6 Oct 2014 18:16:10 +0200
Subject: [Buildroot] [PATCH] legal-info: fix bug leading to one package not
	being considered
Message-ID: <1412612170-31047-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to excessive parenthesis, the TARGETS_LEGAL_INFO expression was
evaluated to something like this:

  toolchain-legal-info toolchain-external-legal-info busybox-legal-info zlib-legal-info))

Yes, with the last two parenthesis. This had the effect that the
zlib-legal-info rule was never called: the last package of $(TARGETS)
$(TARGET_HOST_DEPS) $(HOST_DEPS) was never added in the legal-info
information.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6068e7f..3f56648 100644
--- a/Makefile
+++ b/Makefile
@@ -414,7 +414,7 @@ HOST_DEPS = $(sort $(foreach dep,\
 HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 
 TARGETS_LEGAL_INFO := $(patsubst %,%-legal-info,\
-		$(TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
+		$(TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))
 
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR)
-- 
2.0.0
