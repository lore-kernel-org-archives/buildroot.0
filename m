From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jan 2014 15:25:22 +0100
Subject: [Buildroot] [git commit] tcpreplay: fix build errors when tcpdump
	(verbose) isn't enabled
Message-ID: <20140127142624.8CB3E9C5FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8476e5ad45a46eda8a971f7cbae8dda734786c68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch from Chris' pull request.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ild-errors-when-ENABLE_VERBOSE-is-not-set.patch |   54 ++++++++++++++++++++
 1 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/package/tcpreplay/tcpreplay-0001-Fix-build-errors-when-ENABLE_VERBOSE-is-not-set.patch b/package/tcpreplay/tcpreplay-0001-Fix-build-errors-when-ENABLE_VERBOSE-is-not-set.patch
new file mode 100644
index 0000000..cbc829d
--- /dev/null
+++ b/package/tcpreplay/tcpreplay-0001-Fix-build-errors-when-ENABLE_VERBOSE-is-not-set.patch
@@ -0,0 +1,54 @@
+From 12d0d0876a9a9bf2818ba24ecb5646952b958c39 Mon Sep 17 00:00:00 2001
+From: Chris Packham <judge.packham@gmail.com>
+Date: Wed, 22 Jan 2014 20:37:04 +1300
+Subject: [PATCH] Fix build errors when ENABLE_VERBOSE is not set
+
+Upstream: https://github.com/cpackham/tcpreplay/commit/12d0d0876a9a9
+Fixes #59
+
+When ENABLE_VERBOSE is not set some additional calls to tcpreplay_seterr
+are made. When conforming to C99 variadic macros at least one argument is
+required after the format string[1]. To avoid this problem update the
+calls to tcpreplay_seterr to use a "%s" format string.
+
+[1] - http://gcc.gnu.org/onlinedocs/cpp/Variadic-Macros.html
+
+Signed-off-by: Chris Packham <judge.packham@gmail.com>
+---
+ src/tcpreplay_api.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/tcpreplay_api.c b/src/tcpreplay_api.c
+index 6b81bcc..de67080 100644
+--- a/src/tcpreplay_api.c
++++ b/src/tcpreplay_api.c
+@@ -690,7 +690,7 @@ tcpreplay_set_verbose(tcpreplay_t *ctx, bool value)
+     ctx->options->verbose = value;
+     return 0;
+ #else
+-    tcpreplay_seterr(ctx, "verbose mode not supported");
++    tcpreplay_seterr(ctx, "%s", "verbose mode not supported");
+     return -1;
+ #endif
+ }
+@@ -710,7 +710,7 @@ tcpreplay_set_tcpdump_args(tcpreplay_t *ctx, char *value)
+     ctx->options->tcpdump_args = safe_strdup(value);
+     return 0;
+ #else
+-    tcpreplay_seterr(ctx, "verbose mode not supported");
++    tcpreplay_seterr(ctx, "%s", "verbose mode not supported");
+     return -1;
+ #endif
+ }
+@@ -731,7 +731,7 @@ tcpreplay_set_tcpdump(tcpreplay_t *ctx, tcpdump_t *value)
+     ctx->options->tcpdump = value;
+     return 0;
+ #else
+-    tcpreplay_seterr(ctx, "verbose mode not supported");
++    tcpreplay_seterr(ctx, "%s", "verbose mode not supported");
+     return -1;
+ #endif
+ }
+-- 
+1.8.5.2
+
