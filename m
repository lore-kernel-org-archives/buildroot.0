From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Apr 2017 23:20:58 +0200
Subject: [Buildroot] [PATCH 2/3 v2] core/pk-generic: redirect only wsa when
	listing package's isntalled files
In-Reply-To: <cover.1491427248.git.yann.morin.1998@free.fr>
References: <cover.1491427248.git.yann.morin.1998@free.fr>
Message-ID: <1bfda8d4827de2ec26b79dbed992211a76f44da7.1491427248.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no need to redirect again and again for each new file added to
the list; we can just redirect once and for all.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6b3c69c..166efd6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -76,8 +76,8 @@ define step_pkg_size_end
 		$($(PKG)_DIR)/.br_filelist_after
 	comm -13 $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after | \
 		while read hash file ; do \
-			echo "$(1),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
-		done
+			echo "$(1),$${file}" ; \
+		done >> $(BUILD_DIR)/packages-file-list.txt
 	rm -f $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after
 endef
 
-- 
2.9.3
