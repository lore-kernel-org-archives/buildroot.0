Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDECCA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96E0981235;
	Sat,  3 Oct 2026 01:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aXwVTfh3LK0G; Sat,  3 Oct 2026 01:33:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C600981094
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991193;
	b=szK57hP5ZbFSKLAEW0WzkQcbq9Qmu0PJCPIOvTbMCu26JbUlFcFkLD2VsDL7LXEzFXrA
	 8Q9tXXdCQHKIXpyobQNcmPqOzyJnYaTdrsO4Nv0vfv6g7hW4NAf+qYVUUhm2nl+9JpNzM
	 vY4/WyS7wuox8Z5TNKINENIpqgsZ/jJJj14/zNKCe2AYcY5F7gG6lzR+cLwa55MSPxCzQ
	 eyjsBA0xyRTJUMeGdmvS6zvulpqx9VllFAHYWnsEerLlD7iUyHJgMdGVpPE1N5D2+7Zlu
	 2UEvjo+UzPfo2Kvf+TV1SBaYnGKAHVkGU9Po4zDaK2b3R1y1r47YHu2pjbbBROF8gMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991193;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=38PWJ+0aopobFGhuXZw1C3WbjodErBccVKDk/ddKo4M=;
	b=sYr5kfjz4lKNYctB9gHj/q9zTvdfABi33SRx5d8lsQAKwqa8a55DdF13z9DlLR10NPwm
	 oFPN0sxNoIdLtFF0Sa4ma//l3S82hSLkR2RXxYjGzmSV8SER54Is00WYpKrY8+aDDuFA9
	 FH5jEAfGhmKLFYpnWrKjsDE1d+AKpzUyG4iSKJyIzpuGAyAWg+0Sthy1Fg0+wNFXwJGfk
	 cnbZQ/xUxhDEjrsYc/T/HB1ukpVOWX/i50xAWLJh+vZ9qEbnPPCZx3JgK+XGeV35NBVsA
	 +v0FYT7Lq6Z6J5m+5aF5baI1SsFwf49YCutJB5sp1Y4KndwwzoAsukEzhUceJJlRdHg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hZjhHYUI;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991193;
	bh=38PWJ+0aopobFGhuXZw1C3WbjodErBccVKDk/ddKo4M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=VC2HbVlbOrGWGqdbFyArW2LSWnfBaDk0OIxS2VH3iO20fhn574uiGgpVvSy9uB57H
	 FBX2ZYCw7xj88/61zycU3OzrQAYAY4YUkOUKJ/AE2vNJOzK+DYn9UR0THNwpSqdc1n
	 QEhT60GIxS3z5iIw6XH75r5ruJuUuqqXkF4TB7wtMdEwWSseXMkIVOs5y0lTUiBI+q
	 NuEAv0tm0Qbry9fy3h90aPxMQlRDo/+/WUjYzwc5A6TnpVkGd0aUNXuUitNLkVBFUu
	 NG+4ZRvx3rE/oQGqHpAZD+DJdspo0DIX/wkwyp2y86Mk8Q4go/OUhR/CKUJeepyQCB
	 T5pPQWQ0xkd/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C600981094;
	Sat,  3 Oct 2026 01:33:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CE17F1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB43581094
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OcR7KP3Cqv0 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3D55981067
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991189;
 b=OmTr328huN/b+iQRwKgBa2l5tvpN8MOt6dkl9SqbK1kD1a3Ksl1wLAqa6p1njUD99D79
 1qiaVeRPnJ/kGsF5vtFlnzJTlU7rSs2Cp6edUDOEvQK/xoKG5RK+EDVJe6lFH11DJPmd6
 psK5nX/o+ntHQ0rI4pRLe25sBwKcS8SogSvn9H81Nggbc8986P0kr1kAsbilN2nIaVPOg
 gKMa+gNgEbglLYfftiVNfo1opDhlz9Stcu2LqusxvLh6t83z1Ab0d4tqqLAX6VpkhUv2t
 ba/vF8m0/ktzVXxUGlNvl3L/HQt8a2VCsHllnJ4Qq2ZNA/RZvh+i6+r38a7j5c90Zyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991189;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=0uzZ8rvE1EVqQmHrcuVD89NcWGd7+AA7+o376OXISHU=;
 b=NZ9MFOkF3DPJBO/cCf/nDCVZiuraokrrYfynX4KL9lPAAK28D1GR9RnL/X89ByfmdQTg
 vvGCNOTYA2QLYhl02n5/KEBdvPGNhTvrY0lDaEO6WyG9kGyRKZWpei6KmFoeacFrgewMK
 ALbd2CuEPRRRTlAnl3iLQEG7oK1LwOKZZRq+ZObIP7IAgplfxzAhZF/L+Q3hird1D4zEX
 I7bagB+cmkMGJ8o29yvyz/o3UyhKO+jyumMdvQGoKBQfrMf23PBAJ2WjYSSR/5/vumuWk
 5qrBTD9ynsW0zu8biUfTB2lGZ6Xc5HyjoZwEH3cQV/62FD40UUE6XsLs9papV9aHj2g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=hZjhHYUI; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=hZjhHYUI
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D55981067
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:07 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 46e09a7af769-822ab75c8f7so344633a34.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991186; x=1791595986; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0uzZ8rvE1EVqQmHrcuVD89NcWGd7+AA7+o376OXISHU=;
 b=hZjhHYUIViChDASraaWvlwKk1Thfqvl3hW6BilLxESMfGhAPKsXwDdX01yszhihcNM
 UqnPCyseAga6vJTzTuP43COU15CXoxCAlWMaRPnirdJDTeMU9FQek+QsDBUCBBf+uKA9
 ojJYJ/sL9CEjoratO3+pWL/IH2wl7sm8vTl67US5QnWEUo/czdn2RRPoMPymZN3wYrzH
 Yy4vYI8mVMJBgH4yjlJn7bdTZBpzlqGeJgTdoG1H6pyMNeeC/W0LXM6STZfPDGzRZOs6
 tnnJIPJPsOI/2FG3K1Vj2dyl58iPyPVLGFELR3ZlSIkN7/bBVdYcm/zLLNlA5Lj3WMVR
 pV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991186; x=1791595986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0uzZ8rvE1EVqQmHrcuVD89NcWGd7+AA7+o376OXISHU=;
 b=OTtjtmQrOoAUB+AavR72877EuXJjfGKeC+BGMZW54ph0KstYGnx6W9DGuMI4o7nMXJ
 9AUmpB4jDlWxCdnJwE8Nof9geVNDKQE+q8UNQnMsslkDcQ3DfyVlRYUPuVmwvTBPW7NZ
 /vDjFHQNj9zEsOWECV5PdOjSrJmEVnGKGB6rix8EFVv3vXKXh7PmjzedyRk3u5nggp4Q
 5PL2N0be161LNHLwxW0ZRTeaAQOHF5djOQrSK875xMqMeY3LuwhTfS1q4dVka68wwGZ3
 1B661kPJHcRVrZrUZ5UFN6wBVe5ieFBbaN896Y0+CkgeUliKO2AFyNCumTADUCHHFVpp
 KldQ==
X-Gm-Message-State: AFuF++l3saS+sybI36Lz5cb2ramQ0MlrPMcj41YDVovAN7lVb4BCJHek
 /XUg4VSiq+Js4kiNYHNM9iijwschLpilwnCSY0KV1h6dH7nAOgDXYDpw6jhgdw==
X-Gm-Gg: AYBFou2TzKZapZfllQSV5aBo6qLo4GcrIDOh6dhJwME0mA9UbFv659CmYz8SppEuNfR
 gpcppwapgm5U0HiOnknVVH9b73jM+fsYpbV7DZ6Vw3XtM0IUu2LbGYP0nRpO3IBbD9A+0sH6M60
 XLdVlCMQR/n+irAXxWgeZWQZMTBBwxILa5V5dPU+1WDWpV0h7BLtHn/hSOQjC2UaMTQXeufNroC
 bXzy06TrE4St380uyqlEKlEATI88QDK4YgjuOdzGYz5Ej6ClkJAlgc4scWCmQw/4TQzxm8QrM9+
 QM4fJBfC0xtAhXtZ6UFvx0seLj5vNOVuayd8b/kRfTfSnlg25SDVBgcmoMYFamF4DKx2EThQSUd
 sASt4FSr55T2U/lFhqkTjzyaw0K2jGfLQrxJJiuaLA1wpnZztyD6msKEA0aLrotAJj5rJksqOVj
 2Nii5d/WxlU2kJ0Vn1866UUqWPMe1tYGvBq6kRWP85VlrbKbTRKB/ZFj7/Y58TKzEZhonQLxH5M
 D+4VgPJ797eKbMQZOwf9HQ3Czv/Bt74n+OVDZ5SLARMZfaaw1kB87TuMZ6UbARhKkX7HVg8JaV+
 0W04tB1evpb7963DyTUTMSKJuZSJNTzlI+SIW72zfSdexJKAUjOdQM0AGz9yF5OCB1RiDHRfrr1
 /HzWMJeiIeiHstgfWzy5n1w0QOP8LwjfvSw6Eqx65WA==
X-Received: by 2002:a05:6830:f81:b0:7e6:ef1d:4aeb with SMTP id
 46e09a7af769-82282c70b37mr4275997a34.15.1790991185881; 
 Fri, 02 Oct 2026 18:33:05 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:01 -0600
Message-ID: <20261003013304.400979-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aerich: bump to version
 0.10.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aerich/python-aerich.hash | 4 ++--
 package/python-aerich/python-aerich.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aerich/python-aerich.hash b/package/python-aerich/python-aerich.hash
index 7990532a2e..698d2bd38d 100644
--- a/package/python-aerich/python-aerich.hash
+++ b/package/python-aerich/python-aerich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aerich/json
-md5  e4c7fcf3593c22d58c372595ca3d2e6c  aerich-0.9.2.tar.gz
-sha256  02d58658714eebe396fe7bd9f9401db3a60a44dc885910ad3990920d0357317d  aerich-0.9.2.tar.gz
+md5  208ef8a512bf98cfa08b701819679d45  aerich-0.10.1.tar.gz
+sha256  d090b486de5f632a8c8e349e9227d076b26ba6ffabb522732bb681a9bc2e81e5  aerich-0.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4cc00f0e33ac8e089b37d8a1474be441b26311bdc16fe035c75b51201515f617  LICENSE
diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
index 916279be78..423ae03eb2 100644
--- a/package/python-aerich/python-aerich.mk
+++ b/package/python-aerich/python-aerich.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AERICH_VERSION = 0.9.2
+PYTHON_AERICH_VERSION = 0.10.1
 PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
-PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/c4/60/5d3885f531fab2cecec67510e7b821efc403940ed9eefd034b2c21350f3c
+PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/47/a4/928e971cfdbff75cae335898b3a27643fc2564bc28e23efa182a8843e78c
 PYTHON_AERICH_SETUP_TYPE = pep517
 PYTHON_AERICH_LICENSE = Apache-2.0
 PYTHON_AERICH_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
