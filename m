Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95E6C5478C
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 16:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C2AF41497;
	Tue, 27 Feb 2024 16:30:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SWgsZiN-QQhf; Tue, 27 Feb 2024 16:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C163B414C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C163B414C1;
	Tue, 27 Feb 2024 16:30:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC3051BF30A
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A74088145F
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bloeso7rtonW for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 16:30:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFED181438
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFED181438
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFED181438
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 16:30:38 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-563b7b3e3ecso6239780a12.0
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 08:30:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709051436; x=1709656236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6GAmi/O0DEAilIwmHqE7GxRSrTaugNHqHhinoRUgGlQ=;
 b=EO8xJXsWpXMf3CsBBHM0nUhyDLe+2izj+To5gWl7VkvgVVZGOxxXXUJcfCEXjH/zV9
 MiAH5b3qpQ/6zGz2tEB4qw4HCpl8/1eJIBhBOFp5dxRt+OV3Mv+xmYfq7eTMhYbUJs9i
 sI18UKG+KZ6nU140zOhkJY4f5KflMPdmQVNMEaXR1K5kgddlUiNjsD4+1qXoVTR/A9SP
 /EyxVh0grDgncIJFpQEnR/ZSnW/hTnbZcWn1UGNN5pJ103UYTu4c6dmBYscRwNjqJt48
 aKSujwXt3El8ANlpLZ1cFwSiYI+QZsBohByMz6qAdukcnw/dOCtnGUnNPfT7QerDCqXB
 0lfw==
X-Gm-Message-State: AOJu0Yzn1BKAQweQzRtqHfFocDzKPrlAXR2mNuhlcxgGPwRcUFCcFjzA
 Hc7MU8qBW9Ck+2NzoqojcSDExb9lMwcDRl9LsxzsoZXbSwMyuX6gY6lw9oXPf9nQDbNQ8ykkJKU
 nwXk=
X-Google-Smtp-Source: AGHT+IGDg0AJwiQtdvaApEQFpuINhwKfrRkQoYbS4YF/Umkq+LsjvdJmbG+sA0B8NbPrFLy0uxN8+Q==
X-Received: by 2002:a05:6402:1c82:b0:565:a562:dc66 with SMTP id
 cy2-20020a0564021c8200b00565a562dc66mr5521812edb.11.1709051436471; 
 Tue, 27 Feb 2024 08:30:36 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 ([2001:b07:6474:ebbf:e567:9129:29c8:388f])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056402045000b0055edfb81384sm898404edw.60.2024.02.27.08.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 08:30:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 17:30:09 +0100
Message-ID: <20240227163019.2876942-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709051436; x=1709656236;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6GAmi/O0DEAilIwmHqE7GxRSrTaugNHqHhinoRUgGlQ=;
 b=odyANd1SOg+GYR171DCoESEoixsYCsHeYu7LIXWqzFzus/+6qsBCmfFNSPTSeQc+Bh
 kel5dFEfHKW0cysihXr7MoC/wyMeUNW38C0qekMHIZLufj39rfBhvV9uY8iJciopp6gj
 jDRmR1i0DncpAGD38FcTgX5OhBQNL02ycY7U0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=odyANd1S
Subject: [Buildroot] [PATCH v7 07/17] package/python-rpds-py: add host
 variant
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
arrangements with many parts. This package is required by binman

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v3

Changes in v3:
- Drop Config.in.host

 package/python-rpds-py/python-rpds-py.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 80670f2e4fde..cee2ff290a4e 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -12,3 +12,4 @@ PYTHON_RPDS_PY_LICENSE = MIT
 PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
