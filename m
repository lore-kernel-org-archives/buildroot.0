Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7694EC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4008D40DB6;
	Sun, 27 Sep 2026 10:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkBm_XjFNaXt; Sun, 27 Sep 2026 10:58:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 933D040D7E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506727;
	b=k47jelccbSdcc7LHdXfT2OpBHDw0gv/b8kS7cIqSTFdFP/We8ykJt2+vC3fOgi84QTWP
	 rIv6gSbWKcN+bhFP52v/I767LzvyOrrY32aD33MwbABJ5ZBYFgp3sMYOvG1IYJv9t/mi7
	 hIDXSUUq4HUSi42+52A0uF1l/zaaDI3t4eVKCbrFzg+vPWFO8n+IwNnyJO0sXCaYaPl8P
	 KkiyJOIM4aIieEHgTh/18pH9p/lnvfZL/vHDtIOLp62dv4hicVvq4gaTr3J6xMrpj+0GQ
	 vwCeXI0LtKxzxjGm5Qbnz9fukoCngzJI871KDk388Iw/pPXjp7WsX3O+LVGdaquiLBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506727;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WlGHSYqaqW6NA1iJ5vhYQ9U0DyQfsQwxaHvambouax0=;
	b=KL+Sjo0Nuxm9QB8gh0M95ThtBzv1SrlbJxTvxXmo064Rm4xTiR3EIIY3N6XtSttUuHAi
	 oMtMFzR+yS+ZE86bhAqhhCNBmq9vzQZ02IK9EBGkzmhNyJoNNsfIyNV/3hGam16V2S7ga
	 /r4Vb42elbELjh76xXArSPz0IOzKdX3od1lewjlYs98TVsxP9QSvJsIDLjM4wYaL3Lh9+
	 /m3tGSJ9opraXnHDkmsGflG8mTFAoHH0pl6swvalAptIXRP1USWoP8x4pkDgGdQq2WiDt
	 /y8fwmy+4V2WIe0/hUpm7Rsc+gnqw0tlATi5kj4oAFdknehaXiXuniRJAWPSS8Gdfgw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=GtmhOUhN;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506727;
	bh=WlGHSYqaqW6NA1iJ5vhYQ9U0DyQfsQwxaHvambouax0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XoNGFR7RZ+Ul6g5peUvoBI6oD6Cbv5O/pImKWz9sC7veSpq1Z7abgdA7seC5KjDRe
	 7P70pMIldfHbKgP5uCQJSeHEu3P8LcnmozvH96ea6fUnv5DBUSlPFcTJRTbic2OH/k
	 Bi71HIu+T+PyPm3D6AuPrwV7cHiN5cx5iaD1CAV0Qq77+k/75zDnibvbG5ox4ulhrX
	 qHkfXbntZG+fXO0jT5FGbW5uuu+etBpvmJmGqRH1/kT36Tm1LNAFwSRJvrMfQmgMKQ
	 /e950K7DEwDVjqA4yythiSVkGPoP23z0HrTJYFvf0wZJ/urTKEc4xYm0QvH+tiIQF8
	 OefwyZec1GVWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 933D040D7E;
	Sun, 27 Sep 2026 10:58:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BEB9335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 812D440D93
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W23GRRQDvMLI for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:58:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 947E140D57
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506724;
 b=oRRQRWdoll9HgOnyXbCg3mJTBiSu2QQKZ19zJqFwNzzB/U2CBc9L0mkzxaMcd9cs5a3K
 aTtrmikwZ++PTVX7bh6kPcp9hlEB/Y/qCN+jef/IzbDxHSBVtbC3zz8/aWWNaVRz0dxIT
 6IE5o0iwpUDZMJETsVT0vWd44VxCoKlG19yJP0uQ4nR0jPArFAdl6+a3EPSp+DY0GfVRb
 /wgTH4caF+d2KomaFLKg1xRDNYE58j9N2K9F87k1MUuc5AVuK+VPElj6udaR19mdrsJ5z
 b3XQ4qD6wkjUSq/14dDrouEvYlm5lZzUdlAq05dHDkSpfeHNe0Hcm/mNFnXirtx3wGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506724;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZCz9Mm2R+/TZ6AuG54GXRS+f/UieJLdE+h+hRTFL5jc=;
 b=eFk0mwvnCjHhfMNvkSFWfqTYpHpqgUJau5o2u3paES0/Q8TYZ/8S5LoXQcJKMPbJl0Th
 Y4rQidbxgU+aMAX68AloERFR6mFJ4wmssLfVMcvbqHNm7mMcwrNGV3I1BiUt24jGN6OBR
 GwYoDOwNOybtAhbpmBBqv967G5qDg6Xh5qgy7oXCCX2x6LORGSGErlGL/iYxJ9vqTmRw6
 y+wBRD6UKEL0IiOhOEJKEB/gCNRnKD0pBcnL+r3LOr3KwI6uT1LattD6WGNGgiAzgJVte
 LxUGYSF3D2JVKKTJVFs/yK6s766gm8DQO2Xm/pm3E0zofjy1/YdiVp/8N62FoBbyY/w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GtmhOUhN; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=GtmhOUhN
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 947E140D57
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505868;
 bh=ZCz9Mm2R+/TZ6AuG54GXRS+f/UieJLdE+h+hRTFL5jc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GtmhOUhN3xm1vAoE5vqvmPQ3JKEtqoI6ZmQn7aFop7Bg5k3io7YHLNeigOeXMlCc1
 3K1S6fJ8ltemJrbDhzKkHjtKSAjI7wqeDxe59sM5ugzNlgzOmVRI9DaIHawLSNf631
 t24lGUi5rq9Ek22zVt7JLy1hMStKgXXgwySxNiUZlV183db7Wyn6s+LjNzWsozH3Vo
 y51+e3XJHZogySBaQhWMiBe3mOxuK3cvbLDp4p+4jnen7uc2aL52QltmO46DxdICqX
 rS8r8XPsFOjYSMJdtwmZWc1UMDQJtPMYJ59lw6XuOZqfw7Qx1nD2Yv1eLIjITkPcoc
 VEUmqpl9x9twg==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 uKOa0G5g+9dLsxVcuPV2BXrBrBzdsk8mhHjnBBJGg49Gay80QW4wEtGquE/arc6mFx8wzoCRFn7
 JQWYo53PF6u/XMJveQZvslSIRi1M2V8zf1di4kP1i2F6CLAhpdonS80BQ0QWba/VTcBCzWJiRon
 PsW18pXwk8obuh5ELU5tk2yi98zyCQqqxUatnJ8jAeqWwDUuwUbq4K6/8mn92UwicJz+dOCLq8T
 YDmkZQN13sal9N7wGesRKUVnTiU/BrJU46nBeDKQHTextiReyk1ZTPktQVEr9f1vk8k+5Nh3aP5
 tKi6MLM3/ynwkpFqWoNBov6TK6o7nYWY2rJZosTSa5KKUuHMnXuFt8u+6Qunl8PEzMcNYD2QAFs
 R9X5uvPH82UB4a7U54n6J/Ra2HVsUzt0cuzkhS7JGAkWfd6K2E8K2AzQcukjCuIQe5xgOX2xC19
 SC4leUW1zb2udm7kPlGSNkx+EHNOHl+JQtSlXt9R5zp94ckmjNhl3F7L40B6UMvLX8a3/xebCuA
 VqZKR7h8fsQkaN6Ppj7Ia0deBeFveHW4RBUMhzux/DqLyJr9W3XMsQqxzlDfX24NsHHEeRQjU3s
 8v5WZJCvwiVpMDb3ZTCmSDdhKX+HJdyx8kz5OHmfEMD03En2hgKARDpl5WzO1/ZePKLp+HPfMG2
 22dAy2nMm8GGI+FbIR5vtMh5ctk8gBtfN/2KqCAbPt7w8R/a5zWTWgwHQgXgsGUg=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 97E15A4C5090;
 Sun, 27 Sep 2026 12:44:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLe-0000000007a-04zU;
 Sun, 27 Sep 2026 10:43:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:28 +0200
Message-ID: <20260927104301.1801638-51-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 50/82] package/libesmtp: Fix build with
 OpenSSL 4.0.0
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-with-OpenSSL-4.0-opaque-ASN1_STRING.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch

diff --git a/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
new file mode 100644
index 0000000000..f38435b68a
--- /dev/null
+++ b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
@@ -0,0 +1,36 @@
+From 0705423e2596a21e2d4e1f3fd492792956a4bad3 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Tue, 28 Jul 2026 20:35:48 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0 opaque ASN1_STRING
+
+OpenSSL 4.0 made ASN1_STRING opaque, so direct access to ->data and
+->length fields no longer compiles. Use ASN1_STRING_get0_data() and
+ASN1_STRING_length() accessors which are available since OpenSSL 1.1.0.
+
+Fixes #33
+
+Upstream: https://github.com/libesmtp/libESMTP/pull/34
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ smtp-tls.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/smtp-tls.c b/smtp-tls.c
+index 9f3e50e..981284e 100644
+--- a/smtp-tls.c
++++ b/smtp-tls.c
+@@ -599,8 +599,8 @@ check_acceptable_security (smtp_session_t session, SSL *ssl)
+ 
+ 	      if (name->type == GEN_DNS)
+ 		{
+-		  const char *ia5str = (const char *) name->d.ia5->data;
+-		  size_t ia5len = name->d.ia5->length;
++		  const char *ia5str = (const char *) ASN1_STRING_get0_data(name->d.ia5);
++		  size_t ia5len = ASN1_STRING_length(name->d.ia5);
+ 
+ 		  hasaltname = 1;
+ 		  if (strlen (ia5str) == ia5len && match_domain (host, ia5str))
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
