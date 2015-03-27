From: =?UTF-8?B?U8OpYmFzdGllbiBSb3llbg==?= <sebastien.royen@armadeus.com>
Date: Sat, 28 Mar 2015 00:07:24 +0100
Subject: [Buildroot] [PATCH] python modules search in non english locale
 (zlib, ...)
Message-ID: <5515E2AC.3010100@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

setup.py: do not add crosscompile header locations if language is not
english

With buildroot toolchain, gcc can be multi language.
Python package setup.py need gcc english output to work fine. (find zlib
for example)
We force language to en_US for the need of output parsing.

Signed-off-by: Sebastien Royen <sebastien.royen@armadeus.com>
Index: b/setup.py
===================================================================
--- a/setup.py    2015-03-27 23:55:53.738987211 +0100
+++ b/setup.py    2015-03-27 23:44:48.482968892 +0100
@@ -414,7 +414,7 @@
         tmpfile = os.path.join(self.build_temp, 'gccpaths')
         if not os.path.exists(self.build_temp):
             os.makedirs(self.build_temp)
-        ret = os.system('%s -E -v - </dev/null 2>%s 1>/dev/null' %
(gcc, tmpfile))
+        ret = os.system('LANGUAGE=en_US %s -E -v - </dev/null 2>%s
1>/dev/null' % (gcc, tmpfile))
         is_gcc = False
         in_incdirs = False
         inc_dirs = []
