From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 01:01:02 +0200
Subject: [Buildroot] [PATCH 4/6] gutenprint: ensure target and host variant
	have the same patch hooks
In-Reply-To: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1369695664-5670-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for the out-of-tree support, it is important that all
packages have the same patch hooks for the host variant and the target
variant (because the source tree will be shared between host and
target variants when doing out-of-tree build).

In the case of gutenprint, the patch hook executed for the target just
creates one directory which is needed for autoreconf to work, and the
host variant is not autoreconf'ed. So there is no harm in also
applying this patch hook to the host variant.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gutenprint/gutenprint.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 834d967..2431a54 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -69,6 +69,7 @@ define GUTENPRINT_CREATE_M4_DIR
 	mkdir -p $(@D)/m4local
 endef
 GUTENPRINT_POST_PATCH_HOOKS += GUTENPRINT_CREATE_M4_DIR
+HOST_GUTENPRINT_POST_PATCH_HOOKS += GUTENPRINT_CREATE_M4_DIR
 
 define HOST_GUTENPRINT_POST_BUILD_INSTAL_TMP_HEADER
 	cp $(@D)/src/xml/xmli18n-tmp.h $(HOST_DIR)/usr/include
-- 
1.7.9.5
