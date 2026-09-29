Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AE0CA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D2A28116B;
	Tue, 29 Sep 2026 18:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpDxWUqbJEY9; Tue, 29 Sep 2026 18:45:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 735F081167
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707555;
	b=MiemhS8AcOJD694ABfevHgmjN7uk+jKJAhotsnMJeBkOeFmaWg2O6Rn+3TEp1GEjczcX
	 q/xbUTrzFHPUKPijH4gHy3YZBvYqkd5umZmdmWEm9lC/DrQHOhRWWcewGsZrfU3GZ5w3M
	 BVcvQS+5CB6YOz840jqZYWx4xz3PjWqQGpZNf8+hIWmoUmvTamAhlx4ehPBOsE7FlW+mk
	 XY3v1FHEFweYQpHFnsb+Uzl9GlPBe5hveYQxg70j6dwJ3HjgaNz+ipYMitcuBF58bro2e
	 jC9k1+850/MbNbz6hCzxbuK5JdAtstYo0VVfD9znhlYTjNeArF/z7kh1ciyRYVmqnzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707555;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MGJFdn/xXmdV01S4eJcHAbnxy60FBcPBOG5lTOKViVA=;
	b=ggW/eRBEtNegvnefqtJXJZ3XyV2moPzRGgpkHGFYhHZprdOEXxfPg5P8azQukPm4PfQI
	 waNml1ZG+/A7YccBOxmLw1YOqGL+8EkeE25qcAQyHoW93KO2mcMKq+A6s+3B0OgaHSaD0
	 vSgDgGh6Nrmbt9CBdro4RO8Oj+f1Ex1S1cxFbupLqSma48IIRjEcCNOylMXSo8eZva81B
	 K1gP/QbNwSENs5NTQ49f65tbpDpL6gLw5yoLIzq3bBTCHEluc6oaYWL4Zzq1xbAx7iBKj
	 vkgRMtxVlDOLD7p2RxqmqQ2cP5CS1SK430ygAJxRBh+TLit+qFiG+D4NeJL+/M12a6w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707555;
	bh=MGJFdn/xXmdV01S4eJcHAbnxy60FBcPBOG5lTOKViVA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pWjfObCwtJhpUJ+E2/Uf5RlcHGpnkM0qTncTRDkWWTBQuxJ714JHePmcDQ+Cd9IZR
	 +bqhmwun3CmjOSvUMnFakx4s1rvUlrsP6BkrsgCF5z9znBMLV7g5LfbbTYbWB/KLbc
	 xAPiZxGj5fmGptjAYyvHC/BeF1jRqYPASelxqwTnei8xdAaZ/6SQyVmdwX6ZfjeJTF
	 gn8P1/t/oHF3ID6yTluOWxSO7vDJQ6Pko2gzLij/byQsbuIzT6CUF5JPoVVQOJz4pt
	 oLpFw2sEqGeLgnZaw6DhON932SAyUVC5BI3OlPfbCuuVDG+rY8A/U4tKvBeRqXWurh
	 HqJrpkMMWpDLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 735F081167;
	Tue, 29 Sep 2026 18:45:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2366614C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 148EE406DF
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_t-nMeQ5Xm8 for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:45:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3E4A14069F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707553;
 b=p/XIV23xp5hVC7ELJ4s5TkbD7IHuDuglGzcqNDSVMypAwTln4iJ3UPqb9k7a1HWe+GCm
 ZW6gR9AdZW7yCVjDXEKgpiV9h7gLdtGzJIC85CxMmMyAPj04UDZAXOXK32XLYRgg6itGK
 5KVzTIH9EeD7GLTN03MPrj40H9HArLTXhEnHqmP3XyvCvx5YnHn03PZLv7XRirCR0a9ul
 qFMQkG05uyUIgqBthV5IYUwG+FpYWHwQC8X9ne5HLy4u0f2OjqUqRDgRfoMdsOg+M0sHo
 GWbi8cZeEwAQzI5sSlsWzEJLztEQoMUqlAntZgq/fliGGWpqN3G8KPwHhVO7/F6kTFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707553;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=nHqYmULtfAkLptJDi5XVDSWcnVEq11dE0d7BB83pFzo=;
 b=UJUUW3t+nef44BFjYn/C2/4XKoHqstVE+maJgZhvLXTOYhLfIxErSuhImqZFfJYpWu9G
 YoTOUzaxmDnBly45ycQrNRo2AVvYCPZKrPMCKOvC8707YssqD/MHM+yO+o7jPO3XSvvhk
 ZwaoNYxkMhT+R1WreiVgsr1/0uHkiCj3xH8Bi6lnfTH9tZ9saVjGInT95pys0mUTLuy5E
 PJmkRedPTvH12czIxFhnVsPOKNO36PV+1ceClZFCeSKePJymNxiQWg5cvuFvyhZv3FodD
 fSuk/APVngOAY8DckPhOckSLqPxOO9YUoJeos/eIts9DDfhMsFM5gw884IGSpPP/ieA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="gN//2OIz"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gN//2OIz
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E4A14069F
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707029;
 bh=nHqYmULtfAkLptJDi5XVDSWcnVEq11dE0d7BB83pFzo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gN//2OIz/S+tGkGx5gXaPmunPwYRpCUz4fI51GnyMRPycB8+qxFs13mqTBrMs3xe8
 Be5esDAiNM6lvSk2NuHqu26Jz7H7+rdXsAJGux4jbEBixiba9ryDfqIG6mTncNkX1B
 aCcqjUTdj+lCaIWDifeTkCmkX76AGNMxXbD6Mq6vD/Cp0flewFHkh2yhCHCtztO/qp
 ySzCMizpeR5AQHEionUmyL5yq9+UYsSYE8jX3hChTQnAlbwPXLuRmse3EZvxt1ceV5
 ZwAi0/TpncYuSaddvVjS7dKfwAtMOB3Vf/XV4q0qAgVnS8qReoW9L+iJQRhMa16WP7
 1LhQ2FAh3QCKQ==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 5IcfxDfKmcr2b8mzno26q5Y1JdxPAp3fJV+JqgVHv34l8dTYZR3bwo71JZk/aG1yInSY4JegkBL
 qpUbHLln3nEWkXd1oSShSWUQADZQL4X9RIRZWZi5Ozfb2P5XAvZEpklE264ksbudY3Sa/sWBw0U
 BDz06rFDv8d6btp4SGoFiZYajCdR8S/Vj05Zkmv22FuaU+/jfRkmE+FJdCXIieTGv8j8KMqAsOM
 zm9bymzGfvyShkbxkKkiCjn398TvJxvDuf4ZBupjNZyTrWlATHJLs0jeBAF4l0YJAF6hy5D1iRx
 LSY/oPKsqvoRf12s5en/OLmVE0Xv8VLmI0nFuA3GKqEHnFPop0arLJnYcPO+bZJWUPtqeB/qwL6
 Td5TqXNhC3d49PnqdJMLCk9WjXzMQ0MY8pTivFV8GHoDGb2OTPGra/x4zVGcSBsbUj9Nn3s/k1J
 tmvC58eGg+U8JwagH7KnjQqzpgVPnFj6jIvKjat9gE+jCWdL5M++LVmsxZye1xY7S3A2akOKkAz
 hxdBYWkna0xLaYq7d4LacOI3vOnKsP5quD8Xb0X77EcwJuZjXo974KcgFKmjC/hrDspG0gNgI/4
 Hwdf0Ps=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E15C7A4C51E4;
 Tue, 29 Sep 2026 20:37:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgi-000000006Jn-2gl8;
 Tue, 29 Sep 2026 18:36:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Philippe Reynes <philippe.reynes@softathome.com>
Date: Tue, 29 Sep 2026 20:35:37 +0200
Message-ID: <20260929183607.1849293-39-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 38/66] package/ibm-sw-tpm2: Fix build with
 OpenSSL 4.{0, 1}
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
Cc: Philippe Reynes <philippe.reynes@softathome.com>
---
 .../0002-tpm-Update-to-OpenSSL-4.1.patch      | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch

diff --git a/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch b/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
new file mode 100644
index 0000000000..3b4e3d815e
--- /dev/null
+++ b/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
@@ -0,0 +1,28 @@
+From 66921ee5ba05ffb92700b00f17cf1e8b75522aee Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 13 Sep 2026 11:11:24 +0200
+Subject: [PATCH] tpm: Update to OpenSSL 4.1
+
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/24
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/BnToOsslMath.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
+index 731957e..345d29f 100644
+--- a/src/BnToOsslMath.h
++++ b/src/BnToOsslMath.h
+@@ -77,7 +77,7 @@
+ #include <openssl/ec.h>
+ #include <openssl/bn.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x30600ff0L
++#if OPENSSL_VERSION_NUMBER >= 0x40100ff0L
+ // Check the bignum_st definition against the one below and either update the
+ // version check or provide the new definition for this version.
+ #  error Untested OpenSSL version
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
