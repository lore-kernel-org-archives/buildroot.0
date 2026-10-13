Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B35CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 016D9607F0;
	Tue, 13 Oct 2026 16:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mj2aEVIg1IUo; Tue, 13 Oct 2026 16:43:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1F791607CC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909827;
	b=Cv8dO49nd5t6Il2jpfjCDwm36AkN3V0Xew+wuGN5s0FleOjv1Vq5CyYfOdIHZua+hxZ8
	 saVgLhX1prMNW9Dcct6VqHRECSntqAWQvVZ/wLoNtBKKVz9NOAPViNB+Y06MhoW897xv2
	 Bv97D63wYd65wHe5z4RygZYvgcWvnh+xnzbSxxPdMGtPyEirBx8lxwVxgQa0yCcgUXR4n
	 GbIVNQuShq9JAmuYCyOgr3CtVOUNvw99cfQLT7fOP0/vebCoW+1KzMb5pRVEVyLnPosjn
	 Xg2DlO7fclIMvuJ1awS7CTDhIQH7RA9mkJc3EEDIh9SYE5kZoqx7W+6J5scWPkjE7Hw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909827;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=43ezLouzx75mZkANTuhQuRUgKnZIFhxUekZOi+VdQGI=;
	b=XQzw6XtuZNnR3gQC1fngdeWo3p0UsQeen2vfSk2D6sQ25soHX+Ix2c1WCo4/3hO1UIJj
	 pWNQ5R/iGcVBuYgkCCI1QOddhuqzxIt+pbaROoRnwQxXKGLCv2P895E8aHEVwuB8jAdeM
	 xgsVMNpQl93zmFZfVtdKfFG1Hh0HWYnvwV5GsUqKmZfkR4lu+JPYKa121H+rnP+iQC/Dh
	 CAufAoHNhgmfuiTSH5dgwIE2gHyQ+WoVObckmR92IeKQ1cV1xWI4S7OkseNtp0QzHSqRL
	 3KIk7qqhG3f8hQ0j+L3g3KgWFulVlhpjOZ8oDlD7c0hFLbx0TSF83siOTMxTkWymapw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909827;
	bh=43ezLouzx75mZkANTuhQuRUgKnZIFhxUekZOi+VdQGI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qt5qMFPm7dMA04h5gIj5B0G4d9cAcwnaHDQIhd8HZTkpROz5uKKFEw0H21n9yJU2f
	 0g0gyBArg9BoUPmpX1N+hOEUHM7Nkt0nzQ6x1zn6rCetCtbhPFvfePyvp5pr1b6wfQ
	 9JmRcIFhOjLqAqJXx3mvwFL28kxCKkNHe24JKIDXX5ozMOnuLZRhq5QEOXB1IDn9Bl
	 RjLsxiIJwaRKostJHW3Nm47fyE3aSVCbfpv0fFwvQnn8ZtSVFOPpBiiu0EytustnL4
	 wbwSz10e+Crr6f+4X4ET7MomeoabcTVLDhf86m2zQN9gO6h88i+6jzL1UjPgCXUOyX
	 8G5AZeFYgz3pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F791607CC;
	Tue, 13 Oct 2026 16:43:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67EDD1DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A177404D0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2vgXN30kUmO for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 75B97403BD
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909819;
 b=sHwJgJYQEYfpB1o5WohidpBucsQ9zNsyBCdJTIcuYYN8mtB0bhFGa9iLVlLUR7a3W7Kv
 qAK87TkhG8l5XarB2VLU9GLb8VhKhDjuXlCqMVe03i5MgoE3cVRs3E/WT4GWGNMwF0A8v
 sknEjM6k0bkQ6N2aQ5FLHOjw1Axiyl5uhlD6RReSe4n1IWsDpZmDIQmfQgGf/sxUBmxMo
 NQgedh95eSedxb+opE12mf3uScjCWEzJHYSpF76Jje18K4zdSfB9rF4zN66ufnqjuCuRb
 EvhyQcYW1oEQ+ZovkSWm10jmZ7iG0NTYBZXlbVSdFHhN/CXEHqgn9t3Q8FXT3JMEx1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909819;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=P3KSMs34RATnHV2DKmJ1ttOe+6E2iMgrwV1lTKQeBSY=;
 b=aGOoyC78YL4A7MRI6qeXgWHyssZlgu2BNo5I2kOAVicNaiq7Kch+/h9olM7N++7HaaCE
 uO0j5r7uPu8qXFCRhFPv6fcLf7e86ih+ADSK57P3rYHclScIbhITV/pfRsl4QgPkdsDaH
 2VNKxWk408OTbCGCMoW/l0AROHG5RQxuU30Dm4qAbdPy5FIAR9o1NNSvg3oqQHLVfyjPV
 h9HODPSgrX2tIKbOd7zNA5CDOn4DF1i2LWihKlXRn8gVXQZz8DLU/x4IbWqFsNNDKwTlv
 mdqayIg6gM/x4cWvDdaPbjLSahGmGL5LAPMS4vGeZOaPu62PqQlpcS/LVdJRsybnzhg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Po9Kt3oL; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Po9Kt3oL
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75B97403BD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:39 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-5058b105df7so1053417b6e.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909818; x=1792514618; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=P3KSMs34RATnHV2DKmJ1ttOe+6E2iMgrwV1lTKQeBSY=;
 b=Po9Kt3oLOBPl4iJrCdcHuNTN74wkZhMQgT8Y+49oU0PXe7/SHKJn9mM73yrEFXBPkJ
 YMW1svEx9W62GaBUPHruPB9n05wN1cHAVz2VBFhkLyzk/4gAlvzj8rOIsvGOGQf7olRe
 LGl4+GsEDk0ciVMmxqo3jqf7m7uEXQsQRWA1wif5hO1e3SqcIutNq8pE4QwYtc5LKMmn
 XjSzpTIf2kHvB85dzvFZPdlQSiWLpn7tIMqtSUEyCAuxDBwhUD9c1bGYU4t0IQdii/To
 nrM6GxCubK+8rF+x4WVY4XE5BRQBFZZwQjgQ42AIIHp1Fhj59JulTPV/RHwRteSZ5mJZ
 yd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909818; x=1792514618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=P3KSMs34RATnHV2DKmJ1ttOe+6E2iMgrwV1lTKQeBSY=;
 b=cJfEX3DB1pcKQ6FZNTdkQgJ5l925HN9jZ4pkgsDT0iB4PrC9Slp/WaI6yIyBnc/s6/
 nci3R4iEYSebqmoSJ403JI2RhRqdao6MfdzQehCkiZHS3la+/xNtPe+xVvZk6emf2Xu+
 Z/JeNXOMmbGdwcOAzM/6bH42OwdCLMlVd5RzsmLN14QcI/XQWNdDKlNtPHp/gnfmYXr5
 M1lXZ818+IsCY62NRY6QOhdttjpmSdo+pDJauygELI/edNeTm4Lbq+ddPZZTlD1OV8C5
 Ay7Hls6n3wlU+n5ItdxVcpLVLmBfzYSX5rhpp4nllRBbOZXtHSXTb6BzqbFMp85dW+Cw
 zAIA==
X-Gm-Message-State: AFq9FYK3U/gKMQVpVXzFV1voGwlDwtp4gx6qJKQoanrigJjihaTawCXq
 iG5qNr8KkghLVqzpCpIeMg+lS+9hsiktWuMuoHzTyXm9i0ESkiSnwcvLIt2FdA==
X-Gm-Gg: AYBFou0ueP/EARA4egx5YPWyHD5g5mOptMywuNvs9nzjsVCnlxuYXzu4q8BNU3mGlTl
 z039N310tlm+A1LpaO/xdQjf75mk9zt2dGbw9+xqaPM8oSBtiy/1GijHlM5lZLrJ6yKCM1kKTKv
 BwLT3u5J66vhUmxiAzcxxIzvcei0FYDX0ao7sbab2yvXqZ7YU31r6uMAHrCghMb9ufKL9mdfdV8
 8ukxwqtnvO96Z91X8Kuci7OEYBrnEVLJzlEd0aDhGoXwfnrSlDepdY3UVwc7JlzcXuRPT+6NKCs
 rfk9X7pd5BOsQ/tq7Am542vp2XeyuPktjtRlHGpeDMAlL/KOB54X/e2feiY5seZCeQAaG/auvaG
 ESI9EluD8lAFg44BM9XWXtn3zxmAzP4/mfwiGPKyvT/NR+7nGnm7XPYvzJldLjxKwvZ+IOBp3YQ
 qv86doY6p+TP9ZlLi5qOdBHu4FZF6hRe6csBc/e1BrFX32IX80hmlw5qXkj+5ShSN8Pj5q3OfLy
 GFu1nmh8V4vfScQjbRj7ddxTirU7uJfYMJmtQyiUby1D0lpj5RXze/lUjJXVxUxILoY1oT8EUpH
 HInRPuOB9VUceUgoh0RXaz5A9f4SGgrPwv+C5xUfeWzgVg6VPZ+3QNDnmagz/VRfBAsmV2jjmnR
 9iMLNOHK28pXhrAN45mVzNGb+u+c8NqqsorVPKKyavgc=
X-Received: by 2002:a05:6808:1a02:b0:4fa:8d48:3a6a with SMTP id
 5614622812f47-50c4e683240mr11777732b6e.18.1791909817992; 
 Tue, 13 Oct 2026 09:43:37 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:13 -0600
Message-ID: <20261013164254.1476592-27-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pyspnego: bump to version 0.12.4
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
index bec18ee01f..59eefc5d28 100644
--- a/package/python-pyspnego/python-pyspnego.hash
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyspnego/json
-md5  5e85a37c48b666c15928e9102dc1803a  pyspnego-0.12.3.tar.gz
-sha256  c4982c9f92e6aa5979c9d9a142a21339ff82ebcfbdb4e0649320cb050961a3cd  pyspnego-0.12.3.tar.gz
+md5  119c0aed13eeeeba75debc0e1d54929e  pyspnego-0.12.4.tar.gz
+sha256  acb314d6ca5c9ce87994b1eebbe2d8b687e0d564f9d650b306afb4c8f9c2ffd5  pyspnego-0.12.4.tar.gz
 # Locally computed sha256 checksums
 sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
index 312eadd9e9..3264eb26d9 100644
--- a/package/python-pyspnego/python-pyspnego.mk
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSPNEGO_VERSION = 0.12.3
+PYTHON_PYSPNEGO_VERSION = 0.12.4
 PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
-PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/fd/8f/30bb9568554899a6147bed657762a3c707e2d3dcaabf3492161cc9550bb4
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/4b/58/d7c9cfdf1394a8b4d85ac488888814b28d26c4bd732191bd4169687cbfdd
 PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
 PYTHON_PYSPNEGO_LICENSE = MIT
 PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
