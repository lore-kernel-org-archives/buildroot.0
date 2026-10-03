Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D08CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D40960E86;
	Sat,  3 Oct 2026 21:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAhNtdp8xU2L; Sat,  3 Oct 2026 21:09:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6D60460E98
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061749;
	b=CXGKsoBUNJupKYS0QiJApr0tJAs0mIXo9aMoQ395eIYTZWGQ71UES78PBAOGcUTxJwvN
	 7I9vSJgpHcLcpS5AzknD+CTT3NWzzP4PXaBt90ibbwBHel0eoB+GV5uwy3iuA2dntkwqa
	 PVRYp+6y8WKboUkda0CBJyyVNv6cty3gf/lF60KqKE2TR2fymQR1JVV5lGt/Yj2c0Svq+
	 p4tq2kPEkriRqc7cl5uNclRtAjbl8xtkOS51bG3EgryUwEDUYABjRvYeXzA5gvoyND3sC
	 Hu4LJU3JoiNQxx3kgZvTlOvBHva+WhNELQQU5RvLaFfMugHcP8UmfE9hztzkstfWUGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061749;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WTxm8AF/ZGlXk1anrm9vcqS0KjiJZqy0n9dRPpx+oxY=;
	b=UrGPuI+mTSD+BTlS6LH0f3ufXs+Enb908FLVYnpwr6g9yRYpuyGG0GAawvZoHgmAgeXP
	 BTIvhGf0mDPqBIe89+CbaCe6AcshMz7fE0fSW3aTz2kMe+x1BpYSdfV2WrInzLY3eCgNG
	 lnyvE55XEHYZa9aI+PWH72zSzLTlKkvh9NL8fjgFjzED5QEcLyIYJqwuh/z8onIbZX9C/
	 3ayv9tQ0ILhQfFdXrpH9BJJjXYwnp5F+bUlRVE5hZpxJshxZL79Z1v19SQDkHrVgKGksT
	 MLHcl4IGQ9W73Dc7DiiGRic2lIYm84xUHQ+il8AwBs8M8yQ7xF+EPcfhTaUKeM/+Vjw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061749;
	bh=WTxm8AF/ZGlXk1anrm9vcqS0KjiJZqy0n9dRPpx+oxY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bSQ9BZaFr3KIcvnHj/4Kcm8aTRtOL2YpHY5ReEq4gDyV9T5Cr5Th0PkYZ4Ocpm0Fo
	 FKhDsc92jkED7Ry+ZX1PzSqB+mb2EfA1l+rx5sBjmEyYqpQ5jEG2pMI9pXjSfR3Yvc
	 SeZCrvOpuF61Wdl/kF6Zs3Z/VfpvCJr5y7UJajQMh2LRdjg/2776zv7pwPjtdhNITN
	 3wW4DA6MnzLpzk23bBLksFKSIPhR6r1kS2AKkiDEgS41Aka8s95rlfv5dG/sLoIAFd
	 CqY3+5h6t/udZsFF2GumHpYgRNRLAGQwq3benjjDToIMjWEw4Pvjfsx/bBYaV+T8+v
	 u3fdmX601unvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D60460E98;
	Sat,  3 Oct 2026 21:09:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E6228476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D58608149E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOrdEPQJd0tT for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:09:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DA9D08143E
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061746;
 b=eWwOQPCZC4eAFHaPPef5E8ZQHRA01nIjEdb9kjHLhr1F+5KvwyjzfS8TMBuqlDq0KMwX
 xeMCd/7lTu+WqrHv1mU/0OnwcS9dP3S8hBO3Mh6SJNS5wmL/BGq3k78ZlRGDSCYc4bwPW
 iPmsy9g1+MtLN/+zE5irWL78yGGERq2bU1Y0xOpiy4xjD4yzL3cjyDxnrs8UUfX8zIfdK
 KzTsJO8lVjUjUWYEIOzuf+vZFZb6s0UqzZ8bHbI3ebkaU+aiZglXbIDres/KLXuZ8sPSS
 TVHCO+oao8uJahjSlv4bac+3a6kKgKRC0poTbI62ZvIOWWGTD8eOD2zD0t3RylYsHUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061746;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Rs+3Q9OW9V9YZdJNtJrxop6YgxTSiSVAmUfoMVv0HrM=;
 b=NDa7zTlsD7TjaTTFz2i8Mc99JfzZ2l4FU60TCN6yK0aIe0mKtwGgrZWxBAPRQ1lYI5+C
 o8FO0VMlEnmDGO8GzyTsi9ox64vzA3ePtN65SrMgRNOInvEljQ+Um3pqRalGVnIemYQq1
 dwVNhvdFZhwGURknFEvzxhrapEmk9wKWJnWa8/VDAZNJ4DMFzaAOmGhztNQ9vW2l0C3TX
 KFD5KxCTZ6SRtT3qkqy0ad8ORDZ6MggJAYQm0LLx4RriekUca4MPkTp6MmpMSSVC5I+Yt
 dibAoKNCJTEZEms60xamzYeaNGcsb0Dq7UZTHUh7SSylVz8ynZqnSQuz8xgA1ITOtAw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=q+G3rrLs; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=q+G3rrLs
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA9D08143E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:05 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-82395ae2ea8so812473a34.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061744; x=1791666544; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Rs+3Q9OW9V9YZdJNtJrxop6YgxTSiSVAmUfoMVv0HrM=;
 b=q+G3rrLsMKHGT5Vc3NzJjd7SP7Wh8IrW9jQRrGUH97Oq6iybR1TL4k1LN54Q9hueYT
 i2Pn8nVFs8sJ1VA3ipr6jSpBnJ5WjxSkAMCqgn77V2SxjXVcWNd3HyanKYfmV+eFQ07e
 bsrzOVYzDgJPBy2kh78d/In9lsbI0CvRP4TxZXOXbNqlv1hH+bMVcc/9Aff5wZSX8l8e
 qvXcDnt1fp6PR5souAXWhTz4tGPiCwCxMOhx2ucmiPZjn8tvm0Id3fELMdnOa/q+dn7J
 +zeLWY8EJ4/JMblo73Mv2DIUsaZs4BQ2rAk8el+EHF38hoyj6RfM/r1cUPTKRCfocYOI
 AjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061744; x=1791666544;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Rs+3Q9OW9V9YZdJNtJrxop6YgxTSiSVAmUfoMVv0HrM=;
 b=n5cZW0DJlSF7KyG4TSUp+uLg0cFz4SwDEdAQCjtDUjH/N9qJy5lHQKwjpcGPhyzlOR
 pHLEsXn7xPROPyX4eWrffZwXpUusz+Cm+yDG3l54jrVzio9zSQr7qMOl+gqKmeycXy8y
 yooHnfrmdsbD7p72A5vkM8xGNfUm1nUgd2ju6hUWmf8TwC5Vx4xvNiop5GhmaLU3xegR
 kNgPeR9h+caYM2lYMsKdiBIKWT89Xh0ARdPQKfHDjBI+RRd7TF1CoAXeLZoPX6TAe1Ri
 j/Lv6dNf8JkKGLB9QFj8WFsk0o6S9LYoJWPOowwUNB4gn36rCW1wm48+c/0sT6LZGe3/
 vJVw==
X-Gm-Message-State: AFuF++mvsQvfAtxk6aHxUq27RbHzOON4yBasWnsD2dShRfOSxj4HgYFn
 wD0+qsTLvhfvcFPnWIJERIFfyf2rIDuJh9TtEiYTAvovPKBfu6I2WgI/qKwHXA==
X-Gm-Gg: AYBFou1HQOBOz/8QIMpdfqjHIzG43rjUE07TdtqzXI1CwNT9+cCKmYaCojybGe14+OE
 tDiHPpF6BMW+UBCy6qUzqOMNa59qtesWa5YMfauvXNEit+8oJuf2a/s947ISILNJ2uK2XT/7huy
 gWuz7764vC9CoriHGIkKBHiYdckwHQc7jmZacSWoKUPedJ1Tcq+UmXMQSWiYoLxxLeIZQ9FABJ2
 djTR/dWJQaPgbB8v6hV6izuBlcj//GWPK5GSzstDYTObW56MUiWNc8/zl61+qqxh6Jyou+gCMAH
 H87nDFCJOwttVH1miI+bgrnlqKqvQbdHFZHLl/b1wdyWqT3pmxkoKrWywKlU/1vAu1nhm8xpJnD
 ezlnXlKGd3nXXsoBEErm7IxDzNA7iOHr3j+7dD3/ejWAiZsI5DeUdNqYqoE7X5f+Zqk9E0pnVj9
 nNLnM5DcXPpWUTWLtmImLRGv/yShqrqS+fQneMyUI6ObfhlHHoLNXSHgNrx9eOoSBc+hqiiXTbP
 wiDQh33At32MvcjlZ/a+DxS2qY28AMlU1NxybXwxeVUe9kk+7W7bBy+s0mcD09rlU1kO+1eY8fg
 Y1+EqUgxENWdOFI7uTgR6CLlitAK8lvBJsZg2ZGTMmgWVNLhXtm7CgGDebmG/QREf3mAZTX8MaX
 OBxC+F17NJFyJB+Qx4vXs58zc1Axk+//PkN0eIPDfWw==
X-Received: by 2002:a05:6820:f011:b0:6d8:5491:3753 with SMTP id
 006d021491bc7-6e09de87fc2mr3022793eaf.45.1791061744560; 
 Sat, 03 Oct 2026 14:09:04 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:09:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:08:05 -0600
Message-ID: <20261003210833.735937-15-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyspnego: bump to version
 0.12.3
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
 package/python-pyspnego/python-pyspnego.hash | 4 ++--
 package/python-pyspnego/python-pyspnego.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
index 4b8763a73b..bec18ee01f 100644
--- a/package/python-pyspnego/python-pyspnego.hash
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyspnego/json
-md5  2af96f8b2faaa4c35026332382c1b5bc  pyspnego-0.12.2.tar.gz
-sha256  448a491a9bf0e5fb957567fe46e6809fa836aa40dfcccebcc740bb64acb1be1c  pyspnego-0.12.2.tar.gz
+md5  5e85a37c48b666c15928e9102dc1803a  pyspnego-0.12.3.tar.gz
+sha256  c4982c9f92e6aa5979c9d9a142a21339ff82ebcfbdb4e0649320cb050961a3cd  pyspnego-0.12.3.tar.gz
 # Locally computed sha256 checksums
 sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
index 7592eea3ba..312eadd9e9 100644
--- a/package/python-pyspnego/python-pyspnego.mk
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSPNEGO_VERSION = 0.12.2
+PYTHON_PYSPNEGO_VERSION = 0.12.3
 PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
-PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/03/c4/790211e7a2180509dc29137c488c7b038ef89bdf83db0ce4da802f64f9d4
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/fd/8f/30bb9568554899a6147bed657762a3c707e2d3dcaabf3492161cc9550bb4
 PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
 PYTHON_PYSPNEGO_LICENSE = MIT
 PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
