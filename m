Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9CECCA462
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E53804091F;
	Thu, 15 Oct 2026 21:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gNdlbZkfGc0U; Thu, 15 Oct 2026 21:55:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0D4F7407C5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101320;
	b=F3E3I/4Hh2rKGM+YPkQwicGaqSFAGHCx3sHMYshWR2xLX6N9tbYKZemkofzU77jASccg
	 HStzDxoDSovB+k5HtSoqS1wW1bpbz8UH0uzbB4KwaoP2bZP92wJH+aMsM40W2BfvI4pMd
	 jVovlK/0MOWqC5fZX/1IBOfV9muX+GmExqrUJHK66wSkcXTLpZf+la5pQ2LnMgHDB5zig
	 uMjJGDl18afImhb4e3u2Wkmfka/AxeSGuEIqZvkA/46l4OV4zL5MKbC/N982FGEHzH5HF
	 dalgbRoNeTZiFxA4cuKtA+k6rnsuXwfG8TIABULUQPFwnpZRTYqT+lZGrc5XppZfq+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101320;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=wgRUD/R9Yn6QSudcFnREIdARQatOiZyJtTcvNG0Mb8I=;
	b=TNKWv49sz25M9wgpZKh1qhINNx/pHPcgZxtTZEeZLLohybNiMjONuERywjbO+l+HeoXU
	 f8Y0yJZnqGdG4/ZiijAvVc+989jlElzhLibmhSS5E5cUnAlMkYmbseNh8kUcF402vT20F
	 HEpXs/aqsZeDK27YLGua3nmrMngazpw9rMGyjIsYoqsUmz1vMaUukB9dyqL+9DAzNEwpG
	 qkBnlBy10+umiUN92hIHmAtu5gtsDJ3wqyaurj3jm/+nsQDP3K7anCw82hHyZvv9r/hu/
	 DEZzb+WfCTVzhldiupRhGwAOki8Oojk807mPyc+X7dkN/W1URvWFPGOecZ59TrQ9PfA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nS0rt+qz;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101320;
	bh=wgRUD/R9Yn6QSudcFnREIdARQatOiZyJtTcvNG0Mb8I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gOHFtxBL+6Stz3j5DlRbQkgJhKdBOTzy5maH8Nk5lLUuZW5SF2YKkA5SYnlUJD6tB
	 s3ahRYWTyuv02riLbe1cC+aGhe6qebJsPiEY5hoOj54ElxuzMMLPUNgCE9gNlYHUZ1
	 yzMsxXs79/9d3ZrO5z6aHZBfEwuYpwZmSdN1OQPCSwCnuMoFizjXkZQNCom0aRi8gG
	 MmZrTWUN1uxx1RQS7AVN4LXNrbX9TkYIgdr5HVHei7nKJc4XbtEHvkzrTvMPC38RxQ
	 MXDfQW7Yz9mb/4+fOk1QdXFxrj8obqXx4KzQtEHZ/gVe42sTWN+nTdHa36woaKKhQZ
	 uZ7e4deWDKj1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D4F7407C5;
	Thu, 15 Oct 2026 21:55:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B0CA109
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30B23407CE
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ztJdTTkfSfqi for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:55:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4E760407C0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::31"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101315;
 b=rTrLHGp2k82LqoiMH9VgVL+0bExXkQ8XaQ+kPVdr9r29kKbWiGvRXPxl5Ud6mfgTDYQC
 /Af859CgwK/nEAI4hxMjg/wj4JHE4PSpvpobgyrG3KTDkyU7QSTlzAP4+CIRRv76Cmq5p
 sQlNsRSDNpj8r6ikCnoA+9g95/o0K6af7Xrm5o0U6z42GZlsxVsBDy417smezpYlqKsdz
 +eld//3BUBWFwYB778+hs6F01dtZzgDtwkIW3j2bLPFswYHKAD0hhoe8u6I3DIMz/mOSW
 bCzNE9lH/w2lIRz63NhM1h1qLZfRU+dCS6OMBAv09VTsiwMMCmVz0ARLUkOjevEe9yA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101315;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=jPDnGIWgoRxrzICWlMwku+DUFHVwM1WF54z6lG1tskA=;
 b=Ryaz+OIOZrlXy/Vhq+IdFJTyJUlO3btXAh2RjVC940F8ZDHGBNpb38Ja1QG/Qcldv5Yx
 Y9957V637+uhIpFzTdAYbakXQUonkFB6nsaoZ9SgF3xwR0odh1bVx4azLxD2Aon04EfRW
 9uuN1QAJWON/UHTbhiDYeedQGjd+QvtSjIfrAhBZo0LE4w29jCqU5OaFukxCmAINxhxIQ
 GyFhvQbQ7kmhLefm+k6e+oh1TzhNwsZjII1GQDLViw2Od5CNYnzSGoONEgHQfmtod3DVS
 i7oj+3g1n3+FXwFMtcEyHxp58fQas8wbPXyE7hV/GFVh80LmDDLs4F2kd5v2p9W4aKA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=nS0rt+qz; 
 arc=none smtp.remote-ip="2001:4860:4864:20::31"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=nS0rt+qz
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E760407C0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:55:14 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-499f20c7054so3232184fac.0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101314; x=1792706114; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jPDnGIWgoRxrzICWlMwku+DUFHVwM1WF54z6lG1tskA=;
 b=nS0rt+qzXiD+NwHwtvHtZhTSt4vjaCz2+AMr6/4RTTZg7/r7Wj4+qXkvUDRHgk112R
 qLWeA+D90Pj3JltsCcZxWiBthxwdcU1DaX9LDQdKWbbTENrZDubdhOiko8dIl5kCAMSf
 YbclMC5v7FcolEoJFTqaDq3tkrs2iR1N/gYcdk/XPEY6l+nOjGNOh7TvIkznk1bBlTbJ
 8lqFAYqJagI8JtpoeC92QTwJAACK1iUlzruN2YgboAC3+BnHZyogkjSApG8jgb2vpYIt
 PVEJsyB+Sbvc/meRxSd8SUBvf3gbtQfW4ZsnuSNvOnL8+HjX2hWXBak61uf2jenyFPzQ
 fl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101314; x=1792706114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jPDnGIWgoRxrzICWlMwku+DUFHVwM1WF54z6lG1tskA=;
 b=K9ph4O+a1HLHgLR3I1Y0iE6jmeUgVBSGy3ewEzc0SLdGVNppR3yB9Sb6/gtqAOqvaU
 OMd+//pnIpYIp1T4fFzfOEuVnH+abti6MP4Hr+HAFPPX9fLEL5UivxlklKmep426RyXL
 gVVul+E1ZDjCy6QRMfjSQQ1BIH7npRGAL754t1b1glb5ZgF/86VIv1Dk/Z7x1JlQ0Li2
 QbPU9JXPftIOCVoj5jecMDxeT0SN2xn4/ORjovDH/+pWkVPx0excNBeitq7oTT/YOVIr
 CcLAHJQb+TWKdTM53+CBSOXtydm+n+Ih3BZHhOI2QPFkjMOWZdu3vIqAMXPwu8TT8YY5
 UXEg==
X-Gm-Message-State: AFq9FYK6Z4Fi93f2QQdwTrIx7ZPanApZzjlKBN2RQEeyHWn64zPmG4Nh
 lgntt4TggcsiNgkX5VndmnBUkv6Z4kIlQdWBQA/Jsb1SFBPrZ/ZLlsTYz21E1Q==
X-Gm-Gg: AYBFou3Tqn5jSqWnaMNG/LAYDmgxIWbSaH9w4M8+VJG9PSZLTTEmf2YpJRCJcMWk3qz
 TF5XSVTf4/sVq/zH5UVDv0kdWhYpRAJ2lI37snif10ftoSGiMfbTwBrLUjYazbXWbPfQqbD6O+U
 C/xQ9y8Ukl5qjL/2ckUONU3HgGjSBA5OpUyaHHpyi+3nFjFYV4S2TIyEC8849qen5jUF9P7F/f6
 Z0tzrZj9AviDFkaG+DKYAnBaPhAxC7jnLZtKTNmB2125q0HCC7Pl00lHIb8hQHQ8thc4as5S2C5
 2GcJWuTP7eE6x/YQxBrlYxSO3V5SZxEn6bPjPuxaD2kjCt172YxDGAsXI7v2t5RxjpCU2u7qel+
 qTikyFBcYViJeS4z5c25RBUaE0vWbrwWkDyR0jRbROgbQU17n/0yKpXb/rq3HC0d3mZEOQys3zG
 JZ/VET4LIBR64b3j1TaF2gzrye4+QMRhSk7NVTkAVTDIn4dl3Uw8Lk/sLqSQhE9G5QSrNs+CRVv
 vecs1XfW+F/sPJgP/Ag96qQjRaqJX1DgXfgDUxl61wh9ruzStN1VOrrZ+fWqLzfy7PqSQ40Yqre
 l/chOBacyd44NC6wErYfu06skKnH5ekuiauj1xKK8YCSQE/9G18vom6amvO+RsCPtglhWoP30Ug
 tdkTh27gAAFffeachQsIaMecONOKmZA36u/1e/rGvYQ==
X-Received: by 2002:a05:6870:1607:b0:48f:e107:3186 with SMTP id
 586e51a60fabf-4a2a8b2fac2mr17295852fac.57.1792101313887; 
 Thu, 15 Oct 2026 14:55:13 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a73b6e4a79sm157869fac.13.2026.10.15.14.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:55:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:54:54 -0600
Message-ID: <20261015215454.3428556-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015215454.3428556-1-james.hilliard1@gmail.com>
References: <20261015215454.3428556-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-boto3: bump to version
 1.43.114
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
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 13a242c8da..af7ebbfe74 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  f1eec360124da94c8bb9b36f66bdfde1  boto3-1.43.108.tar.gz
-sha256  03341f089158368acf83e921aca98b706095322ca52bc4c039a616940aa5ad41  boto3-1.43.108.tar.gz
+md5  9a5cb05d8aa6985ffff5be9c5f711bd9  boto3-1.43.114.tar.gz
+sha256  be704857751564a5cf69c5bbaadbfa01c22806409815c73563db42fbffe583a2  boto3-1.43.114.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 97b263d8d5..7a8ea4b329 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.43.108
+PYTHON_BOTO3_VERSION = 1.43.114
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/48/59/fb93b6ebd9ad43eb9a58c7a6da51a0fe24ab0c04bc4d534a0bfc5eba7f59
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/e2/8c/f6f884dc947789317e73ed6fce85e18580d22e9f90e48d67c2367b02667e
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
