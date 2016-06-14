From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Tue, 14 Jun 2016 17:05:10 +0200
Subject: [Buildroot] [PATCH 3/5] pkg-download: allow ssh URLs
In-Reply-To: <1465916712-29684-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614150412.GF3060@hermes.click-hack.org>
 <1465916712-29684-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1465916712-29684-3-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use git when such an URL is met.

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
---
 package/pkg-download.mk                            | 2 +-
 package/readline/0009-avoid-strip-perm-issue.patch | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index a0f694d..5f7a155 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -225,7 +225,7 @@ define DOWNLOAD_INNER
 	fi ; \
 	if test -n "$(1)" ; then \
 		case "$($(PKG)_SITE_METHOD)" in \
-			git) $($(3)_GIT) && exit ;; \
+			git|ssh) $($(3)_GIT) && exit ;; \
 			svn) $($(3)_SVN) && exit ;; \
 			cvs) $($(3)_CVS) && exit ;; \
 			bzr) $($(3)_BZR) && exit ;; \
diff --git a/package/readline/0009-avoid-strip-perm-issue.patch b/package/readline/0009-avoid-strip-perm-issue.patch
index 8415ca2..55d5166 100644
--- a/package/readline/0009-avoid-strip-perm-issue.patch
+++ b/package/readline/0009-avoid-strip-perm-issue.patch
@@ -1,3 +1,6 @@
+Avoid libreadline to be installed read-only, as it makes stripping fail.
+
+Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
 --- readline-6.3/support/shlib-install~	2012-07-10 21:58:08.000000000 +0200
 +++ readline-6.3/support/shlib-install	2016-02-27 01:19:09.878310797 +0100
 @@ -73,7 +73,7 @@ fi
-- 
2.8.2
