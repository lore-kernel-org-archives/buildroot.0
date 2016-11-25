From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Fri, 25 Nov 2016 16:22:48 -0500
Subject: [Buildroot] [PATCH] package/pseudo: update version
Message-ID: <20161125212248.3540-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brings in fix about shutdown synchronization with the server.

See commit message:
    If you're running pseudo in docker, a script that creates a pseudo
    daemon can exit, causing docker to kill pseudo before it's done writing
    the database.

    Since the client sending the shutdown request doesn't have its socket
    closed explicitly by the server, we can just read from the socket in
    the client to create a delay until the actual exit, which can take
    a while if there's an in-memory DB.

Furthermore, the patch add the -S argument that tells the server to
shutdown and waits for its completion.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/pseudo/pseudo-wrapper | 2 +-
 package/pseudo/pseudo.mk      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pseudo/pseudo-wrapper b/package/pseudo/pseudo-wrapper
index 9c8dbdb..ad66431 100644
--- a/package/pseudo/pseudo-wrapper
+++ b/package/pseudo/pseudo-wrapper
@@ -16,4 +16,4 @@ if [ -n "${BASE_DIR}" ]; then
     export PSEUDO_LOCALSTATEDIR="${BASE_DIR}/build/.pseudodb"
 fi
 
-exec "${0%/*}/pseudo" "${@}"
+exec "${0%/*}/pseudo" -S "${@}"
diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
index aa2a9c7..58b9c79 100644
--- a/package/pseudo/pseudo.mk
+++ b/package/pseudo/pseudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PSEUDO_VERSION = 45eca34c754d416a38bee90fb2d3c110a0b6cc5f
+PSEUDO_VERSION = d6eb2df3fe63b765f35d62332add4d0e4e9c6a39
 PSEUDO_SITE = https://git.yoctoproject.org/git/pseudo
 PSEUDO_SITE_METHOD = git
 
-- 
2.10.2
