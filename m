Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC09C43458
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 13:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43445410AC;
	Thu,  9 Jul 2026 13:17:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MkNT2Er0Ekm; Thu,  9 Jul 2026 13:17:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B99F410B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783603051;
	bh=JnjzmDJZJYjmILIUP7I+N1+xdSiZ58OM2ew0JQ5dNNA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lEqgd8+FxX1uMFUx2JCw4W5RLWJnIcNpKBJouNS6CtFZa1kKZcDDhjsQOj4EKiiyS
	 To9eyDAw8ZDH6KYESeucE8qIt7V0nLTUx286QkINzSS9M2+jPgeCKggyTbL78gATSs
	 v5Ec4u9G+oEkiQaAKvOrl5G5mHdUolKRu7bjmHATSE7a6wWILWVGxCBs+TrlHWkxpH
	 WtSlSJKbxHAkpGm71PoDNRChp2Qt1faV1RTWw6abpKL1VMCbT0aV+f/E5OHahn/dMV
	 T6AkfphcPLGzZH0dhAImXYCu+EevdKekKf/0KNjqrXCJ4/sL0XL+OZetX6DOR+vCbW
	 1j484mUASU90g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B99F410B4;
	Thu,  9 Jul 2026 13:17:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62352320
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 13:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53D3E60FC1
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 13:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Ew41okAZdWa for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 13:17:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69B3B60FC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69B3B60FC0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69B3B60FC0
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 13:17:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-493b61b52b6so17433955e9.1
 for <buildroot@buildroot.org>; Thu, 09 Jul 2026 06:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783603046; x=1784207846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LSf8uTzIxo6g3xfIyBRaWpXZcj5EWH6DXszEBysF08k=;
 b=eCL0a7vhD98Bv5GjCaJkTmEO/xhe0iRd0H72bO1FSyFhfWOY7KCqloZdGpicD7ivLW
 Av8spQMpFAloXSexa0JAxVyFsvUNUQr942Dn13riiBzdVDxzwBbaIT7jfV9Niwhqh27A
 4Ilzy2J3q3YfgPY9gcssZuo/Q3FUEgf28jj535qH8By4N/bqiR/PQnfrxbZRjK3dRLK2
 RuQa8HTMNIIfljV07OlG1urdFgCx0RctZEYGYQjdmihjyXo1Rc9l7Y9ULJmiXJKIPrPx
 qqfyL932czdHtiL8VqZbeJyU2m/kbsWMg5quG1vXDMBz65qkipD8YFZ0esIyaSi8UBsI
 q0XQ==
X-Gm-Message-State: AOJu0YyqEn6ngFTJuLVUOVPUmFIzrEjXJE3CncaMsDsiOBjIxObOD2dT
 73YEQQvzYf2Iu+05bGPcbmq8pR3wYzKi6eEPzBGsHu/xhXwqBXcnSMy/kL5J9w3nKwDeUtAVQ57
 +NvKub0c=
X-Gm-Gg: AfdE7cmmKLAG1kH07DRe7I6Z6E2KYvA4YNvwJOMn9nx1S9H/ovICrxOSdfxihNolWUt
 de3ED/aiCokYVN4QtD7ezm936uGTm97GhTYx9dyp6CBNaWDRgmuZlVe6GW+hf7ckWPj8kNQUp8k
 F1arHnmqaXUxL0xT9HxxmJDLsuJKgCRgPTqI8Xanc+iTC5BMt/bZ0zTh+uHiOIxDDPOQhewlrTP
 +5Tub+qLN//On+KfyD2x8zvhSPeF6MC/VH3fePJ2M/JYN1QwjpVQaaoEFA7SrypIpQnrN+XoLRp
 O+vIKFmPYwrCj01QIGRurYbf7EdTbXveMPqabFK/XunvVn1lVlPGKdc+TRe0P3vB887dHQZ7lQy
 V1EVQtF0DLNSKXPAZcQrshDF1yS2auTh5/suI5rcjJx0vA9aZJMY5Y1xgb+mI9TipfBII4geapq
 O4ewuzML3FvFZnUeOXUrpYavF9wFg2ZOr0CiOGz6AIF3svMWeJHrDFx3L4nP1GHfhpZdKn2w7od
 z6huV7BHo0vXmyinnOwDaZATU5T+gPbf5pUWGH1Pe0ZV+8aJWYFYrY=
X-Received: by 2002:a05:600c:4e11:b0:493:ee2b:c876 with SMTP id
 5b1f17b1804b1-493ee2bcc04mr19933845e9.35.1783603046189; 
 Thu, 09 Jul 2026 06:17:26 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 ([95.236.93.155]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6cccfdsm61486195e9.1.2026.07.09.06.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 06:17:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu,  9 Jul 2026 15:17:17 +0200
Message-ID: <20260709131720.1250301-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1783603046; x=1784207846;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LSf8uTzIxo6g3xfIyBRaWpXZcj5EWH6DXszEBysF08k=;
 b=A5kkFCWj53FbDpHXa4p++/U1vtiyDnurObk0qywNZAAwht3wUnti5qoESQOuFJt0sI
 UAguM7qBwWbkTdDx1jq2/ys3VolTkz5jIV3iRuqNUAoJVIWLDVpqKsaqNxX7HKzeGcVt
 A4GmVp/a2b2LB+gfq8PmEF29UIw+1sW8lf+fc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=A5kkFCWj
Subject: [Buildroot] [PATCH v2 1/3] package/p11-kit: allow building host
 variant
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v1)

 package/p11-kit/p11-kit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 68b189418396..1755edb64edd 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -45,3 +45,4 @@ P11_KIT_CONF_OPTS += \
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
