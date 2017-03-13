From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Mar 2017 23:58:30 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] toolchain/external: use
	-dumpversion to check gcc version
Message-ID: <20170313233002.1DBA182560@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47793a94b50dc1f65bd1686c7973438c26fd2ce1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Currently, `--version` option is used and later matched with a regex to get
the actual gcc version.  There's a dedicated gcc option to do exactly that:
`-dumpversion`.

Also `--version` may return a string customised by a vendor that provides
the toolchain, which makes the current regex approach error prone.  In
fact, this situation has been seen with a real customised toolchain.

Signed-off-by: Krzysztof Konopko <kris@youview.com>
Signed-off-by: Tomasz Szkutkowski <tomasz.szkutkowski@youview.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 06cd604ec6d34f25b436ab729543418042a87e1c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 72e7292..0ed8fdc 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -147,7 +147,7 @@ check_gcc_version = \
 	if [ -z "$${expected_version}" ]; then \
 		exit 0 ; \
 	fi; \
-	real_version=`$(1) --version | sed -r -e '1!d; s/^[^)]+\) ([^[:space:]]+).*/\1/;'` ; \
+	real_version=`$(1) -dumpversion` ; \
 	if [[ ! "$${real_version}" =~ ^$${expected_version}\. ]] ; then \
 		printf "Incorrect selection of gcc version: expected %s.x, got %s\n" \
 			"$${expected_version}" "$${real_version}" ; \
