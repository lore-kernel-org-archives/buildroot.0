From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 13 Mar 2014 17:06:59 +0100
Subject: [Buildroot] [PATCH] Add back rootfs-* dependencies to "source" and
	"legal-info" targets
Message-ID: <1394726819-13062-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After adding support top-level parallel make the rootfs-* dependencies
were not anymore considered for the "source" and "legal-info" targets
because the rootfs-* targets were removed from TARGETS variable and
placed in the TARGETS_ROOTFS variable so to fix the issue use use both
"TARGETS" and "TARGETS_ROOTFS" variables.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 481f779..f7b7d84 100644
--- a/Makefile
+++ b/Makefile
@@ -418,7 +418,8 @@ TARGETS_DIRCLEAN := $(patsubst %,%-dirclean,$(TARGETS))
 # variable for each enabled target.
 # Notice: this only works for newstyle gentargets/autotargets packages
 TARGETS_HOST_DEPS = $(sort $(filter host-%,$(foreach dep,\
-		$(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS))),\
+		$(addsuffix _DEPENDENCIES,\
+			$(call UPPERCASE,$(TARGETS) $(TARGETS_ROOTFS))),\
 		$($(dep)))))
 # Host packages can in turn have their own dependencies. Likewise find
 # all the package names listed in the HOST_<PKG>_DEPENDENCIES for each
-- 
1.8.3.2
