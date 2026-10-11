Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6656DCA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2865260622;
	Sun, 11 Oct 2026 13:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjAd68xi69mw; Sun, 11 Oct 2026 13:04:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 446DE60611
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723882;
	b=J++jqd5PPPZofHSNNF9qB21l9YVfyftIN5PjXYrhFlkpq1iUVqIZupBAkskcHyYNloif
	 5mviHUly3Gc47ptvmtLEpSgZSBQ55iIXpZRR/Fj/B3lP7MAHU/ygEkBO2jccr9Wt1w4o+
	 uWfKzDbyfC8eZMT0sLg4xbUmFFlbYIsXmIMb59b1lg+03omErdBCFmljY1v3eHta8Rgam
	 tPIPtkoNqzO4xClR8vprSgDYETm5TqsdZXpyNVG0dWPcvoz+E4SgJgXU8EPbjmwlQ6+n2
	 6qCKWgvtDxqNiMeHoT5QEUVWQ4cAL6R3L+c0Pgo8LW9PPGXpSfWGbpf3wRgBFnj7kyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723882;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	b=Qiyc02UmU/JNgi0z/YoTjXwrF2OPirPpxr+31xeFw3m/0EYw4UMz1ZJyFsVM3/5c/gP0
	 mnDYcx45gKvQUgIPJUVSN4fb9meO7z+iCBtabMn/rnsdr0KsR2mdz5JQ6hjbmqij1J/MF
	 JOMJqPMcg4cdADus3GnyGH+We87CrABz0Yy+IWSwPkoBHRkMlEaTdksaGD737mgHj5jAl
	 Iq1MEvnm9N/PXNTIvViKjL+sNqhC1MqjhIDxE2ljQ34jtsLx3FzfCZo3eNMhEeClivtv7
	 OI5QOG0pI7Lie5Jb4xPYvGXDODY92uDfuVavO8tQvO2Xu3IjYbvLpcdOwe0UN3X1DTA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723882;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kUW9GBVGCfMupyjZGVZqYI1ZM9qmWdkPeesrqq+CiH1dDq7x9LwSjICSsIJfjhh1P
	 3ZOMHiGGEb//g3wuPo/mi2mPam2VY9ao+dsDXC5vv9pEKoNe8H4bHa2uTRAEb4LYkd
	 2Oq2w+NQe1ODaZD/Iw7pTlWZ4Eck5AIBAZTXbdBXdbHBe+1cjPy5A/3/io2U1XFtlV
	 mdmfdN5WmuQ+nnnXlvLlksnR8Z4AL4uv/Xzt4aCa906y2QGfFb79v6T93eL17B0HTC
	 6MTf9uDeTtoFt5fsXe51wqty60/I3MrspYRWT6AHGgAy3eHMNYJ75TYBH3sFKWychL
	 uheDrQYn9UFww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 446DE60611;
	Sun, 11 Oct 2026 13:04:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70BDE111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E8274008B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-1s_6p45d3g for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:04:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 839CE4002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723880;
 b=cd5bSO1RWgsYX6nyp8dKFnc/IMdydElXnWDLE2GceljOlRszuyIaQGmvRvNFM9RxTnsy
 2Kz/1/iEYlyIQvx9rB4qXUPnWix8kCxVoXG4lKe9fiwp34LzX1dXX0NuEsFRZPhnhE4lS
 pzJQluelsvIBhiwt3IOyYGQRT+ItaonCKyZhMO4N/EfKmVo4XtHHT+DHpidAMRZv/VnH5
 DkST2h2X8alKx1wE/Y6sAxssDvlEdBAZFPHuRVX2LXw0Q/1dZYgaMzJ3gr0oV67T85ph5
 tS1QXKsZ0oTdEWOimS3kF12z81ZkR+547MaM+twR7FtSiztYnd1KOWlfuudQegQWpKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723880;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 b=HsmHeLf6Jf7mafMUVAM+TSpL6M8cJSacLrAVoePHsxpqSuhKpIu2vbcKP1Aut1ujjTMD
 icbNdy0LNmULb37g/9ld1JhhbCJLkpP/azzTJCG2KNnVyGzBMdlQ8UrzC7JoSVWRzvgoV
 LAy8yIf/O2ArEeU3WX6PfCQgxXZff0XX25bqouGXZ4gXgHTdXIGYubbLHq2nxxvU2keh1
 kJ6a8dBfN18IAyJWdyCkpLhxR2EOKW7dGxdi+STWBH62zaNO3R/oJzoObqB0CKUJu3oDg
 YsdbsyNeYi/RY+9vulMPXpHM6cmsMHlidSv4Gkifm34mR8wvPRAVIjlPQORmlET07VA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=b+faLgom; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=b+faLgom
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 839CE4002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723662;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=b+faLgomGUKenILgXr+M7B33DJCnZ1sJzYzfiVmeQniyvtAMkdjSeU/uFXWb0vBhx
 sn+7iPvaV5b/Qhan+f4TvsV7Apg0+lGSzNCsB/cVv5nvYsy7goMVY2soG2zNvvn2du
 6dDHQSD/mMaXTlja7cfO+l3PVQWwmBtnWwItTEg8NyEHxiPXwmrnuH9h52e/ySTN4f
 evFZX1nE9E6fnibOIjjbQ+LoXNknDftB0uEG4I8K30arO9/KsJZOZTiBE1huGyzHDg
 vs23HLYvAtgRz5OcuOonBdoI2BLCwV/uWf/0l1ZEXKOTxVDpXFswWl4McFTnduWVgT
 XZrd3zBnGzAWg==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 kcjfqGr80AULpIybfhwaupEU3BKiZ4432i4NHUrPLxIdoDpcI7FScsvSCVJmRiD2KBrRs3vsy64
 QHxN1Dat0NuZ5FfKxGrb7LAppaxkPIcFYQAmSMeyyMudQBRSkt/YC1Fu5FT1QSBnX/HrcdamMlr
 RM8QGmt2CcWcb9s+3g7pyz7Mq1ejnOuA5+bvZo0vwoI78cGW9ybRYCMktKbLAK/ex5V/TKABVjk
 jqrO3ZBbrp5NEd0gdfsgssvF/GhAdNGS48to+4rEKWTu0V4GzJeEmZyhoBT839qMMLD5nUCaNtA
 WdXCK6rZbHEeO09No8oA3Sy+KqD4gu5GTHPFKv/QEYBJchebQmcxPf2nYuHJOSs5a7wuBp4cZCq
 l52qxVPmxWQNnhFeIA7bssNh88LQ5y2z/aL6FxrAwNE6pW6ffcf6N4aLr2I2zH6/hDemmeaRcrw
 8JkbOPo4uzO3rWO3UWN6eLJUZp16qoUTUVVas1l+TfqL+bMhrPaJ8hh4tIjMJFwnNCLE348d2ux
 /CbbkMqzt0g/r6xqOXhnJy+MrtWYgXWF5NXwF0eFB59BxezKPxG5qSYfOHtG7pthr2RDI1xFPrK
 ZEshn6I=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AC49BA4C5857
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAk-000000007Fz-2ksB
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:30 +0200
Message-ID: <20261011130058.3443432-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 25/52] package/xmrig: Add support for OpenSSL
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
