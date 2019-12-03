From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 3 Dec 2019 23:03:25 +0100
Subject: [Buildroot] [git commit] package/tini: compile executable static
Message-ID: <20191203220029.B6FA2870DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4732222e4c863e324771f8be2391764641ceba2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

One usecase for tini is as the init process for a container which has
a single executable and no C runtime library. It therefore needs to be
independent of any C runtime library within the container.

Previously, we didn't build statically to avoid problems with
BR2_SHARED_LIBS=y. However, it turns out that tini can successfully link
statically even with glibc and BR2_SHARED_LIBS=y, because libc.a is
still included in staging, and tini doesn't use any NSS functionality.

Signed-off-by: Simon Rowe <simon.rowe@citrix.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tini/tini.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tini/tini.mk b/package/tini/tini.mk
index 5dd98777f9..986e612a83 100644
--- a/package/tini/tini.mk
+++ b/package/tini/tini.mk
@@ -10,6 +10,7 @@ TINI_LICENSE = MIT
 TINI_LICENSE_FILES = LICENSE
 
 TINI_CFLAGS = $(TARGET_CFLAGS) \
+	-static \
 	-DTINI_VERSION=\"$(TINI_VERSION)\" \
 	-DTINI_GIT=\"\"
 
