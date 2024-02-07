Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A704C4829C
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC88383B53;
	Wed,  7 Feb 2024 15:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLBfsTjUUpRQ; Wed,  7 Feb 2024 15:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EDF683A8E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EDF683A8E;
	Wed,  7 Feb 2024 15:35:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 260991BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00A33404A9
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JbZjfa5-yoGF for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:35:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0F6B40970
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0F6B40970
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0F6B40970
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:35:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40fc6578423so6710705e9.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 07:35:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707320122; x=1707924922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zS9ZszUp4HGXBRYpQsY3vpNS5HRujJ2BtOJZVRsQ0Sw=;
 b=YheowaiBXymw/uHrEWyN0SwtpYzcaY2ChviR9jsEprQbsD2HI92gvixR93jWjFxLa7
 Zr1FZNrOVa9ieZSlg4iZdr44JoH1B52PqNmJ4mX6vD1Fd3ONJihS4eP8rvflCqL4yJoB
 9fVCgRMtSQd+pfIs+jzFCfXSr1Ns8IGE9SmndqZdRzOYBxezMtZ1c0rTUd02y+kjl0Bw
 33SLjUeTjwV3tcjcKbBcMpJvWuKdHeS6BN7gbGnJm/I99zzINKPQQkBTigZSaFQ0KNyZ
 BFAXYZztfay9EO7q3HGDNCE2n/Nq8nmW1oCLKCKAoT+RwU4+A4pYC7wwnWBzFDUWfLDB
 VkJg==
X-Gm-Message-State: AOJu0YzZPPBxCzu+pn+PZB3pOU9dQ4hiexZS1a7oraGPQARUPU2mpLeb
 mSLaYEZdze17x05f/2BIk7dUFqnQERIR0ldqO9yR0DEcQG5ketY6HfcVyY4bRYvzPt+0LaeCSQ+
 8
X-Google-Smtp-Source: AGHT+IEbcc4WY3NKKdgCCwQHnmBFgGzaObYHfTYI45a1vBsmwqmju3EIQJqGHCvRw6LtnNcYjE8yLA==
X-Received: by 2002:a05:600c:4f90:b0:40f:df20:3bc3 with SMTP id
 n16-20020a05600c4f9000b0040fdf203bc3mr4851200wmq.3.1707320122019; 
 Wed, 07 Feb 2024 07:35:22 -0800 (PST)
Received: from arnoutx1.. ([85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b0040fddaf9ff4sm5703632wms.40.2024.02.07.07.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 07:35:21 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 16:35:19 +0100
Message-ID: <20240207153519.657048-3-arnout@mind.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207153519.657048-1-arnout@mind.be>
References: <20240207153519.657048-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707320122; x=1707924922; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zS9ZszUp4HGXBRYpQsY3vpNS5HRujJ2BtOJZVRsQ0Sw=;
 b=aKpeSxrfcYTQ9EpZP0izcI9LJiPkpORuJ66i6fWwAdVhSqunYIKHbFntIOYcQQzpEh
 ZGBDEyl8lVP6dAQ9aAzvvadsttQZ6tv1CWM0Nw7/Z3axB4O87Bhb/Mm0HWBtNLjz/0Rj
 4l/Eg0Aj9yes/omm4SyH2tDKfOPV7/x2+TZcLoW62KVswlYOGEjmdmcWESN6zhiJzQ+y
 /KkeT/cXBDhvOCaM06+hUyaqfAeKnZzMQynQ9rAoRQ6H2y0Xmqtt+bn8o5wP1XC9zErL
 LdjjXXCO1KFRmM/TsaJ6Ud0KjOaZ1JsTdq2zd9meu6b+HEL+Zik6iuML7nfBdvDUvo9E
 8CpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aKpeSxrf
Subject: [Buildroot] [PATCH 3/3] support/scripts/cve.py: start in 1999
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When the CVE lookup was added in commit
4a157be9efac8ba8888e4972f42eda213077152c, the starting year of the JSON
files was set to 2002. However, there are also CVEs from 1999, 2000 and
2001. It is not clear why these were skipped back then.

Set the start year to 1999 to capture these old CVEs too.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/scripts/cve.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 46c384955c..f12a8048cd 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -40,7 +40,7 @@ except ImportError:
 
 sys.path.append('utils/')
 
-NVD_START_YEAR = 2002
+NVD_START_YEAR = 1999
 NVD_BASE_URL = "https://github.com/fkie-cad/nvd-json-data-feeds/releases/latest/download"
 
 ops = {
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
