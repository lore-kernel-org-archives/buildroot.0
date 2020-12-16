From: Charles Eidsness <charles@ccxtechnologies.com>
Date: Wed, 16 Dec 2020 08:37:02 -0500
Subject: [Buildroot] pycompile script doesn't compile files with single
 character names
Message-ID: <CAAV4SYZLndA0mHnZO6+9+YGaVKtPQwGYHxWi4=ckF67AzibDzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I'm not sure if this is by design but the pycompile utility won't compile
single character python files. This causes an issue if you've selected pyc
files only and are building python-dnspython, which has some single
character filenames.

Here is a simple fix:

diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index 7041a0506b..e2cfc2683c 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -30,7 +30,7 @@ def compile_one(host_path, strip_root=None,
verbose=False):
         return  # only compile real files

     if not re.match(
-            r"^[_A-Za-z][_A-Za-z0-9]+\.py$", os.path.basename(host_path)
+            r"^[_A-Za-z][_A-Za-z0-9]*\.py$", os.path.basename(host_path)
     ):
         return  # only compile "importable" python modules
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201216/3cd34951/attachment.html>
