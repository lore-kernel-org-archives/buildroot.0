From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 15:42:17 +0200
Subject: [Buildroot] [git commit] package/ca-certificates: depend on
	host-python or host-python3
Message-ID: <20160505134452.46D4781EF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27f09940670723fb7cfe9e1f39b23fc4b047e5ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ca-certificates build process runs a Python script that needs at
least Python 2.7. While Buildroot requires Python as a hard dependency
on the build system, we don't require Python >= 2.7.

So in order to ensure that a Python >= 2.7 is installed, this commit
makes the ca-certificates package depend either on host-python or
host-python3.

Fixes:

 http://autobuild.buildroot.net/results/a2a4fed293c836b9cf63ff2aaa463b0704dec07e/
 http://autobuild.buildroot.net/results/bbed4afa8e30382b8892062f31ba64cbb0ea14e4/
 http://autobuild.buildroot.net/results/1af5562be3c0d233cea81834a898f7ac6ae48271/

Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Martin Bark <martin@barkynet.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: rewrite commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ca-certificates/ca-certificates.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index da1b70d..393c8cd 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -7,7 +7,11 @@
 CA_CERTIFICATES_VERSION = 20160104
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
 CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20160104T220912Z/pool/main/c/ca-certificates
-CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python
+CA_CERTIFICATES_DEPENDENCIES = host-openssl
+# ca-certificates can be built with either python 2 or python 3
+# but it must be at least python 2.7
+CA_CERTIFICATES_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
 CA_CERTIFICATES_LICENSE = GPLv2+ (script), MPLv2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
 
