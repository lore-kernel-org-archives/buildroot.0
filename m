From: George Chen <George.Chen@pmcs.com>
Date: Mon, 13 Apr 2015 16:05:59 +0000
Subject: [Buildroot] Can we update NodeJS package to 0.12.*
Message-ID: <B9FA34E87D998B44A9DFD1535DEAC39C4870891C@BBYEXM01.pmc-sierra.internal>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current 2015.03 buildroot contains NodeJS 0.10.36

Is there a way to customly configure the package to 0.11.* or 0.12.*?

The reason for the newer NodeJS version is that IPv6 is not fully supported in 0.10.*



I tried to change Config.mk

- NODEJS_VERSION = 0.10.36 
+ NODEJS_VERSION = 0.12.0


And then I changed nodejs-remove-python-bz2-dependency.patch

Index: b/deps/v8/tools/js2c.py
===================================================================
--- a/deps/v8/tools/js2c.py
+++ b/deps/v8/tools/js2c.py
@@ -34,7 +34,6 @@
 import os, re, sys, string
 import optparse
 import jsmin
-import bz2
 import textwrap
 
 
@@ -492,6 +491,7 @@
   if compression_type == "off":
     return sources_bytes
   elif compression_type == "bz2":
+    import bz2
     return bz2.compress(sources_bytes)
   else:
     raise Error("Unknown compression type %s." % compression_type)


However, I am getting the make error:

../deps/v8/src/base/atomicops_internals_arm_gcc.h:258:4: error: #error "Your CPU's ARM architecture is not supported yet"


Is there an easy way to update the NodeJS package?
Is my only option to add NodeJS 0.12.0 as a custom package?

Thanks!
