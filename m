Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D468EE57E0
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 08:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5136140338;
	Fri,  8 Sep 2023 08:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5136140338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id irN_PiZ9yUbi; Fri,  8 Sep 2023 08:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F69440BFE;
	Fri,  8 Sep 2023 08:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F69440BFE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8C271BF328
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 08:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 819CA60F88
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 08:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 819CA60F88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yRqSOFbwoANh for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 08:25:27 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3E4560AC2
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 08:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3E4560AC2
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2bd0d135ca3so31733051fa.3
 for <buildroot@buildroot.org>; Fri, 08 Sep 2023 01:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694161524; x=1694766324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yiy4lR0n4TpPOPTui6BRkuTjstSPoKCiX5KTtp4twac=;
 b=YfP5MoAmbodmlx0zX9Yu/k40qskeKoEBZK4Q7pT1nAjGaGyB7HubpJndRLlK0NZcvM
 ynkkNduui+IGawBW6AyqhmsvAfM3jMSozBRi0zNKodm62fixk3PFp8O3YadKG2Icq7x7
 Y96+Z8UDVnsd4704VaZY7L8kqQ7liO4uclQGNJe6zcg8VPXSzR0v175ZgZvwqWTnvIUU
 d3g2XBGwP2vw298V0C5UQEpKN47CVzl1cKCUhCzjMwapcDrXLs/Fy4tLG/1dhfNC5b8n
 yuIpx14A/UsCm25HnZvEdq0jZUXmH5zkGhi7w0YxfiITFMa5PGWqSqVwUOYjdojpiGDT
 MpyA==
X-Gm-Message-State: AOJu0YynS/ZuEgYiybgxhqusRopIOuWk2B3xxJBkZPeZJ0fWd1JyKTz3
 r1ZtPMaVuFnm3mBjENCTEnOezeH+hGXh7Q==
X-Google-Smtp-Source: AGHT+IHtGw7C8JNwOLyLUfsogGDfmyBq+KefHIBfsBmVIMXvRJ1/9aNZ8k76+xf9oc+6CSe1lvFOJQ==
X-Received: by 2002:a2e:8510:0:b0:2b6:da1e:d063 with SMTP id
 j16-20020a2e8510000000b002b6da1ed063mr1145956lji.45.1694161524105; 
 Fri, 08 Sep 2023 01:25:24 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e3517000000b002b9f0b25ff6sm217849ljz.4.2023.09.08.01.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 01:25:23 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  8 Sep 2023 10:27:41 +0200
Message-ID: <20230908082741.409005-2-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908082741.409005-1-marcus.folkesson@gmail.com>
References: <20230908082741.409005-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694161524; x=1694766324; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yiy4lR0n4TpPOPTui6BRkuTjstSPoKCiX5KTtp4twac=;
 b=McHg39bARqpOD0s1MWCTP0nf7dHo+1ygnfCU/7ZzFUY24Pe+/AXeKy/VuONMMn4z6h
 2AWy5OYyxO1lxLSdoRQZNAKAoF6FfNdASmk1Ld1TZ/rMkhsluQBkcvoZEt6fui4uzQO4
 YZ8WCugk5ycs6t5cH1VRqDP1h3a9niSrOLOeEfKDtkTbRiAjgrZXAr9OLdlP+l2eLmVK
 zX7zW7B/fsICXhHhl7kXM9Xcebgm1KuMa1X3LeiMQ0MtXV/IpxwZxQUbr5bKEM71lPCa
 uuKMZTbUfUJCOMv3f/RkzgOYXvFS7JYaAiY4TJPjasHEp4EZTAssMatXI7rH3fr5wyJ1
 BF8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=McHg39bA
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Marcus Folkesson for
 package/criu
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3af43d2d27..cf7cb9718a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2050,6 +2050,7 @@ F:	support/testing/tests/package/test_python_pytest.py
 F:	support/testing/tests/package/test_python_pytest_asyncio.py
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
+F:	package/criu/
 F:	package/libcamera/
 F:	package/libcamera-apps/
 F:	package/libostree/
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
