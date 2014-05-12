From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 22:49:07 +0200
Subject: [Buildroot] [git commit] libcgroup: fix passing CFLAGS/LDFLAGS to
	configure
Message-ID: <20140512205829.6D0679CA25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66a87eea361ef121ff09074e937181d9cd89fe32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LIBCGROUP_CONF_ENV is a string used to pass environment variables to the
confgiure script, '+=' operator doesn't have any special meaning inside
it, so CFLAGS+=... is passed to shell, overwriting previous CFLAGS
value. Replace CFLAGS+="..." with CFLAGS="$(TARGET_CFLAGS) ...".

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
