Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82008CA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B82580E95;
	Tue,  6 Oct 2026 16:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShzWuEDleA0G; Tue,  6 Oct 2026 16:34:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 81B3580E97
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304444;
	b=KW1ylj6xk+JiRVKo/yfxaEZubvUPyJ+a9DvV5khx9ogGJ4nm6yob+EXCvVVWHxD40Fdp
	 4tCBMUwMEgvYThf2WapIojDIKMJp+EN/GVjfu7BpBaMsgGxRrKtm7+s2ju80j+S6Q+8Hx
	 ZuNVLK16lBt77ju7rytH8EI4ryZyPIaPkjauU+5pCgm3jf8etqpKEnm8XcLY7xAB9qgg7
	 uiged8tLfFwVF9PMEtWFTW1BjPejREwXzY4gnBbKUi60hhfS1S7O2Y5ghdAzztEfcDbn6
	 k1X24nNimOokRxdeVU0fjW/ZTvuy+ZorFLFvinuC38dmpmuOYUlha2cRvGTp3d8SSfA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304444;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AVNTxmrdFKoreplm5WRe3Wu57IlF/aq69UenLp5Bqn8=;
	b=aJd2cW5EdD4lM8s5i/dqf8MmNSIVysNE8nHQg5r9h6j0C/U0QT1HDIOFGOcKl4yp6H8N
	 VUCL7I0iSp0pgwywExmajYm4kGO3dEPh5m4JbsVVNb3odR9jTfwYvlUQ0HH4sxtk0aOnu
	 Rlcn7EbtLMmkyWgN67qg2p/N46yuwZLX0BVg1Ocj231N0qXwOJ1c+HYyoZI5Y8Txrd6Zd
	 /8LYOvJ2W3aBJBQJ/MMyciACAVuTypsHbw35Rtuuq/AYABg8ZwI2qrDCBcAQHAJAXqD6C
	 FgaMssmDPWDD7WOK46vPBRDz+BEgIR2IyJWWGRiuatNpprjuIuwhJw9DdRpy6cbfvRA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304444;
	bh=AVNTxmrdFKoreplm5WRe3Wu57IlF/aq69UenLp5Bqn8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jpbvregwcWDXrRMOCYH7ixLvF9bkHcoyz3XTc9Byd1q9c7tVlCuTNuJqd2zGwX4z3
	 +3PLbNQPHLpnybdhCs7NP8AnrXgp5WzmCQ3mhkuL1Fv0i7Qo0yOSFmAgivpGWi/lK4
	 ZTLGwQbKpMWKGwANcN/Gn0NI2Rug+maLTUNfV7mtTHOGzkYxzUpFR1pibMtEDJjQ5x
	 Ouws6qiJkYpQB3AA5skHk5i0qrWp1yzff2KW6J6K3sOKeGtAFUAMvT+g4jBpZx/nBN
	 Ur/RM/rRoTJ9VK8KJcCpPk72D8TBqeKgJ9L4a3Nk9GFugvY+FMV+QMLPSE0GigeNfc
	 jlcCFcMFeTPvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81B3580E97;
	Tue,  6 Oct 2026 16:34:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBF70317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDC1740689
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lDwboX7iBdf for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:30:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 070EC4070D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304256;
 b=JoZGzVpbeoMlCodLni65jlXxbCczfNBvrSr130pBvTTVb2AY9y8OmvWqO/0R9jmsIjmQ
 ICJlRUCTaoyNXTPHACRRVcY6wWPk0b4+p7fIbh6U7ekb0lXK+xYPkCuU25oUKIqZ2PyLO
 853bHmgxUVyoxKw8AgrPqAfqDwHh13Ri/2UCacwz/Cl+kODrb7tzW18o3srruQd1MQLX6
 +KYvN23qxfw69qsb7QXQBnfc5qBKuX3Ae1Da98zzpLYu6/i3XtKg6/qPVqFuQT2oCg45h
 D8doEqBJQ7Nm041GPHuBGSL/2k0BXqJpcek15Aa42SqLZJ5EwFOKuCzkIPV94tMRtVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304256;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=hAD3nJAJTVRpLisaiI41+v00WBkP0ztl4P0MKjkI04M=;
 b=q4lB7lnK+Uy9tR/YTagWIhX82wEN15SbBaKmak5XBd8gPnxScCL+gAcv1Pm/2Xn3PqD2
 2miLCP4PQaC3dzfJTVbWKJVWSiLXbW/AwQsJLvxw83lbq8PLoAosTwx8TFnupGWxPmLjX
 UbnpN8FOUf/VANMC9utQpEwLnDyf2uESOhhrI+I5nA38UH5mpoZYCC85KEhmtTU4jcu8S
 qmFfUNnE7+LD4q/P/ddUy6gN4m7lgTO69u/nAZx9MyY/qCP3vpOKOTEGIanmIfeOrCHSV
 SO4dByLHuw7DbKFwN0R9MQrf5FPjughnI3f6jN2ef9AvRbUQyFoHu0ClA/66lghkzBQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HOM6EPc8; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=HOM6EPc8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 070EC4070D
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303708;
 bh=hAD3nJAJTVRpLisaiI41+v00WBkP0ztl4P0MKjkI04M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HOM6EPc8LX/EQELwsmUNfGXjiXUMcrL2LMGPy5Ajzx915fKE4EjXQGSXgntOBk/Fr
 +XZ0xb/jblRSmCAfF13Qg9+Ad18M+S8nGRVmNzcKJ5LvMgr/59H1WcTEVsn4s9TNPL
 Uf25ig6u1C02x+vGztXVFE20CiETpfVabHQHRroxFUzX82syxG9MLRif8nEQl979Ii
 LDEpCHv4Kzlj6Svz3z5JeJJtdiyuR/Bg/EmMGsys3gB0GsEzisQ8EuPXf/Dkq2GEcZ
 rlbYBbjL9joidhR1J63PpwudcWKofR8XjphFHmIsTtusRWo8KxefAYPDeLJa1am9vT
 NOWcxyl6FdFIA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 uMh7/KZZzymrMUNKXTzlDQRUBEZly2eqP4dMAabUk1KM0P6CFgMQupgON/BXCKB13qKPvq9Fxtc
 ZnKo4tcsy5V4mGlW3V2eDnWllWRQLfIXNaIH1lJlJcWLz059RRJJrCexv/xbeuNTEu+0ptR+LVZ
 t7JQhTW6cZ31Gai/yoPVQKjt/UOhLaJTVNSfqR1CtJyETz+DrnddTKF7wqpyfpMLqh8YnNwlSst
 wiSFi8kx/APc4V+EY8Qm3tXLm76b8LcrGWOUirwsFwJOg/GmpRNXEYQBUUSSAZ6C/ehhOktYlrL
 eelFBdXJ+sgyxxMsaQ3KEZI8bnmjYIdTZCWuOUFu1V3zMu6hauFvVadzTx3VT5ngXKlwVFqHyax
 ftNzWCMfmjkEqRYx0aX2TzeZI05Am2DDMbpENyahdN7h5fMjK5qBZs32o6Yb3vGFHlFQWNevp0e
 CC4WfEu1QAd5JfrmqaLLZKnaobkbhoj5ilv/C/TRFY+elprpVkXRE+spOIB/54xTJ7aZJks02O2
 ES7dfnNTYiHREz3YmKMdx8BTsaQqP4dOqWiEta7IA51H6Z3zp66VRQdm+Yx3+xAaoxpiQ4D0zDp
 yRuq3Lb8CG+9v5EaidqUeJxfUhZD8G7P2pFluL+jTdTWBQ==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5B4ACA4C5486;
 Tue,  6 Oct 2026 18:21:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uj-000000000ir-0WQY;
 Tue, 06 Oct 2026 16:21:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:04 +0200
Message-ID: <20261006162106.3439373-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 23/84] package/poco: bump version to 1.15.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pocoproject/poco/blob/poco-1.15.3-release/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/poco/poco.hash | 2 +-
 package/poco/poco.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 6979a9a1e4..4c132f9742 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  47394ea7ddb7b0a40e1a5be896f8f5dc77cfdc4f561d2e7131ecf582df5a0c3a  poco-1.14.2.tar.gz
+sha256  4f112fea59e0c65f0fffe30a4957f8d66cf41528c21dd9903e6d7550022c794e  poco-1.15.3.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 63279d530e..7e2a9014bd 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.14.2
+POCO_VERSION = 1.15.3
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
