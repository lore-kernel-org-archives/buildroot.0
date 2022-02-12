Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86705C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 12:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B3AC41503;
	Sat, 12 Feb 2022 12:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kbkzkvlimBvx; Sat, 12 Feb 2022 12:46:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50431414CB;
	Sat, 12 Feb 2022 12:46:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95DFC1BF84C
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 12:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84C8A831AE
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 12:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BiRmq3U7CPQC for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 12:46:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81BBA8316F
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 12:46:45 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id y22so16114890eju.9
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 04:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TWTHwpA2L9xUhBWRSV89GB6PyFQKjkzETRiR+vnBCtc=;
 b=UnQyBjd7RukdLv4A+JnAS6clHLmnN64VXcRhjLUW8aNA2GrxSLXch+Ug56BRzilq6+
 67bCUPGdYDLxij0R+YMvW7bmfEzhxQjBLvyGgWO8TMT1Hi7j58a0Zjd22GmVMvHiO2pT
 u10SgIZnPp+UnZlddg3c4xOOQhfNjJ9tBfy64CQwg1vDPzgnvVBAseFasLmUtvpfqOYN
 yUBCEG5llUYewfESWaFM5kW9d8WrmUylIoafslbKIVx3uEh7vjnDcAbXV1MZdYwqK7fW
 X5lQxojrvq2qf9+CpjB3TiuQPL10MhO0kMtpOVN8M64A/gl2rwW3mr4kho3iR1V5zN2B
 px3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TWTHwpA2L9xUhBWRSV89GB6PyFQKjkzETRiR+vnBCtc=;
 b=CTm6IXbS3yNjzU/cuZb69qv1LdWfJ6Wn+rN+1cgAjp7pIkqERYvkVXuq0jVX+5p/ba
 0Rev7ou99e79UxsaT5MOGDzKXo/CNa3kAkhzByh4loiTT6Mqw0yk/TOonPF3Rxdth/Um
 snw+aHOtg+JFVgV28ZYvMkt+wdUX/Xrte28amv44mk/67HTHdYmGvf5yUgbA/u/N+Bcz
 i9L7uXrWOoiPGsgF4ywhFqMkp8EkaFr/GV0Vlw7hW4KEzb6p/p0nhLj5mPOeqYN91bUH
 Hi4shYih9/+ymNtldwoxYcxk1Mr2mlHL+JP7HvJOsYVeNyRte0bwFvWZaWiGz9XQvCqp
 SiCg==
X-Gm-Message-State: AOAM5305GePKar73HzY9O/KklqXRwvSIIJLFy0hK1vd4n7oy2loBHao4
 QaPs8zg0T4OzXkMUa11Fpcv9Znh/YS5BBg==
X-Google-Smtp-Source: ABdhPJxluUBJVlhfBloVowQ+Ch4R2fpmjMazUaBShZGWz5w0H+GWm/xFe3PpcLmezNxZ/ENr6UQmCw==
X-Received: by 2002:a17:907:3f14:: with SMTP id
 hq20mr4908430ejc.68.1644670003297; 
 Sat, 12 Feb 2022 04:46:43 -0800 (PST)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m17sm65915ejn.118.2022.02.12.04.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 04:46:42 -0800 (PST)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 13:46:34 +0100
Message-Id: <20220212124634.3148041-2-arnout@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212124634.3148041-1-arnout@mind.be>
References: <20220212124634.3148041-1-arnout@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-regex: remove outdated
 comment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python3-regex no longer exists, so there's no need to keep in sync with
it.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-regex/python-regex.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index a90fd579ac..b93607e40f 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-regex/python3-regex.mk
 PYTHON_REGEX_VERSION = 2021.4.4
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
 PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/38/3f/4c42a98c9ad7d08c16e7d23b2194a0e4f3b2914662da8bc88986e4e6de1f
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
