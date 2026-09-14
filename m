Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BBAC88E6E
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 15:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B48EA40611;
	Mon, 14 Sep 2026 15:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNtxC0bJTyDD; Mon, 14 Sep 2026 15:54:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D2EAF40602
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789401241;
	b=KN4JHsve+kl7Z48LrjEGHxLMioy3AdTNUTN3qr6I67UnRcTfQ0D7M7EaNNE/nYEo/6uA
	 KVa9dJ/yQpp/ZDVjqgJIx7DxFkp1K4q3NoqRjFfv0O5oCnKYnTOsgI4MybhtCni8hk+rX
	 DMFl5mnh9pV8TDBr8BJIjE2idClq5TX3i1DlZtmzePOVwuaMeKGcQN+U2EgRfnPXisM5C
	 A8nSrq4rffZ+sQwYMtgrFZqkI8FodkntI4Lj852qeCMoMP7k3B7Qgjeh+GFiwkHe7dXYh
	 CFXfA8LhhaGFlnhvRNQIfzpliH8kf7NqsaP0C+4TBRIUg7Rk90qBdP3DR9CwjUqHPGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789401241;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Organization:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZWzpKRYV3eadudxn7QqiWou6N2CscetqVMamSCVfh2g=;
	b=Z/PiaaNDLNuuuPksya0olVGPApCBB/6XdknBPkEZjhPqNIeQ5ssUpwAelMIG2g4P73Ly
	 RjWFppm5ildpwdhC6TqsJlhrQ15TekgQ+TmGPP5IQvNOoNK3WSAsX+xMFJ9QyMoOREfLm
	 MWQmlnIkfAUaG9Yh1QL8w3oHZMmHODLGH/m3FqShG39uB9rn81wfJHcpi9KsQM23CSrZg
	 LaHVZqD/gCYr1czeHsF+61CNGs8WqmzyvNIMnaOnGaL2e8y/OwEmZK/heWzfm+UY7VKPV
	 3PLpEEqrj/MI+5u2U/a7gtOG3rLU41nt3lahhaytbagyZNta/QZh7mCFy6Z6MBfWWOw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789401241;
	bh=ZWzpKRYV3eadudxn7QqiWou6N2CscetqVMamSCVfh2g=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RGRMzRgmJIodSZlRG6Ty1gLjBlTJiK+vzptdCAChUTi8XNbD0DjFsKVh2AumM7XMn
	 h0u6pkf0agEDv6M1ES8ly9ZKnVw1FEEvX5LzVvLriLHMk1KaM2w9b8fEtKui1dfPzC
	 +dTJrRbh3GMffMB7NifO+Pq9bs5AItIMnHgNELLcY/mFdlUJCc4mQxA+FU1qNX0rJ5
	 uaX1EGjXHFRojwh0wb1f/3AEKVD8+ZjEB/EXEZCkeog7gPAjNy8e/SdDwEEg/OJTvF
	 9cG/70BiQ96VYxjdqJBfaaHu6OArFQNUBuqlmeGVBss0RXKM/TvCmU6G2TI//XxKn/
	 6FCBBvXIMiwhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2EAF40602;
	Mon, 14 Sep 2026 15:54:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 451E72E5
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 15:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2216440144
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 15:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Snx5VpOcoD4v for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 15:53:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 467EC40121
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789401239;
 b=Fxuse7BuUkdTUcrt+c+plI7TEmWQ7Zpq9sheAt5ZskD7bgABLtjKk8UKKfc/pQJ2FQu4
 JN792q4vW1VVb2cepmt70O7kxbx5Fb4n6rxDTmxOW5v8+FCo5fhUVJDG+2YZAqY5AuGQ9
 XCEWvGGK+i71FRt5rfK+Iu0ZEk6G+G/MngZyLqPpPm1FjolopMESm64CIl2H+pg2UIbGy
 ne7hM9y7qsOq4yajJkxARHxrZHm4F7OoWZUIKd7cKI3iHE9ik24zoqKN3cb/bT+nqCSM7
 ln4DMuTpHaFSHxPYEnm4mi/7hy3GLxOmGhod7NGkSGJtC1bB7QWntY8r5krNDZqhB0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789401239;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Organization:
 Content-Transfer-Encoding;
 bh=Kf4ejRQduh//S1EmF9icGdUcmJj+K2RNZU5VlIgU9nE=;
 b=hNwcruH+c5VikpO6V8gbPvjhRDJOtLOahNDMjEb8OJmQ485SOacGsF4EAqxhAe4aorSd
 a6rEWRuVNlSHTizSgE3JoeZHxgAVxCzfh+Vv5Q6O+JoDZRDRdRmuaVUY0GKvNHiFUyr5b
 p5XF+TU/llb/m28nsz3CodRR/fwm6rZz+dykGc6ZJGVlzNzRUQ8G3flvddMGhKGvwdGWK
 AirLpN25/Xyu6v0Q5jWY+AYqCypiVqKABcMVwv4gf8Au8MI5yCrDK++g8ShySwCEKiayN
 UGc8eY7s/U+Mo9Dy+bK6PYEXGCIJIvZasGYiS6uTmqXG8KWTaqqZ/2God/cDlJvrkTg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=DX1ogN1Z; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=DX1ogN1Z
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 467EC40121
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 15:53:58 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c254f6c7a56so295118966b.1
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789401237; x=1790006037; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Kf4ejRQduh//S1EmF9icGdUcmJj+K2RNZU5VlIgU9nE=;
 b=DX1ogN1Zl4TyG8ajQGBurBxY/k4URH4IR7TyV7K6/Qy2AT4BukN9lQWSOHrVuSUb1w
 othQkQQq0nPItTNA1TR7LGfGFULmmDiCD85HwiYzaUniP/WIbZrA7AfAnUvKe/qCqEoe
 XuIxynGa8I6rV1LOqVwkQ96z/IRvwRXdNdQ/fQzNz5Z2staAuCVIJVcjFHzZLc1NpFw3
 OfLNxgfMD0vsxHLHXH/rf7h6pYgR2vBdULv2Wo7qB3vMAdmAFhHElfLKrq/UIUIOEOgj
 A/vI7nIRQUEpyEzCdZIih5LaO3LGK2w7UmO/RNKMLSRshZ21u9VcSV14j2xCyEdqQxA/
 4hBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789401237; x=1790006037;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Kf4ejRQduh//S1EmF9icGdUcmJj+K2RNZU5VlIgU9nE=;
 b=pQu2xVrDLaA3LRVNyueZ9ePQ6INolSLWe7OjNXsQMwBSOAZ0XYF49mJF9l6QkbecF7
 ixdh1RrztTmCnGHnfTkBqlwCigIDxqO46GIEgtOGdI3MltPsJDpNVsmo/ja6aGTzU0O2
 qFXZ7KIIWDJCj44Npt0NN34Ks9JYNjxa62kjnCcSUylzHcnw9qbqcbygEBeig6Sc40dF
 XgT5NrtYmUnKiP1YoltxQrHyCbLtHYTMNyoDfj/TrgEulKijT/3K5NXABUyC+YMsbpQP
 Epg9ZxJiV8gHstzUGFKFzw3Y3WHpH6u7nZRoIJAJaaWob5sM+qwIRixjlHqTdSb2QpSv
 nbqQ==
X-Gm-Message-State: AFuF++k8azAFT/5gmLiCesgvSQ4nfYToJmdYxSFQ7PXhTAkagsPrjAGD
 4BruVVC+MYkTrvADKppv7e5yPe0p4WoaKHIQsowa1w94adayKlKLBJSKGxwzGQ==
X-Gm-Gg: AYBFou3z2buVlSofoJY59RUtFChCQYg/DWUEJc/2b3qouhQW3N1a/iiJj/dhYYx6Kll
 lSO+LMMitSw1c9NGXgLNLmvCWABDZZFF1Tu0ds/PXKCTAekaOxaF8CRG5IEH1+j3JKXnJGtryoi
 bRLNqTPgNm+5+sHgmrYN9Jz/TNgHdNmON30iATBhMH8vrmHdg/r6FDcaN03T9m7/qtlup8zPu8r
 1SSWR+KHRYgza5+ZAwbjz2t4OTBO0FLD2wa/9MNm8vPaBpiuOuzqcM+oGtP2gw+yhiJ0V/1hRRD
 OYtlXeXjQR6cXtKjmrENxptkqNUuVi2X5nf3agvxreomVpCqLOrY7espfJpOdAzSBjdMKxim8V5
 rkqeoim8LSQw9pMyNTQKmHcLmsGwcPLmulSRH1fY78fYO8uMdANX80bKfA7KrgbbroHDikkCF47
 /NwjM+ml0DJGXnmWZZ03Blou3jLk7IMjfJBiXGUSnC5k43iA4qt2fk0utfeIV3B8oLnMfi2Jqzg
 KQU29vTmUbpKvOAikqZwgnaMAY=
X-Received: by 2002:a17:907:6eab:b0:c29:4415:2ec6 with SMTP id
 a640c23a62f3a-c29b8605c6cmr207418466b.12.1789401236696; 
 Mon, 14 Sep 2026 08:53:56 -0700 (PDT)
Received: from gimli.. (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c296611f417sm450611166b.53.2026.09.14.08.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 08:53:55 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Joachim Wiberg <troglobit@gmail.com>
Date: Mon, 14 Sep 2026 17:53:50 +0200
Message-ID: <20260914155352.1331991-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 0/2] package/lldpd: security bump to 1.0.22
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

Bump lldpd to 1.0.22, fixing CVE-2026-46433, an out-of-bound read when
removing the VLAN tag.  1.0.21 is picked up along the way, fixing path
traversal and arbitrary file deletion in the privileged process.

No packaging changes were needed: the configure options are identical
between 1.0.20 and 1.0.22, and the LICENSE hash still matches.  The
tarball signature checks out against the key already recorded in the
hash file.

The second patch is independent of the bump.  check-package had six
warnings on S60lldpd, and rewriting it after the S01syslogd reference
also fixes start and stop always reporting success, and stop not
waiting for the daemon to exit before a restart races it.

Best regards
 /Joachim

Joachim Wiberg (2):
  package/lldpd: security bump to version 1.0.22
  package/lldpd: rework start script

 package/lldpd/S60lldpd   | 80 +++++++++++++++++++++++++++++-----------
 package/lldpd/lldpd.hash |  6 +--
 package/lldpd/lldpd.mk   |  2 +-
 3 files changed, 62 insertions(+), 26 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
