From: James Knight <james.d.knight@live.com>
Date: Tue, 6 Mar 2018 02:39:33 +0000
Subject: [Buildroot] [PATCH 1/1] get-developers: explicitly set devs
 document encoding
Message-ID: <BN6PR2001MB094879FCCDB0C266DE027DFFA0D90@BN6PR2001MB0948.namprd20.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explicitly indicate the file encoding (to UTF-8) for the DEVELOPERS
document. This prevents Unicode decoding errors where some systems
assume an alternative default encoding (ex. 'CP1252').

This corrects the following observed error:

    $ ./utils/get-developers outgoing/*
    Traceback (most recent call last):
      File "./utils/get-developers", line 101, in <module>
        __main__()
      File "./utils/get-developers", line 25, in __main__
        devs = getdeveloperlib.parse_developers()
      File "...\buildroot\utils\getdeveloperlib.py", line 164, in parse_developers
        for line in f:
      File "...\Python36\lib\encodings\cp1252.py", line 23, in decode
        return codecs.charmap_decode(input,self.errors,decoding_table)[0]
    UnicodeDecodeError: 'charmap' codec can't decode byte 0x81 in position 7087: character maps to <undefined>

Signed-off-by: James Knight <james.d.knight@live.com>
---
 utils/getdeveloperlib.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index 2c8d477583..30374d77f8 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -158,7 +158,7 @@ def parse_developers(basepath=None):
     linen = 0
     if basepath is None:
         basepath = os.getcwd()
-    with open(os.path.join(basepath, "DEVELOPERS"), "r") as f:
+    with open(os.path.join(basepath, "DEVELOPERS"), "r", encoding="utf8") as f:
         files = []
         name = None
         for line in f:
-- 
2.16.2.windows.1
