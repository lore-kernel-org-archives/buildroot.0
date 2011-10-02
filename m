From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Oct 2011 20:55:55 +0200
Subject: [Buildroot] [git commit] package: fix bootloader building
Message-ID: <20111002191513.D82438E04A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31960961497ebc1059978c54c7d65a08a8b7e821
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The changes in e055aea216cff4d12cf55eab2e35ca1459edaa91 and
0849e8193ef429f29945b8c2a54eafc8635e0969 have broken the bootloader
support.

This is because the 'pkgparentdir' macro returns the string 'boot/'
for bootloaders, while the GENTARGETS_INNER macro was testing this
against 'boot' to know if the configuration option to check for this
package is BR2_PACKAGE_* or BR2_TARGET_*.

So, instead of testing against 'boot', we test against 'boot/'.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 353ba72..b5ef57b 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -637,7 +637,7 @@ $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 # kernel case, the bootloaders case, and the normal packages case.
 ifeq ($(1),linux)
 $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
-else ifeq ($(4),boot)
+else ifeq ($(4),boot/)
 $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
 else
 $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
