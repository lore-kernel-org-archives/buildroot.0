Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FD1C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97ABC80F4F;
	Sun, 20 Sep 2026 14:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0BaHmIl0ajK; Sun, 20 Sep 2026 14:48:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B186F80DD3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915690;
	b=PfRTANzVX4kYKE5/5UAxehFVRiWvWY9GHmniM0oiN0EcrU/nOQtSG9QjG2AOwj4nKNh0
	 EuwVB/GavW7PyNCqCYRTEz0KvtQ0+jw4H9rPst2szzpPaMJvkyRJueqAcNsAQuFEC5JlZ
	 GsL4GRNbIPmHWVIvW7RtnZzJHpt/ZZHjmtSPrd2rW1dP2lF2u+/RkEbrneDzsXNyOxWjq
	 g/qGbVXgtCJJdE4kVIL+pfUcKgQsCmd9poGxgOuav8HhVTU9PpX2aCMz1Kj2Tieczi2a2
	 62LUEiBfXmt7VSYAf6rT15uOAa89/xwe5yOsQCUHO5ys1lhPMxzKWNJ0FkA+dHuAL3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915690;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9px9d3qOtNpqdDl3zCxSkXoN7KMCzOx5Yk4Fzmii2HA=;
	b=S0lFJss4Y54/F0jgwpeFAohDzOVygQe1tf6nhT5yvnPx5EN+Y8tFosfISxM60UvmiWrA
	 DDiR69HICZZpey/qy57R+55rtDJVVDwDuUVMn3ktiTJEqzLWpNkUKGmA5ysmPJocxalq/
	 sCQZUR4LfVuHn6Gc/JObpxIG2T9jsQf2wOouA0Mjb/4iG1WXgoRPA268gYHbXAPsk/Y7W
	 Sj3Hhww7OxoZaYwUhb53uqb7Q6mpjxlCRGES4FY7C0XZi+FrCFCRkeYskxcu5mp7DIEXJ
	 83NYZwkpB971il/HhbThkBy8Gvqkq9PdE3jLSHENPFONfcK7To4O/3iIOp4292vubXQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915690;
	bh=9px9d3qOtNpqdDl3zCxSkXoN7KMCzOx5Yk4Fzmii2HA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HjOt1r9QeMLCNr241SbKWHs2khSkVHVyLzMZ9npmWGjE6nkmP/OgOOZdkLz+SAscd
	 eWeR5pX4Q/zOw6GvjhulAktnwXOWERIs1m3r5rvrcORf7xKpxX/8W9Ol68OI1rvScA
	 gkfTjvKgFjXsYY0y8rNVp0hDLKyxBCBlk29Gz4hxCoA/BP4m4mUTo0On4oQkgIUypO
	 wsbftJV957WZ5g2TwaONg6Q2GTq8R5ck+c+46oal/PZGH0Hkg9Ppgr4ONRHt1RzrY8
	 E4fRxqei/RE26zsfwP3tfLk2Qsa8UHlvhKJeIr6Hb+O2DIDvv/p/r1w54Wpt8Ozyo9
	 pMSeEPK9CHVMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B186F80DD3;
	Sun, 20 Sep 2026 14:48:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21FA624D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12A354081E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGPpgbeToE4R for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:48:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2A47340808
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915688;
 b=ta4TkWHLgVCU0yVEyzayRb6t951yHNoebg1E+C33INX/KdXlD01EzX9AZbl0CQglN01Q
 HluUMDDg5lRCgIrgL0XvgEDIqXcX6wnBqE/cwUgsseT4KTxokAKscmb1PI5B+SuCn6T92
 Kv+5DK1pa4iatrueAC6OVZcsawNy8LhnQWz0J2SdN8BH6QpzpSL2R32ShZw3Ub3NPAY0B
 u54NEgyk3HHuZd3eUD96MQ6PcqhLw7jDrTsrsxHqxMdwOSPqf4ZtDhbthrlbJ+DfBjMu9
 iv1fbYA9/EDkGJDPzj+sreBtVOk4EZxrVxjGnTQ+LdlatCYz3fcOr4tTbhZtpqhmbHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915688;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=40iENv0yBWyNrjjHcKXw07A5F+SLvc356scGKiuAJSs=;
 b=QcNP4ZYpZt1XCHpz/MH/yp2/O9w1i09Tiix862ItbdqyOd8yPfPqD72zJrli2XkEC/Gg
 DZXitifaELkkUTePSGTtB4woRDKaw0lbemUZh4yAKojhYdcbVJobj81ATdw5r1j5TTlSf
 YmZKZUuIlpJs4JauARi4ErCAm9JNiELwiBKYbC7xb7vTHENsVWJYCFh8YNxVp5qFyRDm3
 RRPGUnJ6BugIZ45RXnIg6WEypvihx7nqDLvX3ES3bTYIk3chqGGX9AGVxvCPpFghI4okP
 3eqSnJmhJfMJHmtlaz4XmWntIRJDBbne7lN5+ehK1MkUv1oddmf8U8xHtJTSyYAPV/g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TzOGYQk6; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=TzOGYQk6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A47340808
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915501;
 bh=40iENv0yBWyNrjjHcKXw07A5F+SLvc356scGKiuAJSs=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=TzOGYQk6P44cEtwtgQ1b6xQN0i+A1CfYmp+vdmQ0IwDhiW1dpBZbxoB2ZCJc4RqFY
 jXwj42h9iAxkmsPHLoU43pCN9VFqquVECL3BeVb9OUuDQsMI88010aOcmPI7YyIkH0
 s2xO8V/9se1HhyPgQ+92fjyB/hSIQgDvYeAu52mBpkXSNzY5uMdSOpuGsBpe3UZr6H
 ONK7VsCwg8MlTxi27MbU2gUo+Mf1cZ8QNDc3rlYHDcah/9z1rgsQ8zkFicr9NAlwGn
 Yr2YvvMECyBdegjHUyV7M/bA8V/X+2M4Ze3+GLxoU6UK5WNHFMCCa48n8LvhrGHtdy
 dogTyQcwY/Igw==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:scy6j+sUMJYOsSZbhf6h/w0Rw5ru3Q7rRPJpK8WSUaN3YPp6QJn/m4y/BtQ0GaMZDpcT6FQ0jN1szrwkE9eRaTWvLSvDwNFqfjIOst5wRTN8nEcBf8F6Ui8OPy/9UiTViGvl3IVpIMQOoeKR+7BuRV8vkyHOAud7zGF8nIKIApj1ld/EKfvl3aj3WHlRGLN1KZzrpqsdaEqP7L0r2i28WzAUBTuKRLFdeT/5lbkysz1OdFMfH4JAq566lffIFNearUTvDOQOHuTX0wpkI0RLxZPKP+nGKSl1orxQ3S0OlqP0Zq5+UvsG3klWbjAjd4js8x4Ue8dXFSMvFQJDcvBhiLWzwvvOObauyPI/ONi+YjeqqekVw1OBGTS+so7NpX9Kus2kdWXMiJOaJKR+qzi2bWvc5MpN+dLBXKOvLaX0lmqpuv6sDP0OipkhX8o0WDBuj0BDgyPgKSoGYkg5lbaav8CYLOfmhUFlcIfS7rgzZM1LPHu83/xL6Wfi/7pebsZzbGL2C3ZyvX6Hk3g3EFj71Uub+/Xl5kEGMYilaQ4nz2fi5XJjAbhbyt4jvl2U5fcHiNhb4/ufSKssUtqH4BRTgWsvvUnV9XWuJDAWaXjf985M55
 shcVkbe3Ebh03cqKzkLUCw//w=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DAFE4A4C4871
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imm-000000000hB-2ilA
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:14 +0200
Message-ID: <20260920144428.3009612-54-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v4 53/66] package/socat: Add support for OpenSSL
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
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch

diff --git a/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch b/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
new file mode 100644
index 0000000000..6c53500d02
--- /dev/null
+++ b/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
@@ -0,0 +1,35 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 13 Aug 2026 07:00:00 +0000
+Subject: [PATCH] Fix build with OpenSSL 4.0: use ASN1_STRING accessors
+
+OpenSSL 4.0 made ASN1_STRING opaque. Direct access to struct members
+(->data, ->length) is no longer possible. Use the accessor functions
+ASN1_STRING_get0_data() and ASN1_STRING_length() instead.
+
+These accessors have been available since OpenSSL 1.1.0, so this change
+is backward compatible.
+
+Upstream: Submitted [socat@dest-unreach.org]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Downloaded from https://github.com/openembedded/openembedded-core/commit/aa435ebaaf7446ec07a88586f2de4109e02a2d38
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xio-openssl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/xio-openssl.c
++++ b/xio-openssl.c
+@@ -1898,8 +1898,8 @@
+ 		  case GEN_IPADD:
+ 		     {
+ 			/* binary address format */
+-			const unsigned char *data = pName->d.iPAddress->data;
+-			size_t len = pName->d.iPAddress->length;
++			const unsigned char *data = ASN1_STRING_get0_data(pName->d.iPAddress);
++			size_t len = ASN1_STRING_length(pName->d.iPAddress);
+ 			char aBuffer[INET6_ADDRSTRLEN]; 	/* canonical peername */
+ 			struct in6_addr ip6bin;
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
