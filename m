Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED8CCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20316815C3;
	Sat,  3 Oct 2026 16:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBy80jQWL90Y; Sat,  3 Oct 2026 16:07:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 05BAC8124F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043663;
	b=Fe5/S6jjVSaGGcoANFeo3+GaEx2IQB85wy2cPo8EeC5tTYRYBgTxUjevCDhRqxZB0ZMi
	 BJeltwP7GTix1WoLVTfFiwergkj+IFQK9HtNlLGYDc6ANzqpnIbCQ+ekFgtNv4NRk9G58
	 lip0wbjMOuuUolmo6kFvTrNCZ0F1i/u5aXvvCPgPc3ka0utj2TO7tOX2mF/gT+Ew0lYiQ
	 zcyHxaJ+BdJtpnnxbxPV8KIjY7ZAgMNZ6ntrKolR0Y8IyvFOVNfJAzZjmAYJv8euzKqmc
	 IGcJ/xRfKZx0u/gRXKJCb+F2fBPWxpKPMH8y7EGZsqR7gdb31g/Hdcog3GRZArcG0/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043663;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=M6O5EcODm+Z38sgh9dWgR3qfu5pRWu/V8Jv/7XQR0pM=;
	b=bKwb2wQjASysTi55dZWzv+qAXSun/LZCLx/3ghLuNrpG2Pr3ujDnVeYktFLvtPkr68hy
	 nmcv8oDhFsLYvnvjgyRn+TMfbVj/HByox5XHQjpTjYvyR3WIcPiJpmSG+ox91mwdhNwNR
	 ZYPRPgWZUUtRTgTcOC7UWOmYT9uSDue3UWT8Do7qVNIzjgkKVh2Rv6u+3DPZjfLVgnzvf
	 Or+E4TkSDSfiIHaALNL+JLt8pvG8kbTk0xAyoclYySkaLxBowmIY5r6J/kt6GF76djfeN
	 DgeCCEL0zofO2wR2LKvi3x+5CxiuM0i0pvZoMVngmaZxHgaDX5ZAIZ4d+tiVBarq4jA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043663;
	bh=M6O5EcODm+Z38sgh9dWgR3qfu5pRWu/V8Jv/7XQR0pM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CDIrjeq2KL8Hn+McxTGCBHG9P8U0vFruyzN7GoQnqs+MiYqiq1escu8Vo5zv5RvtI
	 /ASsJ30J6T52wTFLfjkTLZ/ShYG3faIITNHGMHYWuzvDsBqiDaSk0gGoZO7qVq2LwT
	 VLj8USnKthqnH7qXe++D9p5b0xDXGOpruNTU8+KMSNcwyQtKYHaVDdfdLuP4wvV7mA
	 zPCMSUfj4szkyDX+Cw6dVPuukDZtqekzlZpvbV9riAubatFF8HaIV/gzRvTuCB0uO3
	 /YIJA0RjxbVO9ytofCW9XKnjhBT/VTGrhKLlY42lKu+tiEl9iCnGxL9eFv96erj6oT
	 pORHGw1GXj0cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05BAC8124F;
	Sat,  3 Oct 2026 16:07:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D96B335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF60E60F24
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWPkkTTFaRFH for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:07:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5469C60EC1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791043653;
 b=Pouemm0n4IJoOmbzWwBIOncZEVQML+DPSiHnkIBnG642r4h2anGpm/Mv565DpI0pYxhY
 +xbJyM9THcemu+2Doq/qWjrGnRSCVww6Sl3tpXV4tj6yv/7y3KZunImsUNaAkyZUzPDw8
 JSEq3Oz/jB4QAljOAHxUQr7rzBGVSDGl0cyrJ+z/vkzIgogNE2E5H4ibdZTBH5yFuBLwH
 /UhnLQaK/wsBk4kZe03GqzNt84gwwbhDfIvzctEINnYLam5LQ2tUuPu1m585KJeG1/IV8
 5BUKMh7ZL8PVh3aqmPBLUbfIQzPysYIX51gYuyE/fbXp/15jCvv6J4U5QkQaIXeDvpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791043653;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Cc1uHgvhp01xijNgD+sdD0afiWo79r00nwOfgD87olk=;
 b=IS0RZJt1NA34v1ofwBt9MFIkUAo4OWO5T+Fh243jTEPfjohNushZyI/92MdGuKsG7VQ1
 bV+c60RApNAAjDlfRyRenPenU6fRbAxnVjLg+BCJl0epn2wMX4yj/g93UffofS7LEAThN
 cCLoi5rfJn6wTWFi6eCrcYdmpQzoUYVKsRNoDqyFyjsBJ6d5+WBL/9kb2k1yv7C/9bD2M
 eXWtpOdtQSMgsJeewI6lUvQYkx1P6BTYWsJbVawnmNuSaL6NI66IahJl1bAZg+AA7bj8k
 Qk/oKGTgOzaCxxcl6ZRo7zOGqyxQj4SeJPzL0cLz3pmnPJ8yOCPFE5K8HinkvVd+vfQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sOTCGz8M; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sOTCGz8M
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5469C60EC1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791043634;
 bh=Cc1uHgvhp01xijNgD+sdD0afiWo79r00nwOfgD87olk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sOTCGz8MqWTMvP1UEgfYMQ6zpgLSIFcxQxUaQpdsnc4jULaEY3Dg9yaQKZ3cLGvJc
 q3EWb1UbRWyn2yBGLZzc3bgdNKgX8LGHIfzQYaI/w59Rrvh3a27gRyW2HuxDjFsNf3
 yUFpkfkLbc0tARwIZaXKvA/3kkUTRomrrvjgx0u4KhdOKELvApE2JvfoNF0+U5BdxA
 sGf/Ndfn98mFuO/Yaet6avGIvAygcSXlErrYA4bAKevZq8iNqMvIUu+82iaHFJBmPl
 XVDduw5Gf0lKgZsAQdokcJ9OMT+zGudWgUirxyFcnfR1LoYAAeIG90fqEvHe5onReB
 IraECn40IK3TQ==
X-KAS-Sym: v3:f51bdf72230551df:cUsXPMx0H4sbL4WVoT/dv3zTsJF5iWO5bRGmWD1z2zkLt
 N0F3586AIOmGYj3D/aaEG6PBl8SLV7kvbE1zB4pBdfmau6j0sIqP0MrMNRUxFWcPTjjZubJooUB
 6ExcADap8mttgELI8REL3WLBt4QqnEnWlHkoBQM7/THI+xNANvX137HB8bLQgq5fOBL0q5KZ4vB
 qg4QgG62l9r1bv+dYeMwDPIv5YspQXAAGuLY51eY7k2IiZqwxBkBzcT32Qp0HHMNs7usz8hyJhn
 U4hETGHDUFfA/vBTXI3FjMN9u0TCYBvlCSpvOTlOSx2G4AGhLshgEc5GGyGsyRN8oSUPSrzw==:
 u7jADOLOalTof+qPCIsjSEBjNeU4fjFaOkWNphdJG5uK4jXZ+417EbgT110mUUwhqS0jdFKYZYS
 1nS4S34PRf+dSO77YWGdrSjBpMXnOYtbK2U8r8B0U3uX6Ghc1A0DmiU6VPdLkIoc4gp/axP/tQT
 97ZdbGzV1tyD4tA70WsJ+4DWnWeoRbkqoSlH5FnPSaLzlAMrKO2sdoXSDYfoGNzbCsj2BKvRzlE
 NzT87Ig86B228eujjjU2UhbSbi9rXyLaMayFiaIcQmgPT51PDRArIGeEQWAOd3uFY8u17DK05bt
 t+vwTuBz5TeK3xLJsicsBp5097/Z/W7dydRevB53fKMF8WeWkpvJIZUJCp/AQrB37hkt3mUzWJp
 Urr7swYnct3IYdDfMDCePnis7pe1ATLDfgnvMsbybef+0F8eAM1y1Fejn6PyFcyZSQHlQpPhIpu
 o7niLAta/zNsRWnmXiislJgVh/bnoehUMq79K0HfUwGrpBGq7/rxCWpOSfrk5/kWWExtlkpxfxy
 iUF74taPAwj2vOrykVGvsQp8F+HxRneT7zhXsByZM0XKILVeIBvNLTKBap5hMJbkX5zl/87j/Xb
 zBTM+DihiwbkGoD89i/Z5Ut+IaXwVVs/wP8fHexOw2JXngqwD/aC1PS3Djb0CqUXsKY9/c1VUUN
 EvZ2hTa8B/K8r8CZS
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DB9A4A4C54A6;
 Sat,  3 Oct 2026 18:07:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40626)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xD2GX-000000002cA-3OEW;
 Sat, 03 Oct 2026 16:07:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 18:07:13 +0200
Message-ID: <20261003160713.1350799-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003160713.1350799-1-bernd@kuhls.net>
References: <20261003160713.1350799-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 2/2] package/python-scipy: bump version to
 1.18.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added license fix to series (Thomas), this patch is unchanged

 package/python-scipy/python-scipy.hash | 4 ++--
 package/python-scipy/python-scipy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index 5be848c8ad..bbc84fde43 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/scipy/json
-md5  d36aba61d4b01c50551efd38ca03752f  scipy-1.17.1.tar.gz
-sha256  95d8e012d8cb8816c226aef832200b1d45109ed4464303e997c5b13122b297c0  scipy-1.17.1.tar.gz
+md5  e71b80d5afd37a5abf6e413f287315d3  scipy-1.18.1.tar.gz
+sha256  52c4b7422442aba924d03ad4019852b08a92e64ea187b933135687bfe2747307  scipy-1.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  221e59f5e910fd7f94e44f0dac77436a11338c285c6346232e4a850a50da0e94  LICENSE.txt
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index e6e87d0cb8..2d2d9ea2db 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.17.1
+PYTHON_SCIPY_VERSION = 1.18.1
 PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
-PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/7a/97/5a3609c4f8d58b039179648e62dd220f89864f56f7357f5d4f45c29eb2cc
+PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/7e/74/66de6258867beb2ef08f35f9f2ac017a52cacd5081714d239ff1a442d458
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
 	BSD-2-Clause, \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
