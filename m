From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 21:10:42 +0200
Subject: [Buildroot] [git commit] mesa3d: use -mno-compact-eh for Code
	Sourcery MIPS
Message-ID: <20160531191101.6A1EB80E3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e032a29604e843c8adc551d5ceb3c45bc7715b4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mesa3d doesn't like the new compressed exception handling of the Code
Sourcery MIPS toolchain and it fails to compile with an error like this
one:

/br/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/5.3.0/../../../../mips-linux-gnu/bin/ld:
../../../../src/mesa/.libs/libmesagallium.a(ir_to_mesa.o):
.eh_frame_entry not in order
/br/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/5.3.0/../../../../mips-linux-gnu/bin/ld:
final link failed: Nonrepresentable section on output
collect2: error: ld returned 1 exit status

Using -mno-compact-eh fixes the problem.

Fixes:

  http://autobuild.buildroot.net/results/3cd/3cd81c57c51c0963ee6f4d9b814989460bb35316/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[Thomas: improve comment in code.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 3c98f8d..15ba422 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -22,6 +22,14 @@ MESA3D_DEPENDENCIES = \
 	expat \
 	libdrm
 
+# The Sourcery MIPS toolchain has a special (non-upstream) feature to
+# have "compact exception handling", which unfortunately breaks with
+# mesa3d, so we disable it here by passing -mno-compact-eh.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS),y)
+MESA3D_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mno-compact-eh"
+MESA3D_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -mno-compact-eh"
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MESA3D_DEPENDENCIES += openssl
 MESA3D_CONF_OPTS += --with-sha1=libcrypto
