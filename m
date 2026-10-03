Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284D0CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE57681362;
	Sat,  3 Oct 2026 01:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eT9UlSAhbsoI; Sat,  3 Oct 2026 01:48:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 03CF08134B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790992138;
	b=B3y1oj/3LEiBHgNgoKg8w8wufEi3wheEogIYp7ot+4+xTaWwK1u6kmi7p54v0+ekZlmI
	 ZHmCBpYLqBmvHlvpJFkaPRB6e3/rKcCCZoRACdx8pYnTXcbR8RZ9WV891zkJ18H+8YrHB
	 2+hkBFzkogdOxtHZTcfVkDJoZWyt2HgPE696bFOMEjCwpP4ev7uBOuSFKdWG8/EFX1JT5
	 zsmCzWiOwCaq0ypVXNThIAfP3R67PdfTUKfy5rwAUtU4mbjSSSioJrN4O/WAYaWDviRDi
	 Oh/hfCP/RejkYDLMR8SSTqqVycENh+s4SDq21d+j6jux/yuQYjips48VIhAvnC82tIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790992138;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jvTxiOAq+LIAH0xYDee0uK8RRx2eWiJQq/FutE6r7Wo=;
	b=pZ12ZWQHEk0/mGODYTCKXqEFhGO4cCmtHkCvWsTcB1OlB1S7/J0sd9cBXscQ/MUJTDD6
	 ENa43iAP38eXAF3V+gWHhN1kzOmJPY+I1oFrQEI8akzU3wmyVg21SXBFmgw3pYvVp2e/c
	 jNgvRW6ylvID79XB0iDXa1nmeyCF4WEU/b2fi7eTR8qHBOtoftu/dPic4nLj9JT7TNLEI
	 SeODjep9xSWOzsRY8zuEdp9XCE8UQpQCliFwXS7IByCWDdbLNeBEPgDQA0h5962Ukz5Vz
	 tQ/dPyMQ9q7KZeH7BcjYBFeTdVaElOPDRdsmbg/SQmGtQNjSkayQyD3h1mRJ7/NMiLg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790992138;
	bh=jvTxiOAq+LIAH0xYDee0uK8RRx2eWiJQq/FutE6r7Wo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=hxqZws5vJry7n5hCj8/PamFkV6oXd2nZt6rWOlKkKWcBOclEn9yQ/2cSs78u2dHMQ
	 iXaaIfy3CMLZzcpaX9PGlB6tjSuSHaIeDmpD/IgElriaIliiV/LKEsTRQ2jhVXqS/U
	 otAI2wHTj1LGGnzB1APeSi3eehLMA2dTuHvRNI9pYzBjzJ5VhVPZoGPV1tXWbQWwnw
	 +TGqtz4W98ztpbOFBX91gtyE7IC5fYsdM6yvl4wryNEuVEoctRjqPpBt8C+m1/jMyM
	 D6p3eA1SvXZlpvul7CTm71aVYs/WyfW2kodH5WvrZxE3mMNHWsGrRl8K3eYdrGIOZY
	 RRPxHcgy9FtPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03CF08134B;
	Sat,  3 Oct 2026 01:48:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1D6634E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF0E860E00
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkFh4J0h9Hmh for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:48:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DADFF60DB9
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790992135;
 b=UQ3JjA2wq76Yiv3xcm5AkzbIydW0dXhQ6/FlOe23mXse/yx5C07CWR6lLa4UpIVc22Yo
 JhulchGfqMlSCUOC0eMrZ8hQs3qAJRKNpq/aoEbLJ+0ipJX57VrBDukD755q1LOoqe/1H
 HHcOaozCjI35gbKpBQI1EC1XM+tsgdLlXzcndJYgxkUSKSrO4ttAK57LugkPsP0JVDtmF
 uQDtrfFWk5Ys6vw8chsvWIzR9qLIzQaXGbfyfWjGCZqodi3Jhts/NuOHi4uHkILlLDNIk
 NbA61ZhcofXwVRcZt9jsMZ6CMNrp2t/ov69BckCycZgDqDb0oMJgxPgrcqOaibQsr5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790992135;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=vsFKRAbaZJkdFegnRm+MNUbWW58rO3TPcVgaukW5gwE=;
 b=SExaiXYTe48hWfuASLXC57c0rgSrEq9Q8yfTeJGT4XfHlYzoORqCvRhdCUEphUe2Kq5K
 MSmNBkl5BSRGtez+EzXZnlPLBjWkr2Lgdmrms/tRQV1zN3KZQbemQQQMm9fHPd8FF9tjU
 dUUpDME690COMyAJ3fabolQvTXYpujZcKi/dugChU27wqzBT6Amiu6OlWjwOUAsjZ0t6H
 eeagx5NNMRCrVMUI9icT9IQS5XyM1Kas6Ln+0t+cOlgUWye1xv0vtZJHReB2W5DwPmnMx
 6C2k+TXClp/onV/OscTy0K2goIxxgPcIF8lbGpOVebkbj9NHTfdFnCr9WIHJZg2/+dg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="EfF/JOUj"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=EfF/JOUj
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DADFF60DB9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:54 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-8247421d2ebso7799a34.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790992133; x=1791596933; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vsFKRAbaZJkdFegnRm+MNUbWW58rO3TPcVgaukW5gwE=;
 b=EfF/JOUj/Ff5n6dNimfae9PphhyPIUFVIOhPia3roQ7V7o71298wutvKvyZ+s0s+yf
 5nnwDJPLD5d4jke9X2mnv24wNHv0Pso9qNACUz61ex1zE59737tKWU9r74pn27Wquo4I
 8oD78gOkpIOyT27UawRp44UnkyVWntdsvMUzcfD27hRoAQN14Ox8jxsdAMY5jVblcYSh
 EdZwjp5H9AQSqRTcDwqj9FhBQYy3qO53v/5NDZNwuRrQO8rjPrxVFQmHYjuR1cfQHkYT
 kz6Gk3PlLkESFRRNCPF4148kau01fP+o7gZ3OcqWqFUV43i12OSzvQieJ8nOcg2tiJEa
 BWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790992133; x=1791596933;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vsFKRAbaZJkdFegnRm+MNUbWW58rO3TPcVgaukW5gwE=;
 b=fsYrN9EYy9TSUcp2wlFQoTF6ZgpLHmQ+VBLLdoAzCvc1EY7BoUxY8mU7PLINUeqG0E
 CI3nD0dUM0gPG4RpijE6zZhUYRHgG2zz8x3+dsL17lDbSzOf8kZeb/2v4oOUgQMCk3kr
 8QYKoYah/V5Ai0sLguB1BQsOmZBJjCL9ynk7NY7H51owWh8YBNvvIsQ6kjQDQyn6AY3w
 W+TvLxCQPfG+WCgmbxqJbotzawefkKy1DjH4aoYNAQI9l0Uf6brzDK3+vdRfAy9PnU3h
 2e/gDO1IoT5Sfy9f/zNksNa/3jMwpKUcS0/oiBCXiTUB6deZl0V2soI6+EsCpcRZ7txS
 P7Rw==
X-Gm-Message-State: AFuF++mF0W8W2oUluIJvAX1B/Y/IyqFkj7xdkmtUnkSQroSpUFM9NtpQ
 32YfNmxeHGldOs5qkC+p2SxfKV6uDvXMDCWLWBqqHUXm3c7BM6BRfOwTx6n2qA==
X-Gm-Gg: AYBFou1faaVTsJTyG/FossY1Vc2kQUT1Q4OzDeslNfgbLnYtvgNHJQdjaEWDTk0t/fA
 Yja5eaZ3RccL8FwQ7S1vQo5sFxojqjGqVynpQq2qupqUVRLReMmECYVGyp67XIZZuaM5VrHHKnC
 128coKQxEviuGY52LT5ZwajRov8aF0aRi05gE5JpUtuKU+l+R/GKtdMRXFOMIzhyF4CZl1VGcyY
 /ltlP4crOlgEw4nZXIySfdI6pViIkQJ9dK+1TSuFHyS2VTCLuzpB+Z6vZ8OTKfDGv0f+QbQDsVB
 Rr+YAuEiK+C23Yvya8Yz7NpmdCTFUd9rrOuSI8mnpNQJ83zH9BVv+7Od7fZZzvb4IIPXibplP+6
 +TH5/RC5cQOyhBlhYyDsURZo8l00uQ9HCDHtLGBY4UDYax2eA1M57lPefEXw3ZNabc2N+n/HPN9
 /BdxZ+S07mtIjj3BCfd1/yHq8ZLoPgdpHJSyWFoumaQ9OYI7BHZLeGU/pey2Fm0OTqO1ScgDenP
 ckxn7vXg0S7Qqhe7GW86ssOuUazBULbYekA2j0JO3e5sa3YKwmcYdShACbhYHlr765aDdVG7gnF
 gLpAmo8HaWip/dqXohXjOJ449XP/voquzrn1oCQKEsDTVrlLagPS0aZIKBvLAOTHJvpuTLwTh9b
 ITT6jSfgpQ9a4NKpZvEztCICSjz9yl/7434EOhXS1sKs=
X-Received: by 2002:a05:6820:81d8:b0:6dc:beeb:34bb with SMTP id
 006d021491bc7-6df35e2d88emr3698384eaf.84.1790992133439; 
 Fri, 02 Oct 2026 18:48:53 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-49e16e577c0sm3990524fac.10.2026.10.02.18.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:48:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:48:27 -0600
Message-ID: <20261003014837.403895-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-multipart: bump to version
 0.0.32
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

Update license hash due to the inclusion of the full Apache-2.0 license
text:
https://github.com/Kludex/python-multipart/commit/bbfbaa2f2239f3ab05e6d040c14475a74d24d8ba

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-multipart/python-multipart.hash | 6 +++---
 package/python-multipart/python-multipart.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
index a5bc988b02..5163c82fa6 100644
--- a/package/python-multipart/python-multipart.hash
+++ b/package/python-multipart/python-multipart.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python_multipart/json
-md5  0debb97a2b5d68f8dd5119bd200f4010  python_multipart-0.0.22.tar.gz
-sha256  7340bef99a7e0032613f56dc36027b959fd3b30a787ed62d310e951f7c3a3a58  python_multipart-0.0.22.tar.gz
+md5  93ad538d98ed5604845e537d8a0cb369  python_multipart-0.0.32.tar.gz
+sha256  be54b7f3fa167bb83e4fcd936b887b708f4e57fe75911c02aebf53efaf8d938e  python_multipart-0.0.32.tar.gz
 # Locally computed sha256 checksums
-sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index cdaae6ef67..7572dc4a83 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIPART_VERSION = 0.0.22
+PYTHON_MULTIPART_VERSION = 0.0.32
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
-PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/94/01/979e98d542a70714b0cb2b6728ed0b7c46792b695e3eaec3e20711271ca3
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/5b/42/55c32bb9b12693c092ad250a0e82edb5b31ddeda6eb772de5f308b3804ad
 PYTHON_MULTIPART_SETUP_TYPE = hatch
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
