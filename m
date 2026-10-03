Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E877FCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B32E440DE3;
	Sat,  3 Oct 2026 01:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqjL9G2MBtQm; Sat,  3 Oct 2026 01:33:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B0FB540B26
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991212;
	b=aO5inS4HtRXhLfIGnx3v6vsDQRFLpJYICiPGsNK6lalCR12m/7hnnONJVUXFhgpn/PaK
	 cYNhqwbO+QzL+7hsyH885XR0PNQKyex397LLpXg1piS/CHmTtPnC50RoQ651eG89v1w5g
	 vol3DerSYX+8EZP972EVRYq/1oPa31QuWUq/EOB+Sq2pH+tHVQVI+5Yg5D8qFElQFWUZg
	 rOrpwkUhGFVDC7gNkVq90Ry/ophqb6UJ9BLNl/Qu2+DgGh8ZGPZCM6UitVjcjf1qbzxbm
	 N0K3ZXFv14naryacZPhToo1ZkgEbGr0x3mBcKczllwP4FwJ7XR/D55C1CjH6NmloW/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991212;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pl3AAVX3/6bZki4yrR+tEMp0anArUP9eMSbW9N8CF2s=;
	b=GqNPvS/04UEKM79Bqbb6RLMugseWygFEn7uObVF0e9j0N5V0lh6iNAGdp1m2aKX/lGaf
	 TmPBx5WtfXl3V3yA7wEV3Xi5CaIqna6D+FBq/W75Oo2zulNY+utaJ0Xomgazs/N0JZL57
	 PHHteGu0HLuMZO2Mys0q4DO3nW81pvw9LvKhMNpos9TepRWxQ7bcFRIBIqXd1B4Et93Lx
	 ZA//1otCSgRiuoK0umSY0CAongxIgPcquvoxCU5X3EGswB2Nvan8RzMHMr4vRAAglzNfH
	 aRe+USvQPVRpfAZ7ockBITaV1mVTZXFkkUinnxeiSQzB2xvUaQ/Huundv1H3HmAx8rw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991212;
	bh=pl3AAVX3/6bZki4yrR+tEMp0anArUP9eMSbW9N8CF2s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ZKkPONhWNxyFlzCVBwlzEln9XJX6KCAtwS7MSLWqP8aRxHeksl8/MGNHjJQrd+ySN
	 lBCa6+EQq31y/IpqbQLD8BXkhO2CfmbEgXBoBqvTKfZhKcevtgxHAk16L0LWGQuhDe
	 hj83mpVjS1XKGlGDUzJWyHqXhHxtyp9yRSGpfnAsOvBag0gIPRz8uSc/xjVXDHE7W5
	 DnbhSi9SPkgJ9SF4qWei2VEEewnB6EtVsfJ6eHZDYM7VF71EsKDnSQS1wtr9WDnuIZ
	 vKDoS4D3WfwX10RZsg2AX1wZsoPgN7qlXFmli1FKHsuFjG2VHOGhD7SnTUaEZPO4/+
	 aPPgErSdpOaOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0FB540B26;
	Sat,  3 Oct 2026 01:33:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E844E4B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C02C84016D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EpH1yaWcvmUM for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D1D5840143
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991210;
 b=Skj7qx9J7s3AO7Aer2b12Y2iFJOqDdtwxLNAf1W1EMc2ttU5/57h0+cRlwzLnviinhfs
 W4jsHscH19o5W8bcG/wxi4MQYzhXRwiYZhcBamk1V1Z9quk/kOrW0RW2IqW6XKmN/UdWY
 lCkDH5zaffxtRlwSWVTtrw2M87hImBfjdrYyzjWN/ORhbCsU3olcLmsz5jYczYnlXl7ym
 vsFJLTnuRuNJS0XacwolErRJjltkCFdrGQ2nGnbO36rVPdzhKUlCPb/0J6Vk/V7qGnnN5
 E4uhNNpDomKNu3NMpZoZRCNwyLTmMNZk9FrJ7Zv0UXPYgPIz7aHPhKxtZWJTtmMJfMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991210;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=XUN5kxIh1rAI6CGjz8GcHOwGSQIj2zqPsm4Y/HQaJ3o=;
 b=BNReXCr3kBCIvHjt5IHP4cOjSROZ7oerd2uOVT3RKiFbNbbm0Y0eCwvZjzQ7aArML4t3
 iW6Bo2wD4MQGAPGZ1RZdNJaLGL1j1BMR9iFg1NswdpqmIV6x+AtLQDtIZ9Yi8nMVbjv51
 YqfYHUyd0+d9ThE9Hkdmp0uwgNmIrAtFKfmp6ksUPKVmrItPXo+uEbf9hn7DqHgNlloD8
 5GBGuhZZb+QMfNyhQc9Nyv0UEntmIqWy/D9KHnVRfDpvN+iQGfH0dMwRxeHNfD0DD/rat
 nM17h3T0X+qfO6QMICGd1sYahmzbyFkj9fK4SigjZbxej9a7HB4D3G74bEN8xnut/UA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="CK67Ik1/"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=CK67Ik1/
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1D5840143
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:29 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 46e09a7af769-8231c185333so280889a34.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991208; x=1791596008; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XUN5kxIh1rAI6CGjz8GcHOwGSQIj2zqPsm4Y/HQaJ3o=;
 b=CK67Ik1/e9xuBDHNMuiX15yRuPipI1/Mhj/g/5KPLTo0k/+v9pTAgb+1O9hB6rW1+g
 VXtVialsbur8aE+dh0Wbb5F3gD2nXGbGLpHoC7ivnedp0kvQrjcICnClM0G0MTChwIv5
 x/ySOEUg4usTRt5SO/rDiowEAI3IRHoystJm0dapcCuyXPXzC+Gv3Doz/5zIqr+cjpUr
 jrBMu8koCrQ5UdqH9ayoF4qRValO+kq4fdNr97J52cc9tH3Q85HBYkiyVkaipYaKBYuN
 2xsLiWjlC0fRGRAZ9gzph9vUB/KTn5LKgdRuqzwuKaLBSZ+spY1kmhIZcbsGfWBqMq1j
 zM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991208; x=1791596008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XUN5kxIh1rAI6CGjz8GcHOwGSQIj2zqPsm4Y/HQaJ3o=;
 b=EGaeyNGEOL76kbXMFdjzyjgUnY5BkVplBo+fAJgCb8Q/yBL90/c62pdDL3znqksvVW
 C2F3RML/XGufSP4CE3TNtMJieML9OpETiduNSVnuMLBpGKzUC331XfscuRPwViqL33lo
 c0Xxwaycj8Eg1zBs/UmFb0Dmcmqaf0527ODr/R9FgSM7fwUKtEYPuZfoJjGNgz07munE
 //HpVGI0hRqzMdBXDk9ZUlloyf4uvsM2iUYZbhCD6DBmsBTcwDU/jy4F1/UcXwBlT/vF
 uHKPyZD3quoTZ1WUytx3oGiadEcnpZ/R0zHspCMooiZSy86FGPVAGU/Qvhwt49MYgpkC
 HtNg==
X-Gm-Message-State: AFuF++kYsjd3rfZZc8aLfJGASWPCon8/dMY0gCGOTFJh2epHP3mXnB4z
 kZmS3y9mTm5yH30xtP1BFxfO5SRdxTcPWuCPSC0Oe/8T764jB4JsEv+6DLZctA==
X-Gm-Gg: AYBFou3LZNtUkCkyMf5PhcGtoUiHnW2FWvcXw13lQ/PZ9XPlmodHbiXxe8vHkwy4TTY
 SOaTJoPKSBpZ3KjIxpwu4gyBohuM6Lw8eN948YnVBa2JFidFMUqgNilkEmBZnOl+cnybJ/Idxix
 DEK2WZ239qrzhesDafN9ZFkShZHJK98sf7oUvEpKCB17oyMMWRbs6wJpXYDQUimmh95fq8TRPEv
 +mNpbKYelc73QTPFcF9rq50tt4QnA2V26K1iWML/zGeCQ9XbhfJW4Fnvm1lw5O4jfBqAUIxFstC
 Dkdd2zrdfprIN10vGgWgjL2UyIuMjq7SWFh4SZ2gZmBvNRvfsfFQ4R6Bkz4iZbqN3QvFurEUn3z
 9Z14E5RvV7i7YIX5WwBIwwSh+142VzzJgnSlQ6iuckA8b1eMO1qr2HO3rUYcowtI8wr2WGZDyCP
 Mcy5miSm+GFobMbS1SFD9k/73Eu2RDCjtYV1Rlpd3RRh3Qfp7/KJhCntBUC8fV9ASCkdBO7+44n
 wMzHajLew+NW5VdbA5oPE/L3vog5peKtn4/aSNjea29VQCxT3LxcLBBEyAtBKLPHFMgKexg5b/x
 XFN2CdzFpbOt7as2dnxWp1CDkMSRFOVEcFabxSGMcmZb0SrbJdlwlqX5TEGi0OGiTKamV2qo+YP
 bCGMpl77y1wDYqZokFqPuvnxo30C2PAeCw8hC+Gbmig==
X-Received: by 2002:a05:6830:438d:b0:7f4:d16e:45f9 with SMTP id
 46e09a7af769-82281c7f2ccmr4887338a34.7.1790991208270; 
 Fri, 02 Oct 2026 18:33:28 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:14 -0600
Message-ID: <20261003013304.400979-14-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pdm-backend: bump to version
 2.5.0
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
 package/python-pdm-backend/python-pdm-backend.hash | 4 ++--
 package/python-pdm-backend/python-pdm-backend.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pdm-backend/python-pdm-backend.hash b/package/python-pdm-backend/python-pdm-backend.hash
index d9e1364adb..0218e18afc 100644
--- a/package/python-pdm-backend/python-pdm-backend.hash
+++ b/package/python-pdm-backend/python-pdm-backend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pdm-backend/json
-md5  20119cc4fe88d92eef4ac48ab18ff69e  pdm_backend-2.4.8.tar.gz
-sha256  d8ef85d2c4306ee67195412d701fae9983e84ec6574598e26798ae26b7b3c7e0  pdm_backend-2.4.8.tar.gz
+md5  eb962f59a1ef0c62310b42c081154b01  pdm_backend-2.5.0.tar.gz
+sha256  7953b994563d3151755e3364b9d0cfe817ed0eaecdf27c8f777f412d26bcd98a  pdm_backend-2.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1da058ed0440fea5df1765b19a1418800439b18fd6f1c13c7d429cb81e9c6d47  LICENSE
diff --git a/package/python-pdm-backend/python-pdm-backend.mk b/package/python-pdm-backend/python-pdm-backend.mk
index b02154128c..23dfc858b4 100644
--- a/package/python-pdm-backend/python-pdm-backend.mk
+++ b/package/python-pdm-backend/python-pdm-backend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PDM_BACKEND_VERSION = 2.4.8
+PYTHON_PDM_BACKEND_VERSION = 2.5.0
 PYTHON_PDM_BACKEND_SOURCE = pdm_backend-$(PYTHON_PDM_BACKEND_VERSION).tar.gz
-PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/7c/7e/6d441c8739a30820ec59517a88326789c201ae43a344b2ffb02fb2702d8e
+PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/fc/d5/a82f533ed51f91a2183faf67a1fcb3b759615ffeca95d05b3e7648bf84bf
 PYTHON_PDM_BACKEND_SETUP_TYPE = pep517
 PYTHON_PDM_BACKEND_LICENSE = MIT
 PYTHON_PDM_BACKEND_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
