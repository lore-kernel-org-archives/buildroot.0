Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7159CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62FE46064E;
	Sat,  3 Oct 2026 15:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2mwbsrR4-Xh; Sat,  3 Oct 2026 15:54:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 16D32606E9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042882;
	b=NX1mP7WbcNPa5TchoFg7ULO3DMCZ2jI0i0mWB6EGAhvaIZGqsMYIHdFXFrDrJoCVD0bT
	 DZ4az2bkmgBURxku/OSjUAMzzGWlhonb0f1ao6X7YrSso9RPuqBspaM0RSZJ1CCFwWGh1
	 2OkIdWvfoH3wxKiBwVdbzDTmlX7adEO1LikoIq6U2/gGpSf6MmSNAN3FsQc8cnEMtJJog
	 FE5BTP1r+tajk9QEKdPOdryXEvdHVfefL703HX8uZhERPDYg+cRpM0RThUKuMDK7TzgKQ
	 QIjCIoPahCnLuYfMckQodSkMm2Mo/Zbs4QznyWfTa/PYKeuUvMyjD+Ir6XhfQhlZk4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042882;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zVrfH7GAQRiMdNVKs0jgPdaxBN2erHKc/zy6LqB7DVw=;
	b=A5ucWxdJlqe/s+8PExyCmZRPnGzh1gOzbL99wTXV6XUX9OplTsV1ez31vhexE+cUFtJo
	 CSrlIDaoCIkSLJKQ2icGbHiIdR73awgQvaw5b8gYOr7wXCsMS5j+vzyfDqqSuDtFVYSSO
	 E4qUzTi3Evx12Cz0m4l5cPp8ITYA0WMc4dcFhhNqkS/zqzn1m8K2eZxq2taiOxx0/tOVZ
	 9f801K2ZaSNJ6QP5WsvKf9ICyjIjrVZ3OLwTXH1v8eWUO9C04C73mZz28LwzvGSGpHX7R
	 DuWyl7AfIajwDW5w3Z2DqHkxf/HJO+vok3JeS9Z6FmR9QdglgO28EhIihMsE/BWbOQQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042882;
	bh=zVrfH7GAQRiMdNVKs0jgPdaxBN2erHKc/zy6LqB7DVw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PlvSZqv889g+SLEzdQwSNFn1pa5bUr7hzPKFDY99h1VriN9AmITE3I+yvMO8QGR85
	 UknQoss7uFwCbRNzaypNBQZ/nclOuUsbTpAbsV+RoBCRxU14vDK+JutB8mpDMQOjtY
	 v12yZyGwJZxP/63W4c84Hw9xm2Ts87nB0PkWvyxXIZGR0DpuZJuz0XeJGWG+190L6m
	 UWf5lxa8hTJcMNH0Evgi6+bj1pEpD/NF+lbd1hDmz0pUw6QlozKNyLEEbDD/oYUxxr
	 mfcIzwDtoqnjVyHJ803xUHN6IQMkBp3aqJEahgS0FSNKW2fQqY5fuDR+/vfPkfkcpb
	 jFeGLGNzlAvgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16D32606E9;
	Sat,  3 Oct 2026 15:54:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FBF7335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52EED6064D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BM9vSm5B8RTt for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C9E3260666
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042843;
 b=BXmUzOtEhLFKqDhayrQbCTzsDQbOyPBcfDUS0+ENq9AdUYQ5+HcG2ssNoqohNh0QBmhU
 DkW3bzZIeCU736k5tK3Bv+bVkirJ5I0HkXmLgb1RmtzumZn3/iFSrdKEH2vC6/l1y5N08
 KS4L3OkWOfGlWCYwxIZrNBHEFNxzfZQONeRnr/MJvXhQWtZrz/4NNnSt9j7HrZex59ipq
 eepKKVsln8+2VJG9/Moxyi0MvcfPbgS0KJ9BHmuILt9c2MUb1nVX41KqPN/Hfhanhqdkl
 +rBFuU79wPgYhYQqzgh008LB0x5Jaj/Ar3vMZOJUVMOf+8G6W9B/ZNrDORLXamVK3kQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042843;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=S+IwY+II6LWlogmLEG1puVbiez6g2jwH5DwyDaElYKg=;
 b=nvi/YIfMbsk1LL1y/jvm/pT06wk1m+E3W9KBigY3sYVCJ7AocCgkDUfiXGiRfcH4ngpj
 teCPo0uJwV91sO7BXtneuJ7Xh/AZBeQB8X+JGAE1w8swnY3WCE9nkmqoSjn0FiBx35nMR
 VNjDyt0IncG3CXrap2iGKEichfbNrQ1XyaqYKrpgqxr8L1Xlvz121H+OfwBImgta5WWPb
 hpEF1q/WMJmR/HSf9RIER8AxMTbGeYHlyQGAbTg97BD/e/uoOFVuFyMiKGNhbhx8Eq5Xk
 5UjxqqJbz4bWqPLmp5Gdpx85bGRIJjkkThjN1qSwVrRhe4m7WEavrM2XbEIfee3pRWw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9E3260666
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 169EE886DD; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5f11cd82dd0c599dab859f01dd73219f954ca00
X-Git-Newrev: c2187012ee625e560451f48f40e8912d32805e78
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.169EE886DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cython: bump version to
 3.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c2187012ee625e560451f48f40e8912d32805e78
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/cython/cython/blob/3.3.0/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 3c33ad0536..f4495dd076 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  7cfc3278f4eb7a072446f08dbd4647ba  cython-3.2.3.tar.gz
-sha256  f13832412d633376ffc08d751cc18ed0d7d00a398a4065e2871db505258748a6  cython-3.2.3.tar.gz
+md5  df8ac911bb3c6af48fb0158160e5b029  cython-3.3.0.tar.gz
+sha256  eed0d93fbca7087f143b42c34b05a825849bdf17f101572c2105acfa49aa88b8  cython-3.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index f99dddc310..587949c17a 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 3.2.3
+PYTHON_CYTHON_VERSION = 3.3.0
 PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/39/e1/c0d92b1258722e1bc62a12e630c33f1f842fdab53fd8cd5de2f75c6449a9
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/a9/d8/4981ef716ad0e3ff0d3ef383aefc6b03c4a88dee33b272bf8e0d833001ca
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
