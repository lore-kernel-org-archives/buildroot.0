From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Jul 2017 00:49:49 +0200
Subject: [Buildroot] [PATCH] support/tests: allow properly indented config
	fragment
Message-ID: <20170715224949.25598-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, defining a config fragment in the runtime test infra requires
that the fragment not to be indented. This is beark, and causes grievance
when looking at the code (e.g. to fix it).

Just strip out all leading spaces/tabs when writing the configuration
lines into the config file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/infra/builder.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index a475bb0a30..81735dec96 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -16,7 +16,8 @@ class Builder(object):
 
         config_file = os.path.join(self.builddir, ".config")
         with open(config_file, "w+") as cf:
-            cf.write(self.config)
+            for line in self.config.splitlines():
+                cf.write("{}\n".format(line.lstrip()))
 
         cmd = ["make",
                "O={}".format(self.builddir),
-- 
2.11.0
