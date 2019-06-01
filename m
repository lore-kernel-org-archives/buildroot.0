From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 14:26:34 +0200
Subject: [Buildroot] [git commit] package/gcc: don't build a toolchain for
 powerpc with spe ABI with gcc >= 8.x
Message-ID: <20190601122745.C9F7381456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2df8b1417bc50f52202c6ddc21ccbfe4b109694e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The powerpc*-*-*spe* support has been deprecated in GCC 8 [1] and has
been removed in GCC 9 [2].

While building with GCC 8, the build stop since we don't provide --enable-obsolete
option.

For now, keep powerpcspe support in Buildroot but only for older compiler
up to GCC 7.

Note: Although we can't select Glibc for powerpcspe since commit [4], this
support has been removed for the next version of Glibc (the upcoming 2.30).

[1] https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=b31d0348ddada49453e3edaaf93a423fdc61dc79
[3] https://sourceware.org/git/?p=glibc.git;a=commit;h=a053e878494080f7070cf92890e546057236c9c9
[4] https://git.buildroot.net/buildroot/commit/?id=5777e3ffd99132a57e3d29659850eec14b1625f8

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8e22a4c155..b477fe56e7 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -66,6 +66,9 @@ config BR2_GCC_VERSION_8_X
 	bool "gcc 8.x"
 	# Broken or unsupported architectures
 	depends on !BR2_or1k
+	# powerpc spe support has been deprecated since gcc 8.x.
+	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
+	depends on !BR2_powerpc_SPE
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 endchoice
