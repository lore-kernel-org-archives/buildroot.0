From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Apr 2017 21:09:09 +0200
Subject: [Buildroot] [PATCH] pacakge/dieharder: fix autoreconf
Message-ID: <20170401190909.27403-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When dieharder was committed, Thomas reoved the hook to cleanup the m4
files, on the reason that autoreconf would rereate the broken symlinks
(and because the hook was too complex).

It turns out the hook was needed: autoreconf does not recreate the files
(at least not in some autobuilders nor on my machine).

Reinstate a simpler hook.

Fixes:
    http://autobuild.buildroot.org/results/a92/a92e9a74b0966f8f0bc4080f918d5ddf4c1ec0ce/
    http://autobuild.buildroot.org/results/a4f/a4f6647f69ad89ff1ffe5f1331281fb7a57ade4e/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Julien Viard de Galbert <julien@vdg.name>
---
 package/dieharder/dieharder.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/dieharder/dieharder.mk b/package/dieharder/dieharder.mk
index 05ca253..c3eee64 100644
--- a/package/dieharder/dieharder.mk
+++ b/package/dieharder/dieharder.mk
@@ -15,13 +15,17 @@ DIEHARDER_DEPENDENCIES = gsl
 # The original configure does not use variables provided in the
 # environment so _CONF_ENV does not work. (_CONF_OPTS does).
 #
-# In addition, the m4/*.m4 files are symlinks to /usr/share, which
-# clearly doesn't work, so doing an autoreconf replaces them.
-#
 # Finally, we patch configure.ac and some Makefile.am so we need to
 # autoreconf anyway
 DIEHARDER_AUTORECONF = YES
 
+# The m4/*.m4 files are symlinks to /usr/share, which clearly doesn't
+# work, and doing an autoreconf does not replace them.
+define DIEHARDER_M4_CLEAN
+	rm -f $(@D)/m4/*.m4
+endef
+DIEHARDER_POST_PATCH_HOOKS += DIEHARDER_M4_CLEAN
+
 # fix endianness detection
 ifeq ($(BR2_ENDIAN),"BIG")
 DIEHARDER_CONF_ENV = ac_cv_c_endian=big
-- 
2.9.3
