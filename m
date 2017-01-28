From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Jan 2017 23:19:31 +0100
Subject: [Buildroot] [PATCH] core: enhance printvars
Message-ID: <1485641971-25278-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the output of printvars copntains the name of the variable,
its expanded value and its un-expanded value.

However, most of the time, we need the actual, expanded value, so it can
be re-used from a (non-Buildroot) infrastructure script, like a
post-build script, or a build-farm driver (e.g. a Jenkins job...)

Add two options that a user may set to change the output of printvars:
  - RAW_VARS, if set, will drop the unexpanded value
  - QUOTED_VARS, if set, will quote the expanded value

So that it can be used as such:

    $ make -s printvars VARS=BUSYBOX_VERSION RAW_VARS=1 QUOTED_VARS=1
    BUSYBOX_VERSION='1.26.2'

And it is even possible to directly evaluate it in a shell script:

    eval $(make -s printvars VARS=BUSYBOX_VERSION RAW_VARS=1 QUOTED_VARS=1)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5e4bc92..67a9b5d 100644
--- a/Makefile
+++ b/Makefile
@@ -934,7 +934,7 @@ printvars:
 		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
 		$(if $(filter-out environment% default automatic, \
 				$(origin $V)), \
-		$(info $V=$($V) ($(value $V)))))
+		$(info $V=$(if $(QUOTED_VARS),')$($V)$(if $(QUOTED_VARS),')$(if $(RAW_VARS),, ($(value $V))))))
 
 clean:
 	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
-- 
2.7.4
