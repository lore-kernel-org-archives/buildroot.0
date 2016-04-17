From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 17 Apr 2016 23:41:48 +0200
Subject: [Buildroot] [PATCH] support/scripts: fix graph-depends when run
	with python3
Message-ID: <1460929308-16094-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make graph-depends script opening the output file in text mode since
only ascii characters will be written.

This change fixes the following error occuring when the default host
python interpreter is python3:

  make: Entering directory '/opt/buildroot'
  Getting targets
  Getting dependencies for ['toolchain-external', 'toolchain', 'busybox', ...]
  Getting dependencies for ['host-python3', 'host-pkgconf', 'host-gettext', ...]
  Getting dependencies for ['host-libxml2', 'host-swig', 'host-m4', ...]
  Getting version for ['toolchain-external', 'toolchain', 'busybox', ...]
  Traceback (most recent call last):
    File "/opt/buildroot/support/scripts/graph-depends", line 425, in <module>
      outfile.write("digraph G {\n")
  TypeError: a bytes-like object is required, not 'str'
  Makefile:807: recipe for target 'graph-depends' failed
  make[1]: *** [graph-depends] Error 1
  Makefile:84: recipe for target '_all' failed
  make: *** [_all] Error 2
  make: Leaving directory '/opt/buildroot'

While with python2, adding 'b' to the openning mode has no effect on
Linux (c.f. [2]), the above error is expected with python3 (c.f. [1]).

Therefore, just open the outfile in default (i.e. text) mode.

[1] https://docs.python.org/3/library/functions.html#open
[2] https://docs.python.org/2/library/functions.html#open

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 support/scripts/graph-depends | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index a00eb9d..cb00383 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -73,7 +73,7 @@ else:
     if check_only:
         sys.stderr.write("don't specify outfile and check-only at the same time\n")
         sys.exit(1)
-    outfile = open(args.outfile, "wb")
+    outfile = open(args.outfile, "w")
 
 if args.package is None:
     mode = MODE_FULL
-- 
2.8.0
