From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 23:29:02 +0200
Subject: [Buildroot] [git commit] support/download: do not warn about
	missing hash file for repositories
Message-ID: <20150406212908.732BA819BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa3a409b057a8559dfc0c06307c71e351d3bfda1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When downloading from a repository, we explicitly pass no hash file,
because we can't check hashes in that case.

However, we're still printing a message that there is a missign hash
file.

Beside being a bit annoying (since we can't do anything about it), it
may also be wrong, especially for packages for which we support multiple
versions, with some being downloaded via a git clone and others as
tarballs.

Just print no warning when the path to the hash file is empty.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/check-hash |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index 67c1780..d37f1cd 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -31,8 +31,12 @@ h_file="${1}"
 file="${2}"
 base="${3}"
 
+# Bail early if no hash to check
+if [ -z "${h_file}" ]; then
+    exit 0
+fi
 # Does the hash-file exist?
-if [ -z "${h_file}" -o ! -f "${h_file}" ]; then
+if [ ! -f "${h_file}" ]; then
     printf "WARNING: no hash file for %s\n" "${base}" >&2
     exit 0
 fi
