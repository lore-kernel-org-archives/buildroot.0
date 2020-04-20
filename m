From: Mark Huang <mark.huang@cerebras.net>
Date: Mon, 20 Apr 2020 18:56:17 +0000
Subject: [Buildroot] [PATCH 1/1] package/fakedate: Skip other fakedates in
 PATH
Message-ID: <E260DE97-5F54-42B7-96EB-80FFABAD9775@cerebras.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If multiple buildroot SDKs are in PATH before /usr/bin (usually accidentally,
but there may be some valid use cases for this), the first two copies of
fakedate will go into a loop calling each other without ever finding
/usr/bin/date. Grep for SOURCE_DATE_EPOCH in the candidate date binary, for
additional verification that it's not another copy of fakedate.

Signed-off-by: Mark Huang <mark.huang@cerebras.net>
---
 package/fakedate/fakedate | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
index a64d9b9..7b04568 100755
--- a/package/fakedate/fakedate
+++ b/package/fakedate/fakedate
@@ -23,7 +23,7 @@ DATE_BIN=false
 # Instead, find path of true `date' binary.
 for P in `echo $PATH | tr ':' ' '`; do
     if [ -x "$P/date" ]; then
-        if ! [ "$P/date" -ef "$0" ]; then
+        if ! [ "$P/date" -ef "$0" ] && ! grep -q SOURCE_DATE_EPOCH "$P/date" ; then
             DATE_BIN="$P/date"
             break;
         fi
--
1.8.3.1
