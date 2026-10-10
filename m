Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152D8CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEAC360A3B;
	Sat, 10 Oct 2026 09:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hj0BLBTy9llp; Sat, 10 Oct 2026 09:42:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D12AD608E3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791625354;
	b=oXPFUzg4ehBnhNl1X+hUCIkrQIpDpGgJU9nXSiYVqms25i6esu7ycpc2WBvoK/ISORe2
	 DB0nZllDdWiDSenIWCo3J9/LMJ80IWHHfAxSrFlxxtssTiOeAZ5B6nDqHGyEugFnhLQ14
	 Mcp5ZOIQik51jH/AixJzeqnQhN23RqefKHpQE6zE6Duh6sTSJDgi4l2Kj0XF+xaY+pBkc
	 v/9Ev+uePwVRHU1LwWpVag4phFVQ8GBZ0xxTngkvsObks4xzZ+56tSB/++9J7jHCokwmw
	 oc8bo5m6L80eGcioMvsJBlVFsQB0IHidUqN8/+zdsnq2oH7n0EHQ1f2M15vQAV9lmkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791625354;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=geF6kId/y1K+hjU6y/OfyTf8AsfIRwgUR8BN/qoIWaU=;
	b=ed8/Gdfjr6/cPAYCzYcEPFJJkC73VEZ1+xrSZzbtYh1EHdAH0uOOw5VXM6bx8M74ZQtb
	 S/U3zvSTfRo9ECOkVcRBUas5TkGtEfd5mhHbEeMBIbvH2DKwnLgCztTAuO034puts3hOH
	 bn7efsZar+XvMAmCYMHr7rC6P22e+Nw/YJbSDdRQN6gyjseamQcl9paF15ViH8zD3FNyl
	 NTwtpSzALJLlOwi1JfBjM62J9TUgxJN4wrgF37PbNsGWf4SxObq0CGC6kemy1Tkl49Yub
	 RJNA+d4VsZ+Gjc12R8jJxmTlPIvavPxNB84Q7Qc9WDg9G9lRfKSzyzfe5yZDBqpQZgg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791625354;
	bh=geF6kId/y1K+hjU6y/OfyTf8AsfIRwgUR8BN/qoIWaU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=babmzMGMk4X7/PO6nw5PD8KXSW7z7jEqh356aVfPOTfGVpybq042Li5IleSvwMw8I
	 heGgUS6gY70Z+1giRYNK6NDqDs1Xpd+Seq7jdczSKnp0hO2W8fBNwCrffdKKqPkshm
	 JO0qBBNLMDdrFUEwIqwF14XrbRMYnuaZyceaAsuOikByAD85D8U3FPikcrluCbVa+y
	 a/4a6wOG4NeRywuUiZthOj5tCPK6ZHw/nsKkl7bKpfNVCtiGcmIMC38jd30mJV9Jgz
	 p/zZ8HF4dYqxRTXEHxIM/cZ0MXAVwFeuEWMl2UADNvMQgnbpOBm2eLaZyoPg13eQWo
	 07GMe/GfiMRCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D12AD608E3;
	Sat, 10 Oct 2026 09:42:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 20EEB1DE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 127B4400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1oYIXc4pkMOk for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:42:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 592FE40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791625352;
 b=IACIAMCFzxr9Tkr3LXaxEtQfbdbMxF/bHfUxRMLOYJx8viy7ttTZgbDRzrMsUBSutlD0
 xKHlXPxN7vLWjR5fISxICQSPgh3ukqLAufod/OwyGCpzvP8BLF7RB9IyW5fk+n2wcK6Bu
 RgVmd83J6bCA/Q1cVLw5psSMyCAJ8ynT3TCMr2nK9AtZ9WFHu4VK+5bLRXZIfotD3Z2tt
 06/eLkuIF7yKGnnNoGgydzSChDBG2+KibQ6mmWAKh92FN7Mlokq+78IIrNcgwPheqMXtN
 qeWnwSNTJRLKHRuBt9MA9qoNt/SPRVP6aIKT94BGCAQdgEoY2YcfCR7kpC/hyjKdq5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791625352;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FE+owIcy7mYiGaYCqUcixChXhCe1FYY1HO9NtzMdgtY=;
 b=aYoolMrfwSvIH45WCGmP4E9r3yh4WNzjGQaRi2BOzhs7Ac6YCXXuxepgQIv6VpkZNNcm
 jIDqz1Yezm9kLXz0f8fswCHMQWLVhvx4SykXiNNQvx6QNZW1Kt+stUqlWCMvU95tN2PQj
 zsRnEiHAjHyJKidCSYAIM8SLbi+P+MzZcTj2NM2bqTOdZX5NnmkCkeRjq20SHsSi1neEy
 diEmZrnBBxpZGFqqZ0a/uJbIRZIE+T4ErDsJhYD9+44XEyBXrb4Q/L8mvRGTn4X53jMcC
 Lned4qdTfGe5NjLyEr/QNtA2AVahF7uoPcpMX7dcfFoBTQZF/IcFtkhGHLQkYdXVxug==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 592FE40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 385B58FC3A; Sat, 10 Oct 2026 09:41:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:41:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db2f1fcc43e31e7a2cbbfb934b730f87bd0738c0
X-Git-Newrev: aac023e8eab14f72df75a4b5513927e76040b182
X-Patchwork-Hint: ignore
Message-Id: <20261010094114.385B58FC3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: fix build with OpenSSL 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8494544293078714272=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8494544293078714272==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aac023e8eab14f72df75a4b5513927e76040b182
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Andrey Yurovsky <yurovsky@gmail.com>
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...se-ASN1_STRING_get0_data-and-ASN1_STRING_.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/rauc/0001-signature-use-ASN1_STRING_get0_data-and-ASN1_STRING_.patch b/package/rauc/0001-signature-use-ASN1_STRING_get0_data-and-ASN1_STRING_.patch
new file mode 100644
index 0000000000..ba8032c6e7
--- /dev/null
+++ b/package/rauc/0001-signature-use-ASN1_STRING_get0_data-and-ASN1_STRING_.patch
@@ -0,0 +1,48 @@
+From 101aacaf82d250bfb8e581e002b2c380869080ef Mon Sep 17 00:00:00 2001
+From: Bruno Thomsen <bruno.thomsen@gmail.com>
+Date: Sat, 11 Apr 2026 17:06:10 +0200
+Subject: [PATCH] signature: use ASN1_STRING_get0_data and ASN1_STRING_length
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Use ASN1_STRING_get0_data() and ASN1_STRING_length() functions
+allow an ASN1_STRING structure to be manipulated. Avoid errors
+like this when compiling against OpenSSL 4.0:
+
+error: invalid use of incomplete typedef ‘ASN1_OCTET_STRING’ {aka ‘struct asn1_string_st’}
+
+Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
+
+Upstream: https://github.com/rauc/rauc/commit/101aacaf82d250bfb8e581e002b2c380869080ef
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/signature.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/signature.c b/src/signature.c
+index d2acac6b..91be7bb7 100644
+--- a/src/signature.c
++++ b/src/signature.c
+@@ -1344,7 +1344,7 @@ gboolean cms_get_unverified_manifest(GBytes *sig, GBytes **manifest, GError **er
+ 				"missing manifest in inline signature");
+ 		goto out;
+ 	}
+-	if (!(*content)->data || ((*content)->length <= 0)) {
++	if ((ASN1_STRING_get0_data(*content) == NULL) || (ASN1_STRING_length(*content) <= 0)) {
+ 		g_set_error(
+ 				error,
+ 				R_SIGNATURE_ERROR,
+@@ -1353,7 +1353,7 @@ gboolean cms_get_unverified_manifest(GBytes *sig, GBytes **manifest, GError **er
+ 		goto out;
+ 	}
+ 
+-	tmp = g_bytes_new((*content)->data, (*content)->length);
++	tmp = g_bytes_new(ASN1_STRING_get0_data(*content), ASN1_STRING_length(*content));
+ 	if (!tmp) {
+ 		g_set_error_literal(
+ 				error,
+-- 
+2.47.3
+

--===============8494544293078714272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8494544293078714272==--
