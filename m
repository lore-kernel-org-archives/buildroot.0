Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2632CD343B
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 16:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A92A240F57;
	Wed,  6 May 2026 16:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bpvMDDEyhjj; Wed,  6 May 2026 16:35:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2853940F51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778085303;
	bh=g/fq65/vLVczDRFLle51R0yTvmRBnt/CHg5YSnyw//I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eknKFfJ0EnKNscCPg3RPgHYr4vcpqsZfAaRfvD95hHXPukjiS+lCfklrMcxSSC1Xa
	 6q1+e6DeBE3ejFA07J0ka45Ri7c9fv2pbwKXBy4NaY6MGT4S9xlubavN8fulMS+nC8
	 cYXtjY/eY1/Gh9dUkNSkPyPae3HbvE85dQPGGb4/tntkY8Z4AEBpGc1By8GJWlh3cQ
	 X0TZVQonjDOvBaTlRYLULGaJpMbECGqKXQb5vwel+VPsl0qZnl2cHprCzeoP1lhKw7
	 RrGFKlHUpI/zR0RvfzLrzkRlAnaFNXOvREQAODoyNO4S0mJSdMS8eUp8nQiRaGgAbl
	 dO4PT5X0rIXaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2853940F51;
	Wed,  6 May 2026 16:35:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F3F1317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7550040F51
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smkMOmT6CMn2 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 16:35:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6939140F4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6939140F4F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6939140F4F
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:35:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9C26CA4C20E0;
 Wed,  6 May 2026 18:31:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51906)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKf9y-000000002XI-1wpA;
 Wed, 06 May 2026 16:31:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 18:31:28 +0200
Message-ID: <20260506163136.1330722-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506163136.1330722-1-bernd@kuhls.net>
References: <20260506163136.1330722-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778085116;
 bh=VMedpVoKaBKe5rGfcENCHg2AX16T5lnQR+HFOGMLgDg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CrpaOmlPISq9w1WV5jGpwjOfDmaFrlaD6kedPDRHkmt8J33ymGc5KU+aPgUfg3AM7
 HM4pNdQMciAjstPlUQ/bcjBXJn7HALMCxpv6YaGJeDczeYLBxMKIuno3nQ4Pxzw7UN
 /BKb9czLX8Lur+blXVaaQbVQLlbQmp7sZfslKl2diOnE3lMGmHBLFauRz+3/NdXOgD
 DfXoqbZQuRRCKHi9JK4TixCvi0zmgT+iIYpjatqNElyyPoMhF/UvDIxzPdgcHmIuzk
 WvhBvZNqKbxU92nUfH9vBPstaUAg6efLLheX5EgTWhz5GsY4yiIhGBzppktcLgJgoG
 9JPWeVq6D9wGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=CrpaOmlP
Subject: [Buildroot] [PATCH v5 15/22] package/binutils: add build fixes for
 gcc 16.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport patch from binutils 2.46 to fix build errors with gcc 16.x on
or1k.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...Mark-undefined-TLS-symbol-as-STT_TLS.patch | 61 +++++++++++++++++++
 ...Mark-undefined-TLS-symbol-as-STT_TLS.patch | 61 +++++++++++++++++++
 2 files changed, 122 insertions(+)
 create mode 100644 package/binutils/2.44/0004-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch
 create mode 100644 package/binutils/2.45.1/0003-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch

diff --git a/package/binutils/2.44/0004-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch b/package/binutils/2.44/0004-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch
new file mode 100644
index 0000000000..f4121ee80f
--- /dev/null
+++ b/package/binutils/2.44/0004-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch
@@ -0,0 +1,61 @@
+From d320649e1805e5330a09b103d4ca890a12815f56 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 18 Nov 2025 12:09:54 +0800
+Subject: [PATCH] or1k: Mark undefined TLS symbol as STT_TLS
+
+Update or1k_apply_fix to handle all TLS relocations.
+
+	PR gas/33426
+	* config/tc-or1k.c (or1k_apply_fix): Handle all TLS relocations.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d320649e1805e5330a09b103d4ca890a12815f56
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gas/config/tc-or1k.c | 18 ++++++++++++------
+ 1 file changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/gas/config/tc-or1k.c b/gas/config/tc-or1k.c
+index f5a20b94fa7..798cf6d6acc 100644
+--- a/gas/config/tc-or1k.c
++++ b/gas/config/tc-or1k.c
+@@ -354,22 +354,28 @@ or1k_apply_fix (struct fix *f, valueT *t, segT s)
+ 
+   switch (f->fx_r_type)
+     {
++    case BFD_RELOC_OR1K_TLS_DTPMOD:
++    case BFD_RELOC_OR1K_TLS_DTPOFF:
+     case BFD_RELOC_OR1K_TLS_GD_HI16:
++    case BFD_RELOC_OR1K_TLS_GD_LO13:
+     case BFD_RELOC_OR1K_TLS_GD_LO16:
+     case BFD_RELOC_OR1K_TLS_GD_PG21:
+-    case BFD_RELOC_OR1K_TLS_GD_LO13:
++    case BFD_RELOC_OR1K_TLS_IE_AHI16:
++    case BFD_RELOC_OR1K_TLS_IE_HI16:
++    case BFD_RELOC_OR1K_TLS_IE_LO13:
++    case BFD_RELOC_OR1K_TLS_IE_LO16:
++    case BFD_RELOC_OR1K_TLS_IE_PG21:
+     case BFD_RELOC_OR1K_TLS_LDM_HI16:
++    case BFD_RELOC_OR1K_TLS_LDM_LO13:
+     case BFD_RELOC_OR1K_TLS_LDM_LO16:
+     case BFD_RELOC_OR1K_TLS_LDM_PG21:
+-    case BFD_RELOC_OR1K_TLS_LDM_LO13:
+     case BFD_RELOC_OR1K_TLS_LDO_HI16:
+     case BFD_RELOC_OR1K_TLS_LDO_LO16:
+-    case BFD_RELOC_OR1K_TLS_IE_HI16:
+-    case BFD_RELOC_OR1K_TLS_IE_LO16:
+-    case BFD_RELOC_OR1K_TLS_IE_PG21:
+-    case BFD_RELOC_OR1K_TLS_IE_LO13:
++    case BFD_RELOC_OR1K_TLS_LE_AHI16:
+     case BFD_RELOC_OR1K_TLS_LE_HI16:
+     case BFD_RELOC_OR1K_TLS_LE_LO16:
++    case BFD_RELOC_OR1K_TLS_LE_SLO16:
++    case BFD_RELOC_OR1K_TLS_TPOFF:
+       S_SET_THREAD_LOCAL (f->fx_addsy);
+       break;
+     default:
+-- 
+2.43.7
+
diff --git a/package/binutils/2.45.1/0003-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch b/package/binutils/2.45.1/0003-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch
new file mode 100644
index 0000000000..f4121ee80f
--- /dev/null
+++ b/package/binutils/2.45.1/0003-or1k-Mark-undefined-TLS-symbol-as-STT_TLS.patch
@@ -0,0 +1,61 @@
+From d320649e1805e5330a09b103d4ca890a12815f56 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 18 Nov 2025 12:09:54 +0800
+Subject: [PATCH] or1k: Mark undefined TLS symbol as STT_TLS
+
+Update or1k_apply_fix to handle all TLS relocations.
+
+	PR gas/33426
+	* config/tc-or1k.c (or1k_apply_fix): Handle all TLS relocations.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d320649e1805e5330a09b103d4ca890a12815f56
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gas/config/tc-or1k.c | 18 ++++++++++++------
+ 1 file changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/gas/config/tc-or1k.c b/gas/config/tc-or1k.c
+index f5a20b94fa7..798cf6d6acc 100644
+--- a/gas/config/tc-or1k.c
++++ b/gas/config/tc-or1k.c
+@@ -354,22 +354,28 @@ or1k_apply_fix (struct fix *f, valueT *t, segT s)
+ 
+   switch (f->fx_r_type)
+     {
++    case BFD_RELOC_OR1K_TLS_DTPMOD:
++    case BFD_RELOC_OR1K_TLS_DTPOFF:
+     case BFD_RELOC_OR1K_TLS_GD_HI16:
++    case BFD_RELOC_OR1K_TLS_GD_LO13:
+     case BFD_RELOC_OR1K_TLS_GD_LO16:
+     case BFD_RELOC_OR1K_TLS_GD_PG21:
+-    case BFD_RELOC_OR1K_TLS_GD_LO13:
++    case BFD_RELOC_OR1K_TLS_IE_AHI16:
++    case BFD_RELOC_OR1K_TLS_IE_HI16:
++    case BFD_RELOC_OR1K_TLS_IE_LO13:
++    case BFD_RELOC_OR1K_TLS_IE_LO16:
++    case BFD_RELOC_OR1K_TLS_IE_PG21:
+     case BFD_RELOC_OR1K_TLS_LDM_HI16:
++    case BFD_RELOC_OR1K_TLS_LDM_LO13:
+     case BFD_RELOC_OR1K_TLS_LDM_LO16:
+     case BFD_RELOC_OR1K_TLS_LDM_PG21:
+-    case BFD_RELOC_OR1K_TLS_LDM_LO13:
+     case BFD_RELOC_OR1K_TLS_LDO_HI16:
+     case BFD_RELOC_OR1K_TLS_LDO_LO16:
+-    case BFD_RELOC_OR1K_TLS_IE_HI16:
+-    case BFD_RELOC_OR1K_TLS_IE_LO16:
+-    case BFD_RELOC_OR1K_TLS_IE_PG21:
+-    case BFD_RELOC_OR1K_TLS_IE_LO13:
++    case BFD_RELOC_OR1K_TLS_LE_AHI16:
+     case BFD_RELOC_OR1K_TLS_LE_HI16:
+     case BFD_RELOC_OR1K_TLS_LE_LO16:
++    case BFD_RELOC_OR1K_TLS_LE_SLO16:
++    case BFD_RELOC_OR1K_TLS_TPOFF:
+       S_SET_THREAD_LOCAL (f->fx_addsy);
+       break;
+     default:
+-- 
+2.43.7
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
