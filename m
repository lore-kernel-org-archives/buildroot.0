From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Jul 2021 10:21:52 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] python: use system libffi
 for host-python
Message-ID: <20210712075038.80D2291B33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69bde6ea6192e96fee3ec2241450cf5605732603
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

python2 contains a bundled copy of libffi which is currently out of sync with
the latest libffi release. There is an option to use a system libffi, buildroot
already uses it for the target python2 build and for python3. In python3, the
bundled copy doesn't exist anymore and the system-provided libffi is required.

The bundled copy currently fails to build on aarch64 host due to a missing
definition of AARCH64_CALL_CONTEXT_SIZE. This define was removed from the
headers in recent libffi releases and the host compiler might be including the
system headers before the bundled headers.

To solve this and since buildroot already relies on system libffi for target
python2 and python3 anyway, switch host python2 to use system libffi.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b31f7bc9587170855cd99769db87a5fb32b6724b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python/python.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index f4f9f8563b..ae99f382f9 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -24,6 +24,7 @@ HOST_PYTHON_CONF_OPTS += \
 	--disable-sqlite3 \
 	--disable-tk \
 	--with-expat=system \
+	--with-system-ffi \
 	--disable-curses \
 	--disable-codecs-cjk \
 	--disable-nis \
@@ -56,7 +57,7 @@ HOST_PYTHON_MAKE = $(MAKE1)
 
 PYTHON_DEPENDENCIES = host-python libffi $(TARGET_NLS_DEPENDENCIES)
 
-HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
+HOST_PYTHON_DEPENDENCIES = host-expat host-libffi host-zlib
 
 ifeq ($(BR2_PACKAGE_HOST_PYTHON_SSL),y)
 HOST_PYTHON_DEPENDENCIES += host-openssl
