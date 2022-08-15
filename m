Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDE8C25B0E
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 13:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3AC981496;
	Mon, 15 Aug 2022 13:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3AC981496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VRrNJfYyhm5u; Mon, 15 Aug 2022 13:21:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5658481428;
	Mon, 15 Aug 2022 13:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5658481428
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFA1B1BF31B
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 13:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAE858133E
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 13:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAE858133E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u_wFNQh_96sP for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 13:21:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2A5C81266
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2A5C81266
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 13:21:02 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z16so9040960wrh.12
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 06:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=YBPlq5SP244fBvtfc0DoYkriVJJrRFdP3GyLWiHnVsM=;
 b=lsFfXVYyCSOgEbGYloRV+qqdLLpWPkoZDlFl3BySx9eKpAznS9XfMnCGFPLejhaRLQ
 eRSZkqoBlJzUc1rq4aa3zV9nnQwuI2Aq3Yi1CVkm69HHP8KwckbCY8vL7GauFcm4CHkq
 uJ+EPyONsfn10IKzHVR5cMOGDkpRO1/RuR1Unc6fKq8gJCCFKYSDtBcGc2RcZVI4rsny
 YtZeYghTiVDpcZ+Yg50FRdsMOsCilaJ5FuLCbzPg26UUJTbZnMSJEj1AaKTLZeL33VJ2
 JUK11aeG2v0zwJnTQtlTkJlSOwoUkaCjFVFfqbmPPM93+otqLc1zkWWVyiXKNHkmI0mh
 5t7g==
X-Gm-Message-State: ACgBeo1XXQpkiRtABpziItQInlsSu6WEqRovSZrC1XHYhst3RO3VrgA1
 mQmb9btsqNolq+8os/2fcP2+M/APxJA=
X-Google-Smtp-Source: AA6agR5uNU7/HRcD4sAXTis+xn60S1Nsrxy6rrjXC9ePiIU70O6jMxnb9NCXA/o6LYnZZRIiF1Ohxg==
X-Received: by 2002:a5d:614e:0:b0:222:c091:9ce1 with SMTP id
 y14-20020a5d614e000000b00222c0919ce1mr8497362wrt.232.1660569660833; 
 Mon, 15 Aug 2022 06:21:00 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b007270bbd6f150e5cd.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:7270:bbd6:f150:e5cd])
 by smtp.gmail.com with ESMTPSA id
 r22-20020a05600c35d600b003a5ffec0b91sm1578659wmq.30.2022.08.15.06.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 06:21:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 15:20:57 +0200
Message-Id: <20220815132057.570981-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=YBPlq5SP244fBvtfc0DoYkriVJJrRFdP3GyLWiHnVsM=;
 b=qrU+gLFeD+ADsGLx2IiL1CDMZiPX0Ifj6w/xNznv/1pUkCAlYHaZ7UHHuKsS5GRHio
 HtAJVniEkWXnkv1oYhs97S28eCMLOCSUsJmJI0aBdUvUQZ5aFuO7k0bffHXQp660sEIO
 1T7Gk3rHLdRQP/XhF06vOK0o5pri5m2dhWo+L6PJswtZW5W/QY9ht595PfPUWIeYhLHL
 XcKig/dN4hs55nkE5P/3SJMayjedY7hiIx+PZYNJX+2/6V4atSYSSaLcDXwjyphFqIdS
 Th7bUb6AZ7L5gIZoLiaadm7wS3sFJ8ZJRDvYcqdW9jLkRVfdhTPD6Scy4Nn21zWk9Rh0
 xHiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qrU+gLFe
Subject: [Buildroot] [PATCH 1/1] package/uacme: ualpn needs libopenssl
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Nicola Di Lieto <nicola.dilieto@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ualpn is not compatible with libressl as stated by upstream in
https://github.com/ndilieto/uacme/commit/32546c7caa1626bbef860cf81e53d10e29fca5cb

ualpn.c: In function 'ssl_client_hello_cb':
ualpn.c:2038:16: error: 'SSL_CLIENT_HELLO_RETRY' undeclared (first use in this function); did you mean 'SSL_F_CLIENT_HELLO'?
 2038 |         return SSL_CLIENT_HELLO_RETRY;
      |                ^~~~~~~~~~~~~~~~~~~~~~
      |                SSL_F_CLIENT_HELLO

Fixes:
 - http://autobuild.buildroot.org/results/d7d49cfce6f99c59e99c8e15399164fd5ecacc21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uacme/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index 796f54754e..2c6864871c 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -21,6 +21,8 @@ config BR2_PACKAGE_UACME_UALPN
 	bool "enable ualpn"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL \
+		if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
 	help
 	  Build and install ualpn, the transparent proxying tls-alpn-01
 	  challenge responder.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
