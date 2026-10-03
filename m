Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AC9CA5FE2
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F49560DC6;
	Sat,  3 Oct 2026 01:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPLhbA-wRLBZ; Sat,  3 Oct 2026 01:34:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BBAE060649
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991247;
	b=RQW0IpxnXTy2ELje4KM944X9VnesDPk4rjFYwB0WmqWWewt2Bs7Qt51db175l24UfYRA
	 OBGBwZkS5VABgA0jGzmrNSKYFLgHx8yd3JhTf7E48ghdeFbSHo3GPlz8YbL/a2eSobPt9
	 JdRr7SU1wo/U6/6VxcqsRb3Bv5AP9xEaAOojSkfPH++MFIJzhI5G+48olhS8v6oQdfa2a
	 /EjHAuulqTXwFPSl0mLgWE1cG/MPHHtYDtnxZ2+edjrfP7vqggvVbmcQM3LttpfPbHT9p
	 ENnXOn0so4HCu8xpKJkGYMgihwDnZ7TyAm8a5DkmMLmRJgQRlRAMWfSGR7xUt8RiUaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991247;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2HBLnFf/P7mUw60bQVNcftXh8c6m3HmYZfUCR3iNz4E=;
	b=GRgmuUWYNhWJXRnafrOEZkMzsX3f8euHIzsXT4h33hctpci1lfbMx9rv9qIUsocJOOUc
	 FoSorUqwf2VvW1I6g8kMZP+3+QKE39AEP6QgZQLg2840PJRBM29LPKI+iFHwVlQpw7Pxm
	 2nvEVRgWUNd9xmjOb/NjUB5qNFNK688yrdkNSu80j4R597BRwDWFUXMdoBBWpra3YieIi
	 RoxUU/aphWS5Wvgoj5wo5Il8+gyq8X2LSkQnZonmBfZqn1g3AMGdUp90uZWIbcYN1QAzc
	 uY4iSqcHOdkFlnlfi9J319eB+EmiUtXO41wMaX6RXAO+MjG0ilj36CnqLAUN0c8Q9+Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991247;
	bh=2HBLnFf/P7mUw60bQVNcftXh8c6m3HmYZfUCR3iNz4E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SMDJQPi5qFd1TWFRRrCzNZuQwIjuQjTgK8VsP3Y72ka/SS5heg4BKEh2OHwjc9UhW
	 1tjirJk2+oScf7DS5mLusYz0KiZ9fuDWEgX7JC9IZ60W9CUG+td7YWi+W/lKtmPpWt
	 QFNPBQEbrsxvHc0HKhoAczSh35oMjxwA5zklbtr4TcnMS+jehBcBWGt/sPuslaO5vL
	 Ilw/KA1YJV1aFum4cP3J3/Y7ybp8yeLy1dIoOaZVp75vewuixWAUGwNRJIFEPzq/El
	 RW7U/Kj4qGw76SEGdsdgQjBqABxJw1cESHyi6vfz7jkTy2K16X+5o5qTAOw74ieG2J
	 j5Rsf+qTpz0kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBAE060649;
	Sat,  3 Oct 2026 01:34:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B205C1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 955D0400C5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcefsOjcLAAz for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:34:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B0DE040059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991244;
 b=cMqxyQZtuNP6U0JtTJtefXwxeNZAMGX7rHHiJPs6THBW/dSFNCtwlvkKaHei2d2xL7cz
 rKuY/LwFSFu62f6Vcl5nh2tusbuYT17tBVGgrHC4ED/dsif2GOZPNqpxBhmt9lwgJOQ6A
 3HObOUnevdm+p1CL/4sey2som7+ZwdFo5z2jEOmfnPNoovmFiWenZ+SxNxA5kderXhgE6
 RkLuSD9iR5lFTjgNP+mGA6V+cvNVN01CbUhL5sI6/fri1NiEFZkp3tZ0HrKE+UvX5PYDH
 HEo2JGs/HDkCz9d/aPBY4DjsMFFlEXq0mSOiJHqXChlxWHixVgpW4l18qAEhNpdDXrA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991244;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=6gFWHOBzbl14cteohC6JvkV6HL8kpE4HQOW4a2uioaI=;
 b=i9n6Xemdc3fCFYua+aor1pHWmczHtvzGfso6z1eet0YWtYEXdR2GQkJPU7+HsD/wlSRE
 VM6Zq2ee0krRYL//297faL7F/4VhQ1JmySFQD7+Kao/2a91v2/IBt0n7wRXS1ObJvKrsm
 ug6pWJ9o5IC2m2Bt6R18M0vnkVPByFpApLiUtAFFhe5TQLJUBPY/ETOwXK8UliOiCvOJT
 XzfToRDIeij6mWrL/jIpIqzHYaqTx5AKiJV0JM3TfdX3lwkAUdAh3O5qQe4yC5EtP0Qys
 AJHey524581qDhBouKhwgBqMJBgd5YVBupTh+urN6N8fuNXWU8Y5VbCYMgp1TFeKgeQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mICNlhVb; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::f;
 helo=mail-oo2-x0f.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mICNlhVb
Received: from mail-oo2-x0f.google.com (mail-oo2-x0f.google.com
 [IPv6:2607:f8b0:4864:31::f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0DE040059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:34:04 +0000 (UTC)
Received: by mail-oo2-x0f.google.com with SMTP id
 006d021491bc7-6df14b93e47so193191eaf.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991243; x=1791596043; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6gFWHOBzbl14cteohC6JvkV6HL8kpE4HQOW4a2uioaI=;
 b=mICNlhVbL+duKsZAWBvFH1qAMaI63mBoEQ8YoBplD8UuxjEcPezoCPbEOy93weQl6m
 ttzx3mhpajeGkv2gGUMxNFfrexb+PGz2GZepu8C2CvPMU6Irwc1t7vBFMt7v9hNbCyxO
 KUbrexlTc59hc8yHMs2WuqLk0xx9aPtk+sqUgID9ZP7PaS2UbU5SdGyxy9W9Xen74RiV
 tLf+1UMbqLOT3309yK3l/87UrvFTh+6G52l5B6NycPzAqaBv8N8MDSQIzMV8qKuySq3t
 r4A0sl6bnU6cTapQ+pPiGYprRMN1GxTFJjxts5M5kdqGJ/DTJjAF9/CZEiHbwyoBPR4d
 ljPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991243; x=1791596043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6gFWHOBzbl14cteohC6JvkV6HL8kpE4HQOW4a2uioaI=;
 b=yjhcTdAaPjJNY2wjtDzAVFZejjdNbcKCek1utTf4/euB0Z38oLirean36Jagf736fO
 QydkY/FP3eiqPBLb5OBuUNsfMurKLzjHDEE6VsD91qyoeLvR6Zou6TXqZ8LhOnlQh4I0
 gwrzB2mIFLLPNIB8rSjk/C/gG+3Xxe/x8Hb7D6s+OkbdZaTKeOXwfxDYpE2jyr3Bg9+O
 LzeKy+A5o53/n9pSbCCtUc0znEQwYsuwQ/nY9y2WIRLuQbVxP5w6Um9i0xABZeAW6Iua
 65WVGIAC6qsMtLA5czmQ9DoYzx8r6taVr5R//AiDOolSnL0uTu3KALFzyHXk/RVGijg8
 6ukw==
X-Gm-Message-State: AFuF++nGX4CF0PC+iWm9HGZUFsRdQocHZ/M21ifTm62Oj43EXduylJ7a
 PofrfdV4BXE0YuemyJQU4giSXtxYo8zcVV0Lpm4TWn9xkNRzOLPnXSLhQUSbZA==
X-Gm-Gg: AYBFou2dEDDhRBZIHl2FZ1p3AiqyBkUiYcLSPy/TEs2Y8j4u/7czOtJJhtBX8lrIqaL
 e0DHPDW7pfSqn75W+vqOWiTYCeA7An9surMNIk0PbQVj0q/W25RqrQFAI3hSa1CQ9VNXXsdB1Wm
 xAvJ2W4zjHvf3KtClmGuEoumYoBy7OkpoG1a5JYNKh9ZmetR4F8fgt2labD+AKfaxrq4N5ZMTz6
 d0MdfViJdvIKXBSTdVzs0OudHJhI/dTG4c6xRxkAZoxgu5/5/yJs6KB98Q6uyZS9s3XWe+WAQRl
 fgXg0ofAVSxejGtT7t/MmMXAT5tS6cfH+sSp7IgDAicNdNdsmWs+JEWr+qMzleTMcarGuerGn0C
 NI/fvOX8yn4f1cXhw9U4V3P1hQhHqGsfPaiCbJ4UtlMFiP61s1DxZTozcwPQcd/puRk4vPgbgeZ
 0ZbJdcVBblDFlvbYjuJ2+jy2Ej3NyZp+PdOVQV5IrPcGR6unDKsUnNzZ5yrJd/vO6/g1AISJK+r
 94/Hak8/cBEBiYo3JgmVe3jU/w3r1/8J8sFp5LDJ/+LHsk2faDfANbkFdOIlqULd+ph5/284Rgp
 A36rqi75oO4vhh4i0AOdY4jDirUiW2682LtSUzYYhPQ62KAnd6cv61fc9TNnOVA0T4ac3tb0ivt
 dejWkTM33CJDColy4E80SlGNUj7kaxW78KG03UTT0tQ==
X-Received: by 2002:a05:6820:4dec:b0:6cd:3fdb:fa69 with SMTP id
 006d021491bc7-6df35d37281mr3014884eaf.84.1790991243077; 
 Fri, 02 Oct 2026 18:34:03 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:34:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:34 -0600
Message-ID: <20261003013304.400979-34-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-yarl: bump to version 1.25.1
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
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index 1bbc3e9edb..e3f70e83c1 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  323301056acefbfe0d57e8ab8ba33eb3  yarl-1.23.0.tar.gz
-sha256  53b1ea6ca88ebd4420379c330aea57e258408dd0df9af0992e5de2078dc9f5d5  yarl-1.23.0.tar.gz
+md5  e79fd328e8d575b8c7a1766fc7fede31  yarl-1.25.1.tar.gz
+sha256  03dd38de09bc213e9a8b29761eec33ee1d5318dac0e49d8af36e4d27830e23a7  yarl-1.25.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index d04713e569..11fa128efe 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.23.0
+PYTHON_YARL_VERSION = 1.25.1
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/23/6e/beb1beec874a72f23815c1434518bfc4ed2175065173fb138c3705f658d4
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/75/16/e8be8e2fb175bbf41a0680381a319f1199fae256588241a2ac8677eafb49
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
