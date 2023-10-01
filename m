Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC679E748F3
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 03:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CA9C8299E;
	Sun,  1 Oct 2023 03:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CA9C8299E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V1gPfhBwRar1; Sun,  1 Oct 2023 03:43:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 414958291A;
	Sun,  1 Oct 2023 03:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 414958291A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B88171BF5F5
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 03:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E2B541EA3
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 03:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E2B541EA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Et0kZWjg2vU6 for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 03:42:56 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7026D41EA2
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 03:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7026D41EA2
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-690ce3c55f1so12182715b3a.0
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 20:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696131776; x=1696736576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bswLeC08Fijnm1eDSvnsgi/dtc7NI7sNBVgqWs3Gt/Y=;
 b=ddrj+j+nTKvheAMHm4mnUD6or1/Dwr+08k/5Qg70na8TrVqi9M2NiTRmWCJMBIduLg
 8uSkNF7/0XvwB9lwjwLcO1eLGEzMLh8rBqgWTmJGgyrOj1FGXD0RUdbcajqfmAF3OLts
 srOyMe5brrF+GQCUrgx2sbzMiUXpGYSpsBs7LxmTihTbzzfqef0sarvX96Lenbwf6Vk2
 RlxzFV0y6pe3QY1rFUia+NLKO9dCyoUh+6PCUDCPIfFmDeduh9KbQlnnQXARXDW84h6a
 Z+BZhZ6ji6B0H/Ck/PY/veXz6q2kaEEWMGwxImsgZia1xJoR73LnCZrlQxa9WaEjrDS6
 eNTw==
X-Gm-Message-State: AOJu0YzvPtnTlJSjE3MbHYAGB7XEE8COFsTcIi/eOmdpy8N8sGpVKneK
 nGSJO3Y/CmeZ6tnQbMchSOPw4Tm48SHB8A==
X-Google-Smtp-Source: AGHT+IEsxnSh4sM5YnAZrKImwJ2IOscC+mC1NhDiYY+nR5oaXqLXxW9gwn/ry5geRjofMYGNdoT3JA==
X-Received: by 2002:a17:903:22ca:b0:1c7:56b9:eae with SMTP id
 y10-20020a17090322ca00b001c756b90eaemr2370305plg.32.1696131775640; 
 Sat, 30 Sep 2023 20:42:55 -0700 (PDT)
Received: from localhost ([2400:4051:e000:9e00:976f:4611:4b54:1f71])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a170902ea8b00b001c5c370d4desm13117043plb.246.2023.09.30.20.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 20:42:55 -0700 (PDT)
From: Takumi Takahashi <takumiiinn@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 12:42:46 +0900
Message-ID: <20231001034247.14022-1-takumiiinn@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230930190610.752987-1-takumiiinn@gmail.com>
References: <20230930190610.752987-1-takumiiinn@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696131776; x=1696736576; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bswLeC08Fijnm1eDSvnsgi/dtc7NI7sNBVgqWs3Gt/Y=;
 b=ioCWgtYyC5UNt2pOikbXS7PZW5fahgKH+Ekdeoh79TYn0d0jijoD3RHS8wZ/4htLkw
 ESSlNXEO/eNlyjh8b0bFlu8IhgkZrkuGTByFmUSGqBexqqLnGrr6vDcbdu6+aPSu3+JX
 6APVuP5cQAU7itLIn4C7IqFG5xzCBpeabNOZHc8ytae0m9wRX4KgIblbrrN7D6arAUE2
 D722ZUCWxTzXAGA6x3oLMRrGqw4OCQTgZYYydhfGjL+KTngLU6YH/9AbICogxdbkd1qy
 CQ9r1VOFbeGCRjnfIzbExBbiE911XOYEBCYcitN2WyTO0a5fyf3mkeSPuU8TQqHk1Pos
 A9Bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ioCWgtYy
Subject: [Buildroot] [PATCH v2] package/python-pygments: support host package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Takumi Takahashi <takumiiinn@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The reason this patch is needed is because gtk-doc requires pygments.
The final goal is to submit a patch for lightdm, but since gtk-doc is
required to build lightdm, pygments will also be required.

Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
---
 package/python-pygments/python-pygments.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index f151f0061b..e6d5ba25f5 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -14,3 +14,4 @@ PYTHON_PYGMENTS_CPE_ID_PRODUCT = pygments
 PYTHON_PYGMENTS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
