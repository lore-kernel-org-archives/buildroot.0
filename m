Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BBDCA5FFA
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 20:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FD84406D9;
	Sun,  4 Oct 2026 20:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNAMQblKu-km; Sun,  4 Oct 2026 20:19:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 95D13406C9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791145149;
	b=Lm9HYnb/AfHCKHT14RBVSa2zmjs/98FNy/t1CoCdxd03SwUPLjyAfS5gqTdC8Llr+E43
	 ZctuBWZmquczh0Do2K2rNcxyg1E6pMv6s358+zyoAgDqPOyMRUaolzK75KYQvjvtgqbOo
	 y6Wmb1JhwC4CyGG2w3ZgcaRqQlezIIxPDlNoJy/5m6dDZnyfj7AcNhtnBK1q0nBcUNpbZ
	 gBvGCjnyqKfrLR8d4C5tD897Tk3oE2uvg58jW2vhC8aJKBVBhQdieailZorZgtZ3Jefk0
	 +j09kU0Zao3bKfJpWpGKuO/ZyJ5XQ2Om0JAy3+5yxb9rdwGobOZKypd4Qz7/xPQnJbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791145149;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=40kfarqweRqHzdH30TibdDie4JnOdu2W75yOvTNe/e4=;
	b=f3v5AMQr6Gu5fu9WXiKQh0/h6DGP+5nAzWGzeJeUEcBM0AL27ti0R0u/yTTXHm+AqaGZ
	 8roUaGlL7eXdPt0a0cGJCfjzRrvT/8DvF6Xb/neTSomEzw+MKgrlmw6bdip0VBg6kub8G
	 1aG9MloemJSh7CaweiD8LO1OWgdNYnE0tt5OqfwCBATvtzfG9B+ap27VTeIvjX0rzPsKg
	 /bxNax2PXf/bS8RO9vLmowrCgPnm+0YXUeSdtAWFuw2MP9VyVd7sGdBENqxlZWJcJkGjR
	 fE0rvBOve0eRzUty8+e3w+fPxAol7cmblssyx3gvlpZ0ts8t/1uX/ppXGPUOQFgl70w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791145149;
	bh=40kfarqweRqHzdH30TibdDie4JnOdu2W75yOvTNe/e4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=OOqKAXjMyJbi3nYeSJPwgcEEGhUtgc7FIR2aU6jDGjdIzIbZfJQdy66UMKdiazL86
	 4y/S5/O0e3wKk5nLw5qr0XcYnygiOZCvziECKGI9V4vrApRKZME2M2it2FlxbyorqB
	 EtADI8uQJS7TceityxkmCDoVuV/zmerD1Y1qTJEW3T23Lf3DqlCaevAtlrSsvID3Wv
	 a+mEwNndXWYfo4gpK54TXOxJ4g438zF0FJhaCS/m+lg/Ery7rhbfQfpNa60RXNCFaQ
	 nEa4wgu5eNGsGMISOh0Af4xNMETRAffxTQRmeLaxXwrvjXTxCWqBkEXeeV9kIhbjPY
	 vW5kud5Ivm1/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95D13406C9;
	Sun,  4 Oct 2026 20:19:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54E9732F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B510400C8
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCpfm8f6dlGT for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 20:19:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4B6C640004
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::29"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791145146;
 b=SV80sHGO5AxWm5NgyLL21r6w995lrDhMrpR0+GJ9hnZQpQ5mnQ58OcEJ+PON1rudyzkB
 wypytiDGD6Ohz1FgKJm+WF6Aa77t5fKsRqXmimfxQ2JNq/D3aenTjlMJ1u6D+EDHVSOeq
 w99G2l3JGqGMVQpXPLVzQ6+jzRUY8X3qDwH0t2z5OG5gRLSi8DBFqs2mMB3vCpVUnsBTT
 /Yc4Z5/wXUxxX/UUEkxplWs3I0FX1ojAhCbMH0xBbIeb0raM9MApLB5Fgk1monIui7kQh
 Wterike3XcNZWrs9w12eCcT+jHvFE8NHIUWh63howlvh31YcSlelp9b353jFRU7+UJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791145146;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=gBJcfAIWYmrIVuVm/Z8e6nkCPalvsWeQ0DU1+ynZG0I=;
 b=hh6rCh0sG2DoFwE4+2H2jBpdPr2EK45jCkRLL8e/EzRQWbmkR/FmyWuQYe5+DUrmpNKs
 kyD9q9K0B6hIg7WSr7xTWJvaOgkHvEIof589WUBYqtwG9RZdH+Beal1wMaBvm7gPh/waQ
 LgnGIwyDFwTj1d5vsftD6NTblAR3ICTCOe2QKJXd+xuV/gt4lk1uQQ67sQZ1+nnR7Dx4W
 k+lZMN3JPMqKa0rpXeg/6pKLZEyyrRtK1DhKBy4jqISESz1GIk/HM1E4FK35df3NMaVqq
 DXrRVOkwDteH3lsKwPkv+Is21Wo3KlzTBaOoFwcs+0qN1Z2/4O5zWY3yZthdLsJ+/Pg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=AxyNhRES; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::29; helo=mail-oo2-x29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=AxyNhRES
Received: from mail-oo2-x29.google.com (mail-oo2-x29.google.com
 [IPv6:2607:f8b0:4864:31::29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B6C640004
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:19:05 +0000 (UTC)
Received: by mail-oo2-x29.google.com with SMTP id
 46e09a7af769-7fcb425fc2bso1014174a34.3
 for <buildroot@buildroot.org>; Sun, 04 Oct 2026 13:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791145144; x=1791749944; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gBJcfAIWYmrIVuVm/Z8e6nkCPalvsWeQ0DU1+ynZG0I=;
 b=AxyNhRESP5qRtnGmA5sDSYXnLdSJyaZio8yO2IPPc0MoehgwH7mNNrcs9Xa1g6fRJO
 1UODssTxHLFKwPdpi62KFV0ASO7rTQAcIO+dk5/4TVI71LrgX/q7iiZTDSYELRjmaCSP
 Bb8PLyABRBMPU8oa7d+hga66+Z7DXVpB3iBFt41akCwwrYPZYM0IkXrBvLafonsCwiBh
 DJYosX7m7Iy/C6NElsyFk+CaNYDpsAVneZ+tvoRHNBgO5WBKRprjYjRhMJ/ZMrAXvS3c
 7izNHv2xA3RBEW/41jv6O91IYHG3G+UxtU7IEvebaBhzitBzBj0hqom9LAOEsnlPZ8sK
 AHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791145144; x=1791749944;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gBJcfAIWYmrIVuVm/Z8e6nkCPalvsWeQ0DU1+ynZG0I=;
 b=b6cPFMMkssaYUEz1qzdEm2ZAefxsBmqklkUd5nMF7bnPpM3Yia37SiWoPelyU4/ZjE
 JfzGaBMkhwi4kDiHvuf7CtIg1lI9FPYg+ee3kZrHsVXZ1rK5duuvDP5hqjjuRgJ5kz1W
 Uh31a4defNtuvhRJJO8hnns/WJFa5GPgwabIADOCxyiool1wPo3F4Hyh44sT31+mfCja
 XBfl1b4HGMPAMjYRvcHwgON/V1o4IkKYgSyMMspNQS6bfN1SS1cTL0QKvZGgKD77cMQ/
 RsoexbaZJ5TOQytLQ2xIveuK4h7a6QeoeO51pIqajbPc0T7doP9WNiJdoum8RfhdPreF
 OvEw==
X-Gm-Message-State: AFuF++kFodzbGe+7zSqgkYBvz9TuQWy8+rlKtTHEPI1C2FWH314Qh24s
 e7oN5hakztgZxrsf2nr2vBeHyedNNoA5d7PSh5395xeGm/A4wxIEp9NMRkpbRA==
X-Gm-Gg: AYBFou01HbUY9G5t8z7yno4RYUTeIchbx67ZPpGgUVYDpLSNatrJcZC0Ob/gYjNyT0q
 X7nRekrd7oHS4/SbrP+xIQ/pf1r7SCIftQO1VOsu0bWh7tuRDbw1zw1KNDeisrvw7tch2iWLQLA
 mmz1lQm5B8BFU2DKMs+MSNMK2caGS7Ao4NH8xO9TIkOimpVK690SC6fyjjLzJnZtZsMGbaxjlUy
 mzabpn5DXCc9sAwR6AmfV+6v8SWBISbMgxQHe3Yba/TzWyqQ+dBwQf1gKQxVQCV6AeaXFlASamQ
 4ncv8iCpbMv8zr4uOGMzKcihXiJZrcyCILnryV3Edj5e/UliUHgqZN+D63pg/BwGt1C5AWDRLmG
 jLiNuavYl9zN+KuKg/6CPpzY5BFCxa5LACqULUVXFzbGB+82KZlrzaNF0JMcAx/cV+34FeUi/E1
 Eh8YGwAXV4Lk4PBAlZMaffsSGROlAcVidTtOdfKRo7d7vlSV5SAq/QodCGPFpvzfiaasZR86k7a
 UYAJSM7ysdyZf5T6xniJJT6BIF5N4VDc9ZL5Jszk/vLSCG0RyAk23UL+1+yNUxrxyHulw01UQ0B
 Yby/7bRVnAIxxm3P0O/rKGjinSu11fScC6Bd+kJDT8CedGKshHgv6QXp3xQplrsL+7/bs0YX+l/
 p22aGjaZhkIuQH2EtyVCdT78ixEW9LMHIqjAPZaLTpO8=
X-Received: by 2002:a05:6830:6d1b:b0:7fa:5c49:524f with SMTP id
 46e09a7af769-822858600d5mr11774564a34.22.1791145144660; 
 Sun, 04 Oct 2026 13:19:04 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a86abbesm10037861a34.24.2026.10.04.13.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 13:19:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 14:18:47 -0600
Message-ID: <20261004201853.915471-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 2026.9.1
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
 package/python-rpds-py/python-rpds-py.hash | 2 +-
 package/python-rpds-py/python-rpds-py.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index 6da82fab0f..bd0a4a5a59 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  0bcddb46502750f8e9547ab666db13115d798364b6a21a59c6474a3fa157a522  python-rpds-py-2026.6.3-cargo6.tar.gz
+sha256  bb88a386e7cdb8bf46d4433c829d20c98117365104ba2a1c6705fbade2d2c6d3  python-rpds-py-2026.9.1-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 40a0080a00..8ef766c961 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPDS_PY_VERSION = 2026.6.3
+PYTHON_RPDS_PY_VERSION = 2026.9.1
 PYTHON_RPDS_PY_SOURCE_PYPI = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
-PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/aa/2a/9618a122aeb2a169a28b03889a2995fe297588964333d4a7d67bdf46e147
+PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/42/68/3bd46b8a5e01d3c2ebdf9c5e9497912e3fe0cde02bac21a7130ca866e403
 PYTHON_RPDS_PY_SITE = $(PYTHON_RPDS_PY_SITE_PYPI)/$(PYTHON_RPDS_PY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_RPDS_PY_SETUP_TYPE = maturin
 PYTHON_RPDS_PY_LICENSE = MIT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
