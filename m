From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Apr 2015 22:56:23 +0200
Subject: [Buildroot] [PATCH 4/4 v2] support/download: do not warn about
	missing hash file for repositories
In-Reply-To: <cover.1428267362.git.yann.morin.1998@free.fr>
References: <cover.1428267362.git.yann.morin.1998@free.fr>
Message-ID: <43e395ce9736f82fb6574be4d9ddba48f242753e.1428267362.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
Changes v1 -> v2;
  - fix typoes in commit log
---
 support/download/check-hash | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index c24d26b..96d12a5 100755
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
-- 
1.9.1
