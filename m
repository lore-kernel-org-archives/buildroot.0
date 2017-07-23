From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 23 Jul 2017 01:20:17 -0300
Subject: [Buildroot] [PATCH 2/4] testing/infra/builder: dump config to log
In-Reply-To: <20170723042019.10323-1-ricardo.martincoski@gmail.com>
References: <20170723042019.10323-1-ricardo.martincoski@gmail.com>
Message-ID: <20170723042019.10323-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The config is composed on-the-fly by test infra + tests.

Dump it to the logfile before running 'make olddefconfig' so it can
easily analysed when debugging.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 support/testing/infra/builder.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index a475bb0a30..dc128cdd8a 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -17,6 +17,9 @@ class Builder(object):
         config_file = os.path.join(self.builddir, ".config")
         with open(config_file, "w+") as cf:
             cf.write(self.config)
+        # dump the config to the logfile for easy debugging
+        self.logfile.write("> config:\n" + self.config)
+        self.logfile.flush()
 
         cmd = ["make",
                "O={}".format(self.builddir),
-- 
2.13.0
