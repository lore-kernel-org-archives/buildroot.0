From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 10 Aug 2019 22:35:36 -0300
Subject: [Buildroot] [PATCH 2/4] support/testing: make crossbar to use
 umsgpack
In-Reply-To: <20190811013538.26614-1-ricardo.martincoski@gmail.com>
References: <20190811013538.26614-1-ricardo.martincoski@gmail.com>
Message-ID: <20190811013538.26614-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 19.3.3, python-autobahn assumes that when CPython is used
msgpack will be used as well [1]. But it still allows the user to
override this behavior by setting an environment variable [2] to use
umsgpack.

Make the test to explicitly use umsgpack since it is part of the minimal
config (python-crossbar selects python-u-msgpack).

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/269139430

[1] https://github.com/crossbario/autobahn-python/commit/ea019b80427c9f6d43938631f8143bf7c993b4e7
[2] https://github.com/crossbario/autobahn-python/commit/fe70ceebe04849470b0c81b26ff6e65e709b0d33

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/270022934
---
 support/testing/tests/package/sample_python_crossbar.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/testing/tests/package/sample_python_crossbar.py b/support/testing/tests/package/sample_python_crossbar.py
index 3695fe92c0..374cccd837 100644
--- a/support/testing/tests/package/sample_python_crossbar.py
+++ b/support/testing/tests/package/sample_python_crossbar.py
@@ -1,3 +1,5 @@
+import os
 import crossbar
 
+os.environ["AUTOBAHN_USE_UMSGPACK"] = "1"
 crossbar.run(["version"])
-- 
2.17.1
