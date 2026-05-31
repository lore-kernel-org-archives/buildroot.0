Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043B0CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 15:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2E2D60F63;
	Sun, 31 May 2026 15:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v436j8zSevr1; Sun, 31 May 2026 15:36:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D260860F8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780241791;
	bh=xzxD/o9mUQetlKL0ReVX53cnKX+ktckMQjY//10UUJE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=D6198hOW3as+U9pTMMwRp+s/qJQUAPMJaeRpuKJETm6OAOKbEsUlShQ3eR9N3jW1Z
	 dter05aAHNxP4HN7dMMjf2VZ/cSH30n7EQXzj12GYl65+pihJ/puQZ+TzPADN6S9ZG
	 HB2QtGjxEPorvmJ9Q9joyUgX/mZWL+pbIr6xz2VuVoyiRMR/MAJsjsFLwmOSGjhijz
	 NW3GBSvzN4pGffId6VqkksSQT5HU1w/U82HLuRHsW4s/YtrKe3SyoCuDh6hcUDuqRe
	 GjItS9EIOzoUWrPZDvnYzfIs3olUAybLu+GNWvZCaCxmkvPHcrREDJf5el5dJgboQ5
	 0i+8JWHFJ1Teg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D260860F8B;
	Sun, 31 May 2026 15:36:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF54DF4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC3FB405DC
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZwWok4Udt0T for <buildroot@buildroot.org>;
 Sun, 31 May 2026 15:36:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F522405D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F522405D8
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F522405D8
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:27 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-49050bfe053so60606305e9.3
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780241786; x=1780846586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OkYFsdeVLPgp/Hjw8AZohN+9jJSds1Tb8FVjf2oB12U=;
 b=d7KduhQx3Ee2Eb5AkyEXRaDCUnJX2FK/VXQ0qeOxVENZprN0pFV0kXXFaRm6C9/+0B
 /c4WUKhHMwMwC0Em/8AuFgecGEGcrrIgt+47d3eVM/DhyThyQTfH+aTg7pan3P5HGHVS
 4S11YowcSQnBcqh7/hJ/NTopRo6t4zFSXdvu8V9M+rlNSsXjklNgkNuFXyu5Dfs9VuQ/
 RWOKmUEOlJ2Halye17lTBx6dGYFxk83G9X/C8a5GN/uWbqlLwLyWPONM3mmxc5WFdxtk
 yBzTszObDe293HScbhu5NEIOn1glVuL2kXagiX9dUQZVzmc1EphV4O+6ceqlPr52TI96
 1apw==
X-Gm-Message-State: AOJu0Yw0AlsDof0EegqXN/WLnm7MdZAj88fD72uEbVnmdEjUXm/ReQ1r
 /6Yau3vntbT7WpLk6DMPDaR3HZhI6SVGqOkcfeEptMaqwnQNTich/SbvdDbvnqAiFUPBWGieAW4
 atQSWwnw=
X-Gm-Gg: Acq92OEApGLWJpi8BuE/VAVYXQo3pIfQjtwJ/UVtU5Glo0QEyV2Sde+SBZqJkAnwfZF
 uEZFCshipScP7h4kSMOvKxB1jI+BlRVnIBeb1qV0hBiHfiY7rE/pzB1L8UkhRkveL14U/6LBzjX
 IoiOOqtD5/fvnVCGvjXwm+s9PW+ei0vZX5WKSBRwlbrTLjUPnfZk0UPQSszDNbKymOJzSRCpMKQ
 kSh+aM6przXJyFV6SGtvk5bhH/U/erJyS2Em2bAFfZF3Y7WDlmHSxTJOhx+U1Engzt/YC4hR0yB
 9mNxuuMA+cQqRe0dGLDEOTjGrWzFHqiMGi4SPHwRX2sxBxj4NLYYbN/VM7+gpZLWcGEygR4OOH2
 zZH8Ex7Z4J9KCeSfvGDdZ0PKzb5z8DVwIy4AaswHplYmkkdSdlIyiCko75n8cxKE3lC6rw79K+l
 zY6u9fZO018mjCKvzcjrcUeMT/mkzlCaGHHBr2jt3UE1FwRfaBF8U7rbXsutp27ucmxoAzoAIqW
 ao2Wcse4+/GXAMWWKeRVbnzUFJY78aT
X-Received: by 2002:a05:600c:314e:b0:48f:e518:d110 with SMTP id
 5b1f17b1804b1-490a2968857mr138613585e9.32.1780241786196; 
 Sun, 31 May 2026 08:36:26 -0700 (PDT)
Received: from dragon.localdomain
 (lputeaux-658-1-173-117.w92-154.abo.wanadoo.fr. [92.154.108.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca6575csm278098585e9.4.2026.05.31.08.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 08:36:25 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 17:35:52 +0200
Message-ID: <20260531153557.2375580-9-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531153557.2375580-1-titouan.christophe@mind.be>
References: <20260531153557.2375580-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780241786; x=1780846586; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OkYFsdeVLPgp/Hjw8AZohN+9jJSds1Tb8FVjf2oB12U=;
 b=CjWELlCKoy+jEUsVovBnd04jGxlcckxYS7wFtFzEzyXP4OlOa4ouER3of5D4cnTdIC
 e3PhpHx5BNPgyaenLLvrd2iGZao0e6H0SgxSPvWh3cCDcMqHV49osxZvmZYK5Q0q58Ys
 dqWSZ5mtwm5MhHkPprJkPDEBbyyMKC8IcsPX+/VbxDf2JCU0NCVquOpRKLp5RA9FV2kK
 nxj1KwUzOtXgz1EB4Y0Cmbs4JEkEr3QBapW8dy6j25ZVjCjQS2RCbH8LuMP/3jFFgPnH
 QVI3dOQvaUVcONzujiW2I3IL7oA7zxxIIZOAGIQYS/V1HVVAKBoQyCUGOue0TyoNqMnO
 Pmmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CjWELlCK
Subject: [Buildroot] [PATCH v4 8/9] docs: update the Buildroot manual for
 kconfig variables expansion
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: yann.morin@orange.com, ps.report@gmx.net, thomas.petazzoni@bootlin.com,
 petr.vorel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the update of kconfig, $VARIABLES are no longer expanded.
Update the Buildoot user manual accordingly.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 docs/manual/customize-outside-br.adoc | 12 ++++++------
 docs/manual/migrating.adoc            |  7 +++++++
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/docs/manual/customize-outside-br.adoc b/docs/manual/customize-outside-br.adoc
index 8a76f3a998..ab9557923b 100644
--- a/docs/manual/customize-outside-br.adoc
+++ b/docs/manual/customize-outside-br.adoc
@@ -154,8 +154,8 @@ The main usage of this is to store package recipes. The recommended way
 to do this is to write a +Config.in+ file that looks like:
 
 ----
-source "$BR2_EXTERNAL_BAR_42_PATH/package/package1/Config.in"
-source "$BR2_EXTERNAL_BAR_42_PATH/package/package2/Config.in"
+source "$(BR2_EXTERNAL_BAR_42_PATH)/package/package1/Config.in"
+source "$(BR2_EXTERNAL_BAR_42_PATH)/package/package2/Config.in"
 ----
 
 Then, have an +external.mk+ file that looks like:
@@ -244,10 +244,10 @@ illustration, of course):
   |     `----
   |
   |- Config.in
-  |     |source "$BR2_EXTERNAL_BAR_42_PATH/toolchain/toolchain-external-mine/Config.in.options"
-  |     |source "$BR2_EXTERNAL_BAR_42_PATH/package/pkg-1/Config.in"
-  |     |source "$BR2_EXTERNAL_BAR_42_PATH/package/pkg-2/Config.in"
-  |     |source "$BR2_EXTERNAL_BAR_42_PATH/package/my-jpeg/Config.in"
+  |     |source "$(BR2_EXTERNAL_BAR_42_PATH)/toolchain/toolchain-external-mine/Config.in.options"
+  |     |source "$(BR2_EXTERNAL_BAR_42_PATH)/package/pkg-1/Config.in"
+  |     |source "$(BR2_EXTERNAL_BAR_42_PATH)/package/pkg-2/Config.in"
+  |     |source "$(BR2_EXTERNAL_BAR_42_PATH)/package/my-jpeg/Config.in"
   |     |
   |     |config BAR_42_FLASH_ADDR
   |     |    hex "my-board flash address"
diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index d8d86d8945..fe3d34d740 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -247,3 +247,10 @@ In 2026.02, the network-manager package stopped selecting the gnutls package as
 a cryptography backend automatically. Manually enable the gnutls or libnss
 package if you require features that depend on a cryptography backend, such as
 certificate-based authentication.
+
+Following the update of the bundled kconfig programs suite, variable names
+in `source` statements must now be enclosed in parentheses. For example,
+`source "$BR2_EXTERNAL_FOO_PATH/bar"` should now be rewritten as
+`source "$(BR2_EXTERNAL_FOO_PATH)/bar"`.
+This is affecting **all buildroot externals**, which must therefore be
+updated accordingly to support Buildroot 2026.02 and upper
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
