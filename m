From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 22:55:24 +0100
Subject: [Buildroot] [git commit] Makefile: add '-n' to gzip invocations to
	improve reproducibility
Message-ID: <20161201222139.18BBD7FD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b91b21dae40d6db1c320a76cfdbabeedcb2d1c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Default invocation to gzip include timestamp in output file. This feature is
incompatible with BR2_REPRODUCIBLE. It is possible to disable it with '-n'.

The environment variable GZIP can hold a set of default options for gzip. So
instead to find all gzip invocation in build process, we just export 'GZIP=-n'.

Notice bzip2, lzma and xz are not impacted by this problem. On the other hand, lzop
does include timestamp and does not provide any way to disable it.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 8acbe58..9e588da 100644
--- a/Makefile
+++ b/Makefile
@@ -251,6 +251,7 @@ ifeq ($(BR2_REPRODUCIBLE),y)
 export TZ=UTC
 export LANG=C
 export LC_ALL=C
+export GZIP = -n
 BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
 export SOURCE_DATE_EPOCH = $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
 endif
