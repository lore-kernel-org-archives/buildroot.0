Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E25EFD238
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 09:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BEFA83C55;
	Wed, 25 Feb 2026 09:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dgLAPbHZHzMP; Wed, 25 Feb 2026 09:48:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66AD483C63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772012911;
	bh=/49UXzTmVyh8A8fPkKJx2cc6i0+/pk5Eli4UXjIMQLg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=W0zh9DO7dKowyM0CbdQA93aCE58WJdSQlEAEvC1jIWd5s9IfighTlJfq/OHdfjBdo
	 fyA0ig3dVVrhUt+NaMUYkNAbhi52JQURqI0pDhYky+TorOpi/DHZUHwJGMXazgD2Oy
	 tOkkdgT/LL/xDL41O49Tu/i2EGyQEcoQXDqWM5L25n1+WQ0kWMm8SVk1p54KyWbGb+
	 wXOC3yTmHzFDPfoR7z/fE59S1lQ2+Px1mCEajtPEs1kCVtlgqaLOh9sSXsl8w87SDQ
	 GDkUZYzAbK2RrgxytjxiMFmjsFKcVNytKWTIoCrLRYf+tBBXns4KMsRwA7YZ0zvWaa
	 N5A5+hK7Uqidw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66AD483C63;
	Wed, 25 Feb 2026 09:48:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0543523D
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 09:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF3BB4016F
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 09:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3psvKV7aF9gq for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 09:48:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B9A2F400D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9A2F400D9
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9A2F400D9
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 09:48:27 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48379a42f76so49559835e9.0
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 01:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772012905; x=1772617705;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U9gmXmGw0ZFdOqkVKI61f1G+rSGn2Naz6d2DdC1h+ZY=;
 b=p4WBZiy9ObdgAOJ4y9HeJ2I+ZGnqQCBS6vnZoPWX7cmplvD+LNYfZXoRlpd0ghi4/M
 5E/e2fb3PPG30JP31uZ7ZLqCun3yuHoPiRJT/s9ih2CpBE6Htltvkmc981OzU2xLOtf9
 qgHY+U5MRqRChYIP2whNopG65SNnCIhw+TJl9CTKxt3pLTKEUmuFPrykUnq30ToG3+ns
 H3r+IzPZ05XwSWFbpdbsv8Jz8MfpjiFhwv+JoTv+bWnUpa4fv3dKBy7oTDkG9WboXHdu
 j1EtYpZpDspElIPZmsmEqrrcjWshYOOx3bB3q88u1rdRGgaewUW7+deeYSc+0nHpAE1y
 ugFw==
X-Gm-Message-State: AOJu0YxElgMyaR2PUmMf3O/7Uqlx6rVGZ6dCmF1AECnEilyuEkDbqb4s
 8IhZX36A7rn9moD2ZALjGwiZdTZbJNStQehLv/DZMNoVNg0GuEICBjuEVsXJ30RkJm6a3dy3NQ2
 LfGzb
X-Gm-Gg: ATEYQzzQxsoMlAsFKOsIgnZZYEF8M6jOKXAdlkH2yyO3+hidgKL4Ys9ab9thjyubEHN
 DtdwHCdRqTp5rA5FdTg58FrT7HCDPo6PgB8/SnaYt/ugcQg7sOM2YNnv1kbDi3LVYqv/xD5rU3v
 0twBdbUMJ4MBFwtsWGfg71BbcwPpIUcE2yV4UC/lEJPkq/ZNGpN+cqZ7Nym675WMRD/rx7z5jFZ
 eHDQnHMLpqKLYU0KAJuu+6blZF2wVve8CPgZxpR/jI/zuMiijjuKKxbzGcT8yox+dYtTK0rZU24
 f+1HEuv6K3DDePkG2Jw2yeB/mEhtJm39Ahcb6tYa2WI2GA8VWzdnEy9rn6vKKxxfqk6HKj5rdFr
 Go4uP6O9srkCxvCBU963xLFZopKTbJNHxYSk8bGGvbn6/SMw6P9PPAqQTXokJ24Jm5ylihJGb+P
 +wfi8KGHLWJmoUTvqepclT+MoZhg==
X-Received: by 2002:a05:600c:3f10:b0:480:4d38:7abc with SMTP id
 5b1f17b1804b1-483bef24711mr27307275e9.11.1772012904759; 
 Wed, 25 Feb 2026 01:48:24 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd72bd66sm55770795e9.11.2026.02.25.01.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 01:48:24 -0800 (PST)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
Date: Wed, 25 Feb 2026 10:48:23 +0100
Message-ID: <20260225094824.270893-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772012905; x=1772617705; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U9gmXmGw0ZFdOqkVKI61f1G+rSGn2Naz6d2DdC1h+ZY=;
 b=CqPPmOW07Tas9ud9P9ZUFm107pzLhI+ghTmxYJ4dTMBqW7YQzWjHKa1j4eBYh0uK2w
 LbDcYeXi44FcHHIvVJCVD5pcgKmvJ+7ozpEOCdXdpahdJ7FHp06TRVt5b2yDgVJxQPoJ
 /2eud+RZMUMEXix1tXAPVrADzThIMaisDGiH6VWcYmK0uQcBDgQvYhqkVZYD1LWrJ5eL
 pujSHGUOuPPKELaf1U1xosx5MLuWJLzM3e74D6tH9HgOo0KKe/ZYZ9a2FqzXbptMECET
 6NOqzkrUkOyw2pZhxb7/Vxrp3Px779MFjsOYZYv0ut65TfAJtj4ZLTnSHabnmCHuaibf
 cP8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CqPPmOW0
Subject: [Buildroot] [PATCH 1/1] package/containerd: security bump to v2.0.7
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more information on the version bump, see:
  - https://github.com/containerd/containerd/releases/tag/v2.0.7
  - https://github.com/containerd/containerd/releases/tag/v2.0.6
  - https://github.com/containerd/containerd/releases/tag/v2.0.5
  - https://github.com/containerd/containerd/releases/tag/v2.0.4
  - https://github.com/containerd/containerd/releases/tag/v2.0.3

Fixes the following vulnerabilities:

- CVE-2024-25621:
    Versions 2.0.0-beta.0 through 2.0.6 have an overly broad default
    permission vulnerability. Directory paths `/var/lib/containerd`,
    `/run/containerd/io.containerd.grpc.v1.cri` and
    `/run/containerd/io.containerd.sandbox.controller.v1.shim` were all
    created with incorrect permissions.

    https://www.cve.org/CVERecord?id=CVE-2024-25621

- CVE-2024-40635:
    A bug was found in containerd prior to versions 2.0.4 where
    containers launched with a User set as a `UID:GID` larger than the
    maximum 32-bit signed integer can cause an overflow condition where
    the container ultimately runs as root (UID 0). This could cause
    unexpected behavior for environments that require containers to run
    as a non-root user.

    https://www.cve.org/CVERecord?id=CVE-2024-40635

- CVE-2025-47291:
    A bug was found in the containerd's CRI implementation where
    containerd, starting in version 2.0.1 and prior to version 2.0.5,
    doesn't put usernamespaced containers under the Kubernetes' cgroup
    hierarchy, therefore some Kubernetes limits are not honored. This
    may cause a denial of service of the Kubernetes node.

    https://www.cve.org/CVERecord?id=CVE-2025-47291

- CVE-2025-64329:
    Versions 2.0.0-beta.0 through 2.0.6 contain a bug in the CRI Attach
    implementation where a user can exhaust memory on the host due to
    goroutine leaks.

    https://www.cve.org/CVERecord?id=CVE-2025-64329

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 4ec78897d9..0916c603bb 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  472747a7a6b360a0864bab0ee00a8a6f51da5795171e6a60ab17aa80cbd850a2  containerd-2.0.2-go2.tar.gz
+sha256  2bbf9fedcf4ab31736fcb3ce224ef22610a87da9d53bbd8f6d205710fd849831  containerd-2.0.7-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 2ef70ab5d7..a334f0fdac 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 2.0.2
+CONTAINERD_VERSION = 2.0.7
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
