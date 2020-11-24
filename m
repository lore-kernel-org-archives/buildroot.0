From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 24 Nov 2020 21:30:19 +0100
Subject: [Buildroot] [PATCHv4 1/4] support/scripts/boot-qemu-image.py: don't
 fail if start-qemu.sh is missing
Message-ID: <20201124203022.477461-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When boot-qemu-image.py script was added, we wanted to run
each qemu defconfig in gitlab, so we expect that all qemu
defconfig generate the script start-qemu.sh in images
directory.

Don't make it a hard requirement even if we prefer to be
able to do a runtime test for each qemu defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/boot-qemu-image.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/scripts/boot-qemu-image.py b/support/scripts/boot-qemu-image.py
index dbbba552ad..4066788c88 100755
--- a/support/scripts/boot-qemu-image.py
+++ b/support/scripts/boot-qemu-image.py
@@ -18,6 +18,10 @@ def main():
     if not sys.argv[1].startswith('qemu_'):
         sys.exit(0)
 
+    if not os.path.exists('output/images/start-qemu.sh'):
+        print('qemu-start.sh is missing, cannot test.')
+        sys.exit(0)
+
     qemu_start = os.path.join(os.getcwd(), 'output/images/start-qemu.sh')
 
     child = pexpect.spawn(qemu_start, ['serial-only'],
-- 
2.25.4
