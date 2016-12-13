From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 13 Dec 2016 21:03:23 +0100
Subject: [Buildroot] [PATCH 1/1] tinycbor: try to fix unreproducible errors
Message-ID: <1481659403-7923-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a lot of unreproducible issues with tinycbor, latest is:
http://autobuild.buildroot.net/results/8e8fd1e19d6d07212f29e19a305712e715fe781b

All build failures ends with:
.config:8: *** missing separator.  Stop.

I'm not 100% sure but perhaps these issues could be the result of using
echo without double quotes to print Makefile variables inside .config.
For example, tinycbor calls: echo system-cjson-pass := 1 >&9;
instead of: echo "system-cjson-pass := 1" >&9;
As a result, echo will not print a single string but three independent
parameters, this could lead in a format error when using make with
parallel tasks through make -j.

Even if there is no issue, there is no good reason of not using double
quotes with echo

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 ...le-quotes-with-echo-in-Makefile.configure.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/tinycbor/0003-Use-double-quotes-with-echo-in-Makefile.configure.patch

diff --git a/package/tinycbor/0003-Use-double-quotes-with-echo-in-Makefile.configure.patch b/package/tinycbor/0003-Use-double-quotes-with-echo-in-Makefile.configure.patch
new file mode 100644
index 0000000..d66c5d3
--- /dev/null
+++ b/package/tinycbor/0003-Use-double-quotes-with-echo-in-Makefile.configure.patch
@@ -0,0 +1,46 @@
+From 738f0347535a807a3b898018cc5d0afe6649d34c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Tue, 13 Dec 2016 20:15:20 +0100
+Subject: [PATCH] Use double quotes with echo in Makefile.configure
+
+There is a lot of unreproducible issues with tinycbor, latest is:
+http://autobuild.buildroot.net/results/8e8fd1e19d6d07212f29e19a305712e715fe781b
+
+All build failures ends with:
+.config:8: *** missing separator.  Stop.
+
+I'm not 100% sure but perhaps these issues could be the result of using
+echo without double quotes to print Makefile variables inside .config.
+For example, tinycbor calls: echo system-cjson-pass := 1 >&9;
+instead of: echo "system-cjson-pass := 1" >&9;
+As a result, echo will not print a single string but three independent
+parameters, this could lead in a format error when using make with
+parallel tasks through make -j.
+
+Even if there is no issue, there is no good reason of not using double
+quotes with echo
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ Makefile.configure | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.configure b/Makefile.configure
+index 424efb3..ce81560 100644
+--- a/Makefile.configure
++++ b/Makefile.configure
+@@ -22,9 +22,9 @@ sink:
+ configure: $(foreach it,$(ALLTESTS),check-$(it))
+ 
+ check-%:
+-	@echo $(subst check-,,$@)-tested := 1 $(OUT)
++	@echo "$(subst check-,,$@)-tested := 1" $(OUT)
+ 	$(if $(V),,@)if printf "$($(subst check-,PROGRAM-,$@))" | \
+ 	    $(CC) -xc $($(subst check-,CCFLAGS-,$@)) -o /dev/null - $(if $(V),,>/dev/null 2>&1); \
+ 	then \
+-	    echo $(subst check-,,$@)-pass := 1 $(OUT); \
++	    echo "$(subst check-,,$@)-pass := 1" $(OUT); \
+ 	fi
+-- 
+2.5.0
+
-- 
2.5.0
