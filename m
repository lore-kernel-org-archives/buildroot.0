Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2838E784AD
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 12:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F5AA41E5E;
	Mon,  2 Oct 2023 12:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F5AA41E5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7wej1tLLPX5L; Mon,  2 Oct 2023 12:48:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14FC141E6E;
	Mon,  2 Oct 2023 12:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14FC141E6E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D227C1BF94D
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 12:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8C2E4016F
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 12:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8C2E4016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SNVC5PKuRqDf for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 12:48:11 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C8BE40120
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 12:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C8BE40120
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso2217464766b.0
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 05:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696250889; x=1696855689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7gVo9U24z28RJQSja+zKvy6LUQaAMFxiy6OdgFDVe1Y=;
 b=RfHf/vNc29ci8iCiZicNQIQ93WO8xBMADXqDC4b8OKf7HFeJ7IeEb/ZYL9EtQLUUZ5
 RDdhHSz9DwYIxnILAGD3AGi0aLBKnwly7PNj02YKylGqpcpgmG7ti5HMN93Zv/c45ZKk
 ixUbe12B/9+pNnJOTgBJGoHxAjciT1/HipDKXzd+W0pHd4Xo0Lx66wF2WkqZqgkvU5u2
 uhGsZRzC2NWJYyGDl7pDFtwlMlYWbQ4TLtP5I43Kqqg8tokgWRN5YIkrtCCC58gi0NPj
 /FZeREFCWjgoJyKs4Q8VH5HOPRc3f0UuuBYl3JOkJ7+rY//q8QpEkooYFzx0HWcM21eO
 Ez5A==
X-Gm-Message-State: AOJu0Yx7bhk9cgnIL+aS8uIHR9UOOybm6mElTTaFh969SjEgZl96ptrF
 5j5Rc1sxuggfmFntxCuWPD4yyAlpp1G+QhyYrRm+jUVS
X-Google-Smtp-Source: AGHT+IEsbHZ6i+DFt78Kn2KfcdmyfVElDc83VcaETo0rgYWBjRxso9vktIQZ25lTmIFKpsXzs1pneA==
X-Received: by 2002:a17:906:cc17:b0:9b2:b691:9b5f with SMTP id
 ml23-20020a170906cc1700b009b2b6919b5fmr8832488ejb.41.1696250888868; 
 Mon, 02 Oct 2023 05:48:08 -0700 (PDT)
Received: from localhost.localdomain ([79.132.253.132])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a17090635c300b0098951bb4dc3sm16688189ejb.184.2023.10.02.05.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 05:48:08 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 14:47:23 +0200
Message-ID: <20231002124736.179251-2-thomas.perale@essensium.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002124736.179251-1-thomas.perale@essensium.com>
References: <20231002124736.179251-1-thomas.perale@essensium.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1696250889; x=1696855689; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7gVo9U24z28RJQSja+zKvy6LUQaAMFxiy6OdgFDVe1Y=;
 b=ExH9WmC5Ul2xhDMA2/c7Q5QrYPQzpAo6Fntk5TZxXxPB9p45wQUjJd5+PM4okUscFP
 WI9CIVISuxE0OK41G8g/395d/ffpm1AAA7g5Dfbi0sj191wUinwX6DTs8EDjAl2Ktpf6
 nZlDKZEKxjUgJ8CbT06kWXStoGvJXBXs25nsYru2i87csFUh4za9dG5U9nsjHHLZdMD1
 A5uboVMlDKfJQLyKfoH0PYWFyI/A4+7Y01MiMVo5vAgT00VbqSQ8YebOooAZGzYIujLt
 rmbvP9kinZoDSXN2++IhTBvHMGl/V1j2cIONZYL/NxBEsobUR7NO74CXhwhk6u2UjiLM
 xmBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=ExH9WmC5
Subject: [Buildroot] [PATCH 1/6] DEVELOPERS: add Thomas Perale for 'go'
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Geoff Levand <geoff@infradead.org>, Fabio Estevam <festevam@gmail.com>,
 Anisse Astier <anisse@astier.eu>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Perale <thomas.perale@mind.be>

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c45e7315da..4681b2a21f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2898,6 +2898,9 @@ F:	package/frotz/
 F:	package/kvm-unit-tests/
 F:	package/xorcurses/
 
+N:	Thomas Perale <thomas.perale@mind.be>
+F:	package/go/
+
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
 F:	board/beaglev/
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
