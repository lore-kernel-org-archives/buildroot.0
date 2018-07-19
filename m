From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 11:57:14 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/Makefile.in:
 replace invocation of tempfile w/ mktemp in try-run
Message-ID: <20180719100408.D422688E4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=297cf0c324bf77ec580ccc7ea39e44079dd6b3ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

mktemp is included in GNU Coreutils, and its usage is preferred over
tempfile.

http://lists.gnu.org/archive/html/bug-coreutils/2007-10/msg00134.html

Additionally, some distributions no longer package tempfile, causing
the try-run macro to not work as expected. For example, due to try-run
not behaving as expected, testing for the -no-pie option in the
aespipe package doesn't work, and we build without -no-pie, causing a
build failure.

See also commit 91a08ecc998 (package/Makefile.in: add host-cc-option
macro) which introduced that initial code, explicitly to add -no-pie
when needed.

Fixes:
  http://autobuild.buildroot.net/results/db50f4415d18441f94b641ef6dc5a3672678b8b9/
  http://autobuild.buildroot.net/results/76d73f767d3aab3c97d61188f5666899d72ed82d/
  http://autobuild.buildroot.net/results/6aa9031962603354086b49bc49add92fde496ec2/
  http://autobuild.buildroot.net/results/33d22f4d96fb439be8551355290896ef6d3649df/
  http://autobuild.buildroot.net/results/eeec2ed80e147c172ec2d50958b12cfa38b2cc8d/

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5d08d34b3dd44b7d4d9421ae020b80d9a5065015)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 57fb47ea2e..58af2ef242 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -242,7 +242,7 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
 # Exit code chooses option. "$$TMP" is can be used as temporary file and
 # is automatically cleaned up.
 try-run = $(shell set -e;               \
-	TMP="$$(tempfile)";             \
+	TMP="$$(mktemp)";               \
 	if ($(1)) >/dev/null 2>&1;      \
 	then echo "$(2)";               \
 	else echo "$(3)";               \
