From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 12 May 2014 07:27:04 +0400
Subject: [Buildroot] [PATCH 2/4] libcgroup: fix passing CFLAGS/LDFLAGS to
	configure
In-Reply-To: <1399865226-7054-1-git-send-email-jcmvbkbc@gmail.com>
References: <1399865226-7054-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1399865226-7054-3-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LIBCGROUP_CONF_ENV is a string used to pass environment variables to the
confgiure script, '+=' operator doesn't have any special meaning inside
it, so CFLAGS+=... is passed to shell, overwriting previous CFLAGS
value. Replace CFLAGS+="..." with CFLAGS="$(TARGET_CFLAGS) ...".

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/libcgroup/libcgroup.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index 6d7ae54..0ef1e91 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -16,8 +16,8 @@ LIBCGROUP_INSTALL_STAGING = YES
 # large file support. See https://bugzilla.redhat.com/show_bug.cgi?id=574992
 # for more information.
 LIBCGROUP_CONF_ENV = \
-	CXXFLAGS+="-U_FILE_OFFSET_BITS" \
-	CFLAGS+="-U_FILE_OFFSET_BITS"
+	CXXFLAGS="$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS" \
+	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS"
 
 LIBCGROUP_CONF_OPT = \
 	--disable-tools \
-- 
1.7.7.6
