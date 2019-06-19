From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 19 Jun 2019 23:30:08 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/iputils: create ping6 symlink in
 post install target hook
In-Reply-To: <20190619213008.7883-1-petr.vorel@gmail.com>
References: <20190619213008.7883-1-petr.vorel@gmail.com>
Message-ID: <20190619213008.7883-3-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream expect distros will do it, see
https://github.com/iputils/iputils/commit/ebad35fee3de851b809c7b72ccc654a72b6af61d

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* Use IPUTILS_POST_INSTALL_TARGET_HOOKS (previously it
IPUTILS_POST_INSTALL_HOOKS was used). IPUTILS_POST_INSTALL_TARGET_HOOKS
works, but not really sure which one is correct/more suitable.

Kind regards,
Petr

 package/iputils/iputils.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index c6f380a84a..f62b027894 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -65,6 +65,12 @@ define IPUTILS_MOVE_BINARIES
 endef
 IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_BINARIES
 
+# upstream requires distros to create symlink
+define IPUTILS_CREATE_PING6_SYMLINK
+ln -sv $(TARGET_DIR)/bin/ping $(TARGET_DIR)/bin/ping6
+endef
+IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_CREATE_PING6_SYMLINK
+
 # handle permissions ourselves
 IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
 define IPUTILS_PERMISSIONS
-- 
2.21.0
