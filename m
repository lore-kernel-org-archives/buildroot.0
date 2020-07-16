From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 18:22:17 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] packages/pkg-download.mk:
 fix file locking over NFS
Message-ID: <20200716161859.96D558716A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3554820a58e03bb8dad009d87798ce8155fa5e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

BSD style locks such as implemented by flock are translated to POSIX
advisory file locks (implemented by the fcntl system call on Linux).  It
is not possible to lock a directory using POSIX advisory file locks.
Hence, the lock strategy used by Buildroot doesn't work when used over
NFS.

Using flock on a simple file works correctly though, so use a '.lock'
file inside the download directory instead. If the lockfile does not
exist, flock will create it (in a race-free fashion).

Tested using NFS v4.2 and Linux 5.4.43.

Signed-off-by: Maxim Cournoyer <maxim.cournoyer@savoirfairelinux.com>
[yann.morin.1998 at free.fr:
  - slightly expand commit log about creation of the lockfile
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2e9d6565fcc10268b7db6d44d74f9b48d2c2354c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index de619ba90a..951d2fb554 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -99,7 +99,7 @@ endif
 
 define DOWNLOAD
 	$(Q)mkdir -p $($(2)_DL_DIR)
-	$(Q)$(EXTRA_ENV) flock $($(2)_DL_DIR)/ $(DL_WRAPPER) \
+	$(Q)$(EXTRA_ENV) flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
 		-c '$($(2)_DL_VERSION)' \
 		-d '$($(2)_DL_DIR)' \
 		-D '$(DL_DIR)' \
