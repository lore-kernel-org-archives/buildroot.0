Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3200CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 23:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9214480F48;
	Sat,  3 Oct 2026 23:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPIKLw800xt8; Sat,  3 Oct 2026 23:29:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A5A3680F23
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791070161;
	b=gU+Dva3Sm6O2PK086FL4+QnQZZJz4eem+/m91rlhV15Fuutkmy1/soro5XiNX48UByxQ
	 VLuegcw4cOl+O2spKi2h2MUS9QWknGm+K7G9lm7LbcuXeOeoNDic7orcZhhaOhjPt6b1q
	 RcUdfoPYGgQuV9t1QwGbXw4f0cp+Ogho+tN0UvEvCSgoqhYbf6Zd4+81/FdWhodOv0yw5
	 0Pvjwc0gi9/OYXQ5SldZfRQd7Qmkiur9xdEGGhCfrhOs/a8LBCxUo4v27DozXoQAfLQQW
	 v2dhlEwnJsiHNfikFjSeva/8hISIwWePi4N8MF0x1K71xOF8cyiRT5tKa9Wg+Kx+e6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791070161;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hW7R6YsVDUP9DAM5wf/axAJxzJog2OJuoUt3yQNWhq8=;
	b=lkiPQdtUtyYjamZo2Kh2xAUU/mFY/I/nUdbkiWH3eQfIpfkk6c1EgBIQpEDze5AlGRcE
	 O+IytselO5ibJMp7Bk1VoI/6blRwli99rLhf8oE9TBYvwc69hhSmpb4Oh9UDD12MjLn2b
	 64a+PVCrxnSqtmD58M4fz0VyDufPEeRVHvEeNAPDR/XqRAbhZJaIxEXZDrFtNRVz09+V5
	 TYJPC9/D/318HkilGdYndO9io5O1ZlcLntaMl13hilFSgoC/ujGdEaGYhpsXbpWdh4t5m
	 iR98A+aqzDsONMLQeWmS6JFPJPePQ4hUUFQinMQJJ7LHuVAro71nPF8Wfd8ilsYPz8Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791070161;
	bh=hW7R6YsVDUP9DAM5wf/axAJxzJog2OJuoUt3yQNWhq8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=f9Uyi8MzKMsra0bbXFVcCxuughyarUhLFe2wdUV8rs9vHvQJcZaIrsV8fdW6Xr8Sl
	 iNZnCBwyfqMrW/Xmz298QmfawdBM2a/SeULNHwSsCDDZSfKd6iGQmQt+SywBzCsjbh
	 /p1bNCLf9V6nw3lwOrdP3iIoiscl6u5m1Nm4XRVfI1xrU8YSrwHZv/b3mS1+O1XgXf
	 b+VA4WlHQ4kU8idslZs3vLzPuNMqsgsAklUzIEozWHxDz4ZrlBaj+noo4+rNYNqGJd
	 M6OVjMpCeHiHgv1sCjOzXBW/Lvlr2kj12rFLw7QqO2D/Y6vbttzZv8iac+i2w+8SS5
	 S9/u6wVqTpEVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5A3680F23;
	Sat,  3 Oct 2026 23:29:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E8D5C1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB0EE4081A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YzEOgo4V6K0Z for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 23:29:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 01D694080F
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791070159;
 b=TtreSmiBxX71ut7nRXsjhxdmUqZoXsob7WCsVhSoe/t95qhCNqKOBx+7QByaMCquuBEt
 SAdq8ByjR2+SxSeauhjSHBJR5WPjGmM0cM6r3bP0fbbAlajsHLbCZ47NZbk0bbbK+7eRE
 XBvg5HDmf3X61ANROkfKERDKE7DnVnp7QfBt5b/ndZu0f3gnEAbvIK6ugkV/jraJN+G2Y
 JhpMp+V0Fcaq+CfEu1oBdhSHOJvsI7DAFBy4t2tr/mMlT9raw3d+jrLPuqH0wEZCHGlG7
 CyoMyD6tL/I4mgH4T11vSiu8qEzj9kQx498nZg5BhmB6rcNkywamIxijlEVelHBHraA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791070159;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=l4+sIO+dbezonh6a3HA2Blo5kbqP/YsMWZk3PRlLYcs=;
 b=L0q9Llt7BK0V+0+tJFWbTudoN72ZQKRppVowLVDjXhheJS1KZARFQD6v3uqpFWo1lPDS
 HFtxzMo+PUQ4q4db2dlcBxOXf2x0uteA/XiH4I/Zf0Ev8AVU4MbggtaEPIF9G0YrSOOlt
 f2HaovdAgKvy1cm+hjv+PVijBEGwckrTMwAN8vLaQYTk+xPI5l4oXyE2ZxNdL56jXD+Jo
 6l/5nK+kUq2/iXSFicRIBIrEoMHi2VxBLFlcoxbkh68K4QrtP5cwU2eMnnPXVOztzFQQL
 CMOEFmhbiFx5AcVlyBISV8cU6YmNtzlMPEq4G0x5+iH6c2gYvFu9Cki1CELVtD1d+bQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=RGhKkKlQ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=RGhKkKlQ
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01D694080F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:29:18 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-8243e4db9dbso276425a34.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 16:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791070157; x=1791674957; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=l4+sIO+dbezonh6a3HA2Blo5kbqP/YsMWZk3PRlLYcs=;
 b=RGhKkKlQCepSt2WkMmGUnB64qkgi6QvM99YU+RXPW+N9FgVsK2mTWaAHMmA9raR6EH
 lzsKfoFA05X+yDK2rfKqrhNCCt+P4pSUGTB5KamCiThqbZqKc2lCJygyy4+DHrKrfD5K
 GE3TLgf5f9IhDP+cMFF45sOOCeiuh51eGnn1VagfNatkpJQwlQGJGi7am/VoULxTkHdQ
 Gx4v0xtK+Lo4Z9woIbyapBgwngd5daYbyZk8j4pHotJXwTMaOmp5dHlo40Ji0vWyg5iU
 n5Iw/S1yjmxFwwUJTurvuCJmJDicvntMpotYKjTGPTxEBlXA/Vh5XWjzZ2FzfD45C1km
 RAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791070157; x=1791674957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l4+sIO+dbezonh6a3HA2Blo5kbqP/YsMWZk3PRlLYcs=;
 b=zbBiBDhiObuBjUqlpOrNQ83+Grj1Pn6d6q3TGFAy3b6RJmbDLmKyWvYO1KX5l3jCJk
 0Vo/IJr+dEKH5s62dW/GYXXy9j6qkzBefAKjZ7R50WpPDNEOl+6Si5OcZMg0twyDSG4i
 16He4E8pRtERldezwWXeJRx60L76xTIh82dDjwQTdFoi67Kqn7qeTcfCmYem9lj+jXe7
 uk0qN7h01bc/xjX5syrB+aRXBlHP3kak82YSIjFxO8k6vUctpWeavbLuldgZtGc2SMB9
 dwL3/B7ipCbQFSsFZn4N2H5AMSPRzZA13hQLkOTgVGhmvnZjzV93JwYxWRjIExUAB5m5
 2L8A==
X-Gm-Message-State: AFuF++lARdMxHICDzmmndoyFeOvP8AQDNLQXbAmST8TxcjcJpEMFFqLa
 i1I8qBG1n5RTUs9udZu4yMiyZEzQwMelmTZVXQprUo/kYx9v8Ep8z7SkxATk9w==
X-Gm-Gg: AYBFou3efRvfMZwkZI9pra9+GWScN1IIrZeQ4B+AmUHZbf7uq0EH/AQ1jJpn9tnayOt
 M9/MkuVbNmM4Zl3H5FHbKz7Osh6yKrsuCuWNkVJkDVZnEoI3Gn1mWZiANmg9AHiQ6Q1DIjTad1f
 dsIxAULkwGqbGAabktoRMmqB8Ijlu4jm/PvRWFWvisAv8SL61tr62fxq2Hgw+dGAZiX5BClgBBk
 EKYM6DMsKtyp84bA2L6i6wEfHDLyDqHngn7euQ8Yl5Gh2FCW497XszNIDTbfQ0hl/N+P2dZkAVo
 SdZBG6R6V4JorQ68v/eUKmva6HzJ5FpZZNmeMaqQ1PzCJNTvIBj80kN9G1hKwEc6eiAJ1gDQrhV
 y/ylPyX3nbZFvkRxkKXUPnLT3iYzyA+NiwnqQiQAKnT4luS4n1EbOxsDVV+GGD09t5o2MA3YDeS
 yDPhZF1dkWRih1dwstzZ3uPKFmRMoe+lvLfJduOuIYQEn/rVZ01q6+V7lZDHnvY24+nEuPaIzsk
 KMFGFyh0DC40mw9d3f1rFS36ittyfPPbwYrZ5OqM8Znl7IuFVXdBmjU8xPhqouNFI+Ymfu6uVFl
 YWFcyQR+rSEWjm39bdIKkSNcG+w8aVdxTgHJFrNYKfwx4wVgGAY0bL4YLj2h6Lq0DB0WBjG9+t0
 DGICNvmz7+oitjocR7ZZoQeFigsrEcSz+Y3vTRsxuUPav
X-Received: by 2002:a05:6820:1c87:b0:6e0:fb60:d5c3 with SMTP id
 006d021491bc7-6e0fb60dec2mr2449966eaf.47.1791070157561; 
 Sat, 03 Oct 2026 16:29:17 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6df37fe3061sm7053172eaf.1.2026.10.03.16.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 16:29:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 17:29:10 -0600
Message-ID: <20261003232911.749403-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-botocore: bump to version
 1.43.108
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
index fe438a9e80..59b04e5f07 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  9e7a3210cc146e77aec1c7cd6652ee94  botocore-1.43.103.tar.gz
-sha256  8c7f220e09f3b7ec99c59c716aa66cf6f5b2b57fd8731544054f3778aa744c6a  botocore-1.43.103.tar.gz
+md5  74f03a0859f14c28ca78a6694f74afe9  botocore-1.43.108.tar.gz
+sha256  ee4f75cf3bdbb0da7912e089950e8112f692016539d939312c771499958e6cfd  botocore-1.43.108.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 0226e1c2b6..264ea1aab8 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.43.103
+PYTHON_BOTOCORE_VERSION = 1.43.108
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/3c/83/acbee6f2e3b1f02de935fef0c48a387511bf979149dc6b44466aaafba6a5
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/61/16/6b4477f433da2c11193802f538330ce080076c2f38d817ad437ed3cd1465
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
