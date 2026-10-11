Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A354CA9ECC
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 20:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB41B6060B;
	Sun, 11 Oct 2026 20:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mQD3-OxXiRL; Sun, 11 Oct 2026 20:58:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D3B9A605F7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791752318;
	b=N/kMaqCguRNiDwwb3Jv2IIQv9pj3/U3V9zpmq6cckn880XjtAqZCtB2miTAG0PGeW3EK
	 ck5KCf88OZYOsjm4v5YdeiB03Ug2aGr+S5YXZlKPom91oPOWOW9UlLSZZs0Mwq//vo3Kw
	 9hsrxLuoF1VIgUDmY1P5T34PvkS5qPAjztpZCR+DCOAY0yd6DwUZ64Ltq0fhagzuVOZ9G
	 1xbRZ1DOJlqo1+hDkwVZcLK5KMmOVb3CiImIpbS9qjSO5VydhJv9cBAjW7MszHy2oQMDt
	 dAo2WK96L2+fOZxyWo3qK7wpTskSH7BF2evMOylh+BOQSRJi/5Fa7LyW8p/JreNHgJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791752318;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=L4NCZSn3LjCdIgc23jfkINWCAYsNwyTISvO2BXmjExM=;
	b=dDjyxY05LeHe+I8qeI5iej3U3N2FqDfZZxprlL2fvD0eYQNFj4WfzxOOT55DTpf/325J
	 ldvaWuroaoWtCl7tThpdgrzVUBMEGCisdl10+euW18Y2YroXxsx4LrmVMelB2bBD19Y6X
	 SG82EPYD4DVaF5PGSpOAyYfX5Gow+tCRjkyT1BCtdifwWefzO89RxePJOgxZugR/QDHTW
	 +zm7XHxaj2LzMNrWeQkzwOHlDJ374fXWBZ3+FgolsPwKfXPlFE3OS5e/LOi9RIAr7TxkB
	 diBeUOz05bLnTbNZAeCQyIOA9HRovl4i1ccA0vJV0XLtAjzQcxHOoFsdrkEv/dZeTjg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791752318;
	bh=L4NCZSn3LjCdIgc23jfkINWCAYsNwyTISvO2BXmjExM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G3hVv6vM5fkkBY2KiLLLpOnjjzhGryAgrMlMcWiikbK8W65/sPzPzQVy7lUe8lFIR
	 9fTlXC/tm9sj1Gsw9dVXR9GaOPkrvJbojcAI13HxH4ZWDCaez26SsVLxTQjXAUd3vl
	 PrnY9iL1NUymarpa4dZbjNO4ziBfFxO14fiyHH7KBnZi2hFR/i8z//EUm5mISOsk9z
	 nxDmdI6OsR7AXcr1FTYiv4aSmtzES/TiFkvVJmmnmg0WJe0iDTO7dUMgTiJPuL2ZrG
	 d/jOI3mA9hsF2fKpUh+ebZdCpMBBA2z0bhOQ69ADIjIHhd4noDIqz//a86Khj6HMvO
	 E+QHpe23eYpVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3B9A605F7;
	Sun, 11 Oct 2026 20:58:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 248A52E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12C64605EC
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umCfYXaKsAnD for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 20:58:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6BE3E605EB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791752314;
 b=c6a5RKzgLFClguvVksGDt7DMgPv+EGuzTrvd8T0f4fvn1zhG2bnAQKs2VZc+fCNm0bnB
 pmpL6w9yNARayMYcJeWBBmF/oEgiaL9hZpNp8RYHD6ElCPNXEwyo4jEj6s75zSPleivba
 tRKJcSs84JO+iG+7aVm5mVJhBYtRLe2tL+XrVf/t7ixwhPI+AVk6D4mGsNGbK1Gr5Hc6j
 hfJnJSgGdpDgFR9LhHFf74KyuR29MveC3EagabjoN98NwubVAbGSM+V3Yu/SuzshQT383
 L3yVI592UKZv1hWljU4I/N/wL11WTWzcsi9XQOpdDLn4CbACuK/BYE2FX5s/sIVNcVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791752314;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0s3LagJH9LztPq9mnoUZAToZ7SKUaMA3rhj5CYx/2Qc=;
 b=ChQJuNMt7ztNrpXZF+P321DmRxjj4lWsa4sCxtfw56DgPRteW5Fqwkp5U3amZZtFYOGS
 xzRAa9fnzCJXQyLPtNNEmlCizLPJwMwOgE23LRpGRo+NvlJC6whyG9fmdozm1a22qYXK0
 0+ecp7ycGrIr0a7mhyBOIxQc9EhVwmjFmoex6wsWyTTt9m4ot3vvTjr6eJ3qBCclcbIZx
 OR7SPePY8fmttJXAdX3fMizTIbH6x59zQW/FT3scHB0nWRGYH68+J+6yfR9e2P5OylWN3
 AiSh9hVZmGkqY0ugOiItQbWL9zJUL+0MG/1+OaDBddIoA02r3gUAMe58uwPdTiy+VEQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BE3E605EB
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:58:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7165D95247; Sun, 11 Oct 2026 20:57:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 22:51:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f43af4ef31cd40270c7db94b98c0ff9f212e6448
X-Git-Newrev: 7f665c89778550d659ddb7614eb5b791462cb904
X-Patchwork-Hint: ignore
Message-Id: <20261011205715.7165D95247@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: add
 'no-tls-deprecated-ec' configuration option
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2423130635775472046=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2423130635775472046==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7f665c89778550d659ddb7614eb5b791462cb904
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since OpenSSL 3.5, commit fed9be39ffec ("Make RFC8422 deprecated TLS EC
curves disablable"), OpenSSL has the option to disable support
for legacy TLS EC groups that were deprecated in RFC8422.

In OpenSSL 4.0, the option will be removed again and instead there will
be an option to _enable_ the legacy curves.

Add a Kconfig option to enable the deprecated curves. Use positive logic
already, i.e. the Kconfig option enables them.

Signed-off-by: Konrad Vité <konrad.vite@cherry.de>
Acked-by: Quentin Schulz <quentin.schulz@cherry.de>
[Arnout: clarify that enabling this option is dangerous]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libopenssl/Config.in     | 8 ++++++++
 package/libopenssl/libopenssl.mk | 1 +
 2 files changed, 9 insertions(+)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 03d3def802..f276d15ce2 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -229,4 +229,12 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL_TRACE
 	  Build with SSL Trace support. Disabling this option may
 	  provide a small reduction in libssl binary size.
 
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_TLS_DEPRECATED_EC
+	bool "enable legacy TLS EC groups"
+	default y
+	help
+	  Build with support for legacy TLS EC groups that were
+	  deprecated in RFC8422. Enabling this option risks to
+	  accidentally use the deprecated curves.
+
 endif # BR2_PACKAGE_LIBOPENSSL
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 4aad749eec..44734d176a 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -124,6 +124,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SIV),,no-siv) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SM2_PRECOMP_TABLE),,no-sm2-precomp) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL_TRACE),,no-ssl-trace) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_TLS_DEPRECATED_EC),,no-tls-deprecated-ec) \
 			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
 			$(if $(BR2_STATIC_LIBS),no-dso)
 endef

--===============2423130635775472046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2423130635775472046==--
