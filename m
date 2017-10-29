From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 18:14:37 +0100
Subject: [Buildroot] [PATCH 2/5] test-pkg: filter empty lines and comments
	in CSV file
In-Reply-To: <20171029171440.8095-1-thomas.petazzoni@free-electrons.com>
References: <20171029171440.8095-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171029171440.8095-3-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for the addition of comments in the CSV file listing
toolchain configurations, we filter out such lines when reading the
CSV file in utils/test-pkg.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/test-pkg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 6899d44f7c..1b7046eac4 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -54,7 +54,7 @@ main() {
     # Extract the URLs of the toolchains; drop internal toolchains
     # E.g.: http://server/path/to/name.config,arch,libc
     #  -->  http://server/path/to/name.config
-    toolchains=($(sed -r -e 's/,.*//; /internal/d;' "${toolchains_csv}" \
+    toolchains=($(sed -r -e 's/,.*//; /internal/d; /^#/d; /^$/d;' "${toolchains_csv}" \
                   |if [ ${random} -gt 0 ]; then \
                       sort -R |head -n ${random}
                    else
-- 
2.13.6
