From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Dec 2010 16:38:10 -0300
Subject: [Buildroot] [PATCH] libcap: fix target install
In-Reply-To: <1293565090-6483-1-git-send-email-gustavo@zacarias.com.ar>
References: <1293565090-6483-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1293565090-6483-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/usr/lib/libcap.so.* was installed via "install -D" but libcap.so.2 is
a symlink so it was dereferenced.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcap/libcap.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 301d1b1..f895b78 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -12,7 +12,8 @@ define LIBCAP_INSTALL_STAGING_CMDS
 endef
 
 define LIBCAP_INSTALL_TARGET_CMDS
- install -D $(STAGING_DIR)/usr/lib/libcap.so.* $(TARGET_DIR)/usr/lib
+ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(TARGET_DIR) prefix=/usr lib=lib install
+ $(RM) -f $(addprefix $(TARGET_DIR)/usr/sbin/,capsh getpcaps)
 endef
 
 define HOST_LIBCAP_BUILD_CMDS
-- 
1.7.2.2
