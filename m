From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 26 Sep 2016 11:44:22 +0100
Subject: [Buildroot] [PATCH 2/2] jsoncpp: patch to include stdint.h,
	necessary for int64_t and uint64_t
In-Reply-To: <1474886662-46914-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1474886662-46914-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1474886662-46914-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise failures like these one can happen during the configure phase
of other applications that use jsoncpp, like upmpdcli for instance:

checking jsoncpp/json/json.h usability... yes
checking jsoncpp/json/json.h presence... yes
checking for jsoncpp/json/json.h... yes
configure: error: libjsoncpp not found.

And this is the actual problem that you can see in config.log:

configure:5233: checking for jsoncpp/json/json.h
configure:5233: result: yes
configure:5259: /usr/bin/mipsel-linux-g++ -o conftest conftest.cpp
-lmicrohttpd -lmpdclient -lpthread -ljsoncpp >&5
In file included from /usr/include/jsoncpp/json/autolink.h:9:0,
from /usr/include/jsoncpp/json/json.h:9,
from conftest.cpp:26:
/usr/include/jsoncpp/json/config.h:155:9: error: 'int64_t' does not name
a type
typedef int64_t Int64;
^
/usr/include/jsoncpp/json/config.h:156:9: error: 'uint64_t' does not
name a type
typedef uint64_t UInt64;
^

Upstream status: pull request sent
https://github.com/open-source-parsers/jsoncpp/pull/536

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...dint.h-necessary-for-int64_t-and-uint64_t.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/jsoncpp/0001-Include-stdint.h-necessary-for-int64_t-and-uint64_t.patch

diff --git a/package/jsoncpp/0001-Include-stdint.h-necessary-for-int64_t-and-uint64_t.patch b/package/jsoncpp/0001-Include-stdint.h-necessary-for-int64_t-and-uint64_t.patch
new file mode 100644
index 0000000..26a11ff
--- /dev/null
+++ b/package/jsoncpp/0001-Include-stdint.h-necessary-for-int64_t-and-uint64_t.patch
@@ -0,0 +1,51 @@
+From ab0f1e234aa40147e39cdfd0b97bf6527b8ea5e8 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Mon, 26 Sep 2016 11:16:38 +0100
+Subject: [PATCH] Include stdint.h necessary for int64_t and uint64_t
+
+Otherwise failures like these one can happen during the configure phase
+of other applications that use jsoncpp, like upmpdcli for instance:
+
+checking jsoncpp/json/json.h usability... yes
+checking jsoncpp/json/json.h presence... yes
+checking for jsoncpp/json/json.h... yes
+configure: error: libjsoncpp not found.
+
+And this is the actual problem that you can see in config.log:
+
+configure:5233: checking for jsoncpp/json/json.h
+configure:5233: result: yes
+configure:5259: /usr/bin/mipsel-linux-g++ -o conftest conftest.cpp
+-lmicrohttpd -lmpdclient -lpthread  -ljsoncpp >&5
+In file included from /usr/include/jsoncpp/json/autolink.h:9:0,
+                 from /usr/include/jsoncpp/json/json.h:9,
+                 from conftest.cpp:26:
+/usr/include/jsoncpp/json/config.h:155:9: error: 'int64_t' does not name
+a type
+ typedef int64_t Int64;
+         ^
+/usr/include/jsoncpp/json/config.h:156:9: error: 'uint64_t' does not
+name a type
+ typedef uint64_t UInt64;
+         ^
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ include/json/config.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/json/config.h b/include/json/config.h
+index 6519101..71278c3 100644
+--- a/include/json/config.h
++++ b/include/json/config.h
+@@ -7,6 +7,7 @@
+ #define JSON_CONFIG_H_INCLUDED
+ #include <stddef.h>
+ #include <string> //typdef String
++#include <stdint.h> //typedef int64_t, uint64_t
+ 
+ /// If defined, indicates that json library is embedded in CppTL library.
+ //# define JSON_IN_CPPTL 1
+-- 
+2.7.3
+
-- 
2.7.3
