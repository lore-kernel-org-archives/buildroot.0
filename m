From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Aug 2019 17:32:10 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/quagga: fix
 static linking with getopt
Message-ID: <20190822152851.B98B98447C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31f80c9e53a2c684125d26e0ca7fc503548be2ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

quagga has its own copy of getopt_long() instead of using the system's,
and this copy also defines the opterr and optind variables. Obviously,
this is only apparent when linking statically.

This problem can easily be avoided by making sure that getopt() itself
is defined too. This way, there is no reason any more to pull in libc's
getopt() and the corresponding definitions of opterr and optind. Note
that getopt() itself is pulled in by netsnmp, not by quagga itself.

Fortunately, there's a REALLY_NEED_PLAIN_GETOPT flag that we can define
to make sure getopt() does get built by quagga. We can safely do this
unconditionally (instead of only when BR2_PACKAGE_QUAGGA_SNMP and
BR2_STATIC_LIBS are enabled): without netsnmp, getopt() will simply not
be used, and with dynamic libs there's no risk of conflicts anyway.

Fixes:
http://autobuild.buildroot.net/results/0ac598c2259a8d7e8b72d4e8ed95079675b31b84

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d7215f2bbbe087ed026a43aa0884607084026b0e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quagga/quagga.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 420d72c79d..8aa58aceef 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -18,6 +18,11 @@ QUAGGA_CONF_OPTS = \
 	--sysconfdir=/etc/quagga \
 	--localstatedir=/var/run/quagga
 
+# quagga has its own internal copy of getopt_long. To avoid conflicts with libc's
+# getopt, we need to make sure that the getopt function itself is also built.
+QUAGGA_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -DREALLY_NEED_PLAIN_GETOPT"
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 QUAGGA_CONF_OPTS += --enable-capabilities
 QUAGGA_DEPENDENCIES += libcap
