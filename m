From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2020 23:47:01 +0100
Subject: [Buildroot] [git commit] utils/getdeveloperlib.py: fix issue with
 hasfile()
Message-ID: <20201117223530.A806D86AD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afc112b0e4627a01e95887f7770437b0d060cf43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pkg-stats is not able anymore to set the developers for defconfigs and
packages. This issue is introduced with
ae86067a151b6596ca492d6f94ed513f4f8e18d7. The hasfile() method from
Developer object tries to check an absolute path against a relative path.

Convert the filepath to be checked also into an absolute path.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
