Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE42D2ED0F
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 08:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DDA5857C0;
	Tue, 20 Jan 2026 08:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQicm75RoN-H; Tue, 20 Jan 2026 08:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50B0E857C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768897454;
	bh=UhE12FQ/7QmwVa5XmAHVyWF4SMcUefvWcyUupdeg700=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dGff/AnIlGH1O6QBcMc/RuD8mGVgV9KcQvc0T69RnhnExFc2645O1HzcryOd+++fs
	 YSLOdBahuCRGVZa2bR9RRLTVChAYUHN3f4coevZ1+d4JpbotzxA4D4tRBESomIriXU
	 t8P3XjM8h8wSDIymZZm+5ryV2GrzWlpI3SZauVzjb4oG4TZbbGmC1AwzjBSOeSuytA
	 2pzZBBTrV1jt8rU9U9e4Vcdjz5SoIcpyE4gweTKWBywj0ru+w44gczBDIwsS3McFl5
	 /fGr9I3svYL7eDbT8LnrQf0A4YGSsvYDudQI+96QTR/jw1nhMtAyXt1cduFGSq+y/f
	 i4vdEtFwJaxpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50B0E857C5;
	Tue, 20 Jan 2026 08:24:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 498F4160
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2C854EE14
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXclZTd3HDkr for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 08:24:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 386854EE23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 386854EE23
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 386854EE23
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:09 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-64b608ffca7so7744300a12.3
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 00:24:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768897447; x=1769502247;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xMhMz41Bjfviaeh6K3zRJsQHqdPuHn4OS5yKEbTgl1o=;
 b=p8Qg1zxS616jLlyZhQWocuQJ4j0JdI0X6vAQ+MfHKHHv7ZhKvTxbPyd/S0jgoR6GPM
 BKrIIlumTa0koyio2opAprpKKvsCrcbMUnFmaI/oobiCVInbSE/WfzUNqmop98p5oi+w
 31ER/GrizqRqqtrrlofuv5dCzoBnIfciwnSNDhhuxOKFwhaes1t3D69E1yOvrwR1mjhS
 yiJjF6MjP6NFtaN+bfFtyj5N/rCdZg6svmesCHj6HqsWo1cbSRoTQDPOqQ2hZQ88fFHM
 A7rGuWuBCNRodSfn8lB0BrjKs3zoXNhOscq5OTCK0WS/eaSaTHu9RKw+qEtwLXKBA4yS
 /KGA==
X-Gm-Message-State: AOJu0YwOb3BDNnjQglloD4xz2ZXX9IF+vxlAu1eKbxZ1T1ZGmWKV01Pa
 pJPlmftK4WaiYddzK8mvmqxszUWSupD4HodJ+bICc/rc7ESvD52A2tvvJd9nDBt2mPd5eNWcW6K
 ADxSG
X-Gm-Gg: AY/fxX4jS7nhHdzlPbIe3q1BUftI6IX3oy1CG35Xnnzrit1zHsqKQIe9AUFgYFU2bBW
 QWTfp+GjFjp3tOFZQJ/JaG6Ir0ARyISEIUnwd8DLmu2V5eWvdDMIsZggzUfgy/38AvxQIYonryy
 VnX4aKB3zugN8UfSK7dyq6Ypzi5PY+DGKy56yeGLHw1QXwpnRswNsG9kQ7cpOqmXIm04HJ0sYOM
 oB1uQR5NDWSpgldFvvJz45CIcC/WnQDPAFmbIsN1sG6BWmZeUjnYqPV19WITdw03DuZMQ+bKt3Y
 SIu0M7mHGNjMsq4C5sMTFLSu3ko8awA4Ra5cX7C5amyTCVkOMTOidKn5zeAWTHudtiQo1Kqz+CP
 ysgVREgGhbMluMV/vb0fT/kwBF5rdkj/6SIS0u/DUC27ovLyZQ1EEsikAIYyu3IELPdU3L8906H
 /jbv/lxMau6HoXVcgD2UPOey+la5KgHXvuovk=
X-Received: by 2002:a17:907:6e94:b0:b87:2bd6:6bc3 with SMTP id
 a640c23a62f3a-b8796bb0f1cmr1214601866b.61.1768897446860; 
 Tue, 20 Jan 2026 00:24:06 -0800 (PST)
Received: from arch (94.105.116.200.dyn.edpnet.net. [94.105.116.200])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959fbefdsm1307568566b.55.2026.01.20.00.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 00:24:06 -0800 (PST)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Julien Viard de Galbert <julien@vdg.name>, Nimai Mahajan <nimaim@gmail.com>
Date: Tue, 20 Jan 2026 09:24:00 +0100
Message-ID: <20260120082405.46683-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1768897447; x=1769502247; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xMhMz41Bjfviaeh6K3zRJsQHqdPuHn4OS5yKEbTgl1o=;
 b=TbnHvaLuZzsvUO5ancS900iVWSwFl3KR6ZwbzqdnZcO8J/0GtO6K+YDlk/KN47dvwB
 QMPc5tf+BxEHlEOxUoQQOAcCc5dYrpK4f5r3B60EHlGdxn7CCx61prFJ4S9SiNUSNMDG
 P1DL62+D5brMRnA3byHsFo7vVsvHKjCqLXQGUZcE6cjHuBlh6cF+16LUkyx3GZijdNh5
 VKD3H3VExtQWV1eRN1O/jYOI6D6FVO9AWR9AO1etb7x4Afxjl1RddGcLE3Qd8uVNIj4g
 PaH8tcBqk20+tjnHMt8SIJRbir36i9nzMc+p8eao1h28IJ1ZJWN8XznjrRQFejnbKE21
 /LaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TbnHvaLu
Subject: [Buildroot] [PATCH 1/6] package/docker-engine: update CPE
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

While `docker:docker` is not marked as deprecated by NVD after a
scan through the CVEs the last entry for `docker:docker`
is CVE-2022-34883 [1]. Replacing this tuple with `mobyproject:moby` that
is referenced in the upstream project GHSA [2]. The last entry for this
CPE is CVE-2025-54410 [3].

[1] https://nvd.nist.gov//vuln/detail/CVE-2023-5166
[2] https://github.com/moby/moby/security/advisories
[3] https://nvd.nist.gov//vuln/detail/CVE-2025-54410

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/docker-engine/docker-engine.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 37d42edaea..5fe225fbbc 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -13,8 +13,8 @@ DOCKER_ENGINE_LICENSE_FILES = LICENSE
 DOCKER_ENGINE_DEPENDENCIES = host-pkgconf libseccomp
 DOCKER_ENGINE_GOMOD = github.com/docker/docker
 
-DOCKER_ENGINE_CPE_ID_VENDOR = docker
-DOCKER_ENGINE_CPE_ID_PRODUCT = docker
+DOCKER_ENGINE_CPE_ID_VENDOR = mobyproject
+DOCKER_ENGINE_CPE_ID_PRODUCT = moby
 
 DOCKER_ENGINE_LDFLAGS = \
 	-X $(DOCKER_ENGINE_GOMOD)/dockerversion.BuildTime="" \
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
