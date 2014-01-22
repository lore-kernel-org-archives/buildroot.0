From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jan 2014 21:59:36 +0100
Subject: [Buildroot] [PATCH 3/3] manual: add explanations on limitation
	about using O=...
In-Reply-To: <cover.1390424302.git.yann.morin.1998@free.fr>
References: <cover.1390424302.git.yann.morin.1998@free.fr>
Message-ID: <d384f7fdfa66bf7c3f4b0fa37465fee8a494084b.1390424303.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Using a relative path for O=... has limitations, since it is interpreted
relative to the Buildroot tree, and thus may lead to unexpected results.

For example, running this:
    make -C buildroot O=my-O

will not vreate my-O in the current working directory, but as a
sub-directory of the Buildroot tree, here in buildroot/my-O

Explain this in the manual (as is similarly done for BR2_EXTERNAL).
Also add a note that $(O) will be created if missing.

Reported-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/common-usage.txt | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 1d15c05..ca44b10 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -40,7 +40,8 @@ Or:
  $ cd /tmp/build; make O=$PWD -C path/to/buildroot
 --------------------
 
-All the output files will be located under +/tmp/build+.
+All the output files will be located under +/tmp/build+. If the +O+
+path does not exist, Buildroot will create it.
 
 When using out-of-tree builds, the Buildroot +.config+ and temporary
 files are also stored in the output directory. This means that you can
@@ -48,13 +49,19 @@ safely run multiple builds in parallel using the same source tree as
 long as they use unique output directories.
 
 For ease of use, Buildroot generates a Makefile wrapper in the output
-directory - so after the first run, you no longer need to pass +O=..+
-and +-C ..+, simply run (in the output directory):
+directory - so after the first run, you no longer need to pass +O=<...>+
+and +-C <...>+, simply run (in the output directory):
 
 --------------------
  $ make <target>
 --------------------
 
+The +O+ path can be either an absolute or a relative path, but if it's
+passed as a relative path, it is important to note that it is interpreted
+relative to the main Buildroot source directory, not the current working
+directory. Using relative paths can lead to various broken setups, and
+thus is highly discouraged in favour of using absolute paths.
+
 [[env-vars]]
 
 Environment variables
-- 
1.8.1.2
