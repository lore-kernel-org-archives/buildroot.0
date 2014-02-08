From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  8 Feb 2014 17:26:04 +0100
Subject: [Buildroot] [PATCH 1/3] packages infra: add function to get a
	Kconfig option
In-Reply-To: <cover.1391876537.git.yann.morin.1998@free.fr>
References: <cover.1391876537.git.yann.morin.1998@free.fr>
Message-ID: <9668e99e32d7b8a9d27b7556e0ca7d409e0c4bf0.1391876537.git.yann.morin.1998@free.fr>
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
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - use simpler sed expression  (Peter)
  - use simple assignment, not a define  (Arnout)

Note: when we have the Kconfig's 'config' script, we can revisit this
to use 'config' instead of our own sed hack.
---
 package/pkg-utils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 91a1981..99fefe6 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -52,6 +52,8 @@ define KCONFIG_DISABLE_OPT
 	echo "# $(1) is not set" >> $(2)
 endef
 
+KCONFIG_GET_OPT = $(shell sed -e 's/^$(1)=//p' $(2))
+
 # Helper functions to determine the name of a package and its
 # directory from its makefile directory, using the $(MAKEFILE_LIST)
 # variable provided by make. This is used by the *TARGETS macros to
-- 
1.8.1.2
