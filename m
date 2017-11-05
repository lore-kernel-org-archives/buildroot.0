From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 Nov 2017 16:58:12 +0100
Subject: [Buildroot] [git commit] qt5webengine: only available on x86(-64)
 hosts
Message-ID: <20171105155244.26E677FB27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=315f2a7d16914051e21a6e5a1da2e6514cbe7c80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The -m32 compiler flag is used for 32bit builds and the host tools have
limited architecture support. It may work in some situations (e.g.
on aarch64 host when building a 64-bit target), but it's equally likely
that it breaks and those situations are not tested. So just limit to
x86(-64) hosts.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Arnout: explain that it may work in some situations]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5webengine/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 6b68d1b..d40b580 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	default y if BR2_aarch64 || BR2_arm || \
 		BR2_i386 || BR2_x86_64 || \
 		BR2_mips || BR2_mips64
+	# -m32 flag is used for 32bit builds and host tools have
+	# limited architecture support
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
 	depends on !BR2_BINFMT_FLAT # qt5base-icu
 	depends on BR2_USE_MMU # libglib2, qt5base-dbus
