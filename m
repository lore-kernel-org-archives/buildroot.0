Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88C2C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A33E083D1B;
	Sat, 17 Feb 2024 16:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mHTWSi7FROTg; Sat, 17 Feb 2024 16:03:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A23C683E81
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A23C683E81;
	Sat, 17 Feb 2024 16:03:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F23CC1BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB03883D48
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tR6RTaYiUaq for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE0C883CFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE0C883CFF
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE0C883CFF
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:03:14 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d0e521de4eso37513741fa.2
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185792; x=1708790592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4zjm09BbWCn6jKtVskmNbCjwfubt1zvpGnXXIr07a/k=;
 b=pLZIZD/Z6vxarbmWtmJpNbsyIuMYUiikgIdFblmPl4pyECzvn2LeLV7M0oelfa6BZF
 8m9Xidiy1fd65vkVg8g+gTXl5XXh0y9OAQGRXQkbrLsS0i+UEZFhFkgM3k9GKB302OfS
 27lHL9XdijT8f8BlWOM9HdDB9mDk1qvD8Rgi4lxad3qFEXZRG0UoVMHSNhn2jVac6lJ2
 65ihxI9x12spaLrE4LoE2cQsBbiJcfrEdSKCBcP5nkx0sB86HMbh5QB0lxEveA1F2k04
 VyXRsAS9l4CJtFUIHTOSSkqHhJoNpPJ+zvVppqc8yLg2Vk/HHzg2iQ41p5tMWMo5NXCg
 ByIg==
X-Gm-Message-State: AOJu0Ywu3PyUKiPaDWeOCxgBoyajTn1B0FilpahC6N6AhqYZz6KA7I+s
 8HaxTXkV6fFOF0T7gD522BUA/KplT2XEZu2N54AyXkoiFMhUow+TwReQNrWl8WUmRJo7n4aVTEk
 Ea8Y=
X-Google-Smtp-Source: AGHT+IGi6dQFgvtcfybepErqePTUT2S4DD1xyLEm/c+Unk1e1040+7g7ybQTu9i3vKNyoMol7hp7ng==
X-Received: by 2002:ac2:4477:0:b0:512:a8e8:8c5b with SMTP id
 y23-20020ac24477000000b00512a8e88c5bmr663464lfl.42.1708185792297; 
 Sat, 17 Feb 2024 08:03:12 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:03:12 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:35 +0100
Message-ID: <20240217160244.1320482-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185792; x=1708790592;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4zjm09BbWCn6jKtVskmNbCjwfubt1zvpGnXXIr07a/k=;
 b=P1oVdzYxYxC/4aRTj+saG+4RZ9X8gw919oBMTblUKMyMKWlF+B5rCsrLlrusIHOJxf
 ptcrLGA4oO7XTDhWRhMwEGv7EOFn/yjqmL+pHyZpdVp8Lhxd2YWbPnr8WfYtn7mFx2f1
 YpHOPqMJGn50Wdz2iG9zC1mKbYnvoSuDt1vlw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=P1oVdzYx
Subject: [Buildroot] [PATCH v4 11/20] package/python-rpds-py: add host
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
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
