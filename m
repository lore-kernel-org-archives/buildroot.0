Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F35CCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 12:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85CCB40348;
	Tue, 21 Oct 2025 12:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOFqJDbQ1SA4; Tue, 21 Oct 2025 12:04:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9504540367
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9504540367;
	Tue, 21 Oct 2025 12:04:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA4F843F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC370806C5
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbQZhxEQ5lF9 for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 12:04:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF3C5806B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF3C5806B7
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF3C5806B7
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:03:59 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso38955135e9.1
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761048238; x=1761653038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CgKpNg6jVKECYmUNJGWEFkbWI/UbudCOLMFQq0KaWvE=;
 b=sObhXqqmxuhWaQZC2kGHmPJrMZraSJ5bH1PtdJ1rWKCitMmDGHK5ht8ZAOiC3HwNYh
 E5xge5lHwEVZeyhSJKn+5iOeolLBPejA9QQgQvAvcbygesl+J/PqNKjFzsRLZa3CIWlF
 /w+YuMYQs35KDO0RWoki8DUB8KTfnmXSkr5Ti6+fVqQORBH6sv7LOJVcnQFfm+06tg2p
 QMzfMlo79UlHMjHQhmeSUC+QXJ4B8Qf/jGYLuwfyDvuqcYtizj/Yao3RN5VBqsQwhshF
 rRjhzU6gwnbbu/Tq/b75HNNjME67vhK91BVfTFdKq4z3sTSVSneUy+rhP+6AUPxvRHW5
 e8Tw==
X-Gm-Message-State: AOJu0Yz5LyaQTx+TeqoT4vh8o8Cxwu0kcjjGmUdPTEgrNAkWk4DBK32J
 G2VQgFjb+56iD2MOVvsqtrl4MYRBWKQGlTIlaMSr8Y0GmHbyIi2zvG2LOayyUw==
X-Gm-Gg: ASbGncsI0bax6l6Se5XlwwWdbae4b4FWjPddm0ftJ1qGIk7xuAB627RmpU761VNvRre
 Cc0nMTDbP/MBnxL9zjiAp4z5wZj/NqTM3dueDfcmcjrR4oh3i0o0tX1XsDM+JJ2j8On0OcDwRo5
 9JiAm8tPQY15wZS7dbmbnugHrniPHoyuN8Td6J71s0PPlSuxlqMWjmtr2HLndFwNjnUz66U/klk
 CdymZxLGZFqqKGXgwh5vLIj4MdLh3UExDmMAMFjPWTo5PdpGBGQ3vAsb0tKmxR29UxL4L0BcQ3y
 6oa+SC68orUkTrsNPJJNHKbtO4TPyAQzWHQIhYGE8ndxC93AZr4VEUFwnhv3xH2HQFpGZAugtB7
 GDJeAjGa+NeapzGEAuEXxW2Qi9sTgMr3YFB96hc3xTCjcslO8BWWMJN+hP2qCVRcKS1rx4sYhE1
 VlUQ==
X-Google-Smtp-Source: AGHT+IGa7nKvR3yJ8Rjii72f+YRD/177cBWSwPJJa519kdrFCC3529Pn6DFMvgkq5BHWIv2heo7ETg==
X-Received: by 2002:a05:600c:4e49:b0:46e:1a60:c995 with SMTP id
 5b1f17b1804b1-4711721a463mr129774115e9.2.1761048237292; 
 Tue, 21 Oct 2025 05:03:57 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:7dc:f6df:77e5:8474])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471529598c9sm192462405e9.5.2025.10.21.05.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 05:03:56 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>,
	Maxime Leroy <maxime@leroys.fr>
Date: Tue, 21 Oct 2025 14:03:38 +0200
Message-ID: <20251021120342.483933-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021120342.483933-1-maxime@leroys.fr>
References: <20251021120342.483933-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761048238; x=1761653038; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CgKpNg6jVKECYmUNJGWEFkbWI/UbudCOLMFQq0KaWvE=;
 b=evKg9FozlmqBJHn0SDdV1Q8K7o78k5K/dZoRuY/h7x7TpCChKwyLKvafqdQ9IZ2mjn
 2dR3TQiMkw+me2hy89ztp3MeIIU9n9qGnG8icfSd7WAS8GwANu44GPd+7msFCBkUIBNA
 DEbcSVjzinFHktBOxWVn19PCEon01fX53tDK+WT1Us+KC2FN65bJ3/omQhOWWFZrLOS0
 bkCBgc7FOEO9Vc4yZXyert45CppRXEOCR7BtREn/kLFbk5ohvbPW2PtwBs6y6IsZt9xY
 F9Ck45q6dRaRJScqAcLqRxp1WHUKW/q4i0ypHhHAEiPds93+NV+ByfyP2wCAs3MGLnDQ
 E9zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=evKg9Foz
Subject: [Buildroot] [PATCH 1/5] package/dpdk: bump to 24.11.3 version
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

See the release note of the new versions:
- https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id1
- https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id5

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/dpdk/dpdk.hash | 2 +-
 package/dpdk/dpdk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
index e9a22736b0..5c9fd7c087 100644
--- a/package/dpdk/dpdk.hash
+++ b/package/dpdk/dpdk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  bcae7d42c449fc456dfb279feabcbe0599a29bebb2fe2905761e187339d96b8e  dpdk-24.11.1.tar.xz
+sha256  d5ae4cfaef05d6aa491af643d61b83d840e53ced96f9c9f60fda986313ed84b2  dpdk-24.11.3.tar.xz
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  license/bsd-3-clause.txt
 sha256  e19808bccd90c238fac06da2fc3683e094c64f7ba647e9d86f03a98cf5f2ce05  license/exceptions.txt
 sha256  6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  license/mit.txt
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 0cbdc67e87..1c7eada937 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DPDK_VERSION = 24.11.1
+DPDK_VERSION = 24.11.3
 DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
 DPDK_SITE = https://fast.dpdk.org/rel
 DPDK_LICENSE = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
