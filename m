From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Nov 2019 19:50:05 +0100
Subject: [Buildroot] [git commit] package/sudo: new config to add sudo group
 and rule
Message-ID: <20191105184322.387B78E810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a751f6ba8a5299bbca2ed748deababed05e2a444
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>
[yann.morin.1998 at free.fr:
  - drop the conditional creation
  - uid -is -'- when username is
  - leading TAB in user table, squeeze other spaces
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sudo/sudo.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index ab58f308ec..7d52eb0b57 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -70,4 +70,13 @@ define SUDO_REMOVE_DIST_EXAMPLES
 endef
 SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_REMOVE_DIST_EXAMPLES
 
+define SUDO_USERS
+	- - sudo -1 - - - -
+endef
+
+define SUDO_ENABLE_SUDO_GROUP_RULE
+	$(SED) '/^# \%sudo\tALL=(ALL) ALL/s/^# //' $(TARGET_DIR)/etc/sudoers
+endef
+SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_ENABLE_SUDO_GROUP_RULE
+
 $(eval $(autotools-package))
