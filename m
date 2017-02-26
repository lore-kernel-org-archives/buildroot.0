From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Feb 2017 22:42:53 +0100
Subject: [Buildroot] [git commit] htop: work-around old uClibc issue when
	static linking
Message-ID: <20170226215951.58D74821F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4b7bdd469e3d37ae7bd755db35bd52c2b0cce40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

htop wants to use backtrace() support from the C
library. Unfortunately, with old uClibc versions such as the one we
use for the ARC architecture, the backtrace() implementation is in
libubacktrace. In addition, this implementation needs dladdr()
support, which is in libdl, not available when static linking.

Since this problem no longer exists in more recent versions of uClibc,
we simply special case the ARC+static linking case, and make the
configure script believe that <execinfo.h> is not available.

Fixes:

  http://autobuild.buildroot.net/results/cdea351fad7a0f61ddec3e6a141da8da0523a902/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/htop/htop.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index adc5090..9451d15 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -18,4 +18,11 @@ else
 HTOP_CONF_OPTS += --disable-unicode
 endif
 
+# ARC uses an old uClibc that needs dladdr() for backtrace support,
+# which doesn't work for static only scenario, so as a workaround, we
+# pretend that execinfo.h is not available.
+ifeq ($(BR2_arc)$(BR2_STATIC_LIBS),yy)
+HTOP_CONF_ENV += ac_cv_header_execinfo_h=no
+endif
+
 $(eval $(autotools-package))
