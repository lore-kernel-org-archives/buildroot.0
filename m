From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Date: Fri, 15 Nov 2013 14:28:56 -0600
Subject: [Buildroot] [PATCH] pv: support ccache builds
Message-ID: <20131115202856.GA13944@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using ccache TARGET_CC is something like
    ccache gcc

This causes problems in the pv build which attempts to
override LD because the command ends up being
    make [...] LD=/tools/ccache /tools/gcc LDFLAGS="[...]

As a result, during the build phase it attempts to build
/tools/gcc which succeeds by doing nothing:
    make[1]: Nothing to be done for `/tools/gcc'.

and during the install phase you get the real build which
errors out on the LD error this snippet was attempting to
fix:
    ld -r -o src/library.o src/library/getopt.o \
        src/library/gettext.o
    ld: src/library/gettext.o: Relocations in generic ELF \
        (EM: 40)
    src/library/gettext.o: error adding symbols: File in \
        wrong format

Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
---
 package/pv/pv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 00502d3..5f1a54b 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -17,7 +17,7 @@ PV_LICENSE_FILES = doc/COPYING
 # the correct one. By passing the below values for LD and LDFLAGS, we
 # ensure that 'gcc' is used to do these partial linking steps.
 PV_MAKE_OPT = \
-	LD=$(TARGET_CC) \
+	LD="$(TARGET_CC)" \
 	LDFLAGS="-Wl,-r -nostdlib"
 
 $(eval $(autotools-package))
-- 
1.8.4.rc3
