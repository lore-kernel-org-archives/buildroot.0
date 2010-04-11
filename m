From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:02 +0200
Subject: [Buildroot] [PATCH 06/25] Remove all documentation when
	BR2_HAVE_DOCUMENTATION is not set
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87b0637bd086ecdaf01f6f108bd68eb7662397ca.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, we had BR2_HAVE_MANPAGES, BR2_HAVE_INFOPAGES and
BR2_HAVE_DOCUMENTATION, but there's no need to have such a
fine-grained control over what documentation gets kept or not.

Therefore, just remove all the documentation (man pages, info pages
and documentation in $(TARGET_DIR)/usr/doc and
$(TARGET_DIR)/usr/share/doc) when BR2_HAVE_DOCUMENTATION is not set.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index ce6bf3d..03ed4c5 100644
--- a/Makefile
+++ b/Makefile
@@ -409,11 +409,10 @@ else
 	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/man
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
+	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
 endif
 	find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
 	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
-- 
1.6.3.3
