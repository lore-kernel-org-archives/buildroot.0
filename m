From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 21:56:57 +0100
Subject: [Buildroot] [git commit] manual: add explanations on limitations
	about using O=...
Message-ID: <20140222210312.E99F69056B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a524731012280dbb52fd0051a5c7c94a4562b265
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using a relative path for O=... has limitations, since it is interpreted
relative to the Buildroot tree, and thus may lead to unexpected results.

For example, running this:
    make -C buildroot O=my-O

will not create my-O in the current working directory, but as a
sub-directory of the Buildroot tree, here in buildroot/my-O

Explain this in the manual (as is similarly done for BR2_EXTERNAL).
Also add a note that $(O) will be created if missing.

Also change O=.. and -C .. to O=<...> and -C <...> to make it explicit
this is an ellipse, not a relative path.

Reported-by: J??r??my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/common-usage.txt |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 127060d..9a8c92a 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -40,7 +40,13 @@ Or:
  $ cd /tmp/build; make O=$PWD -C path/to/buildroot
 --------------------
 
-All the output files will be located under +/tmp/build+.
+All the output files will be located under +/tmp/build+. If the +O+
+path does not exist, Buildroot will create it.
+
+*Note:* the +O+ path can be either an absolute or a relative path, but if it's
+passed as a relative path, it is important to note that it is interpreted
+relative to the main Buildroot source directory, *not* the current working
+directory.
 
 When using out-of-tree builds, the Buildroot +.config+ and temporary
 files are also stored in the output directory. This means that you can
@@ -48,8 +54,8 @@ safely run multiple builds in parallel using the same source tree as
 long as they use unique output directories.
 
 For ease of use, Buildroot generates a Makefile wrapper in the output
-directory - so after the first run, you no longer need to pass +O=..+
-and +-C ..+, simply run (in the output directory):
+directory - so after the first run, you no longer need to pass +O=<...>+
+and +-C <...>+, simply run (in the output directory):
 
 --------------------
  $ make <target>
