Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64EECA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94C5461039;
	Sat,  3 Oct 2026 15:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yj9yc1oVxZEn; Sat,  3 Oct 2026 15:57:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A2C7961056
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043033;
	b=SgpLqNzQZUbUYMcd8ZV4+Am73BPeLvBrABpXBSLp9xN0uobEg8DtOa84WAufat57L1bW
	 c/QUEjfHGuCnUIzczKiIpQCihuyeyIpiSlR3WgJb+VxLis1yiPr2a5ajRqAwZVhayrNeu
	 H6SdJ2BSYvyRJb6FtbP8Z78gBZM+f80cL8q5UBrDhFAAHcnRiljYHonAN+U5XAMvPxv33
	 CLgPdd9DvwS44T1QUaOvvUaECuB17K8Vf33MgVcuYiGoZN5OPH48BxBjsgr4eyw681VE7
	 hNsh8HoOdzL7B+PlS3ne6PwRRdNpcMMeeK/QAouKU/Sg0BS8e8U1DGtwQInOehHNuQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043033;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hKgbe/Kcj6+EpStZIzSKi3qG6IiHx7CXTnQ96Xk3vuw=;
	b=Y5NYXYv7VWIddkBdivYvHO8QHBHLtuOoSIX8cvwVltpOM0mEhlBI4yCo+T66iDIrCNGm
	 PNkP1D5zNn6or3d6KI5z+zDqdxC8isT+1ktiUEhzJvfPLa+9FIkI46n7oX1s0dfI6FsHA
	 rUWkdObzRfq3bQdeyef37KeLZJFT8GSwad+YfDkSLbx6Kl9/GKWWZK9i96H/fi+3EcWaU
	 uK5y3YL2dK+85LJJhMAjtomAb2ULAtj1M8lIrA2qus8mG5IDCHz2rQjFrNzUaxFna0h4U
	 Z6+qUWwx23vxQI1qcvBRt+/dBJLuUNag1DWJpF9dtZkbu1/EKSGw3wIl5jx/BOGimcw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043033;
	bh=hKgbe/Kcj6+EpStZIzSKi3qG6IiHx7CXTnQ96Xk3vuw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PX/3Y+T1wqI5TeShoP61kp2wOTG3k6NnWGBdKvmsX4u1CqARLgTUzXV4Cevwx0e/M
	 +P1+O3F3oqV25/zh8avHYS1jU6TonA8MybkX5SYjtt/36liM+ZkS52n0nv9a4wh755
	 s8EkxdMuwfsBkPF0T3tcFx5LFs8th2vnXptH8SDfA/8SC1uu9Rb/6Tl/dfhsJhpYaS
	 1xrIg7uhI61XYNvbsoA+DhMUtZfROkWTbt3kzNf0CJJqMEcvfUYnJQKcNgUCwozfpN
	 4t9Jt2fw42CH40uxTobWDs3eagX1BmZPBU8EUozaNi1DNKehzz7su10L0nISs3Jh89
	 LR5OV8KSA0+vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2C7961056;
	Sat,  3 Oct 2026 15:57:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91073A0F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7967060689
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elaLRotmxdW1 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2C672606AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042848;
 b=PYu7FJNXTmNn6R84WHMLTG9aYyUGAF9aigBkKqXZ0wWqOaO5j6URr8EkWWSklCqF6uwJ
 d0r5cmp53N+ABZHGSssl5XIrdeDicBwZ+H2CHmuATF7ofgbH1oA1V1jod2hfrR7hY2X4j
 H0uivu78djczhArkTwXPvJC+GaYSJgS3al7hpNrlX5KxBTlM9PCASjQImex74zmbH5plK
 8t1OMP3PmnRa2et/NEEgDh2wFIdSv6vyzDKTAK/D6+v0Anns0B70JRxfXsMwf8+8pBah6
 f6NpumH11tkRn8DtU+7LA8UQjKitSHTMA1SXPl9iOl0klc8l4CtEpS5vZli3Oy+Xueg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042848;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yHxMPG3kV0XiIA9mDMl9ASY7haU4Ljgmu5KKlm+U3pY=;
 b=XIAkoCkVTCLv6mLH3MESU5y7yP7SZADF+V7UghYMyNRam5D4kDMkIn7RZ+gaOtnZmMZQ
 vNAGY/bzGGa5sc6XOC7h+9o07gIP0mE9S9R7qyDY3kDD2pUHrdekwXwXDRZ4pEKOboOuT
 0m62vgvqJfL8ZtWdSnm9ulQZK38bgMUJtKEQ1MZZAR2f3Dv9EJ0aRA+tikkgpOBl6Mutq
 KAlnuMe8LGbLPO7d97LhIv63+i7A2p9+B23EQaPD+5nQhds4gcdpkbK6PCINLd7lVTJ0z
 /eNQdxL1ckSo5i0ZXFldRM9DzLioA07oC/f87KU+EXCoe4wHkAwALe0t2b+QLTnKAmg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C672606AE
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DD658A31E; Sat,  3 Oct 2026 15:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d72da002ac4277c9761cbbcd6cdcfc2dbf9d44bc
X-Git-Newrev: e384247dc8fb6bf95b1e01330fbb1e0bbfffb70c
X-Patchwork-Hint: ignore
Message-Id: <20261003155253.6DD658A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-markdown: bump version to
 3.11
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e384247dc8fb6bf95b1e01330fbb1e0bbfffb70c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index 1a5aef991f..ffda094bc9 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5  ec7bae2cc261dcb2c9a27271b60d40d4  markdown-3.10.2.tar.gz
-sha256  994d51325d25ad8aa7ce4ebaec003febcce822c3f8c911e3b17c52f7f589f950  markdown-3.10.2.tar.gz
+md5  b5032b0df41befcc3c96f9fc966a0668  markdown-3.11.tar.gz
+sha256  180224db6aed87ba9ce1f2781ebcd5826253de8ff637112090e24b84502bbf9f  markdown-3.11.tar.gz
 # Locally computed sha256 checksums
 sha256  7ba4eb6d10b32b2d11dce13821340351cdbbb30ba8ccc67841db2ffd86e79aca  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index 0abcae709e..9e7559804e 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.10.2
+PYTHON_MARKDOWN_VERSION = 3.11
 PYTHON_MARKDOWN_SOURCE = markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/2b/f4/69fa6ed85ae003c2378ffa8f6d2e3234662abd02c10d216c0ba96081a238
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/f8/4f/700155c8c20d9e655dd0732b5fc3c7614f291b9148da271d7388e50bf774
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
