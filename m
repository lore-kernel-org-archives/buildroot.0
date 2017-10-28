From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Oct 2017 17:30:57 +0200
Subject: [Buildroot] [PATCH 2/4 v3] core/pkg-generic: redirect only when
	listing package's installed files
In-Reply-To: <cover.1509204637.git.yann.morin.1998@free.fr>
References: <cover.1509204637.git.yann.morin.1998@free.fr>
Message-ID: <197d62b193e6ada6f1ffe841769d8e200015c04a.1509204637.git.yann.morin.1998@free.fr>
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
index c81a701834..0baab661c7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -83,8 +83,8 @@ define step_pkg_size_end
 	$(call _step_pkg_size_get_file_list,$($(PKG)_DIR)/.br_filelist_after)
 	comm -13 $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after | \
 		while read hash file ; do \
-			echo "$(1),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
-		done
+			echo "$(1),$${file}" ; \
+		done >> $(BUILD_DIR)/packages-file-list.txt
 	rm -f $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after
 endef
 
-- 
2.11.0
