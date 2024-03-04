Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB59C5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 370874152F;
	Mon,  4 Mar 2024 15:34:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nFeUfXBSpjYa; Mon,  4 Mar 2024 15:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06D4A41559
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06D4A41559;
	Mon,  4 Mar 2024 15:34:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DDB31BF3B0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1971840939
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id let5cyk3q4yZ for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:34:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38ABA40955
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38ABA40955
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38ABA40955
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:34:21 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a458850dbddso46742266b.0
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:34:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566459; x=1710171259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DwwK8UtUc7CS9+8lAX4BSv4tcLQxWOxlekObFDB1SeU=;
 b=NiKahJYmfnzFN3h7+3Qv2AhQ6ZwCEcRLrznzxCqquo5PoX7G4RNjQf2+bd5fgHFSVN
 bw48nPlsBVA/ihnCeeE9uMs4yt+RGtK81U1j76f6XR9PfFz9rcQqzmE/zcyP5vL43M3y
 g39cxptjc+AD9irrVF9L74uUkxu4JtUxjFcRtEOnrG7gh5MbVKF4oEi7u9vdIXToSTj7
 WXgWSvtyqyUAZnCkelkYdj8SEHo1o+vC8CeF8NZ0x7sRGNV6Fth8v/D8+8rG2H9zRqEW
 eJztG3KYM8trKYWjKzjx253XSmojSN0acNTot1TkP3x3OVv4Ho97h6E1FNm1hF3qgRU8
 BDpw==
X-Gm-Message-State: AOJu0Ywn/qsaNb5ss4G2jNAQjhE6NfM7jfKuMScldzrgvds82L4rKuXC
 3N7Zxxfkp8dRiYzHhcSZ69pWADK6pCUKtrhFE1w+pgkR9gLr+jAIJmFBU744D6LSyW1VUenNcCq
 JLw8=
X-Google-Smtp-Source: AGHT+IHh0mGEiInmug3EJt/KcTE2sRv2/Ha8ErWF2clJLIMJ6gTNpYCN5PhtmF5cW5n+5nuq9wPRfQ==
X-Received: by 2002:a17:906:a18d:b0:a3e:7a8f:27dc with SMTP id
 s13-20020a170906a18d00b00a3e7a8f27dcmr6183790ejy.49.1709566459056; 
 Mon, 04 Mar 2024 07:34:19 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:72fe:558f:d55e:d423])
 by smtp.gmail.com with ESMTPSA id
 sa20-20020a1709076d1400b00a4432543b21sm4936082ejc.198.2024.03.04.07.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:34:18 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:32:40 +0100
Message-ID: <20240304153253.732708-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709566459; x=1710171259;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DwwK8UtUc7CS9+8lAX4BSv4tcLQxWOxlekObFDB1SeU=;
 b=gL998EXtJmS6LcMbr29m5sLbe2Vw7jwEY5pSz/rlk+LjQt9hQ1MEyR87KGCjU8yu31
 fz8Dx9DWIENpB4kHQEAjj7nUyfUf0y9CcOfd4lqmUDPEEE12ReHkQaasB07OyfczqrUX
 nYzQnBkRiFB0QofBePIo/BJmhnHujM58axD2Y=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=gL998EXt
Subject: [Buildroot] [PATCH v9 09/22]
 package/python-jsonschema-specifications: add host variant
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts. This package is required by binman.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Co-developed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- Add runtime dependencies
- Add SOB and COB tags of Romain Naour

no changes since v3

Changes in v3:
- Drop Config.in.host

 package/python-jsonschema-specifications.mk                | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
index 40879898c9d4..653c839bb450 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
@@ -14,4 +14,14 @@ PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
 	host-python-hatchling \
 	host-python-hatch-vcs
 
+HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
+# This is a runtime dependency, but we don't have the concept of
+# runtime dependencies for host packages.
+HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES += \
+	host-python-referencing
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
