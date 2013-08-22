From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 22 Aug 2013 07:43:58 +0200
Subject: [Buildroot] [PATCH] generatelocales: fix 'cut' invocation
In-Reply-To: <20130822022639.GA6009@zuhnb712.ap.bm.net>
References: <20130822022639.GA6009@zuhnb712.ap.bm.net>
Message-ID: <1377150238-3467-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

'cut' needs to be invoked with the -s option to make sure it doesn't
print anything when the delimiter isn't found. This is particularly
important for the charmap detection, because UTF-8 is appended if
the charmap is empty. But without -s, it will never be empty.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 794d217..6018d63 100644
--- a/Makefile
+++ b/Makefile
@@ -543,8 +543,8 @@ ifneq ($(GENERATE_LOCALE),)
 target-generatelocales: host-localedef
 	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
 	$(Q)for locale in $(GENERATE_LOCALE) ; do \
-		inputfile=`echo $${locale} | cut -f1 -d'.'` ; \
-		charmap=`echo $${locale} | cut -f2 -d'.'` ; \
+		inputfile=`echo $${locale} | cut -f1 -d'.' -s` ; \
+		charmap=`echo $${locale} | cut -f2 -d'.' -s` ; \
 		if test -z "$${charmap}" ; then \
 			charmap="UTF-8" ; \
 		fi ; \
-- 
1.8.4.rc3
