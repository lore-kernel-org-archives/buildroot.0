From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:33:02 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/ca-certificates:
 fix rebuilds
Message-ID: <20181024123123.B6B7388972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89500d4219e0d30861f8e655c6675f47b3a9563e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Rebuilding ca-certificates using make ca-certificates-rebuild
caused duplicate certificates to be installed in the target. Its build
system is broken: it doesn't detect that the output file already exists,
and instead of overwriting it, a duplicate is generated under a
different name. The net effect is that all certificates are installed
twice after rebuild.

Fix this by cleaning the build directory before building the package.

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 42b10634c628918c753bfb1aad4f950fa5d41299)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ca-certificates/ca-certificates.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 2d685c74af..c212a198d2 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -16,7 +16,7 @@ CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
 
 define CA_CERTIFICATES_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean all
 endef
 
 define CA_CERTIFICATES_INSTALL_TARGET_CMDS
