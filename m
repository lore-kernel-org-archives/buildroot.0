From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 09:40:27 +0100
Subject: [Buildroot] [git commit] dependencies/cmake: blacklist cmake 3.7
Message-ID: <20170228085709.6E6048226A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4422eca2d418e2b817b419ff6c4c62f7f4cb7871
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cmake-3.7 has a bug in how it handles rpath, linking with libraries from
the host.

Until we completely understand the issue, just blacklist cmake-3.7.

The issue has been reported upstream:
    http://public.kitware.com/pipermail/cmake/2017-February/064970.html

Reported-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J??rg Krause <joerg.krause@embedded.rocks>
Cc: Ben Boeckel <mathstuf@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/check-host-cmake.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
index 9b63b06..84c26c2 100755
--- a/support/dependencies/check-host-cmake.sh
+++ b/support/dependencies/check-host-cmake.sh
@@ -6,6 +6,9 @@ version_min="${2}"
 major_min="${version_min%.*}"
 minor_min="${version_min#*.}"
 
+# cmake-3.7 incorrectly handles rpath, linking to host libraries
+blacklist_version="3.7"
+
 cmake=`which ${candidate}`
 if [ ! -x "${cmake}" ]; then
     # echo nothing: no suitable cmake found
@@ -27,6 +30,11 @@ version="$(${cmake} --version \
 major="${version%.*}"
 minor="${version#*.}"
 
+if [ "${version}" = "${blacklist_version}" ]; then
+    # echo nothing: no suitable cmake found
+    exit 1
+fi
+
 if [ ${major} -gt ${major_min} ]; then
     echo "${cmake}"
 else
