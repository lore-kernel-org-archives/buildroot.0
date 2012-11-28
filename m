From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 28 Nov 2012 22:40:30 +0100
Subject: [Buildroot] [PATCH 4/6] manual: add manual-update-lists and
	manual-clean-lists targets
In-Reply-To: <1354138832-18149-1-git-send-email-s.martin49@gmail.com>
References: <1354138832-18149-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1354138832-18149-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/manual.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index a344efe..2e4ff6d 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -47,6 +47,18 @@ $(TOPDIR)/docs/manual/package-list.txt:
 $(TOPDIR)/docs/manual/deprecated-list.txt:
 	python2 $(TOPDIR)/support/scripts/deprecated.py > $@
 
+manual-clean-lists:
+	-@$(RM) $(TOPDIR)/docs/manual/package-list.txt
+	-@$(RM) $(TOPDIR)/docs/manual/deprecated-list.txt
+
+manual-update-lists: manual-clean-lists $(TOPDIR)/docs/manual/package-list.txt \
+			$(TOPDIR)/docs/manual/deprecated-list.txt
+	@$(call MESSAGE,"Updating the manual lists...")
+	@test -d $(TOPDIR)/.git && \
+	  ( cd $(TOPDIR) ; git diff --exit-code docs/manual/ &>/dev/null && \
+	    echo -en "\nManual is up-to-date.\n\n" ) || \
+	  echo -en "\nManual is out of date.\nCheck and save the changes if necessary.\n\n"
+
 ################################################################################
 # GENDOC -- generates the make targets needed to build asciidoc documentation.
 #
-- 
1.8.0.1
