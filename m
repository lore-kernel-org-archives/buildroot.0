From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Feb 2021 14:52:32 +0100
Subject: [Buildroot] [git commit] package/tmux: bump to version 3.1c
Message-ID: <20210206133352.6528482619@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47132eed6d7809d0445fc7476b0652ddc4fe12e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update hash of COPYING (examples directory removed:
  https://github.com/tmux/tmux/commit/e722ba38e3133cb01b4cd17bf5fe7c56e42a4962)
- Update indentation in hash file (two spaces)

https://raw.githubusercontent.com/tmux/tmux/3.1c/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...e-after-the-end-of-the-array-and-overwrit.patch | 35 ----------------------
 package/tmux/tmux.hash                             |  4 +--
 package/tmux/tmux.mk                               |  5 +---
 3 files changed, 3 insertions(+), 41 deletions(-)

diff --git a/package/tmux/0001-Do-not-write-after-the-end-of-the-array-and-overwrit.patch b/package/tmux/0001-Do-not-write-after-the-end-of-the-array-and-overwrit.patch
deleted file mode 100644
index d169322ed7..0000000000
--- a/package/tmux/0001-Do-not-write-after-the-end-of-the-array-and-overwrit.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a868bacb46e3c900530bed47a1c6f85b0fbe701c Mon Sep 17 00:00:00 2001
-From: nicm <nicm>
-Date: Thu, 29 Oct 2020 16:33:01 +0000
-Subject: [PATCH] Do not write after the end of the array and overwrite the
- stack when colon-separated SGR sequences contain empty arguments. Reported by
- Sergey Nizovtsev.
-
-[Peter: Fixes CVE-2020-27347]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- input.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/input.c b/input.c
-index 42a60c92..c280c0d9 100644
---- a/input.c
-+++ b/input.c
-@@ -1976,8 +1976,13 @@ input_csi_dispatch_sgr_colon(struct input_ctx *ictx, u_int i)
- 				free(copy);
- 				return;
- 			}
--		} else
-+		} else {
- 			n++;
-+			if (n == nitems(p)) {
-+				free(copy);
-+				return;
-+			}
-+		}
- 		log_debug("%s: %u = %d", __func__, n - 1, p[n - 1]);
- 	}
- 	free(copy);
--- 
-2.20.1
-
diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index e27fca253d..75538e09ae 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 839d167a4517a6bffa6b6074e89a9a8630547b2dea2086f1fad15af12ab23b25  tmux-2.9a.tar.gz
-sha256 ce75f1345a76c93bd0f413d1b93ff1baa0669f34a7242779a00c1b862b4f813a  COPYING
+sha256  918f7220447bef33a1902d4faff05317afd9db4ae1c9971bef5c787ac6c88386  tmux-3.1c.tar.gz
+sha256  c031bd37f464c534277814f6aa38686fa023d094261d57fd2545ad592bb53ccd  COPYING
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 17e1da5607..17570520c3 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-TMUX_VERSION = 2.9a
+TMUX_VERSION = 3.1c
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = COPYING
 TMUX_CPE_ID_VALID = YES
 TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
 
-# 0001-Do-not-write-after-the-end-of-the-array-and-overwrit.patch
-TMUX_IGNORE_CVES += CVE-2020-27347
-
 # Add /usr/bin/tmux to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
 define TMUX_ADD_TMUX_TO_SHELLS
