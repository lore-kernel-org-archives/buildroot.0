From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jan 2014 14:56:26 +0100
Subject: [Buildroot] [PATCH 1/2] packages infra: add function to get a
	Kconfig option
In-Reply-To: <cover.1390744549.git.yann.morin.1998@free.fr>
References: <cover.1390744549.git.yann.morin.1998@free.fr>
Message-ID: <b68b4ce8c5017701344c6f32a993de7d3e26802b.1390744549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

We so far have no mean to get the value from a Kconfig option from the
.config file of a package (eg. linux, busybox...).

Add a new function that returns the unmangled value of an option.
It expect two arguments:
  - the Kconfig option name (complete, with leading CONFIG if necessary)
  - the .config file to get it from

Note that, if the Kconfig option is a string, the returned value will
contain the leading and trailing double-quotes.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-utils.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 851575c..2f70acc 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -52,6 +52,12 @@ define KCONFIG_DISABLE_OPT
 	echo "# $(1) is not set" >> $(2)
 endef
 
+# Note: we do not indent this, since we want to avoid any leading
+# space or tabs when calling this function
+define KCONFIG_GET_OPT
+$(shell sed -e "/\\<$(1)\\>=\\(.*\\)$$/!d; s//\\1/" $(2))
+endef
+
 # Helper functions to determine the name of a package and its
 # directory from its makefile directory, using the $(MAKEFILE_LIST)
 # variable provided by make. This is used by the *TARGETS macros to
-- 
1.8.1.2
