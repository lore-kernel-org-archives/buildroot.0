Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948FBF45A19
	for <buildroot@archiver.kernel.org>; Sat, 11 Apr 2026 09:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEDEC41E34;
	Sat, 11 Apr 2026 09:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qxa4S0xxCdv8; Sat, 11 Apr 2026 09:57:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1833941E1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775901431;
	bh=3tIp3i+MP+C1A9F2lyiS6HNn3YCquEjwkqNJ94PQQlU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=riVrCI9P40N92quCS0Vb9dhKc5iLMbbRGilLVcU0lpoYEuscImaASsZU68zKGxwZv
	 94mlwnK0NTBn3kDJ/20DYSyfFxmNYUVauzaqQnGH3/KUHqOhRmuCxxcJDX+Rmyrig8
	 Q0k6r+f9LAFCHW67Z/xnm6JjoHM7RQTpIW7vIvnWoJi2xH4kKW/JPb9Vgj5qdK2lVU
	 nJjpLDEYlF5PSdN07+uXrPYO4fYy9fjZ1Sa6e0yHn97RUw/7FRsBHy8+tCeviMkB/X
	 4bf9y1CIMAKjKoE7CgNRmvy5nLJeeWz2XnyzRzXrWu2QAVx5oX2XI1R/FZoWxdEWlI
	 a8jbIwLcQiclA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1833941E1A;
	Sat, 11 Apr 2026 09:57:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CDA8194
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 09:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F26AC40181
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 09:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBt_no98ZkeL for <buildroot@buildroot.org>;
 Sat, 11 Apr 2026 09:57:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 44E7F400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44E7F400E4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44E7F400E4
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 09:57:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c02a.dip0.t-ipconnect.de [79.214.192.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EB720A4C0E2A;
 Sat, 11 Apr 2026 11:57:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41568)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wBV5M-000000002mv-1SK5;
 Sat, 11 Apr 2026 09:57:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Apr 2026 11:57:04 +0200
Message-ID: <20260411095704.1241777-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775901425;
 bh=NsrLwMTTU6SokGcNTYBrWqRPRHAehNNeR4iMrRjE+dI=;
 h=From:To:Cc:Subject:Date:From;
 b=u5IwJ6rtXlGSO7Eic+Oj1wVZPJBgBTaM42ngnGgR/9CSYrq6lvs1kbQleKn0gQ6v+
 XvVwZmGJBlZvsHD/Xwkq7AqvUstDFLoP5s6iRNuO5iYf22ozg0SV/W3069UChLUFzi
 oFWLfaAgmLdizLNZXBLGsfdQ26NZvzCSNkWSP4uXVHwGvXTlLyrHuehyS2+Q8nOPPq
 LmOWn+zG9MmDengMuP7wJVtg6a1Itf9sgPsEmFQatusAtl+/J18fHRrQ7V6v2ej/1O
 OUGYjopEddKj7aoOtBDW3CANxR3sqGLFo4vhtMACaWEfCqdRis8in11cWrsgeGE0jj
 p8bCkPniLUAaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=u5IwJ6rt
Subject: [Buildroot] [PATCH 1/1] package/suricata: fix build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit a3374e49baa45679997c37a25accaf1574132c4a bumped the
package from 6.0.20 to 8.0.4.

Upstream included in version 8.0.1 a commit adding rustdoc as build
dependency "required for the tests":
https://github.com/OISF/suricata/commit/6d74656befe20cd939de8a97bfe272efa112c90b

This causes an error during configure in buildroot:

  checking for rustdoc... no
  configure: error: rustdoc required

To fix we problem we add RUSTDOC=true to _CONV_ENV.

Fixes:
https://autobuild.buildroot.net/results/489/48984ab369d01fae9b53b7b1f51e874bada0619f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/suricata/suricata.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 0ee3752a21..56bbc0c89b 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -30,6 +30,7 @@ SURICATA_DEPENDENCIES = \
 SURICATA_CONF_ENV = \
 	ac_cv_path_HAVE_SPHINXBUILD=no \
 	CARGO_HOME=$(BR_CARGO_HOME) \
+	RUSTDOC=true \
 	RUST_TARGET=$(RUSTC_TARGET_NAME)
 
 SURICATA_MAKE_ENV = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
