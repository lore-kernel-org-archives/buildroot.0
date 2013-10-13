From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Oct 2013 01:11:28 +0200
Subject: [Buildroot] [PATCH 4/4] pkg-infra: add user-supplied step-hooks
In-Reply-To: <cover.1381705600.git.yann.morin.1998@free.fr>
References: <cover.1381705600.git.yann.morin.1998@free.fr>
Message-ID: <3f8ce54570cde2f93d5f61c80a1b28af046b4926.1381705600.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Allow user to supply their own step-hooks by passing a variable
on the make command-line:
    make BR2_STEP_USER_HOOK=/path/to/my/script

This can be usefull to run site-specific actions at each step of the
build process, such as logging installed, removed or modified files,
do sanity checks on installed files...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 162c9ed..f5c33b2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -42,6 +42,14 @@ define step_time
 endef
 STEP_HOOKS += step_time
 
+# User-supplied script
+define step_user
+	"$(BR2_STEP_USER_HOOK)" "$(1)" "$(2)" "$($(PKG)_NAME)"
+endef
+ifneq ($(BR2_STEP_USER_HOOK),)
+STEP_HOOKS += step_user
+endif
+
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
 ################################################################################
-- 
1.8.1.2
