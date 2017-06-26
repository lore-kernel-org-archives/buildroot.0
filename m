From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 10:09:23 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] openssh: fix sshd for
	MIPS64 n32
Message-ID: <20170626081043.D7B1481945@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67542de53f18bc95cd5afc94df8cca2d82214d4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

This patch backports two patches that have been sent upstream as a pull
request in order to fix sshd for MIPS64 n32.

The first patch adds support for detecting the MIPS ABI during the
configure phase.

The second patch sets the right value to seccomp_audit_arch taking into
account the MIPS64 ABI.

Currently seccomp_audit_arch is set to AUDIT_ARCH_MIPS64 or
AUDIT_ARCH_MIPSEL64 (depending on the endinness) when openssh is built
for MIPS64. However, that's only valid for n64 ABI. The right macros for
n32 ABI defined in seccomp.h are AUDIT_ARCH_MIPS64N32 and
AUDIT_ARCH_MIPSEL64N32, for big and little endian respectively.

Because of that an sshd built for MIPS64 n32 rejects connection attempts
and the output of strace reveals that the problem is related to seccomp
audit:

[pid   194] prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, {len=57,
filter=0x555d5da0}) = 0
[pid   194] write(7, "\0\0\0]\0\0\0\5\0\0\0Ulist_hostkey_types: "..., 97) = ?
[pid   193] <... poll resumed> )        = 2 ([{fd=5, revents=POLLIN|POLLHUP},
{fd=6, revents=POLLHUP}])
[pid   194] +++ killed by SIGSYS +++

Pull request: https://github.com/openssh/openssh-portable/pull/71

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 6da373798426e0080e2f910132a8e281b892d435)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 2 ++
 package/openssh/openssh.mk   | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 3685bc0..ed628fa 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,2 +1,4 @@
 # From http://www.openssh.com/txt/release-7.5 (base64 encoded)
 sha256 9846e3c5fab9f0547400b4d2c017992f914222b3fd1f8eee6c7dc6bc5e59f9f0  openssh-7.5p1.tar.gz
+sha256 310860606c4175cdfd095e724f624df27340c89a916f7a09300bcb7988d5cfbf  afc3e31b637db9dae106d4fad78f7b481c8c24e3.patch
+sha256 395aa1006967713b599555440e09f898781a5559e496223587401768ece10904  f4fcd8c788a4854d4ebae400cf55e3957f906835.patch
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index ba48770..dea7b47 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -8,6 +8,12 @@ OPENSSH_VERSION = 7.5p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3c, BSD-2c, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
+# Autoreconf needed due to the following patches modifying configure.ac:
+# f4fcd8c788a4854d4ebae400cf55e3957f906835.patch
+# afc3e31b637db9dae106d4fad78f7b481c8c24e3.patch
+OPENSSH_AUTORECONF = YES
+OPENSSH_PATCH = https://github.com/openssh/openssh-portable/commit/f4fcd8c788a4854d4ebae400cf55e3957f906835.patch \
+	https://github.com/openssh/openssh-portable/commit/afc3e31b637db9dae106d4fad78f7b481c8c24e3.patch
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPTS = \
 	--sysconfdir=/etc/ssh \
