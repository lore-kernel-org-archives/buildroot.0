From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Oct 2020 23:11:10 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] python-scapy: add
 upstream patch fixing python 2.x compatibility
Message-ID: <20201011210131.3B78B80046@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cfc64df27813bfc8a7ca144720c7d28eb034f07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:
http://autobuild.buildroot.net/results/829/8293529a72ac4c8e93919b8bc0ea758fbb4bc444/

Python 2.x gets confused by rb"string", but not br"string", so add an
upstream patch changing the former to the latter to fix a pycompile issue
with python 2.x:

error:   File "/usr/lib/python2.7/site-packages/scapy/tools/generate_ethertypes.py", line 23
    reg = rb".*ETHERTYPE_([^\s]+)\s.0x([0-9A-Fa-f]+).*\/\*(.*)\*\/"
                                                                  ^
SyntaxError: invalid syntax

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-scapy/0001-Small-Python-2-fix.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/python-scapy/0001-Small-Python-2-fix.patch b/package/python-scapy/0001-Small-Python-2-fix.patch
new file mode 100644
index 0000000000..562838d53b
--- /dev/null
+++ b/package/python-scapy/0001-Small-Python-2-fix.patch
@@ -0,0 +1,26 @@
+From 0c3d5e417bbd923c4729d15572c3d693d58aff81 Mon Sep 17 00:00:00 2001
+From: Gabriel <gabriel@potter.fr>
+Date: Wed, 21 Aug 2019 18:18:14 +0800
+Subject: [PATCH] Small Python 2 fix
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ scapy/tools/generate_ethertypes.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scapy/tools/generate_ethertypes.py b/scapy/tools/generate_ethertypes.py
+index 5bc5cdf9..47c38c4f 100644
+--- a/scapy/tools/generate_ethertypes.py
++++ b/scapy/tools/generate_ethertypes.py
+@@ -20,7 +20,7 @@ URL = "https://raw.githubusercontent.com/openbsd/src/master/sys/net/ethertypes.h
+ with urllib.request.urlopen(URL) as stream:
+     DATA = stream.read()
+ 
+-reg = rb".*ETHERTYPE_([^\s]+)\s.0x([0-9A-Fa-f]+).*\/\*(.*)\*\/"
++reg = br".*ETHERTYPE_([^\s]+)\s.0x([0-9A-Fa-f]+).*\/\*(.*)\*\/"
+ COMPILED = b"""#
+ # Ethernet frame types
+ #       This file describes some of the various Ethernet
+-- 
+2.20.1
+
