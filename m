From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 20 Dec 2018 22:22:21 -0200
Subject: [Buildroot] [PATCH v2 2/2] [RFC] package/pkg-waf.mk: mimic
 selection of host-waf
In-Reply-To: <20181221002221.16024-1-casantos@datacom.com.br>
References: <20181221002221.16024-1-casantos@datacom.com.br>
Message-ID: <20181221002221.16024-2-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since host-waf's Config.in.host is blind, it is not possible to select
it in the configuration menu. There are two possible solutions for this
problem:

- Add "select BR2_PACKAGE_HOST_WAF" to package/mpv/Config.in (currently
  only mpv requires host-waf). Also, document that BR2_PACKAGE_HOST_WAF
  must be selected when <PKG>_NEEDS_EXTERNAL_WAF is YES.

- Set BR2_PACKAGE_HOST_WAF to 'y' in the waf-package macro. This one is
  simpler because it does not require changing anything else.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/pkg-waf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index 3288dd63a0..fe5995250c 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -43,6 +43,7 @@ $(2)_NEEDS_EXTERNAL_WAF ?= NO
 
 # If the package does not have its own waf, use our own.
 ifeq ($$($(2)_NEEDS_EXTERNAL_WAF),YES)
+BR2_PACKAGE_HOST_WAF = y
 $(2)_DEPENDENCIES += host-waf
 $(2)_WAF = $$(HOST_DIR)/bin/waf
 else
-- 
2.19.2
