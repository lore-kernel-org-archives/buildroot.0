From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Sep 2011 20:45:56 +0200
Subject: [Buildroot] [PATCH 1/1] package: fix bootloader building
In-Reply-To: <cover.1317408294.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317408294.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7c448d52bb6e84eef5ac068b6e02b5607f6f2f9d.1317408294.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The changes in e055aea216cff4d12cf55eab2e35ca1459edaa91 and
0849e8193ef429f29945b8c2a54eafc8635e0969 have broken the bootloader
support.

This is because the 'pkgparentdir' macro returns the string 'boot/'
for bootloaders, while the GENTARGETS_INNER macro was testing this
against 'boot' to know if the configuration option to check for this
package is BR2_PACKAGE_* or BR2_TARGET_*.

So, instead of testing against 'boot', we test against 'boot/'.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
1.7.4.1
