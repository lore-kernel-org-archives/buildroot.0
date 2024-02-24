Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD5BC54E41
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 20:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15367405E6;
	Sat, 24 Feb 2024 20:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vq-uuV7Vumt; Sat, 24 Feb 2024 20:57:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C47AE405CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C47AE405CD;
	Sat, 24 Feb 2024 20:57:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A36CE1BF276
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9183881F65
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7D-2CdbqyUxN for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 20:57:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B6DDE81F58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6DDE81F58
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6DDE81F58
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 20:57:36 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a3e75e30d36so369325066b.1
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 12:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708808254; x=1709413054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yI6EI4PLyOwb5Mbfb+U9aDSReebynjCbXzyzR7HAgKs=;
 b=YvZw6o2/vjFJnnjhDgnvIVISWThwU3KqxV39NXZ5HP7xdXXQ0m3VCkkbzLuAhsYcqL
 1gx1g/krAufaU2nmMPCioH8WxVFcvfLi71PKdGCWg94xW+T8SSQysRjZ/3FU8G3k1im3
 Xz8a3muB+FhYDtaChESThA/IGvDcvMvweCS0iLAG3w5LaZNO9pjUzZ/+wiYQtcXJ3B0B
 OwBogqXNMonN83p/3z/ZFOiStAVsIQYA+ahR7fltiEUKxtzbhdWeDigX8Wh3881wuAx8
 eJqJ+P+rf1ajey3m7FTeV2mbYsudT2VLOnzKFpnJzJ9Q9pHyBcpZDFiNgyrckLXP9ezF
 gjEQ==
X-Gm-Message-State: AOJu0Yyfh6XVttjYJsiU6e6ZEoDS27StEwpgFMp7ZuWqjFsXIKqtYpKd
 QeuBWN0geYuMj7LB7lYsqSWGbHmbJhDzkU667LI75egJfCbTSq4gQEMvP/LHh88LPW8kaEtC3xu
 48aQ=
X-Google-Smtp-Source: AGHT+IFxQ/PPKcaEAfSe1VyANGBhRMb3yU8s6dXhPNhAw8tLEdtmloPZuERNwDMjY6mDgPNqYC2fpw==
X-Received: by 2002:a17:906:f215:b0:a42:f158:f53c with SMTP id
 gt21-20020a170906f21500b00a42f158f53cmr1607107ejb.2.1708808254555; 
 Sat, 24 Feb 2024 12:57:34 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 tk6-20020a170907c28600b00a4306ac4c77sm425506ejc.197.2024.02.24.12.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 12:57:34 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 21:56:43 +0100
Message-ID: <20240224205654.1546744-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708808254; x=1709413054;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yI6EI4PLyOwb5Mbfb+U9aDSReebynjCbXzyzR7HAgKs=;
 b=e1az3nmi4JjRXfp7GqIrKyPKhDRlyk3BCeRRFQs4uk9r5vnLlHpbdrfcJhzT/F6dTD
 yCDmgXxvMEG7DrsxO3pDO4L+dvN9Ji8Y83HR1QiM/cSl2a4K8SL3LaisYblAr10ogrii
 0qfF19p2C38fALueYtMNKIyeyLaCnzhy2uX1s=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=e1az3nmi
Subject: [Buildroot] [PATCH v6 06/16] package/python-attrs: add host variant
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
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v3

Changes in v3:
- Drop Config.in.host

 package/python-attrs/python-attrs.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 8a1236cc4402..fb1729e62fa2 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -15,4 +15,10 @@ PYTHON_ATTRS_DEPENDENCIES = \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
+HOST_PYTHON_ATTRS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
