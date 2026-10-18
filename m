Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BA5CCF2D3
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20E00606AA;
	Sun, 18 Oct 2026 14:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_PzkbpaPcU9; Sun, 18 Oct 2026 14:24:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2A5B9606EB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333486;
	b=iC3tg5VZ/c9J3TBGZ4ZX5ObP38nkrIbXMBvnlBdkymhiduwX7aHMIo1tjzLP0Ymlsxv1
	 83O4+TrbiCLVJAWFnYJAHt3NE1DNy6Dtelr4c4mWhcDJMBeUWRN/jSEa2ZXU3PC7+z1zz
	 /qBOAFnZmIrpI0kaHQqlliH8BoK3CXqFB98RwWpA2zZdu3ATitpOABM5BzjZqJPFqPOPg
	 qcMDAMP7svvLVD8HymDdpUkzlzoU9NTNn1/tjPv0LYGC88BM3FLjAIFyfDtAEMDM654Nq
	 hpqRF9ChCn3vKc/5zrsKGYgI4b31RuoPp1dsMIwhKcZGKX6cnCI+PngEgTwRXbCP7FA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333486;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LJ2w1/HvCUNRgzn3feyEWdO8LPPXdi2YOfbRcNfaz6k=;
	b=i3CiXQRtG3LQfaTw/tAxGXum6XEUuLSV6iBcW5HKLeo84pSZOVTOhPN06/oaJtEZ+RIe
	 PT3gmB10uO/WyxquVTd31DFTZSmTvigMaqhpJhEZuji70OuQeiYkXYo7LgMRNmULt5owX
	 9KcvPuQ8Ggx3jhanufYLzV5jM8Y4iKb5a2Df42d5AW875gG6VqXNt32RaHpRZpkKDh086
	 lhEFU6Mql0sw2EyJd259ovjey+fmfSwhvzJ3suGX6YiC3KAPDvYJCyWbnqs2J73wjKWXb
	 UsbzqXlIQjAR9AGnmBluU+FSwGhwbJJlJTZAOCI2BMCAftxHp69NgD1L9zYAuwHMKvQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333486;
	bh=LJ2w1/HvCUNRgzn3feyEWdO8LPPXdi2YOfbRcNfaz6k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U+/D805UiQ94hUlzxA+IF72PllQaIw+AsbfVB9aRkmBHiusFZqt1Yka1CB876JWhE
	 QfbIsQVpyLBc2+JKemFdp1uSns8ao0sJpNwQIIYsmippOKEFKvwxnH3GH+1XSkf8GS
	 53B/VBjWstLQESspyjjmX1R+90O3iyhsRN7gtgLd07sQdugkAJmKRorBvKBMaTfUFs
	 V50mdKxvaey9R85esTHwSJhGbwvW08PB1PHyx8VL93DJobUEf26WbsmOVIulELOqcF
	 hDHK58VWarb3hF56lNfuD76bfXBN8h/9lFonIFKqDiNw/08PY36cGLz4pVJ6oBvuZd
	 nXB1XDNFfqaIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A5B9606EB;
	Sun, 18 Oct 2026 14:24:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B07B5769
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1F0B400EF
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLDaNXpWZUPs for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 65CAA401F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333466;
 b=LX5kyu62sUi/B6XW0j7AenOONCuRO+MJ9/c/lJUYq+wM22vVxXB0Sq5UaFuHfQWczbQY
 epO83E6gq/w4kzOq3dwbMVlskXUGqGa7u+R+G6+S8nTqOMdzRKlEK0zF7Iw0Q4iCLtcCA
 N+XrkuXQkktB0vL+Zu5ytVUMqrCT7r9eQIu8mB4Qz939BmDbeCLsku1J2fmTACG00WbTb
 OxoEFVO8w+MeRLS9GeAb7mrmU5iC3HqrjXsgu1o2MKcu429j2HqrlOx/XCAch1EuWGkn6
 R2XKx05nwDeA9lXDJUgzpVeHeX2KKYVSmhopXDql7vgkCN4jg0V9YthHImED3J4nd5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333466;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=EhvgA7u5m6m5xboCvtrFBJKabmzCRQ6/WTvRn+xnjDc=;
 b=TKScj4hZp4zNtCN2nW9S+Z4dJr1kJHNmr4TMKMVQMuNafroLPS5eVHQBSOWfms9rIHQe
 YcU6f2ksSGhSj7fA0xA/4dh2NwNJzol9+mrF3GoDZaHcCcX2YXNVNYlFhnDlSnh1yEBTu
 7RPCmjWuQXw9Qet/u65Q6npaofjcnhdMPGuGV8o1X76sN78emeWumj7IHU4VXJ3kSchIr
 Ija16un3VzzwRIofgNgZxTt3Qsb0D1D8dYAwalGMh7ydGysI5jhkrdlN/wFoL1yVyTA0z
 86Kb3HACrKCPxhDS3a22tIsnCNMFdhXzb6Ucj+KBK6ADA49xaL/V4q49sC5XnNfgITg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65CAA401F4
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 561259828F; Sun, 18 Oct 2026 14:23:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:57:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f4d6e52effadc77a7791625b6e32ee8cf0647fe
X-Git-Newrev: c3cd96bd37e78547957ab957627cab0fd8ca446a
X-Patchwork-Hint: ignore
Message-Id: <20261018142304.561259828F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-serialx: bump to version
 1.14.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c3cd96bd37e78547957ab957627cab0fd8ca446a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-serialx/python-serialx.hash | 4 ++--
 package/python-serialx/python-serialx.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-serialx/python-serialx.hash b/package/python-serialx/python-serialx.hash
index 603e515ead..ae0d9d8d02 100644
--- a/package/python-serialx/python-serialx.hash
+++ b/package/python-serialx/python-serialx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/serialx/json
-md5  f4daa494184f90a7cc3381fe498c7f88  serialx-1.13.0.tar.gz
-sha256  0f9ecfb157ff04beb280cd01fce6cca36a5092af861dbb31072e636bd3b8f547  serialx-1.13.0.tar.gz
+md5  2e3b6725772273c234aa24ee08b384ca  serialx-1.14.0.tar.gz
+sha256  508fbc83290b2c368cc3cc034bc2a30fa083d1bdcfae6755a1175f6ec14c8af1  serialx-1.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-serialx/python-serialx.mk b/package/python-serialx/python-serialx.mk
index 0dc1f46ec4..67de7a698f 100644
--- a/package/python-serialx/python-serialx.mk
+++ b/package/python-serialx/python-serialx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERIALX_VERSION = 1.13.0
+PYTHON_SERIALX_VERSION = 1.14.0
 PYTHON_SERIALX_SOURCE = serialx-$(PYTHON_SERIALX_VERSION).tar.gz
-PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/07/a8/aec21f8a6d23be84a9dd9eb9259f3f2feec2b5169eefb2fd647d3a14d5e0
+PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/19/46/a23c683d997c5d46f34e777abb7f4b0e41e189b115a9f6995812e404595c
 PYTHON_SERIALX_SETUP_TYPE = setuptools
 PYTHON_SERIALX_LICENSE = Apache-2.0
 PYTHON_SERIALX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
