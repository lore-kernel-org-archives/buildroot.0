From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Wed, 02 Jun 2010 16:25:37 +0100
Subject: [Buildroot] Makefile.package.in: strange conditional behaviour
Message-ID: <1275492337.18231.34.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm working on allowing source control (GIT, SVN, etc.) repositories to
be used as software sources (instead of tarballs) and one of the
requirements of my approach is to disable the "extraction" stage if a
working copy of the code has been downloaded into the $(BUILD_DIR) as
part of the "download" stage.
I've run into a problem where the test condition I'm using is not
working correctly.  The ifeq always evaluates the else-part.

Here is an example when running with the file not present in $(DL_DIR).

        File:/home/crehill/obair/buildroot-v2010.05/dl/signtools-HEAD.tar.bz2.
        Wild:.
        Wild is NOT empty

As is plain from the output, it IS empty!

Here is the case when the $(DL_DIR) file is present.

        File:/home/crehill/obair/buildroot-v2010.05/dl/signtools-HEAD.tar.bz2.
        Wild:/home/crehill/obair/buildroot-v2010.05/dl/signtools-HEAD.tar.bz2.
        Wild is NOT empty

As expected.

Do any of you makefile mavens have any idea why this behaviour might
happen in the "$(BUILD_DIR)/%/.stamp_extracted" target in
"package/Makefile.package.in"?
It's bound to be something obvious-when-pointed-out but it's eluding me
currently.


The patch is generated off my current working copy so probably won't
apply but It's just an addition of a single group of lines so is trivial
to add manually.


diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index b4ba7d6..e47911f 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -152,6 +152,13 @@ endif
 # Unpack the archive
 $(BUILD_DIR)/%/.stamp_extracted:
 # Only extract the package if it was downloaded.
+       @echo "File:$(DL_DIR)/$($(PKG)_SOURCE)."
+       @echo "Wild:$(wildcard $(DL_DIR)/$($(PKG)_SOURCE))."
+ifeq ($(strip $(wildcard $(DL_DIR)/$($(PKG)_SOURCE))),)
+       @echo Wild is empty
+else
+       @echo Wild is NOT empty 
+endif
 ifneq ($(wildcard $(DL_DIR)/$($(PKG)_SOURCE)),)
        @$(call MESSAGE,"Extracting")
        $(Q)mkdir -p $(@D)
