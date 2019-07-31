From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 31 Jul 2019 18:32:37 +0300
Subject: [Buildroot] [PATCH v3 1/1] pkg-infra/show-info: dump
 install_{staging, target} info
Message-ID: <20190731153237.13607-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

provide info if the package will be installed to staging/target
destinations. Might be useful for analyzing the packages which
installed only for target/staging.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
v2:
    1) use oneliner 'if' to dump install_{staging,target} properties

v3:
    1) fix evaluation of true/false value via 'subst' (suggested by Yann E. Morin)

 package/pkg-utils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index b7280e930f..ffe198e242 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -94,6 +94,8 @@ endef
 define _json-info-pkg-details
 	"version": "$($(1)_DL_VERSION)",
 	"licenses": "$($(1)_LICENSE)",
+	"install-target": $(if $(subst NO,,$($(1)_INSTALL_TARGET)),true,false),
+	"install-staging": $(if $(subst NO,,$($(1)_INSTALL_STAGING)),true,false),
 	"downloads": [
 	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
 		{
-- 
2.17.1
