Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1B7FC6166
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 01:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2068F80891;
	Sat,  3 Jan 2026 01:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2NIlzmELWaN; Sat,  3 Jan 2026 01:26:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44B4A80854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767403561;
	bh=MRLCGBQsFRnyDnLUAsye9hj5YwvM20m47KRmxoWzwKM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Xy7Iz9RFtu+sOU9Vy+QeCOObKDQ58mtxgZNGTk5giI+rHjZ0ai3h/9WTpVi0UvL0a
	 RJcfXVLSHLEcbOPVMxquZ1ltnOMHL4+On7cAwOsL14wvybl+nkg7cfIxseRAbyDYIr
	 Iz/hR551kAkGIANlI+6RRzivVtbizGTrUGpnay0smACq3qSRQiB+yN9fk+dxqkUHuX
	 ghlHGmJy0OAO/6uogAx32GDA1i6Y1zKL6VPMpZ5rI2v8BuSm4q2K7UHUOWQQvKRA9I
	 psMPB1uhfWKlgJg2DzAId6HxWq9+1RvErLQWE3oyVUlzUkUlmGicHrDpKuvBxicQco
	 PmZxYXwxQNBvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44B4A80854;
	Sat,  3 Jan 2026 01:26:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0E81440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1691608F0
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NQQLJUqiJqS for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 01:25:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EAEB860878
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAEB860878
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAEB860878
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:25:58 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-455a461ab6eso3778876b6e.2
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 17:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767403557; x=1768008357;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PBAs0+Qj89j6ElSBuZU87iF45Vl7RObMm//5Umohd5s=;
 b=cxty9Lq/BMGaaAQFmPWVbvoN4TMGjE7rUOtADSU10y4mbye8wyI+AhtwAaXVCom75n
 GNdl0BCnedDE8tGlivcZO1j2H8NW3ZiKTNTMxK2FsnVGHQK5CRfI9tDgJss0/WWH6pWS
 sNFlg9Y+Vwrn5GJ8Fx7ndLkI2lxvk1KHuI7oDHwZ0lHhs/v9fPA60C5oCdrgB5a6REx+
 XMDQBoHBsPCALsn5QAQNFZF/Gapi75ZKlZeiVCWucejDLvD+vZz+7/r6T4n9r6z9F0Ld
 q2u7r0sgtMr3lc55phkAUmhY9fHgJH4t/FiIA/m30EhTX32QGAYPEsN/1+K3Qx5dyuKO
 sDbg==
X-Gm-Message-State: AOJu0YxTMvAEyRDfRS8uaAx1NOAc0ejrsSEmg7hF3zpENsbC8PNjEkjm
 lR56IIEcvpReZsLrCTkeLSvS9kMutQcOvE6QS4InpRYFH6flUqOKC7HSmEiD4JCqJ94=
X-Gm-Gg: AY/fxX4tZKXCxg1NX/GHrMINGVCDKImoTXOldhKl7sIFSh5B6eSalkDwsm1Q9RClFxC
 fHtpoA15AhLcn5vtSV7TQB/SF1d7vC3xEKKRwFB6ImDSpdt8E3maMtfh2nUp8PKCjckIxqCFhe2
 yiqQRSEmnODDjP5Mb9e5v/+ct1wpzCmPG9NSx2cbuR6bXGx4JBD6PuaMkGM0JA2r4FWd5ucYY98
 AayToJtGl4wyn5qwZ+aUFC8AXDuVJxpk5pT1BIxJmz5O0yBa6SHeJLkv1lS6gF3gKsjLG5t+hdd
 jERgUhBj9W0dY0hzCG1/Amay/eBpMjsIKZGi0Ux2GG/GCIWW4mylSNHdo5Ey+BjmupY3+GulwdT
 VVrh797tRSvG+P96FBgmVpkIv9FUsMAnR1/rQ/1SGanghMtenAIQ7Amo6we5mfaZ3buWqIiZEP+
 e4qFUhVvuhU0eLthMUAJCClk6bJ6JGKvxWHxE15E6ObdYXeqHF9396NSUZwfLaoSJqGQpGLiWjt
 rfDEnBFhFZ1IMKdUeGpEd6u1Qu25YWqCQ6UxDVlz1ZMPMKmwsu2+50=
X-Google-Smtp-Source: AGHT+IG5mfzVdi+qTOvo2iy/phnQ7U2y69U5jIIOBLg2rNmcwA+OHV4XDMFqLsY+qg8aB19kDGeuNA==
X-Received: by 2002:a05:6808:1991:b0:43f:64bc:8b7e with SMTP id
 5614622812f47-457b1ee20b3mr18463771b6e.15.1767403557630; 
 Fri, 02 Jan 2026 17:25:57 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaa8d3585sm26868623fac.2.2026.01.02.17.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 17:25:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 18:25:54 -0700
Message-ID: <20260103012555.762154-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767403557; x=1768008357; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PBAs0+Qj89j6ElSBuZU87iF45Vl7RObMm//5Umohd5s=;
 b=R3OJu2lTiH/+Ybr7HdSFYl4LCZwnxLF5K94ome77gTA61R4iQi5elU1K5CoQJb4vdB
 j6Db4GIvdweEpfp04iXRDCS60IWt/B5L5jmP+vmka1Aw0u/KZ9rOa2scqCNLedOs7weX
 h7RZdhr89rvwCyskkW1xwV5uetHaleBxPoUVKPPN1WbspAYyzeR9IecMNfrvqIxTjWgh
 OjCJ1yV0n5ZG4zTR17PU254jch/1Bd0jUVvs+rswVABVEW556zHY/YmIpaAnNoWfTEAL
 dXKHVy4SaHSvLXaNhYEfX+YjGlWav/jp5TwTlFnRTH4zunSsRlAOOu0dgm//fv+nWy5o
 FCdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R3OJu2lT
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.42.21
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 6b4d788410..5645c0fe64 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  5905039db132a93c73a18ad9e497bb43  botocore-1.42.14.tar.gz
-sha256  cf5bebb580803c6cfd9886902ca24834b42ecaa808da14fb8cd35ad523c9f621  botocore-1.42.14.tar.gz
+md5  76edea65e7dd32f11f8ea3885dc65524  botocore-1.42.21.tar.gz
+sha256  db8f99d186156da42feb4fd2098017383d9b155097290cc53da7258f6e652c39  botocore-1.42.21.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 3d7fe258bb..5ed8ac421a 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.42.14
+PYTHON_BOTOCORE_VERSION = 1.42.21
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/35/3f/50c56f093c2c6ce6de1f579726598db1cf9a9cccd3bf8693f73b1cf5e319
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/4c/df/dfd07d75fda643ba07af75e33cfd72472a12bb13901812ca34e47f081507
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
