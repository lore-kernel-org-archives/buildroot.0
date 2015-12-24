From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 11:07:53 +0100
Subject: [Buildroot] [git commit] autofs: really fix build
Message-ID: <20151224101242.48CFC826F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b78a95d109ea335406bbac2957c4cc85b98838d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The autofs configure script does a number of weird things.

First, instead of using the default search path for AC_CHECK_PROGS(),
it overrides it its own search path, ignoring the PATH environment
variable. Due to this, autofs fails to find flex even though flex is
available in the PATH. Fortunately, the authors provided a --with-path
configure option which allows to override this search path.

In addition, the configure script is checking on the build machine
that a number of programs are available, while those programs are in
fact only needed on the target. The one causing build issues is
modprobe, because it may not necessarily be installed on build
machines, so we explicitly tell autofs that modprobe is located in
/sbin/modprobe. It might be necessary to provide additional values for
other programs, as we discover other problems.

Fixes:

  http://autobuild.buildroot.org/results/447/4479382b2d4d762991cab2e93fd08ad6160c2921/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/autofs/autofs.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index 0ab8986..a98e5eb 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -11,11 +11,20 @@ AUTOFS_LICENSE = GPLv2+
 AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
 AUTOFS_DEPENDENCIES = host-flex host-bison
 
+# autofs looks on the build machine for the path of modprobe, so tell
+# it explicitly where it will be located on the target.
+AUTOFS_CONF_ENV = \
+	ac_cv_path_MODPROBE=/sbin/modprobe
+
+# instead of looking in the PATH like any reasonable package, autofs
+# configure looks only in an hardcoded search path for host tools,
+# which we have to override with --with-path.
 AUTOFS_CONF_OPTS = \
 	--disable-mount-locking \
 	--enable-ignore-busy \
 	--without-openldap \
-	--without-sasl
+	--without-sasl \
+	--with-path="$(BR_PATH)"
 
 AUTOFS_MAKE_ENV = DONTSTRIP=1
 
