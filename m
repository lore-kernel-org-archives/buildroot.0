From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Dec 2014 21:54:21 -0600
Subject: [Buildroot] [PATCH 29/30] qemu x86 readme: documented selinux target
In-Reply-To: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1418702062-61039-30-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 board/qemu/x86/readme.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index c702557..faa4804 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -5,3 +5,21 @@ Run the emulation with:
 The login prompt will appear in the graphical window.
 
 Tested with QEMU 2.1.2
+
+-------------------------------------------------------------------
+
+Run the SElinux target emulation with:
+
+  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append "root=/dev/sda rw console=ttyS0 selinux=1" -net nic,model=rtl8139 -net user -display vnc=localhost:1 -serial stdio
+
+The emulation should reboot once the first time for relabeling and then
+provide a login prompt.  The login is username root and password root
+because PAM requires a password in this secure configuration.
+To enable SELinux enforcing at boot, login and edit the /etc/selinux/config
+and set SELINUX to enforcing.  Save and make sure to "sync" before restarting
+the emulation as the ext2 fs would otherwise corrupt when the emulation
+exits.  After enforcing is default, the selinux= provided as part of the
+qemu "append" above can be used to turn enforcing on/off.  Currently
+the enforcing policy configuration doesn't allow getty login, only ssh login.
+This configuration would be tailored as part of a targets refpolicy
+customization.
-- 
1.9.1
