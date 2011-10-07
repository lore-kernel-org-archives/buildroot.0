From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 07 Oct 2011 16:51:48 +0200
Subject: [Buildroot] [PATCH] crosstool-ng: add dependency to host-lzma if no
	lzma found
Message-ID: <5ce1be6b920b684e152c.1317999108@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Crosstool compilation fails when lzma is not present. If not present on the host
system, we should compile one ourselves.

This patch uses the already existing but seemingly unused check-host-lzma.sh
script in toolchain/dependencies.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---

I think the concept of first checking the host system, and only add a host-foo
dependency if needed is a common one. Therefore, I think we should consider
creating a function for it, something used like:

$(if $(call is-host-package-adequate,foo),,host-foo)

This function would return the path to the existing host package, if any, or
the empty string otherwise. The name for such a function is open for discussion
:-)

This mechanism could then be used to check for a recent-enough tar version
(recall from a previous patch series, old tar versions can cause problems when
unpacking archives containing hard-links, if the --strip-components option is
used).

Comments/suggestions are welcome...

diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -4,6 +4,6 @@
 CROSSTOOL_NG_INSTALL_STAGING   = NO
 CROSSTOOL_NG_INSTALL_TARGET    = NO
 CROSSTOOL_NG_MAKE              = $(MAKE1)
-HOST_CROSSTOOL_NG_DEPENDENCIES = host-gawk host-automake $(if $(BR2_CCACHE),host-ccache)
+HOST_CROSSTOOL_NG_DEPENDENCIES = host-gawk host-automake $(if $(BR2_CCACHE),host-ccache) $(if $(shell toolchain/dependencies/check-host-lzma.sh),,host-lzma)
 
 $(eval $(call AUTOTARGETS,package,crosstool-ng,host))
