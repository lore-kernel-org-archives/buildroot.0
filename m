Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFDACA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 22:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1330840CC3;
	Sat,  3 Oct 2026 22:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgvJXZF_RN2q; Sat,  3 Oct 2026 22:45:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1018D40BB5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791067508;
	b=i3nhjth+b6R59oO7biC36RbQPVhjwvmQmwAbzuP6yq8Ld2spYsnPuWimYGy+/bujGGKv
	 XivzWcA5bjxNBzNOM1Jy8k1LJgSbtmZdfuvtfoYW6NFZg2pOPRXG8aJyCOAP0MRsTIAF/
	 Dfl24yh5Cvw4mBtY8SvfK7LRRmSdJ8opVR2OPa6DVDWn78kyS1whbGFOTEx1/s4ZO1uFi
	 JG2OyigJHPamD9eO2r2/28wKgCxooY3gHvqeB/Ym7zlu3ihftJJpPsYHnmcVD0i2xhsQ+
	 cmNMWHy47U1PULElHQwme68XehJt35L3R8wMof16Q+te+6OaehYa96lSjAhYsn/jXlw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791067508;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kRWbIe1xOsp8j4MXy/pwND4mHV7xSR2TQmkL6srJTSM=;
	b=nFWWOFyuvn71/PFG7h0fmd0/iZF2ROiR9SmaVRG076Lavsm4zh2/gqj2YNbvW+bo+CJK
	 8eLmpMadBPBtxOjz1o5UXp8gmFwSBe7NryileTKSDvsGR1mmMASh20IN+TDLTsaGBjssm
	 cQayaKrVri2QVXtLk3pJwgZp8+c8lA6+K+JGSLu4tP/ZbKb2vqAGlRGwx4VoMmbVgeupg
	 9KSPmRv0sTNw9468sM15VGHPzGSzTHIMOJnMSr8/lsHCXY/gfhqcPdTbrWf1bPeeVeKmF
	 nMoR5W04XjcdB1IQ63exI7iWW42NKjuDf6DSgmj4fh9udSHr1kTnbyAqsihbG+jGyvw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791067508;
	bh=kRWbIe1xOsp8j4MXy/pwND4mHV7xSR2TQmkL6srJTSM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=rQqp32sMKohB5vJsko/nFJJvo7fLpuagC9By1LamhmIzFRPkiZtHBsbp2llPMd/QL
	 XKF1p2TV4hNyPiLctuonwjT3yOv3Uk9vgmTE6SRF2+CM3cSYh+NyYaF1ZA4J1/1mZh
	 BSoUuivYFgMJkKmPhJAVOoPTD/cVazuhAIgEYZFN+IC4AACDps33msECGp5gKoxk7G
	 EZF+fsu4U//D0tPoWkKPhP8bexC6lhmO1e+jbEgSQQvGzwvrQnWJQudBZQuMVqO18B
	 uLPoCpex/lOuFmAcV5bVetIqCj4Jwt6fdZMwsWRt5+q3ZCwY3Vw9i8y4AulueYPkCi
	 BsQsSaIhVlRBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1018D40BB5;
	Sat,  3 Oct 2026 22:45:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04C9D263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01FCF4007E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_3WwDqt-ZsD for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 22:45:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org EA69340055
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791067505;
 b=ncM/Zx+pgFvUrZsZ7LS66lUp1PuQfkReZdpuMGga3eKhhNFEajBhaxfkXZu6drLS7upu
 w5tuwpJDG06kFefZgneFI7BZSk/ubB/rRJppy7KTy6EorSX+bge9tl9+Auh3/6erCPgdS
 hwtR6DemkYUZ+5zxZkhzqhBOL4gQIcAV/goQAxMosQ43gOw2xa0bIlMsSdxWFh1WlS8/t
 gud9qnwo65iGeIpl6Lmkc4q34hjkTdWS78CKrw+SAWNJ9l80m9XmJsFa48wBArU1mzwqr
 ed+HiMAe4g9zEVX7kvqtTLajm8tYRG8wOSjV9bU9mjzKGB4LyS6vR2E/PzRU42t3x1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791067505;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=mUHp1LjWxy85Txdq2O5eSmjIdhPgCzRc7bzZMEUeIpY=;
 b=XtfRmsDrlOLJykisXuc8W4AEa3C49BX/eKRw8qeO/HuMq41SJRL0B6Csz9iO/XWyUZmd
 Mb+8Nv5oTATFUuEPQcyq2tBPmF0L2ZZd2GvUpyo/j4lUSVcgkih8eFWFaenBvN+l4irli
 XQqSpXJAcJA5q1N6lVqY7P/j/B2CukspphPTcYfbxa8endnj79jYC3FuSDKDn8u9mHk2v
 Mx/zD9sZB681UwMFmAxxReUPezcHZS3mBz36TUvaqCLNCo2K6J8Mg02RlZGMf/051pVUp
 Uy97TR+vR+It448RAc9NF/w9Rs+3PhrKqHt6ILBDt4imnOIUtGOTvqVuBpRnMnIVCMw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dyvgIb62; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dyvgIb62
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA69340055
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:04 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-82478760557so500121a34.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 15:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791067503; x=1791672303; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mUHp1LjWxy85Txdq2O5eSmjIdhPgCzRc7bzZMEUeIpY=;
 b=dyvgIb62zafd7/8KCAvjau+6CwY/CBzuRw3YcmgfBJkfpzRaa+Im9oaSeAuA+E5MeW
 2Aq925t7qKo7PhFjBHFDr1AtLoJe9w7s6IHT6nmri4GGbOhI1yse+1yLm+wVBIBvMN33
 46UKer2Bxhz3WddobYnp2Xplav6KwaI9H1Eyt/0EDjQIvcGbWYiFuMbxY91EpmnBovaA
 dt3NrB5kcIvXiVuXKO4B6FQR1SKHm+CcskL8Gy5i/xhxLs4L6afzhjBuNi1l10jJinNm
 St3Jt70qlpBF1GoJN9Tjf9ROyr3WE/UStAW32KAJUcMK1GRX2zZux8dSpRPTO+McT2OK
 t/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791067503; x=1791672303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mUHp1LjWxy85Txdq2O5eSmjIdhPgCzRc7bzZMEUeIpY=;
 b=hx7OBgNmJxc055jZz8lxNd80Qcr3WH15KcNhP0vZ3MlwXh1artgGyBhfW6SpNQNKIL
 kAct4nGZiXiJOnNwo1Z+yjTQSYTC1h5cfezULnVaYNEZL+EAj/QnGGcLijml8nfQAtEj
 JBURlwchUd+gi1vNsuDMeR/QjwKlGhsgrRPxR9S+BuxYJlcRqQHCeq80ocUcS4WHsAtf
 pJjUvSmIuY0v2AtWL0UkznU3ZWPWSJEh9NCF2VpiMWowHKYgfcb7jQ9iSuR9NYQkK7Zw
 eFKJvtfADMKLMq1xejfkohUQ4zgqU6B91PV9JVuUShaxbOtqLxMsdNL+LRttB6GddMXi
 uPJw==
X-Gm-Message-State: AFuF++ntxFrX1Dw6lbBD6gDzIC1/rCu9H42qBbqjeXMd87gwthpM+IAn
 aA7yfBTHah3fWvZWUQrXxc1ulKJSQqOXp9CCjj20Ck1EpntO/unfhoeMZxwhCg==
X-Gm-Gg: AYBFou1qvWRI4EPTAwE+TFfKjYdLscuIKHK/Wwb0ZtsRoiTqg0DzLw2bYzLPzi1U58F
 lpfmHSVGkz/dYm3UGrd9svtb3dsiSo4tnoBQwyCMbPMcpN1WycJmzzpiVf41PoyvXRqou5nBGyH
 2MGvlx0ZROuBoo9k7EFKNCz14BpMSVyehwatfPf8DxzIfQrVh4JtnF4oW+Ocpf9PV9Kv9xsA0E+
 hygcZSq0akI6nACqmOCuAMkygtCg+6PRjLANOHUOwAhreCL2SYDmx8Xusq6JYHtVYl381ShidCd
 7CIIem0PTjQs+sQ4B0LA9+PFigqe6TdBpaYiPKDyFbvhTFzzTR2/dQPT4I8nMANeUg11R07Nhlp
 mO0VEbQHDa57sird+hH0UKfmkXBhKUWQ84TED1diefGBkUYNv+JZj8WrHOwAkGAfN21pqfP1DxS
 A6u7F2/Et2jOrDsTdy7ys6ims6JHbMFeQ/CsFJD8Cjq98WgDFq44bL5lV8Jio6UNgKnzMlsYyLl
 1QkzuhjZjOdkP6Bj5cxwsm5LLdaYAa9ie+j1rLFxku1pLwlw4L/tE+S9FT+DL2+gw4He/Yg445H
 cwLZk/wWmP+vQUg2dL5xfwYPC43Us1vGNtI27Z99zcbvBpVt5Er7K0Fw+1Og2Ahult+cOAtRtPT
 d/UDgCvcD0TK6Q2tMK1klLy2zvCWeO/XNPswRMtfZpg==
X-Received: by 2002:a05:6830:918:b0:821:15e6:d2fe with SMTP id
 46e09a7af769-823fe5192ddmr4250973a34.31.1791067503109; 
 Sat, 03 Oct 2026 15:45:03 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a36943bsm7262522a34.19.2026.10.03.15.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 15:45:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 16:44:32 -0600
Message-ID: <20261003224447.744966-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pysmi: bump to version 2.0.0
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

Update license hash due to copyright year update:
https://github.com/lextudio/pysmi/commit/170fccec8ca124c581cb0f9cb5d07c41da98b5e4

Add the python-lark runtime dependency.

Drop the no longer required python-ply dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pysmi/Config.in         | 2 +-
 package/python-pysmi/python-pysmi.hash | 6 +++---
 package/python-pysmi/python-pysmi.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pysmi/Config.in b/package/python-pysmi/Config.in
index d30e24afd1..8c398a2435 100644
--- a/package/python-pysmi/Config.in
+++ b/package/python-pysmi/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYSMI
 	bool "python-pysmi"
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
-	select BR2_PACKAGE_PYTHON_PLY # runtime
+	select BR2_PACKAGE_PYTHON_LARK # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	help
 	  SNMP SMI/MIB Parser.
diff --git a/package/python-pysmi/python-pysmi.hash b/package/python-pysmi/python-pysmi.hash
index 856f59baaf..0d7854a4db 100644
--- a/package/python-pysmi/python-pysmi.hash
+++ b/package/python-pysmi/python-pysmi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmi/json
-md5  406818a9bb351e665e2eb9e9352a57fe  pysmi-1.6.2.tar.gz
-sha256  abed01673113886d10f0f336426859238fc13b5383c7e28e13dbcd5af0443ba1  pysmi-1.6.2.tar.gz
+md5  c790e3c8d1f825d7557889ee40b94593  pysmi-2.0.0.tar.gz
+sha256  9eeba85ed59c5de38f512fe9858ce3332864526f7efc8135b3e3f552666cf79b  pysmi-2.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  ba934e538c4116c2d9209c14256778b9a8a246234a3bd9256c62f396187e80d4  LICENSE.rst
+sha256  72bf37e11cd6e07ea46ac80eec46f2d72dcea5956bf0e1482816dfdfb7e40c4e  LICENSE.rst
diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
index 2288f04e88..cbed8167ff 100644
--- a/package/python-pysmi/python-pysmi.mk
+++ b/package/python-pysmi/python-pysmi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSMI_VERSION = 1.6.2
+PYTHON_PYSMI_VERSION = 2.0.0
 PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
-PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/a7/80/917111aaa4bf931bbd4d9a6c89864de2304b79cba8ce49639a6440ecd5ba
+PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/ce/69/5666ed49ca34b418c3fdd9a6d7754566193ae0b9d2bc4b695ade7ef85b77
 PYTHON_PYSMI_SETUP_TYPE = flit
 PYTHON_PYSMI_LICENSE = BSD-2-Clause
 PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
