From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 13 Nov 2020 15:06:27 +0100
Subject: [Buildroot] [PATCH 1/1] utils/getdeveloperlib.py: fix issue with
 hasfile()
Message-ID: <20201113140627.6097-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pkg-stats is not able anymore to set the developers for defconfigs and
packages. This issue is introduced with
ae86067a151b6596ca492d6f94ed513f4f8e18d7. The hasfile() method from
Developer object tries to check an absolute path against a relative path.

Convert the filepath to be checked also into an absolute path.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 utils/getdeveloperlib.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index dc0cc07cc7..f57f41887b 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -126,6 +126,7 @@ class Developer:
     def hasfile(self, f):
         f = os.path.abspath(f)
         for fs in self.files:
+            fs = os.path.abspath(fs)
             if f.startswith(fs):
                 return True
         return False
-- 
2.20.1
