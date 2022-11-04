Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87951C4332F
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 23:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 299D78226B;
	Fri,  4 Nov 2022 23:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 299D78226B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cG69n0g34b1J; Fri,  4 Nov 2022 23:57:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65E8882254;
	Fri,  4 Nov 2022 23:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65E8882254
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4FA31BF31A
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 23:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0F1A61162
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 23:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0F1A61162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cX-7X24DxDCC for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 23:57:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1240560A6B
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1240560A6B
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 23:57:34 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46-20020a9d0631000000b00666823da25fso3555371otn.0
 for <buildroot@buildroot.org>; Fri, 04 Nov 2022 16:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7OcOhyRS54YAvgIcRNVRm4fIrs+W1qIxBRQCU/Vegxw=;
 b=1IAPlcJx5wUHJTpETbA9ktPaA9N8upMmOHUlqCp/BMPUGqiKr9tTIFCJWm2dbqLzbF
 MLAAmhOUZ4YHDh9zu7hy1hpNRY1Fzknzd2yqUtL8ehkiSqsVw98fRAIR4oAfUh7MDiT5
 KHqMewjKiXIxWX9nulbpMw7OjxYLnYlqSBeFaxQweKvKF74Ms6mraBd/jnUdE8bzDRFp
 LOCrlQwYaZy2e87PY/5AhO9II5MHJJZNWa8LsDPpTqBrw/WUK8wRsQnYv4bYcN4w/WD2
 mIRvmDK/RPA1uxoFHXq5wgyrxeOk99hOhbAQUzz/e5FEI91OxRyktyJlSDwoqdYbV/Ak
 Cfig==
X-Gm-Message-State: ACrzQf3V7FuJ8dpDr8IajssbcvAyuDJ0p9yRRZZis0hi+IkqoKlDNOSg
 yUJQyoofXCmTXzUqwVd0lUtEv7Gk1EI=
X-Google-Smtp-Source: AMsMyM7U2EvNLHtu+jotQrDKrY4t1zK0VnbYsh9AWslePG7YFqpiRM/qUmLUepzZoZB1eYm/4pkXCQ==
X-Received: by 2002:a9d:6b18:0:b0:66c:6333:5117 with SMTP id
 g24-20020a9d6b18000000b0066c63335117mr12464810otp.147.1667606253959; 
 Fri, 04 Nov 2022 16:57:33 -0700 (PDT)
Received: from casantos.remote.csb (177.204.173.152.dynamic.adsl.gvt.net.br.
 [177.204.173.152]) by smtp.gmail.com with ESMTPSA id
 k131-20020aca3d89000000b003549db40f38sm165638oia.46.2022.11.04.16.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 16:57:33 -0700 (PDT)
From: unixmania@gmail.com
To: buildroot@buildroot.org
Date: Fri,  4 Nov 2022 20:57:25 -0300
Message-Id: <20221104235727.587650-2-unixmania@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221104235727.587650-1-unixmania@gmail.com>
References: <20221104235727.587650-1-unixmania@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7OcOhyRS54YAvgIcRNVRm4fIrs+W1qIxBRQCU/Vegxw=;
 b=mKx9zgvCJdj43YtQzdwWrVBx6RR9AZJXTZCndx4oJ8xmdvBDompKppc3/nIHHThZaf
 Hl78mZb5z0FV11T3oY53jYz3P9DXc0vXJZ5OmIjiyF1xyaPa+Fexi3sXVUMhQmDhKKcE
 e84EpZWpQLaBFiJBn5IKcngAW3nEMjjkrRxLzcUErQoe59ORIhEY/Eu2V3rn6xnCJywa
 uFj+T+xVEz3bUQylAkSqdPE5KQgx3YkZzq/GXvonrlCwGRc+TYb8XMmWvwwxDb8Rdoq0
 Gl8dpFPGFHQyaP4ZJfBf+8oGeCsoNG+gEAiiDRBPVBeSTLCQOzUM4a+zc1e2xfej0xj3
 vEJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mKx9zgvC
Subject: [Buildroot] [PATCH 1/3] package/qemu: make "custom targets" config
 depend on !BR2_STATIC_LIBS
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
Cc: Carlos Santos <unixmania@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Carlos Santos <unixmania@gmail.com>

Custom targets selects system and Linux user-land emulation, which in
their turn require shared libraries.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/qemu/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 15d6c7d6b5..8b8a999885 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -51,6 +51,7 @@ comment "Emulators selection"
 
 config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
 	string "Enable specific targets"
+	depends on !BR2_STATIC_LIBS # dtc
 	help
 	  Enter here the list of QEMU targets you want to build. For
 	  example:
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
