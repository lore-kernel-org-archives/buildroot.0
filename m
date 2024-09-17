Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A8BCAC597
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 19:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B23F46110C;
	Tue, 17 Sep 2024 19:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rs87J964vv0K; Tue, 17 Sep 2024 19:18:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CC7C6112F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CC7C6112F;
	Tue, 17 Sep 2024 19:18:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFD5F1BF966
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 19:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE3FA6110C
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 19:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rjYVq5HaG7l for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 19:18:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.46;
 helo=mail-wm1-f46.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D90F66078E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D90F66078E
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D90F66078E
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 19:18:06 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso62930915e9.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 12:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726600684; x=1727205484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4PyLRBbLuaiQHmLMm7r8KeJtCukrYYrCBCAXRMKGqq8=;
 b=uamLx6vmZK71rJ5HQueuZld5m0aSsmvtQqZ6UBo6tkKbj7erRxOoPt1Myx0vdRYC/A
 JzKicAJNPknhbziuj5LaVAX0bQxLeG0OTkk671GmjIYQavlZVxQUaAMz4FqdSmdaTnEv
 FWGia43Q/qm3uAoupjBMBOQw2yAisMN79pflV4b2yDQutw0uYYRITQQJsWCMtEg2tgMI
 E77kOUnCSusQrGdui/6bdnJhkzTGB4DhihV+tEkym8JXFlEtUEBN60giesialrDrg61M
 med47fvGKni8FskzaQO+tvjqaeh78nOAInEKDEDUeFbTvBTz7i5wdq86KRWaabMkDYKB
 vAUw==
X-Gm-Message-State: AOJu0YzdGZVx+G2EFahqUv1s/5zMLmmipEMHQxT2lm1g6E5jIDTN+Wtk
 zRJrVw1PlcXVcybs1L6i2aIzBPvdMYGEKo1SG/BpmDetK5bvlYnsGkJNKjTR
X-Google-Smtp-Source: AGHT+IFSJ6SYj/u8enZDbuBSKLSr3s19iAwTUBZbAJVjj4/Oae3xrRTq9t0q/I2G+SPu1eDx9Jz+zw==
X-Received: by 2002:a05:600c:4f41:b0:42c:b950:6821 with SMTP id
 5b1f17b1804b1-42d90829e60mr146745615e9.19.1726600683946; 
 Tue, 17 Sep 2024 12:18:03 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:2841:ccc:4e90:c28])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da22d85f2sm111111615e9.17.2024.09.17.12.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 12:18:03 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 21:18:01 +0200
Message-ID: <20240917191801.828015-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240829131232.2132854-3-thomas@devoogdt.com>
References: <20240829131232.2132854-3-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2] package/libgtk4: fix compile error if cairo
 zlib is not enabled
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds some patches to avoid the need for cairo zlib.
Otherwise, this error occurs at build time:

../gtk/gtkprintoperation.c:26:10: fatal error: cairo-pdf.h: No such file or directory

Note that libpng has to be selected since cairo only selects it if zlib support is enabled.

Upstream issue: https://gitlab.gnome.org/GNOME/gtk/-/issues/5072.
Upstream fix: https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/7717.

These patches have been needed since the introduction of libgtk4,
libgtk3 was a bit different since buildroot selected the required
cairo-{ps,pdf,svg} since the introduction of that package.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: replace the BR2_PACKAGE_CAIRO_ZLIB selection with some patches that avoid the need for it
---
 ...ntoperation-unix-portal-.c-add-CAIRO.patch | 198 ++++++++++++++++
 ...kends-gtkprintbackendfile.c-add-CAIR.patch | 219 ++++++++++++++++++
 ...ndernodeparser.c-add-CAIRO_HAS-check.patch |  31 +++
 package/libgtk4/Config.in                     |   1 +
 package/libgtk4/libgtk4.mk                    |   1 +
 5 files changed, 450 insertions(+)
 create mode 100644 package/libgtk4/0001-gtk-print-gtkprintoperation-unix-portal-.c-add-CAIRO.patch
 create mode 100644 package/libgtk4/0002-modules-printbackends-gtkprintbackendfile.c-add-CAIR.patch
 create mode 100644 package/libgtk4/0003-gsk-gskrendernodeparser.c-add-CAIRO_HAS-check.patch

diff --git a/package/libgtk4/0001-gtk-print-gtkprintoperation-unix-portal-.c-add-CAIRO.patch b/package/libgtk4/0001-gtk-print-gtkprintoperation-unix-portal-.c-add-CAIRO.patch
new file mode 100644
index 0000000000..70622b6412
--- /dev/null
+++ b/package/libgtk4/0001-gtk-print-gtkprintoperation-unix-portal-.c-add-CAIRO.patch
@@ -0,0 +1,198 @@
+From 44c2d24ea45d3014458e7d4f77fb6332b9746436 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 15 Sep 2024 19:50:51 +0200
+Subject: [PATCH] gtk/print/gtkprintoperation{,-unix,-portal}.c: add CAIRO_HAS
+ checks
+
+This is similar to the checks in tools/gtk-rendernode-tool-render.c.
+
+resolves #5072
+
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+(cherry picked from commit ffc8f34dfd560f36659aa1d5b5684fa97c4f4ebc)
+Upstream: https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/7717
+---
+ gtk/print/gtkprintoperation-portal.c |  9 +++++++++
+ gtk/print/gtkprintoperation-unix.c   | 17 +++++++++++++++++
+ gtk/print/gtkprintoperation.c        | 10 +++++++++-
+ 3 files changed, 35 insertions(+), 1 deletion(-)
+
+diff --git a/gtk/print/gtkprintoperation-portal.c b/gtk/print/gtkprintoperation-portal.c
+index afc276067b..3b91bf0830 100644
+--- a/gtk/print/gtkprintoperation-portal.c
++++ b/gtk/print/gtkprintoperation-portal.c
+@@ -24,8 +24,13 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ 
++#include <cairo.h>
++#ifdef CAIRO_HAS_PDF_SURFACE
+ #include <cairo-pdf.h>
++#endif
++#ifdef CAIRO_HAS_PS_SURFACE
+ #include <cairo-ps.h>
++#endif
+ 
+ #include <gio/gunixfdlist.h>
+ 
+@@ -147,6 +152,7 @@ portal_start_page (GtkPrintOperation *op,
+     {
+       if (type == CAIRO_SURFACE_TYPE_PS)
+         {
++#ifdef CAIRO_HAS_PS_SURFACE
+           cairo_ps_surface_set_size (op_portal->surface, w, h);
+           cairo_ps_surface_dsc_begin_page_setup (op_portal->surface);
+           switch (gtk_page_setup_get_orientation (page_setup))
+@@ -164,15 +170,18 @@ portal_start_page (GtkPrintOperation *op,
+               default:
+                 break;
+             }
++#endif
+          }
+       else if (type == CAIRO_SURFACE_TYPE_PDF)
+         {
++#ifdef CAIRO_HAS_PDF_SURFACE
+           if (!op->priv->manual_orientation)
+             {
+               w = gtk_page_setup_get_paper_width (page_setup, GTK_UNIT_POINTS);
+               h = gtk_page_setup_get_paper_height (page_setup, GTK_UNIT_POINTS);
+             }
+           cairo_pdf_surface_set_size (op_portal->surface, w, h);
++#endif
+         }
+     }
+ }
+diff --git a/gtk/print/gtkprintoperation-unix.c b/gtk/print/gtkprintoperation-unix.c
+index cf52c56463..b61b9f5fd9 100644
+--- a/gtk/print/gtkprintoperation-unix.c
++++ b/gtk/print/gtkprintoperation-unix.c
+@@ -36,8 +36,13 @@
+ #include "gtkprintoperation-private.h"
+ #include "gtkprintoperation-portal.h"
+ 
++#include <cairo.h>
++#ifdef CAIRO_HAS_PDF_SURFACE
+ #include <cairo-pdf.h>
++#endif
++#ifdef CAIRO_HAS_PS_SURFACE
+ #include <cairo-ps.h>
++#endif
+ #include "gtkprintunixdialog.h"
+ #include "gtkpagesetupunixdialog.h"
+ #include "gtkprintbackendprivate.h"
+@@ -90,6 +95,7 @@ unix_start_page (GtkPrintOperation *op,
+     {
+       if (type == CAIRO_SURFACE_TYPE_PS)
+         {
++#ifdef CAIRO_HAS_PS_SURFACE
+           cairo_ps_surface_set_size (op_unix->surface, w, h);
+           cairo_ps_surface_dsc_begin_page_setup (op_unix->surface);
+           switch (gtk_page_setup_get_orientation (page_setup))
+@@ -106,15 +112,18 @@ unix_start_page (GtkPrintOperation *op,
+               default:
+                 break;
+             }
++#endif
+          }
+       else if (type == CAIRO_SURFACE_TYPE_PDF)
+         {
++#ifdef CAIRO_HAS_PDF_SURFACE
+           if (!op->priv->manual_orientation)
+             {
+               w = gtk_page_setup_get_paper_width (page_setup, GTK_UNIT_POINTS);
+               h = gtk_page_setup_get_paper_height (page_setup, GTK_UNIT_POINTS);
+             }
+           cairo_pdf_surface_set_size (op_unix->surface, w, h);
++#endif
+         }
+     }
+ }
+@@ -746,6 +755,7 @@ gtk_print_operation_unix_run_dialog_async (GtkPrintOperation          *op,
+     }
+ }
+ 
++#ifdef CAIRO_HAS_PDF_SURFACE
+ static cairo_status_t
+ write_preview (void                *closure,
+                const unsigned char *data,
+@@ -817,6 +827,7 @@ gtk_print_operation_unix_create_preview_surface (GtkPrintOperation *op,
+ 
+   return surface;
+ }
++#endif
+ 
+ static void
+ gtk_print_operation_unix_preview_start_page (GtkPrintOperation *op,
+@@ -838,11 +849,13 @@ gtk_print_operation_unix_resize_preview_surface (GtkPrintOperation *op,
+                                                  GtkPageSetup      *page_setup,
+                                                  cairo_surface_t   *surface)
+ {
++#ifdef CAIRO_HAS_PDF_SURFACE
+   double w, h;
+ 
+   w = gtk_page_setup_get_paper_width (page_setup, GTK_UNIT_POINTS);
+   h = gtk_page_setup_get_paper_height (page_setup, GTK_UNIT_POINTS);
+   cairo_pdf_surface_set_size (surface, w, h);
++#endif
+ }
+ 
+ static GtkPrintOperationResult
+@@ -1292,7 +1305,11 @@ _gtk_print_operation_platform_backend_create_preview_surface (GtkPrintOperation
+ 							      double            *dpi_y,
+ 							      char             **target)
+ {
++#ifdef CAIRO_HAS_PDF_SURFACE
+   return gtk_print_operation_unix_create_preview_surface (op, page_setup, dpi_x, dpi_y, target);
++#else
++  return NULL;
++#endif
+ }
+ 
+ void
+diff --git a/gtk/print/gtkprintoperation.c b/gtk/print/gtkprintoperation.c
+index 8aa8976a10..bacd7b21ed 100644
+--- a/gtk/print/gtkprintoperation.c
++++ b/gtk/print/gtkprintoperation.c
+@@ -23,7 +23,10 @@
+ #include <math.h>
+ #include <string.h>
+ 
++#include <cairo.h>
++#ifdef CAIRO_HAS_PDF_SURFACE
+ #include <cairo-pdf.h>
++#endif
+ 
+ #include <glib/gi18n-lib.h>
+ #include "gtkmarshalers.h"
+@@ -1953,6 +1956,7 @@ create_page_setup (GtkPrintOperation *op)
+   return page_setup;
+ }
+ 
++#ifdef CAIRO_HAS_PDF_SURFACE
+ static void 
+ pdf_start_page (GtkPrintOperation *op,
+ 		GtkPrintContext   *print_context,
+@@ -2063,7 +2067,7 @@ run_pdf (GtkPrintOperation  *op,
+   
+   return GTK_PRINT_OPERATION_RESULT_APPLY; 
+ }
+-
++#endif
+ 
+ static void
+ clamp_page_ranges (PrintPagesData *data)
+@@ -3096,7 +3100,11 @@ gtk_print_operation_run (GtkPrintOperation        *op,
+        */
+       priv->is_sync = TRUE;
+       g_return_val_if_fail (priv->export_filename != NULL, GTK_PRINT_OPERATION_RESULT_ERROR);
++#ifdef CAIRO_HAS_PDF_SURFACE
+       result = run_pdf (op, parent, &do_print);
++#else
++      result = GTK_PRINT_OPERATION_RESULT_ERROR;
++#endif
+     }
+   else if (action == GTK_PRINT_OPERATION_ACTION_PREVIEW)
+     {
+-- 
+2.43.0
+
diff --git a/package/libgtk4/0002-modules-printbackends-gtkprintbackendfile.c-add-CAIR.patch b/package/libgtk4/0002-modules-printbackends-gtkprintbackendfile.c-add-CAIR.patch
new file mode 100644
index 0000000000..7d583f564b
--- /dev/null
+++ b/package/libgtk4/0002-modules-printbackends-gtkprintbackendfile.c-add-CAIR.patch
@@ -0,0 +1,219 @@
+From 50962fdeba34a38ce20895623041dda88f231ad2 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 15 Sep 2024 19:52:48 +0200
+Subject: [PATCH] modules/printbackends/gtkprintbackendfile.c: add CAIRO_HAS
+ checks
+
+This is similar to the checks in tools/gtk-rendernode-tool-render.c.
+
+resolves #5072
+
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+(cherry picked from commit 9f855eecb11924e78350fcfd1e8b4ecfddf490d4)
+Upstream: https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/7717
+---
+ modules/printbackends/gtkprintbackendfile.c | 55 +++++++++++++++++++++
+ 1 file changed, 55 insertions(+)
+
+diff --git a/modules/printbackends/gtkprintbackendfile.c b/modules/printbackends/gtkprintbackendfile.c
+index eb0b00ce3b..ddfd8d4425 100644
+--- a/modules/printbackends/gtkprintbackendfile.c
++++ b/modules/printbackends/gtkprintbackendfile.c
+@@ -27,10 +27,17 @@
+ #include <string.h>
+ 
+ #include <errno.h>
++
+ #include <cairo.h>
++#ifdef CAIRO_HAS_PDF_SURFACE
+ #include <cairo-pdf.h>
++#endif
++#ifdef CAIRO_HAS_PS_SURFACE
+ #include <cairo-ps.h>
++#endif
++#ifdef CAIRO_HAS_SVG_SURFACE
+ #include <cairo-svg.h>
++#endif
+ 
+ #include <glib/gi18n-lib.h>
+ 
+@@ -60,17 +67,29 @@ struct _GtkPrintBackendFile
+ 
+ typedef enum
+ {
++#ifdef CAIRO_HAS_PDF_SURFACE
+   FORMAT_PDF,
++#endif
++#ifdef CAIRO_HAS_PS_SURFACE
+   FORMAT_PS,
++#endif
++#ifdef CAIRO_HAS_SVG_SURFACE
+   FORMAT_SVG,
++#endif
+   N_FORMATS
+ } OutputFormat;
+ 
+ static const char * formats[N_FORMATS] =
+ {
++#ifdef CAIRO_HAS_PDF_SURFACE
+   "pdf",
++#endif
++#ifdef CAIRO_HAS_PS_SURFACE
+   "ps",
++#endif
++#ifdef CAIRO_HAS_SVG_SURFACE
+   "svg"
++#endif
+ };
+ 
+ static GObjectClass *backend_parent_class;
+@@ -220,15 +239,21 @@ output_file_from_settings (GtkPrintSettings *settings,
+             {
+               default:
+               case N_FORMATS:
++#ifdef CAIRO_HAS_PDF_SURFACE
+               case FORMAT_PDF:
+                 extension = "pdf";
+                 break;
++#endif
++#ifdef CAIRO_HAS_PS_SURFACE
+               case FORMAT_PS:
+                 extension = "ps";
+                 break;
++#endif
++#ifdef CAIRO_HAS_SVG_SURFACE
+               case FORMAT_SVG:
+                 extension = "svg";
+                 break;
++#endif
+             }
+         }
+ 
+@@ -325,8 +350,10 @@ file_printer_create_cairo_surface (GtkPrinter       *printer,
+ {
+   cairo_surface_t *surface;
+   OutputFormat format;
++#ifdef CAIRO_HAS_SVG_SURFACE
+   const cairo_svg_version_t *versions;
+   int num_versions = 0;
++#endif
+ 
+   format = format_from_settings (settings);
+ 
+@@ -334,18 +361,24 @@ file_printer_create_cairo_surface (GtkPrinter       *printer,
+     {
+       default:
+       case N_FORMATS:
++#ifdef CAIRO_HAS_PDF_SURFACE
+       case FORMAT_PDF:
+         surface = cairo_pdf_surface_create_for_stream (_cairo_write, cache_io, width, height);
+         break;
++#endif
++#ifdef CAIRO_HAS_PS_SURFACE
+       case FORMAT_PS:
+         surface = cairo_ps_surface_create_for_stream (_cairo_write, cache_io, width, height);
+         break;
++#endif
++#ifdef CAIRO_HAS_SVG_SURFACE
+       case FORMAT_SVG:
+         surface = cairo_svg_surface_create_for_stream (_cairo_write, cache_io, width, height);
+         cairo_svg_get_versions (&versions, &num_versions);
+         if (num_versions > 0)
+           cairo_svg_surface_restrict_to_version (surface, versions[num_versions - 1]);
+         break;
++#endif
+     }
+ 
+   cairo_surface_set_fallback_resolution (surface,
+@@ -550,15 +583,21 @@ set_printer_format_from_option_set (GtkPrinter          *printer,
+ 
+ 	  switch (i)
+ 	    {
++#ifdef CAIRO_HAS_PDF_SURFACE
+ 	      case FORMAT_PDF:
+ 		gtk_printer_set_accepts_pdf (printer, TRUE);
+ 		gtk_printer_set_accepts_ps (printer, FALSE);
+ 		break;
++#endif
++#ifdef CAIRO_HAS_PS_SURFACE
+ 	      case FORMAT_PS:
+ 		gtk_printer_set_accepts_pdf (printer, FALSE);
+ 		gtk_printer_set_accepts_ps (printer, TRUE);
+ 		break;
++#endif
++#ifdef CAIRO_HAS_SVG_SURFACE
+ 	      case FORMAT_SVG:
++#endif
+ 	      default:
+ 		gtk_printer_set_accepts_pdf (printer, FALSE);
+ 		gtk_printer_set_accepts_ps (printer, FALSE);
+@@ -660,6 +699,7 @@ file_printer_get_options (GtkPrinter           *printer,
+ 
+   if (capabilities & (GTK_PRINT_CAPABILITY_GENERATE_PDF | GTK_PRINT_CAPABILITY_GENERATE_PS))
+     {
++#ifdef CAIRO_HAS_PDF_SURFACE
+       if (capabilities & GTK_PRINT_CAPABILITY_GENERATE_PDF)
+         {
+ 	  if (format == FORMAT_PDF || format == N_FORMATS)
+@@ -671,6 +711,8 @@ file_printer_get_options (GtkPrinter           *printer,
+ 	  display_format_names[n_formats] = _(format_names[FORMAT_PDF]);
+ 	  n_formats++;
+ 	}
++#endif
++#ifdef CAIRO_HAS_PS_SURFACE
+       if (capabilities & GTK_PRINT_CAPABILITY_GENERATE_PS)
+         {
+ 	  if (format == FORMAT_PS || format == N_FORMATS)
+@@ -679,6 +721,7 @@ file_printer_get_options (GtkPrinter           *printer,
+           display_format_names[n_formats] = _(format_names[FORMAT_PS]);
+ 	  n_formats++;
+ 	}
++#endif
+     }
+   else
+     {
+@@ -686,15 +729,21 @@ file_printer_get_options (GtkPrinter           *printer,
+         {
+           default:
+           case N_FORMATS:
++#ifdef CAIRO_HAS_PDF_SURFACE
+           case FORMAT_PDF:
+             current_format = FORMAT_PDF;
+             break;
++#endif
++#ifdef CAIRO_HAS_PS_SURFACE
+           case FORMAT_PS:
+             current_format = FORMAT_PS;
+             break;
++#endif
++#ifdef CAIRO_HAS_SVG_SURFACE
+           case FORMAT_SVG:
+             current_format = FORMAT_SVG;            
+             break;
++#endif
+         }
+ 
+       for (n_formats = 0; n_formats < N_FORMATS; ++n_formats)
+@@ -802,13 +851,19 @@ file_printer_prepare_for_print (GtkPrinter       *printer,
+   format = format_from_settings (settings);
+   switch (format)
+     {
++#ifdef CAIRO_HAS_PDF_SURFACE
+       case FORMAT_PDF:
++#endif
+       case N_FORMATS:
+ 	gtk_print_job_set_rotate (print_job, FALSE);
+         break;
+       default:
++#ifdef CAIRO_HAS_PS_SURFACE
+       case FORMAT_PS:
++#endif
++#ifdef CAIRO_HAS_SVG_SURFACE
+       case FORMAT_SVG:
++#endif
+ 	gtk_print_job_set_rotate (print_job, TRUE);
+         break;
+     }
+-- 
+2.43.0
+
diff --git a/package/libgtk4/0003-gsk-gskrendernodeparser.c-add-CAIRO_HAS-check.patch b/package/libgtk4/0003-gsk-gskrendernodeparser.c-add-CAIRO_HAS-check.patch
new file mode 100644
index 0000000000..fb3ab3b9af
--- /dev/null
+++ b/package/libgtk4/0003-gsk-gskrendernodeparser.c-add-CAIRO_HAS-check.patch
@@ -0,0 +1,31 @@
+From 853e852d9f8de5c474c64a0f6b56924ccffe54a3 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 15 Sep 2024 20:51:20 +0200
+Subject: [PATCH] gsk/gskrendernodeparser.c: add CAIRO_HAS check
+
+resolves #5072
+
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+(cherry picked from commit 3610ac0fd1e6e17e280b17cde7d9b1c995ede351)
+Upstream: https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/7717
+---
+ gsk/gskrendernodeparser.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gsk/gskrendernodeparser.c b/gsk/gskrendernodeparser.c
+index 9f7602d98d..aa24163f23 100644
+--- a/gsk/gskrendernodeparser.c
++++ b/gsk/gskrendernodeparser.c
+@@ -4415,7 +4415,9 @@ render_node_print (Printer       *p,
+         if (surface != NULL)
+           {
+             array = g_byte_array_new ();
++#if CAIRO_HAS_PNG_FUNCTIONS
+             cairo_surface_write_to_png_stream (surface, cairo_write_array, array);
++#endif
+ 
+             _indent (p);
+             g_string_append (p->str, "pixels: url(\"data:image/png;base64,");
+-- 
+2.43.0
+
diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index 99553fc44e..2f597ea872 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -27,6 +27,7 @@ config BR2_PACKAGE_LIBGTK4
 	select BR2_PACKAGE_GRAPHENE
 	select BR2_PACKAGE_LIBEPOXY
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_TIFF
 	# At least one backend is required
diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index b00a2facad..2fba4e7610 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -21,6 +21,7 @@ LIBGTK4_DEPENDENCIES = \
 	graphene \
 	libepoxy \
 	libglib2 \
+	libpng \
 	pango \
 	$(TARGET_NLS_DEPENDENCIES)
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
