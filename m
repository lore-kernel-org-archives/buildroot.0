From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Aug 2013 23:05:43 +0200
Subject: [Buildroot] [git commit] generatelocales: fix 'cut' invocation
Message-ID: <20130822210602.EE8819B528@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e2696eab6a781727c09408528678d4d29edd7a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

'cut' needs to be invoked with the -s option to make sure it doesn't
print anything when the delimiter isn't found. This is particularly
important for the charmap detection, because UTF-8 is appended if
the charmap is empty. But without -s, it will never be empty.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
