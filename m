From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 22:45:21 +0200
Subject: [Buildroot] [git commit] infra: fix "<pkg>-rebuild" when using
	rsync source feature
Message-ID: <20140715204534.CE7499D24B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67f25d1b212e71412fc4b239a33b79269a0c342c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because the configure stamp file depends on the rsync stamp file,
removing it by the "<pkg>-clean-for-rebuild" rule trigger the configure
step. To avoid triggering the configure step use an order-only dependency.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Reported-by: C??dric Marie <cedric.marie@openmailbox.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 2bd4466..395e593 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -545,7 +545,10 @@ else
 #  source, by rsyncing
 #  depends
 #  configure
-$$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_RSYNC)
+
+# Use an order-only dependency so the "<pkg>-clean-for-rebuild" rule
+# can remove the stamp file without triggering the configure step.
+$$($(2)_TARGET_CONFIGURE): | $$($(2)_TARGET_RSYNC)
 
 $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
 
