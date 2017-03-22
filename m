From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 21:43:54 +0100
Subject: [Buildroot] [git commit] support/scripts/check-bin-arch: fix after
	"fix for filenames with spaces"
Message-ID: <20170322204642.75419817F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5d642a43f4bba00111aff021de6c65b77358e31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 2f6c5e513cf6688f9343a25ac90138e9ad751eb5
("support/check-bin-arch: fix for filenames with spaces"), Yann
adjuste the check-bin-arch script to properly handle filenames with
spaces.

However, he also did a subtle change of the regexp that extracts the
path of the files. It was:

  "/^${package},(.+)$/!d; s//\1/;"

and Yann changed it to:

  "/^${package},\.(.+)$/!d; s//\1/;"

So the file paths used to start with a dot (like "./usr/share/foo"),
and now they no longer start with a dot (like "/usr/share/foo"). While
this modification is good and makes sense, the match for
/lib/firmware/ was not adjusted accordingly, and the follow-up patch
also ignoring /usr/share was not adjusted as well.

This commit fixes those /lib/firmware/ and /usr/share/ special cases,
which will fix:

  http://autobuild.buildroot.net/results/76a1475f4cdedb80426fb022ef2e644aa5625660/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/check-bin-arch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index e1c99e6..ff974a7 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -25,14 +25,14 @@ IFS="
 while read f; do
 	# Skip firmware files, they could be ELF files for other
 	# architectures
-	if [[ "${f}" =~ ^\./(usr/)?lib/firmware/.* ]]; then
+	if [[ "${f}" =~ ^/(usr/)?lib/firmware/.* ]]; then
 		continue
 	fi
 
 	# Skip files in /usr/share, several packages (qemu,
 	# pru-software-support) legitimately install ELF binaries that
 	# are not for the target architecture
-	if [[ "${f}" =~ ^\./usr/share/.* ]]; then
+	if [[ "${f}" =~ ^/usr/share/.* ]]; then
 		continue
 	fi
 
