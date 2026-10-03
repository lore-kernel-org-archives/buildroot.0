Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D7DCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D7C440EE2;
	Sat,  3 Oct 2026 07:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKXCYjC8nOjZ; Sat,  3 Oct 2026 07:12:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C2F0140EF2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011520;
	b=Hj1MheWzGykExLyOHpjDGJcQcS8wqqex1wDglDtNsZM3YOjlvXyLkWB/FKSP74kEQ9lq
	 aMbF5bsMUhk0ZZ7BVtUSYvLYrsSU4UGgxLVMoDdEJQk8AbPkhlrOMG2xztS42SijbvwMu
	 fJjVDe9X58m3TXNH6VL72nmSrKjZBbdwXg8PBbs7Hs2tbYM/nkHAFQkZ8aSBo8QVByQEa
	 ONNaAzrkBBPRRgbBmrTkKpmrkXVPSL0sh8KU3qk1McDPDZvuVf7FFbjLi1cchKqM5uQrM
	 CFwTkrv+sf0uyx5ajhbahv4YFaPGpW4yEkNuA1FWSKuwlQd+e9xWKtjV4PoorSgP77g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011520;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TXBydlhFDCy41ey7urMM49p1xzvncJxyYAhwCfbArpw=;
	b=Man8ygGLJru9nxmv5fSG8GUZh8HWfjAgrC7nXwwTk44FUXL8FvvSYtcl5Q7XRige6H4A
	 3AW1aIorpW5oYfkgtvVbead4h/aYJn9bsYFJWu4Uasl+uYogBH7rda8OdQO/HMtKOZ6dP
	 4ERnZ7vKUZKX+tD295EtDxue7EKtDK2tOBrsxnl5fPOm2ALm/Ios8uh06N0hS5mYxhxJz
	 FPGb/Ich4+BPloAaPCpZoT8kDjTGS1dxQysH4NOFwzJZ1nYc4VNK/TuPyfEqm62uGSqAy
	 zaX6rybfqfkgTLmP/F+mII3lGM2nzSr/atnu8loe4crXEnMxDcMawZLlf0SaXMtkDfA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011520;
	bh=TXBydlhFDCy41ey7urMM49p1xzvncJxyYAhwCfbArpw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XqJZjhXMaui8+8KqDve6TvV4WEXZec6mDlKSM3P6uboAC5MLE7dGH1Swu10afBGD5
	 kY2kRPSHygd9jRWYCQcPqrBqAwLdJGIJjTnkFplHYZQ8dWQf5IiCLK/sSIeXSCQxEd
	 ctX3GVZjawIgVN42khQJEDBnAgwZdGBW02mTrPMKGnGL8/4X7QxFIKR+PC2qhQMKI1
	 uzIe6ZEFC1S1T6YubuEX3GrWhQ4Ysnwd4YRzGl7EQPRrQ5zUN5Is7BA5Jd7xna8pDi
	 WfVuPF+GHy7QQhK9zpo0Y996ZP1G6B/2DZjfTrHyNiGgg8Jnd5LafugUlGtNvhwfwy
	 Rhb3HL366bpZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2F0140EF2;
	Sat,  3 Oct 2026 07:12:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F47E34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60E2E60666
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NY0cNRuRg17e for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:11:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 69B9B6064C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011518;
 b=d1f7zux/r9qj+xtuFYfB8kPyLbhMzupb9gsDDXpGX3UDnjWCxfn0txydb7YDZJ29ppj+
 FMN2hIz1bHKsnokh89l+zwgpjmnNCcRYyDxMcMUrh4tl+IdgRL8xl2ASD1mp7uGS2x09t
 UOgGHlRwFKzQc8Zk0VRanX0DiAnvhAq590Cam3RxnqSARP1tJuoHzDVaSn6dBEIZSkX4x
 nk/yh8FUFXQatep9EdC0S5Oqqr/7dV5tkJlmrju9tNXZI+npsp74e2CrbZhbcYBowRM2T
 v+8W68/PJfz4IYn4vvpe1CR/PlxFc3frmPSaVlwrMG/5s3T7uLlO/J1dmCkxciGFM/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011518;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=NIFcE4QUCJN9fCipO8qarF+I75+foPQBRbedrW4uyew=;
 b=FaULbzN8nX1YFW5l7Ooc5uJqlwbsu76UU2129TK44wGuShhgMjssaVZfCNLZiya5wr/E
 KwrU7LNVH/ZX4raxUKJmkhELH5hSnRKtaHS9bhxpUI9SpnZpRhRVIQdr8nUBgR7A137T3
 1dCGIJqG3mFvWMr8N2kNAAXnWJwng5++hv7/zyNuLrUneBQaRUyCrMilN7jic1a3edJGC
 dV0vnBcWvtJuDeUxjTMbRh2XUwfFZmeF8aC8rkIbTDY/4sIxO7wp0rbxLwHrqgG0cNK2Z
 CkVBCQXMx4zL22gCpOqbjI7hU/CXvFzxWxUqoYUHaawgMzQCkaBlFZhU9xiVGXf+pXA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lNESSJVA; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=lNESSJVA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69B9B6064C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010931;
 bh=NIFcE4QUCJN9fCipO8qarF+I75+foPQBRbedrW4uyew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lNESSJVA1QceyXFAjSOkX/QXmjVsbO2PTF8hEsJ3CKeAZWRoZ4AbB23ZinjzamuxL
 TsZNBzpCc/2qLwFLpklotQNTl418v9Ib2S9KmcccVgm+VfaT/M8MZrvXApluCRPEeo
 PO35lGnT8XAKooWl2aXl7eGUpOx6YAzAn42HoDlwLMx7JPjlYM2i1clTd+JCR1MUNe
 ZhucablyuWL2tAeaS6KQBiDmUtIf/QqkPjGJz6oREDJ7mzz/hJtohoG9X3q+Zt1fHb
 9mlieq+A/SimtWZ7qPKY9fIqDgppsGANPQw3pYlChO1NbkaFGqCaKQo6zvKm3dhqSx
 ziHLQQ/mimltQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 HVOJwSYOqcKcWgSNIfEOliGAgpLIyII7tCk6MK1TOAPn0hratmq5zJy0fzrCcfSt9uuFWJPovyI
 l3FI1SezFlgGm78YIpiOquQWXqZM0CuGUlQmf/0LsfCuGr96CYkdfoDPcnOzZ8n9qcA2oiaQKZ3
 gEeTSjzqsCam0apOYGJn0ftPPnnKaRkogaXtQqhprYLQcxEQJYEXxi3Ip5nVUm9x4txMsGV1/ty
 0Lbxcl+dJwofQEh1E4y7BKKODwwt18kPZs8bMpKtfG9EQlDROlqPmrChomlYQurOIh2XBzfBvKg
 yRQD7GfByFLo5161or7RPQ6/lzSW5Szbt0xo1cDbQ0e4I5LHZe/LzoHjXBJunteMZLH/uJb9n6V
 7DMOx+ZuNeWtxjeknfNYln15zi2gAZWRktALi7RzHK2qck1QC+qGum3iVRVLAKmUECK1uAzH12n
 FmDynjOsgkT4hXPQvjdpOO3EjaEXR0QYN0o948QS5Ul/WEHk/hfe1YGbLY0wkwfftSmrxeYkPvq
 Fk8+U/mx/QcYdE1mVNJyJ/XJ8CgcVBMJwm7aGYT+EuLHCVgGQVq+gybsrhXGl1C+SnHhQ47JHeZ
 H6XeljwH1n/Rub/BSvy6zHKe+6sP9EsDl5MRppDlVuLANzboYdzh6EI182Z3wiT6
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 44E3BA4C543B;
 Sat,  3 Oct 2026 09:02:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkh-000000007Zo-3zU4;
 Sat, 03 Oct 2026 07:01:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:00 +0200
Message-ID: <20261003070128.1295458-88-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 088/114] package/python-telnetlib3: bump version
 to 5.0.1
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-telnetlib3/python-telnetlib3.hash | 4 ++--
 package/python-telnetlib3/python-telnetlib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-telnetlib3/python-telnetlib3.hash b/package/python-telnetlib3/python-telnetlib3.hash
index 14c52634f5..65881e7808 100644
--- a/package/python-telnetlib3/python-telnetlib3.hash
+++ b/package/python-telnetlib3/python-telnetlib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/telnetlib3/json
-md5  c72d70acb65fba264c7f1a8ed68d4e07  telnetlib3-4.0.2.tar.gz
-sha256  76726d7a7a34163b5dbef461e9cbf8fb4bda8f4fe7fcb225f56cbb4dcf5fd16e  telnetlib3-4.0.2.tar.gz
+md5  b60dff81a92a07ceba879130b48d1e4f  telnetlib3-5.0.1.tar.gz
+sha256  6fde197ffb71cf26ad27fe2c88694d8364f4b1cc962a37762e0cf7e79b9afaed  telnetlib3-5.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  23bf24a5fe7cbfc70b962da94334649cf60a3b309834c72eb053d91d8caf60cb  LICENSE.txt
diff --git a/package/python-telnetlib3/python-telnetlib3.mk b/package/python-telnetlib3/python-telnetlib3.mk
index 7b29e7b13e..60772a63ba 100644
--- a/package/python-telnetlib3/python-telnetlib3.mk
+++ b/package/python-telnetlib3/python-telnetlib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TELNETLIB3_VERSION = 4.0.2
+PYTHON_TELNETLIB3_VERSION = 5.0.1
 PYTHON_TELNETLIB3_SOURCE = telnetlib3-$(PYTHON_TELNETLIB3_VERSION).tar.gz
-PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/2c/1f/a5de9f0f86976d299a439619417019a9674fa8662377659734dd6e067235
+PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/b2/6f/92e130274d84487c48b149f1c5bade54dae3cf535b4c7a5d4ca3e6579590
 PYTHON_TELNETLIB3_SETUP_TYPE = hatch
 PYTHON_TELNETLIB3_LICENSE = ISC
 PYTHON_TELNETLIB3_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
