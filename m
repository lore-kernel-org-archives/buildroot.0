From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 14:42:13 +0200
Subject: [Buildroot] [PATCH 2/2 v2 autobuilders] br-reproduce-build: fix URL
	of gitid
In-Reply-To: <cover.1428842444.git.yann.morin.1998@free.fr>
References: <cover.1428842444.git.yann.morin.1998@free.fr>
Message-ID: <4ec90d83a1df3ac770250375cbd7617dc2b6fe63.1428842444.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The canonical URL to the results on the autobuilder server wants the
sha1 to be prefixed with the first three letters of the sha1, like so:

    b52/b52c54eafc2ea8814bb49850823e55d8e034d33d

Currently, this is done by a redirect on the server, but it is broken,
so that requests that do not conform to that scheme return empty
results. See for example the difference between those two calls:

    wget -O OK 'http://autobuild.buildroot.org/results/b2c/b2cefd7d362c12ed99b708d11b988704778d450c/defconfig'
    wget -O KO 'http://autobuild.buildroot.org/results/b2cefd7d362c12ed99b708d11b988704778d450c/defconfig'

So, currently, passing only the sah1 on the command line of br-reproduce
would not work, because the sha1 is used as-is to construct the URL. To
make it work, a user had to pass the sha1 prefixed with the first three
chars.

However, this is not very convenient.

Fix that:
  - internally reconstruct the canonical URL;
  - still accept a prefix-sha1 on the command line (for users that got
    used to that behaviour).

Reported-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - use bashism to extract the first three chars, instead of the more
    complex but POSIX-compliant construct  (Thomas)
---
 utils/br-reproduce-build | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/utils/br-reproduce-build b/utils/br-reproduce-build
index 0ecfb54..17d61f5 100755
--- a/utils/br-reproduce-build
+++ b/utils/br-reproduce-build
@@ -16,10 +16,25 @@ if [ $# -ne 1 ] ; then
     exit 1 ;
 fi
 
-BUILD_ID="$1"
+# The location where the results are stored on the server is
+# of the form 'xxx/xxxyyyyyyyy', where 'xxx' are the first
+# three chars of the sha1, and 'xxxyyyyyyyy' is the full sha1.
+#
+# We accept the user to pass either the full sha1, or the full
+# sha1 prefixed with the 'xxx' part. So we just extract the sha1
+# from the value passed by the user
+BUILD_ID="${1#*/}"
 
+# The build directory is only made of the full sha1, without the
+# leading 'xxx/' part
 BUILD_DIR="${OUTPUT_DIR}/${BUILD_ID}"
 
+# Now, we construct the BUILD-ID as it is expected to be on the server:
+# - extract the first three chars of the sha1: use some shell triclery:
+# - prepend those three chars and a '/' to the full sha1
+BUILD_ID_SHORT="${BUILD_ID:0:3}"
+BUILD_ID="${BUILD_ID_SHORT}/${BUILD_ID}"
+
 mkdir -p "${BUILD_DIR}"
 if [ $? -ne 0 ] ; then
     echo "Cannot create output directory"
-- 
1.9.1
