From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 27 Feb 2020 17:08:13 -0300
Subject: [Buildroot] [PATCH v2 2/4] package/pkg-utils.mk: add
 KCONFIG_GET_OPT macro
In-Reply-To: <20200227200815.26613-1-unixmania@gmail.com>
References: <20200227200815.26613-1-unixmania@gmail.com>
Message-ID: <20200227200815.26613-3-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Given a config name and a file list, returns the config value if it is
set in one of the files, otherwise returns an empty string.

Files are searched in the given order and the last value found prevails
over the other ones.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/pkg-utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index d324934dba..6f9693e81a 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -16,6 +16,10 @@ define KCONFIG_ENABLE_OPT # (option, file)
 	echo '$(1)=y' >> $(2)
 endef
 
+define KCONFIG_GET_OPT # (option, files)
+$(shell $(SED_QUIET) '/^\<$(1)\>=/h;$${x;s/$(1)=//p;}' $(2) 2> /dev/null)
+endef
+
 define KCONFIG_SET_OPT # (option, value, file)
 	$(SED) "/\\<$(1)\\>/d" $(3)
 	echo '$(1)=$(2)' >> $(3)
-- 
2.18.2
