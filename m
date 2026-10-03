Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAE3CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DE3F606EF;
	Sat,  3 Oct 2026 21:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVFikQhDrefQ; Sat,  3 Oct 2026 21:08:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D7DC960681
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061723;
	b=IZf3SaktGElUnjq1tXqG4bITjzunWXQc3TF2GVuqkbmb8sCpvSw41zDJYjHiPxwrcFYX
	 p3hvFWGAPPIUsXXx99ZLegPflDsof42Q3j7rM1K+yvJvMQFDTnNMCMwITBhGrWbqExFsx
	 0ABKAJzb+ejD8uNcYKObgTye5YdlsKYyWWqHvTIA6e+qNv0mnk+w2gNCrDThlrLuanQH3
	 KMNXXOpSFOARf8FgZ77mxnNr/4k4nFLkaRRFPcYavhBdlS1m8m3meBR08HdKPiwjoTlj5
	 qHarrK0/kVCqWHBClLgbZ0n/CGjTpQlNqySYd+AO+VHhTfpw6RAz32q8WDsXoMZN5Ag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061723;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3yIIORbKyFDk2GCpRwD7sDPBLQA5fKBYO6IgVZC0VFI=;
	b=PJaP0FRhCpC5sBVD9Bo3HCgL9tEvbcr0bxmnDg0tNTI391tMjolNfTiAV6PCrYdtjFmO
	 yw8OQ7Rj2Ww2cgiJsGUIkWtL6fKkeSq/7cxb3qn0o7k8SEjzAzvKGIaeo/AiHk89QgL8I
	 dCS1r/sUa1mb1qCoe77cV3WtAWEyTKnSPN8SgjSwdXRMk+Ee9Dl4etiErDdsTeiPsAB6h
	 B0d0Wo346ZKZRyZquglrrdY4+I6C4YV8Fn2LRwZIylKw4E3u6hUePuHv/HA27I4WnW1P7
	 4oKY19TlgV0NZ0zqi8gldTDZLrR2pfO41rLE9+cds4eAMZEWrSsauT62pVyUgGuQKNw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061722;
	bh=3yIIORbKyFDk2GCpRwD7sDPBLQA5fKBYO6IgVZC0VFI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=e2DDmwAyQ2A0mYvklUQtFvzLFwdHd/c2Tws1wuqU/n7CrJGHYsqUjdCKIIMqxvBWA
	 Qh9783/pFMiGs6IZTBaCh9rP+tnUrLO+AQPI/kaapywMahLeSiywGo7is+8hW9qHet
	 2iPbgPioNfkxipqLCSR1OU7y9XZVyeQIWTSMJq7mzHgWUmD6FiGk93Ef6dV9x6fBg8
	 1oeIjis0YRn3iRzlII0bcxLFC54P62W6U31e3Qb9CNx32tX8jBFm34Iy8j5FQ8rKC4
	 ssWbIOs2OCk96Bx1HzQ5yAJz0cnNJyK6/m5vYn4zapj3zDrLBO5QIevxW/Ec74qPs1
	 1dvtwMj0oe3Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7DC960681;
	Sat,  3 Oct 2026 21:08:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07BB9A10
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB48B8130D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_wgeIwTZJma for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:08:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1F319813AE
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061719;
 b=sy78xOswt+rqKhN5SkPd+rhB6p6zEFtIEcbiWxUI62lLkjmuMLFBVoN8LsaprD5/pPrh
 du7mjEwisoY29wVDj/Zx64BiZbRSQwSigfW1ILrcGqzvDrc6jzUzqNoJpnIkCq2acyV3W
 QmnpNMcPO1aqJo3FW4PB+UCrJ08g/DdG7xEbU+X9y2Gi00/WNTebg6A1BEBwwjPJfZaqh
 ko4dY1VJnD0aKZmqIODON4rM28DPlI1zQJ/dSAWwAVHK4FmgEJG27KOb6O9pHFAIGTbyM
 6jLDHISv358JaKz7Htqne/liSdPLassrdNx0Tccohya+iqJF+vwOU9XVZE2ferfwJvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061719;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=wUzvnbeD3D79x6eFh05mGcnzLcx1NB91c5GDwyq5Ysw=;
 b=euS3xj4K1j6xCfxvArhf/rspw1yHW9olZrfxFqkDnC1CYLvr0PUqeg+rRYiqG+sxYxGL
 IWZHf7akVrdfYryRk7zjYE4KgoO/RV2Ff9+O4DKQfpBMER60BD2Me0rBK9nkjjn1qVnGv
 YsU8MYmaOZ7HXhPwdzIA1jwRyWDzqM+JbxoO0usJS5rd4BJkbJOgBYez3Wng5QupJ4hOT
 NicG0KszUX3XG/0BLEV6RpDjj3whhYvIAsak7xyA8mJDNt6/96oYXrUTshZIALfcniejs
 vc8bDcTjw3qBFGY/Ny+hotJdm4PbZdRcB5ZzjlP9ZkrrV3svMAyMDftCoSxH+B4EADw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="IsUT/9kw"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2a; helo=mail-oo2-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=IsUT/9kw
Received: from mail-oo2-x2a.google.com (mail-oo2-x2a.google.com
 [IPv6:2607:f8b0:4864:31::2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F319813AE
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:38 +0000 (UTC)
Received: by mail-oo2-x2a.google.com with SMTP id
 46e09a7af769-81be5042c56so692252a34.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061718; x=1791666518; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wUzvnbeD3D79x6eFh05mGcnzLcx1NB91c5GDwyq5Ysw=;
 b=IsUT/9kwqYGFhpJaaJwL+UTq8CUfgl6hP8M+1jd4N+tGNqK4TzABu3VrkX0CNP7Oo7
 bAqvK1GjLU9CoxyfX0wlhRSHSTK8mFaUVHeAUopU9RtWrFw7PsZxwtBA2Um90EyEffjV
 PToY9XnnrcOk9+CpAZJia0Bw2sfRaCRFCvaGfwKSv2g/SxJoiKQufjXqHCjMtyCGZmCV
 qfBRAQacl6Rgs+juWfsvzSQyxIlYR/NlSjRBE7C1y+QNYK60cLigYXNJojNTVPiqGs4C
 7ig0r0K8JPZi9JNyfHdbjhB3bW3EJTHbySVy/hFCEMrDZTW1VDW11XHap3LeKdO3P2Gu
 95Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061718; x=1791666518;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wUzvnbeD3D79x6eFh05mGcnzLcx1NB91c5GDwyq5Ysw=;
 b=QoAyy6lJtn2S5KChECzcIAnDKuxYVsjR32FsIN7LyyRkGs+/lqIvqVnkndSwGKT9JV
 qVzZ0xxZmno10rW9duKZT1NhzBBe+Ig3bXvpmcHypQTQY5NQCNAHyDfAmphs8yllFvZX
 +rauqj1P3ryMX0kyvqf8HGTa7u7wfALSxnakGBpdZdeYAoMCw+hXGP21Giylvo4wGSw5
 P/UraBLwmj/0/Y8x9nzp7b1U5S1JbZnGxsWWIZBdlFwP0eiIExwSw88JPqoUN3xt5MRG
 8Bg5GYj9uhpqC9fSsm/uB1Mo/S4E76mf07Z2pQLVN+QazMrYOaJ3JAVAEU45OD3iFmL7
 2kLQ==
X-Gm-Message-State: AFuF++lriPdNCBqiIwxUqJhKF4LxUTWWA+VPQ6pgC/XiB/YL1DWFweWq
 Bc/BQXoiTizD4QzAzX74yX4+JN7LlKreuUBaLfC2DsFbE+HsunNNYY12VmuYdw==
X-Gm-Gg: AYBFou2akLdEbPyAifNybtHZ0dr0GdLX+nnjAcfcjNFJXxn0Q9I3nxw3DoLkFRPD+O+
 7X9hi77nJ7FQ8MOa5Dv3O8Sj4l5k4KT5b2Opzmeg7+50YENJR2bS2YWfe0zJmiM5iWA8A8Xzmff
 8ORfFRU57ccK0ptWTATjjMwmBob/nzyNpxa+Fw3kQmDpVaInTU37BCr9Kt2e+7HXz80K0GarIIR
 PkkeaiYbsJvCLbgVj/X2wUHtNUDQZmcKbKYrwqOoX4P098qmeu1qnAfVoGWEGzCua6hOJr8Fule
 eYw6aStcW/p9YoteXpSlmeq3MuQ9GnsQOb2H7UG5D8ax+sm+hO+RSS4KyZeKTg/HGnrBRmLpH/I
 wAo3VOxI3TGTk7L2ZVzOEYc4IxBkqNNCiszfgqAB0sUB3ZJauyNJHvku2kgNfr23vysVCev93Dv
 d0rDwOwbmDOBGuti6mCGpG3oBJK7T/0tht9LK11B2ljK6Z+YHo5Eh9sf2jpbOYRSTbJytrsemlR
 7aGUZudlGvkD9SCBv4LswtcIsjCzTep8Kok3oa05tYxkG1lK7qcF5GX2Ne/v+seCh7PD7ZZLtsM
 7fgy6k1Wwn81u9xsivMV+RoYH25tQF5XEKEyzlrO7t91Vp1uAmtNnt2jnUHUjmmq4NSRxCxoUXd
 ZA0Z24jydLkaElIdUNVKpw+GrpVheruN2RFFed8JkUA==
X-Received: by 2002:a05:6820:c0c3:20b0:6d8:c658:5f66 with SMTP id
 006d021491bc7-6df33c96ea8mr4208948eaf.27.1791061717834; 
 Sat, 03 Oct 2026 14:08:37 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:08:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:07:52 -0600
Message-ID: <20261003210833.735937-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-falcon: bump to version 4.4.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-falcon/python-falcon.hash | 4 ++--
 package/python-falcon/python-falcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index 6a78f0f617..269986fadd 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5  f6ed9db875cb6ea8d26791b5345cb0a6  falcon-4.3.1.tar.gz
-sha256  b5081be62f1e2d4f5140f4bad6993fd2bf8b1e503ee7261f56d324b87e41a67a  falcon-4.3.1.tar.gz
+md5  0c8029e7de3eb3a158770283c0bebd2d  falcon-4.4.0.tar.gz
+sha256  9f3ffbddc8baed4573295642eddb18a37eea37baba9f20c5be379c8b3d3d79e6  falcon-4.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index 44ba1c7bc4..4e6bbf8812 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 4.3.1
+PYTHON_FALCON_VERSION = 4.4.0
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/a0/02/a51af369a4feded77801d744f2d4669c7fa0a294bc117acf6ee06439937b
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/a4/c7/a0584e932cdb42ab6e5dc3baab16352471dda1ba2215311c65d79ea3c0de
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
