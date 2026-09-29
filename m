Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2DACA5FAC
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 17:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C78D40758;
	Tue, 29 Sep 2026 17:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpS5Ib4f4zRI; Tue, 29 Sep 2026 17:53:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D7D1140766
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790704389;
	b=c3nnbM22Y5Lio78lToigfe0PIg0a7F6tk3DkhZjtz/TWvkAhP88oJ9YUFQs8QqfSicwY
	 5bt5ty5GnUDQxBqEyOYqcueWNwTJTXIwt/UIqK1IGYk8ooarDkq17rvJ9VaTaLc8RReMY
	 x954jIaUYuZBKoGnYOyUrm31e6/2AlZyk22+bDvmRPkO3ChYtppm16j/tQ/W6QVw4sv2s
	 ReGfUbnGuamE4mzDa236/cJwRuz9smz8eJxqMpJBrrodUcVNZGcbMnlnADFyAoBmjVYHm
	 fkN3RtLB7nTs+yANeglT+oFOPqUw9zc5lkGVrqEECletWTlJ7AuiCt1lMH5izBa9rag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790704389;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=E/DH8VnxJ9msUmoOQaj4TcvK2tFilBYafXaME2Y4aA8=;
	b=Q0zACf+gYbFXgaByBgLF4ejj/AHH96fRImChpmz5MVOVQEhVm3CMrIdzVsDZZw37bkH7
	 Xl+4M53dgggd4P4pd8VP5eUqmNA6cqvCtYNrJZxWMUF3hgbA5rCgdTuDQVikqOgT4gi1L
	 R4Z69V6S1qa4K5GWn8gkQPPcr9zW06Xj0F0wMYaF0Nczu7sstuk0wbqfrR73t9AZqHqrb
	 /2RaxziDe3+SGqit83i5ECU+QCy6pLYdf8ftBwBCxKE+NR7P7ECIrdF9MN45rzj/iTL6e
	 NN4DorQo6l3xdUHGsiWiFFlBou/DejCnDvY+aHonRPJLn66MVNRF/mSj7liwA5gowBw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790704388;
	bh=E/DH8VnxJ9msUmoOQaj4TcvK2tFilBYafXaME2Y4aA8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D32Zq0vPYhcHAm9j3NO/fXLp0m5Xt0jQnJTlqDcXhlxCaSzfRnoOiLoYU03/FPkrT
	 BlXrMG2f4f78Xz5qw8OHMz1202F6VZ79FZW4KxzI27NEDTlRdC1obco9imqZakDpcx
	 /YKD3IrJ/7thn1cjD/ypxojkApIK6NzhCO8Qu0WsScE5KCk1bdUT4jAYw0cE0Wo/HR
	 vVBacyAb+P+3gkXvvzC4DCVKwTK8nmxSGwlkZWiLarcSx3B/jXrmRsug/Bo2jIE77g
	 EGEVzVN8gfe2yBRevhrnPCQfK2SrAC20UkCW8Gl+WEDJO8gwB43LeccXVTPF95oa+m
	 CXWl/yfiHUngQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7D1140766;
	Tue, 29 Sep 2026 17:53:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D12D932A
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 17:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6B6D80D1B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 17:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulTDgfg60War for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 17:53:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 43C6780AC8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790704386;
 b=aWSLUhprGa7fZeDGJBglxF2zGTx1RTAnzh2SSqhBNZvevxkMAEKDKKhND7dkm/+WSa5L
 kLXG1v3lQSaEbiGxShfEqqGSmZH65VMA/Z3v5r2HLEl/KK++0RCsImKiEJhM3X7ogATlE
 VZ8RHbbzv+WtkBy1riQ36BvbrepZTgkIY3L0F92kGWB3snDvXciRUMUEzVI+0RWLUJYfU
 xaLvBwIoqKo2K4Q2yNZQ0biLrI1f7rRmavy8Zn2IffLkhARK1whRTpp3Yf+CoMBibhh2c
 4JF75epMQcgpu5AdRDbaYEoblTXV8uGP8PaBOLqXN9qV6IeGkBM2yKmpv3uaNSxPTlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790704386;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=85qB40fO6AZ/lFlaRVHihMpmWSYcuJBTzUiaqMEw1f4=;
 b=Qm42kMCfgmcAwfejC9PSGGP/4T0QscyxtwSF/hNgmHhuXRVe+kNdIes5F3OkFP67IenF
 bXfWO5NLbkvfSI+hsAs4Rxkr8QE2gJDT8cgZhiitFIFne7RbFUMGbkL8Lw6jI3IO/xNKQ
 xT6KkEM9RdWpJ/9KNlf2uR6g0BIWKz8Ai461L0v2KhGLyUZeFssAYMz8PZTntiDiHOA2Y
 jGmzmhhGOpLjsahO1BjxyIkSbZsmNbe7yaa5cW0aueB49ipf+4ovRnZP5bjOPhp8gCRgC
 9mxusg0arlx9jMdznlEQaISPmkHcTLyofrFjErxSsmnmCeipfII4MrxmQl8B/m957AA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CmpefUQ3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CmpefUQ3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43C6780AC8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 17:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790704380;
 bh=85qB40fO6AZ/lFlaRVHihMpmWSYcuJBTzUiaqMEw1f4=;
 h=From:To:Subject:Date:From;
 b=CmpefUQ31BjFnf2QKWO8J50wKSKqM0H0RtpYZKMDi6C7M7sDcYhJh88i4OW708jgH
 oNPXT5PILjsdni3NE+SU/OdOOwmhgDSk9BOrG9Ww5jCUS8BUtGeOKxflcCQVMmyr4K
 EJQJKbabhJU+AwcIVsR23iov/MHvTtW2KHWGNl4WFfju03nUFg8Itu0wJxBLhEp7GZ
 q0kyWvYURq75DJML3OmdG2vHA2/KbenObRyuj5YtQQOUDqQ5xDN5jMhOoWDzBwODWJ
 ZifnXRY/7j/GXCdN+tt2gCCtiqgTHFbZeT0hGb7q8zLakecNk4/npRWMLu/qcQf6KG
 vXMmTZRcaOn9A==
X-KAS-Sym: v3:f51bdf72230551df:NttKc/1TfhmeH1TQOlSa0GmegQRpVcci+I3gbSiAMII0e
 bYRxE2eBilm5GyN+hfoeaeQ2BJiSr7jbKiKEo7L9Irn4b3gLxOcR+s94ij3IrqzNwxuzPGeVh8k
 LECc5HXveUm90KAcAYlQpmgSkcY7YWGndbra7VoRMxzPAUAv3NHU9XbK5dyOU1XPEfsNw84amCW
 Ba20mBlzMI0TIrmJ/2h3aluw4mZXRs6eCEoIKqqntYfAwuIKv3FRU5IuEBJip7Xc4iHmGSeFNvL
 ykbQdUtlAwaen8vxGp2oP7ca2ZgFucSonZi6eOmc1y7EjMwWi1nkM1ox+4L71+IeQUQHsIkQ==:
 BmxmoPQX9YuDfmYIv1IMaKOlEkbSL65yMY03nRdYqerYcuznnbAZZWE2vG7u5k2CzJO8hHFuPdF
 2X51d6dZ0S0SABRmq6//JK2+s5sMoJIuWQsxIqMO4wXOiRJxTigkuamutO+bdowUBbRya7k8yvl
 Y1WlUzPiwypifwhLTQ6JnrIn0NE1l/SiJVS0pbec8Pr0r+nnwpAhFvcUY+oFIAsf6tVSBinSdx3
 26vGb/9eCSWcniY0sudqcu8k1dUVZfM9M7Eutt/NNeYNi/ZclWOGv15bQ5vXgZXaxr6In41ca0E
 STO6ofvnjLG8jRHP2PYnxiopbPFZzRax+7E+qhRfbaRvykgrsOPf2E+DyXdI2RMXRT/EXhniWsc
 6qkqB3GrZfHQ9dhLThw/OZwaF3EJ0rp8oOhynTdxuuBM99nLzr/nJM5/teSfi4icoMGH8oa1msM
 UHHYJC9f/mWzWDRPJ1+8gdAMz8zdQPyVTFyyhTsAp89b4FmnUIj3km05q1upSkIa9LxlyXbxiqa
 2h3btSQL2F/ClzffpF5HIfblNPLanAmPO28XLIY8YhaKMIxA4W1Zy2/8u7cV9fmCUep+s1XC6LN
 CpUVHV/R5RF6CkEB4SXVI45qYSHgRlh9c504B10E/bCglis75Ljd4gLG5kRyaEms6PvYw7kGzxv
 oqjPAq7n4IWoWHg==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D9365A4C5167
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 19:53:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60272)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBc0i-000000007EQ-0k68
 for buildroot@buildroot.org; Tue, 29 Sep 2026 17:53:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 19:53:00 +0200
Message-ID: <20260929175300.1838821-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 version 3.6.5
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

https://github.com/openssl/openssl/releases/tag/openssl-3.6.5

This release incorporates the following bug fixes and mitigations:

Fixed DTLS retransmissions of handshake messages from a stale buffer offset.
(CVE-2026-84782)

Fixed excessive memory allocation in relative CRLDP processing.
(CVE-2026-35189)

Fixed QUIC unvalidated amplification credit may be over-accounted.
(CVE-2026-35191)

Fixed potential CPU DoS via O(n^2) fragment reassembly in QUIC.
(CVE-2026-42772)

Fixed a timing side-channel in scalar multiplication for mon-NIST EC curves.
(CVE-2026-54872)

Fixed QUIC STREAM fragment metadata DoS.
(CVE-2026-54873)

Fixed non-constant-time SM2 scalar multiplication on ARM64 and RISC-V.
(CVE-2026-54875)

Fixed out-of-bounds access after SSL_set_SSL_CTX() during a handshake.
(CVE-2026-72897)

Fixed QUIC connection-level flow control was not enforced for streams.
(CVE-2026-75804)

Fixed a NULL pointer dereference in CMP client revocation response handling.
(CVE-2026-75805)

Fixed an unauthenticated and undersized DTLS 1.2 AEAD record causing DoS.
(CVE-2026-75806)

Fixed a timing side-channel in SM2 signature generation.
(CVE-2026-77696)

Fixed an unbounded RETIRE_CONNECTION_ID backlog in QUIC stack
implementation.
(CVE-2026-84784)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/f2fb3fc5fbd3c7cbb489326ff677d209c1f4036b

 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 46ac5589dc..b7083cc3d7 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.6.4/openssl-3.6.4.tar.gz.sha256
-sha256  9bffaa1ad1e07b354c21bd3324ec02fa15579f45a7d0494b3e74bc449b7333ef  openssl-3.6.4.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.6.5/openssl-3.6.5.tar.gz.sha256
+sha256  a2157c2830efdec3788939b00c9b0638306d3f0bbb76dc4832ee503bb397df98  openssl-3.6.5.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 9b3eec4baa..4aad749eec 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.6.4
+LIBOPENSSL_VERSION = 3.6.5
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
