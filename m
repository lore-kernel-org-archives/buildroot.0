Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E7FC982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E40626076A;
	Sun, 20 Sep 2026 14:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uT0fiJbWVCAw; Sun, 20 Sep 2026 14:50:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 17C486073D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915842;
	b=MF8l6AZuAzbKij6p7npMlzjvI/UGTrptkUR9AWatJsOVqE+Lz3+MUkQbWhaXB4icxPwN
	 oC2lsKSkpRz7rpf8xG/Macgu2v2QoOs2xMPQZ0aLe91T/2E+Jm/NoIjAH/rz+cOSzOn46
	 i7opTfNKeP3uBHr+vPV227SCS6ot7PH5dANB9q71aK+sNRsnFrvaEbjAfh6HBGOr3+Ha3
	 /HstP81emYsrLN14KFtE9l+rmM9+lJj73hqYyShMrjuuAU0y01M1v1K20EbN6TSibrMLy
	 ClslK0A/HqYe4PEPMCUjRbr+FnYVeo5TV3bN5HkZqAcgAEdI8tyXgJ59vt76OBy9P7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915842;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=p9L8kF8Nzp3KCRi/r0+rSnV+oz5ZYOsTUT7m57x22uo=;
	b=o+byX1C9RCFqXkF4O7QoT8PWeCrwwj+Qa+//oKKnTgDkBNYhR5rdQEhL+AB1TbuCb7be
	 pFjgQ/Vq9rBUREVkgd96JzS+P/20Udg6jVe4RWEPfTn/W3ZRbZTigm49pTgtHtJusQDlO
	 kOkm9hCfJva+rc1BzAt43lMrXTR61TZpt+CCb0sKhYXVUY6jJTNxxUejpfSP2SmheOa9L
	 JtSl1vYd+cVTN8uW53hDui8r8VymqmRBNSzLu5iPBrw46J6fUlgrsXusL2R4gv02Dm8Ti
	 gtc6p1zeHw6kO6oVv6YxWNLPtsSIDZZ5lXJ/uvqDaSWNVWhsqpoZrKslartmJq7WfiA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915842;
	bh=p9L8kF8Nzp3KCRi/r0+rSnV+oz5ZYOsTUT7m57x22uo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TQ7Lc3sWmSqscSliXVDFYfP9b3CqhSd151jYDXKmSpcMgfumhf6pmHNpB4XIjETOU
	 fILUSpwM3GF/GXBjOLkz9HymuOPdSXppu83+XitG/kQMWONJ4e18U6Gfj8uAxSuYXa
	 cTUMdIy0Wvg2ITN4seuJQfeE0BF87LTfvfSSkSABW76jGAcptKell1ZAg9bJ1RuDlB
	 65wjOt/jniQeuaOCsh3ec0G2rmyG4NqGcpg3q4/cAHQT7bnnbY8+nSLNtuiGwTj2hp
	 yIasMBRQuOWmCPGc/Gz5owsb07W6JdSdL6X4dTgQqSXiLVCKZ0JLHJE2UHWAnopuTQ
	 wvSX3O5O0NJxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17C486073D;
	Sun, 20 Sep 2026 14:50:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7453B24D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 723F84009D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_8OPYd-y1Pp for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:50:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A732040022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915839;
 b=bE+7zBQrHhH5HRpoaDQvyuZqbCHonSp7ES9LQP2NMiFOqpLXbwbgRKW1cy6kbRkpsL+T
 oB5e4DyI2pH5bhViK5Up4MCngJNLT8tsnHHzJona2kDc9tTGMKKw1UAaAOk3mUpPeZFvk
 znSmNhtQyYXM8OOv5uSm4f7BUrADVfQyyt1BOMdSiaPTMSPOxB3/5fWuECcTDhOCM+6s8
 jW2IvLPgRRthz8ck1ZB0TpJYH2yF4XWrYwicc3+xioBovQiN5mgEq30IJK0M8g20QyiZV
 sqoPNbysmQHZSo3Gql4ipG4uFBrs9vv+q2Syl+FSY7UC5E/GB42kW81Zw7RgfXC+d4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915839;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dIFh+ZdunTyCcogzTlY9e/HYnSfn0B2UGyOpJK9cMys=;
 b=qN7dND1j8AdPbEQq5al4hoR7pIb8LERwaoeFwJAnae8WDiSVWYgQFvZ7+t8ahHiLn6Xa
 xXqVLhwh5Z9yOcXIwzQ2yvToijP5tK4hZ9h2JDe3rybQcMT8APzvz5f68JzsbHvV8tucC
 BbBVvEtOjPhxwLeCBPk44nx5LS5LoRoEWMeBPX7QOKDNBnRj7dvNSbXDHCAKgyS3jKUqU
 VRhY99WpmOpvYijnn8weYtiRn3ym4c5sZEsvPmot2SeOf/8bl53hu+lBxw8YpJSYthIuA
 4mhjJSnKPeg92U3/8VsempWRV5R67U5kyfOGEKeHUnFQFVuzCMqAy6ClzF6bREf2KDA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pIUMClxv; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pIUMClxv
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A732040022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915503;
 bh=dIFh+ZdunTyCcogzTlY9e/HYnSfn0B2UGyOpJK9cMys=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=pIUMClxv3Q1n2YHiE/hQgu9vLQAK8pgf8o0HtQgTKpEuiKZ8tkdySqJmmByzJIzxR
 EHud2LbFKRTIGA0DZsEQKAoAA/L2KvEE+tjsExpSCIYfU+jmfpJRWKRs06GNao3WYE
 4GPzibI+StCATVR/4FW6j9sY5939aRznATR7ZONq4Br5J2axR/yFqoONlQAf6T99PT
 e+7ZAW6o4LV0b8GwANeXxkc/oCn4I+SLK58F0YMcEnZ32iXHg1Gr1cOyGXwhkkDoUJ
 R+f2aqGuJJxmmWGBb0IE2BbOk91YqJK15C//cENmf5In8BHytKNGp4BpVOk+HsBzep
 Rcfk74+krgXtg==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:oUuQl+0vln6paRL+AExcMWW6I6rEalIbsZLYsoqjajVbUjTT0iTBTiRnV8wQGGr99VtW/+RmWuWa9sLbLbpTOSTV2WSENlGbkCCShuDjTqfFv0fgXOvFteCNgc7rjrenpH4Loo/PhVN9oj+0YvFl+n+IpO0jmGJnxEvKnuXZH9UkFrhafA39ZJeBiRanGDYBEbTnCwjl/f8UwPB6K+1G9C/trMnAZiUQmt2tmZZYy5CGIuOmtF3wlFIadeds2MWiVYoN/rGPdtpjnd+xw5gmR5aE2h+D3xbR4rwrRu+ADa9bAEZRjMOpSF31XvECi1YFdcZTvKWh6bKDMrOhTZoXmjDwIhO87C+FNbuZiXopHRstsFoGxdQcr3FctXOlzBKTR/O8BMlmuAoQSDlJgyTOGOKVNef4Bv1Vehcve9AFTeCP1XjkloRRGO+qUtrnLRlX9RRROGT+bBDlnFhHHVj9r6UJzKPW8jmqRhlrJX2/AAwcJntpXk84fOFy36uQTaUx2bNKBAsmEAH8oL3IqqKpaiCCjYSQEGvRGRQE8F6rS/9m/X1CJ91lfc9IdKzbzlG36P1Oa/4ut0jSZu8rha96vcZpiZwfqFE=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 075E6A4C488F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imi-000000000hB-1sgk
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:52 +0200
Message-ID: <20260920144428.3009612-32-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 31/66] package/gloox: Fix build with OpenSSL
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
 .../0001-Fix-build-with-OpenSSL-4.x.patch     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch

diff --git a/package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch b/package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..bae3319115
--- /dev/null
+++ b/package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch
@@ -0,0 +1,43 @@
+From 69c49c945aa3847eb12a995f949d97a2a99642f6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 9 Sep 2026 23:27:07 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.x
+
+Upstream: dead
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/tlsopensslbase.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/tlsopensslbase.cpp b/src/tlsopensslbase.cpp
+index bfa1fd9..a71ff11 100644
+--- a/src/tlsopensslbase.cpp
++++ b/src/tlsopensslbase.cpp
+@@ -224,12 +224,12 @@ namespace gloox
+   int OpenSSLBase::ASN1Time2UnixTime( ASN1_TIME* time )
+   {
+     struct tm t;
+-    const char* str = reinterpret_cast<const char*>( time->data );
++    const char* str = reinterpret_cast<const char*>( ASN1_STRING_get0_data(time) );
+     size_t i = 0;
+ 
+     memset( &t, 0, sizeof(t) );
+ 
+-    if( time->type == V_ASN1_UTCTIME ) /* two digit year */
++    if( ASN1_STRING_type(time) == V_ASN1_UTCTIME ) /* two digit year */
+     {
+       t.tm_year = ( str[i++] - '0' ) * 10;
+       t.tm_year += ( str[i++] - '0' );
+@@ -237,7 +237,7 @@ namespace gloox
+       if( t.tm_year < 70 )
+         t.tm_year += 100;
+     }
+-    else if( time->type == V_ASN1_GENERALIZEDTIME ) /* four digit year */
++    else if( ASN1_STRING_type(time) == V_ASN1_GENERALIZEDTIME ) /* four digit year */
+     {
+       t.tm_year = ( str[i++] - '0' ) * 1000;
+       t.tm_year += ( str[i++] - '0' ) * 100;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
