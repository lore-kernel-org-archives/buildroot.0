From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 30 Jun 2014 11:51:28 +0200
Subject: [Buildroot] [PATCH] infra: fix "<pkg>-rebuild" when using rsync
	source feature
Message-ID: <1404121888-7966-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because the configure stamp file depends on the rsync stamp file,
removing it by the "<pkg>-clean-for-rebuild" rule trigger the configure
step. To avoid triggering the configure step use an order-only dependency.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Reported-by: C?dric Marie <cedric.marie@openmailbox.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 54193d2..3c05a94 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -544,7 +544,10 @@ else
 #  source, by rsyncing
 #  depends
 #  configure
-$$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_RSYNC)
+
+# Use an order-only dependency so the "<pkg>-clean-for-rebuild" rule
+# can remove the stamp file without triggering the configure step.
+$$($(2)_TARGET_CONFIGURE): | $$($(2)_TARGET_RSYNC)
 
 $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
 
-- 
2.0.0
