Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69708C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 372E940CB7;
	Sun, 20 Sep 2026 14:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2FFxssu3MCX; Sun, 20 Sep 2026 14:57:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5484840778
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916247;
	b=P5h6mtbhGrh22iVFjmilbG+VcpGd3JA4G5xJqre6BAKWusAWbUPJkeyCylWfsQgkfNBZ
	 brmCf/ckNTIVukjqDnAg/oYPIEmre/8gxyGG5cV7UnXWc8jiRnARQcUo9l3LUSwv9cBfk
	 Dk5Tpo5J0iLnBayd1j5Q0YZjQPHkMtU+q0TgkSj5t74dz4eRlCCgWSDoDSeEuKhADm2qp
	 IJ0CatHQMccoMOWbCsig3buTZTOAnKB/NZuAIkugBPfeqy9g7tdzOqRqBcZMbFhKXQewv
	 xM5vr5CeIga7h+hVDWHBaIj3ftP9ZkIMWnBfqRZ477dwUjRUpgCeRIToKQcci4v914w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916247;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	b=UF4g/PZu6len9VfffPWAKhZe8+YmOcza8BKRC4aqYNxdakSWx5blj+r7OEykdQ0N+6oz
	 y67pocl144xZP9OCGnDnSqTnioRCtwRqHnPt9fNSSKRy/sKV3WOPZEssKqCL8sbHFMEL2
	 zN1UUXcdcbm+3dxbWhWoBFVDgAX9VVUncQK4I4wpwrhcKP1w79beimPrvTrgqBPlPnhbj
	 0VGQOeMSyiSkQXkd0Mm0ojLCOKgDPC07Kvo7K6xJJGz4/EpcnXwbobY+sZpk4blpQvtoT
	 Dzipd5ibdc0HWhY6GRa4LdKPkwdFU/AV8xY19xKIRKG92jcEHwhoqs5ibCiTZYPC/sQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=lhZnqktE;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916247;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dJDY/LDe5hhkq/LNBNiJLtYjfSVScJWeyfVFxoeRZWRREdzThjoAGxg6IEhx2O5qB
	 TNvZGuxPajNr3/NfXJxxuDSyf5MXV+fWOx0h5QX6//cKQdyUPLCy22duv07EzET2oL
	 plE9EeenMHlDL5uAcXmLVq8mtkPBxJFHlzr2P/Q4AdS1ng5bnvb3ben3NSOlYyka01
	 Z+St2F/qpmcVl9tqIaqPoWGPXrROk1PAwpQUbQF2a3b2YB4ftiZgESbY7yYuXTW0qo
	 f47l+k7vjhgBkCseMnF6/mGo1kAWsucKHR2KW3JXl8MwxvC8ei2JeyW/+J5mljASy/
	 WmVIqx1Lrq+VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5484840778;
	Sun, 20 Sep 2026 14:57:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80CDC24D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6707440609
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_0hbXOnfF41 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:57:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 705DD405DA
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916244;
 b=mzyipt4p7DjY8sZv85oK5nQb3L1tFd6QVldf68bpOWqP2GpilTrIqUB3bCLx5L1lz+fs
 lQVaEyD8GJZnoP+YYfFkt+zsOsHrly0cpdMHAkMi4Q5fZSIj9YshHBQyoMY7vWBc5Yv6H
 GSDzFpdHCIbi6YKH0kXTTTWKo5rNHv8LL1U6brMbufwmi0VBUf7xyh1bhSamorWxrVHnm
 DNLAKla1YM0dzf8owyxGUaa5OGXiegfdzn1r3DGD0eUflRTS9ZG3vSBkrwdjW8g8xVudi
 A7NU+7GQsKrKIqCF5XYgy4VYynR3b5V8ELuLbuuce9P2o5Cs3UUaT/CznJ+WwbjRV0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916244;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 b=rLKIpaZIGGGdPLqEjBaGuZmJG4a1UwdhxCMMOFFRMDcLdrC8GIobgUDV5OJrSaQHtTrr
 SCyYQkDd0Y/nsdr2F2rIFJyK7U7Fvb03GTMehPaWAtjk9EubOATh9cjcw78iSRqA4Ny1f
 qpTinLKhvr3Z032SI2D5D+X5nqokNDe/EI2RgUnvg0Dqb6XsY0QqM9dzvuVyjZSv74sJg
 8yPa6XJIRAAktqNHUXJSTI5KiUKQV/OVA2cC0rgK7mNLozwWSLoMsFOYIwuqadvARKLRq
 Tdahg4HW3IgCrERyzPcofqBnRO8Cl/c1QJaDdYBvJJhE/kMDe4F3vDeSkY+ptONoYyg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lhZnqktE; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=lhZnqktE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 705DD405DA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915506;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=lhZnqktEm5Q10khf4jQFE9BUCVEj9a1FAZGyTO0efGEZRTbkJARWxBgO7fFR5DCEt
 3yuSJCjvLQE3Fwu+U5WNCsuMk5QERE6vPrc1v9z8UnfYu0qqjbnr3fLe3A+94iB7HB
 bfsfBk6teA9AiLq2k9cCS/Ye9EmOg9KCfMinbd1wk9Z527XK1qDPEl/ErMt+9zECow
 iVpcaWCbMi4DkySJNi9odWz4T0AxqhthNnrMU5O+KKt/k1NNqR9m1SsneDVShtPQ8d
 Vulnt4DFd4SetykWbfjHhACc69cyugAx0SFWIoJvsFfb+rQdFJjcxbK00DNRtkNcJF
 Wy64/Ls8TNl2g==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:kxkYQJGuaNFOatbLiYI6uXKL1JussAt+Cg8azRV8whUa/CMp3yk2cJ3xZK2hdid+zvQbhjDg+EsjqfWI3rk2jou9w6Mr1sYO0vt0m7J6+F4v38RqgpOf/aDYiLjZnep94B1BvCOlfpgb7hZo6bk6n/6oL7yAASG5h6Ffhi69/eKpPGRtlLjaHNmjnHjx9PC+Au3ALdB166chc4tK6oE9FltT1jEzmujSU5FTUg0jEKFBk6tKS/EGQWal3gi1KnGirZMyxoY498j7BtpVqz/S3LaMC313yXIyCR1W4Y29dASypxegK68vWgdR/P/WXzKLZHiwxOT3fwRnLkFcSaRqD/6VFdRKllH+tD2v0s8YhD2GBLcjHjWPNY6glJ+kkbfY9c8sSpcNO1eENYZ6zhJw0JrwMzi7lIbGxkP9Yih08EURXNSfe6exiHqkP8nZaC7IITR0lV053QqBe3ziqDb3KnGS4iMOeIpKAFXU64nx2AVZitbYKNZg/6ursvDwMT3RlBsej0axo39YpEw8d9thISJw9yC8vjMybHyXFi4oBLD99tXLie/ggTnCdoaHKZOo2jiVE8bs/7S2MdZwePQgeSfn7tDbUFQ=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 48649A4C48B4
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imo-000000000hB-06TV
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:25 +0200
Message-ID: <20260920144428.3009612-65-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 64/66] package/xmrig: Add support for OpenSSL
 4.0.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Fix-build-with-OpenSSL-4.0.0.patch   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch

diff --git a/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
new file mode 100644
index 0000000000..966744abbd
--- /dev/null
+++ b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
@@ -0,0 +1,40 @@
+From 357fab10b79e49dc9b8f42dc6cf425a8124a3f40 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 2 May 2026 16:45:38 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0.0
+
+src/base/net/tls/TlsGen.cpp: In member function 'bool
+ xmrig::TlsGen::generate_x509(const char*)':
+src/base/net/tls/TlsGen.cpp:118:32: error: invalid conversion from
+ 'const X509_name_st*' to 'X509_NAME*' {aka 'X509_name_st*'}
+ [-fpermissive]
+  118 |     X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
+      |                                ^~~~
+      |                                |
+      |                                const X509_name_st*
+
+https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/xmrig/xmrig/pull/3808
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/base/net/tls/TlsGen.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/base/net/tls/TlsGen.cpp b/src/base/net/tls/TlsGen.cpp
+index ad2e648b..59e4f0c9 100644
+--- a/src/base/net/tls/TlsGen.cpp
++++ b/src/base/net/tls/TlsGen.cpp
+@@ -115,7 +115,7 @@ bool xmrig::TlsGen::generate_x509(const char *commonName)
+     X509_gmtime_adj(X509_get_notAfter(m_x509), 315360000L);
+ 
+     auto name = X509_get_subject_name(m_x509);
+-    X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
++    X509_NAME_add_entry_by_txt((X509_NAME *) name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
+ 
+     X509_set_issuer_name(m_x509, name);
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
