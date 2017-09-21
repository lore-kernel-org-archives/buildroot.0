From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 15:41:26 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] download/git: force gzip
	compression level 6
Message-ID: <20170921133630.4CA1D80FA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ce4be9c5e6abdf0c2616003485b2cef10b94ce7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Force gzip compression level 6 when calculating hash of a downloaded GIT repo.
To make sure the tar->gzip->checksum chain always provides consistent result.`

The script was relying on the default compression level, which must not be
necessarily consistent among different gzip versions. The level 6 is gzip's
current default compression level.

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 04a22cf1b521acb5634ed083e0381d42979d1698)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/git | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 056057c..033a984 100755
--- a/support/download/git
+++ b/support/download/git
@@ -98,4 +98,4 @@ LC_ALL=C sort <"${basename}.list" >"${basename}.list.sorted"
 # sources.buildroot.org and used in the *.hash files
 tar cf - --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
          -T "${basename}.list.sorted" >"${output}.tar"
-gzip -n <"${output}.tar" >"${output}"
+gzip -6 -n <"${output}.tar" >"${output}"
