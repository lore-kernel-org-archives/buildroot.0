From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:33 -0000
Subject: [Buildroot] [git commit] support/testing: do not print non-utf-8
 chars on cbor test
Message-ID: <20190903133617.A86AB8A5E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b2928201f272eb2e817e9be2ebb92bd155b4e71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python-cbor sample script to be run on the target dumps a binary
variable to the target stdout. This is done for debug purposes-only, in
the case the test on test infra fails.
This non-utf-8 is currently silently ignored by the Emulator class /
pexpect.spawn from the test infra because the infra uses Python 2, that
in turn do not differentiate between string and byte data.

Make the code Python3-friendly (Python 3 in the host) by doing the right
thing and encoding the data before printing it.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/sample_python_cbor_enc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/sample_python_cbor_enc.py b/support/testing/tests/package/sample_python_cbor_enc.py
index 1bde92bb9f..31d937d4b8 100644
--- a/support/testing/tests/package/sample_python_cbor_enc.py
+++ b/support/testing/tests/package/sample_python_cbor_enc.py
@@ -9,6 +9,6 @@ data = {
     }
 }
 serialized = cbor.dumps(data)
-print(serialized)
+print(serialized.decode(errors="ignore"))
 with open("/tmp/data.cbor", "wb") as f:
     f.write(serialized)
