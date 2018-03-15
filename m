From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Mar 2018 21:35:07 +0100
Subject: [Buildroot] [PATCH 1/2] core/intrumetnation: don't spawn to get
 seconds-since-EPOCH
In-Reply-To: <cover.1521146096.git.yann.morin.1998@free.fr>
References: <cover.1521146096.git.yann.morin.1998@free.fr>
Message-ID: <ef3b9c4c1ca910423b06f1374ee9461c77aaeed1.1521146096.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No need to spawn $(date) to get the number of seconds-since-EPOCH, as
bash's printf can do it as easily.

This is just a micro-optimisation, though. Probably not noticeable.

Reported-by: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Trent Piepho <tpiepho@impinj.com>
---
 package/pkg-generic.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9eddaeee57..2a82025a04 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -49,8 +49,8 @@ endef
 
 # Time steps
 define step_time
-	printf "%s:%-5.5s:%-20.20s: %s\n"           \
-	       "$$(date +%s)" "$(1)" "$(2)" "$(3)"  \
+	printf "%(%s)T:%-5.5s:%-20.20s: %s\n"           \
+	       -1 "$(1)" "$(2)" "$(3)"  \
 	       >>"$(BUILD_DIR)/build-time.log"
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_time
-- 
2.14.1
