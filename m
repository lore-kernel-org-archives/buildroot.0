From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 17:50:45 +0200
Subject: [Buildroot] [git commit] testing/infra/builder: dump defconfig to
	log
Message-ID: <20170724154703.4151881E98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=046f968775dfca0038d1dc0f193088e1b4dd9f7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The defconfig is composed on-the-fly by test infra + tests.

Dump it to the logfile before running 'make olddefconfig' so it can
easily analysed when debugging.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/builder.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index a475bb0..905b127 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -17,6 +17,10 @@ class Builder(object):
         config_file = os.path.join(self.builddir, ".config")
         with open(config_file, "w+") as cf:
             cf.write(self.config)
+        # dump the defconfig to the logfile for easy debugging
+        self.logfile.write("> start defconfig\n" + self.config +
+                           "> end defconfig\n")
+        self.logfile.flush()
 
         cmd = ["make",
                "O={}".format(self.builddir),
