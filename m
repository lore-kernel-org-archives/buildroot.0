Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB6BCD4F24
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 16:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54F3E40E68;
	Tue, 12 May 2026 16:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_pgbUBGU7HQ; Tue, 12 May 2026 16:43:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8531840F22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778604204;
	bh=l/mL9CBkOKxetqe94c6zpKRI8ShOlgnL3nSmxHamOUc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fHcfeNbmxDGeVwtdgmfZGOSPdq8AT1XLfRdkQUMow8Bq0K5I8VUS4L8yyWpzpl8PT
	 zzkpg0NLZOTDGYcWtWXWwaKuO4YplnXxXLGgHLDb86KzsrykXgUoQTPkih61fgx5fF
	 ts1uD632ZrONdCYQhgX6wKtGBTOJ1HpuuLNWKEOsfUvuuFWGUDm2cgeOILUmvj/wgC
	 LjcHXJnD/E7wwWEgep0ASAup5JxZ6ncSiTqFCLWDY8Ngu98oNzf/XxIMHdY27Vo9I6
	 ponfjOXHaR3tok8B9766mEgp35sEgR/2OXevxjkEYokreSfuxNmQ7fVTh8IKTF5sgi
	 e0d5t10EsWyQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8531840F22;
	Tue, 12 May 2026 16:43:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42BB6223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2901440F22
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X52b-LUVKe-5 for <buildroot@buildroot.org>;
 Tue, 12 May 2026 16:43:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 48BF340E68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48BF340E68
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48BF340E68
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:43:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F255A4C0939;
 Tue, 12 May 2026 18:43:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42238)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMqCW-000000006yM-02YS;
 Tue, 12 May 2026 16:43:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Frank Vanbever <fvb@funkworks.be>
Date: Tue, 12 May 2026 18:43:19 +0200
Message-ID: <20260512164319.3691172-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778604200;
 bh=aHeFzpd79l4r2kwgeKI+eLSPjbRxJ9cCv/Fp8jJjnG4=;
 h=From:To:Cc:Subject:Date:From;
 b=KQQnUmcidb0FgFtGrDz3p5Qzfr9F3dqdoi0O+Oy60ojIToBNxnl6+FBApqf6nkIff
 PW9djF38zDcgIhu83IjZ5dsaL+Pc6F8tn45H+per2iTb9nDBEPmUHt4E/KKzAR0WzD
 cSTKjXdrG44DbDx/Xb9VYqLioHavItCpqJ8WSHhMCvJGDOikje6JrI0/ioC+mZHZpb
 XfWwIBX699dV/jHX5RB0Uk1dI3txc8OMbQ2cYRjRk2pn74R8q/n4AwlgLQ9QvEd+JA
 8MSV87VNSXoTwPYRZC3kY/ik9/L/I3wEY41qHarIS6PsY4cGlFlv0bWX5Vu/tWJWrX
 zT7SQQOQgbrzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=KQQnUmci
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: security bump
 version to 3.0.15
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

https://github.com/owasp-modsecurity/ModSecurity/blob/v3.0.15/CHANGES

Fixes CVE-2026-42268 & CVE-2026-30923.

Rebased patch 0001 due to upstream commit
https://github.com/owasp-modsecurity/ModSecurity/commit/f38b5b7296d87e7b1744ef6b5f3dca11fe7cf886

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch   | 6 ++++--
 package/libmodsecurity/libmodsecurity.hash                  | 4 ++--
 package/libmodsecurity/libmodsecurity.mk                    | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch b/package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch
index 9e0b672c8d..43d1cc73f6 100644
--- a/package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch
+++ b/package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch
@@ -14,6 +14,8 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
+[Bernd: rebased for 3.0.15]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  modsecurity.pc.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -26,8 +28,8 @@ index 96cdf5ca..7c895ddc 100644
  Version: @MSC_VERSION_WITH_PATCHLEVEL@
  Cflags: -I@includedir@
  Libs: -L@libdir@ -lmodsecurity
--Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@
-+Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@ -lstdc++
+-Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @PCRE2_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@
++Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @PCRE2_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@ -lstdc++
 -- 
 2.39.2
 
diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index 821459f6b9..aab9d14d67 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.14/modsecurity-v3.0.14.tar.gz.sha256
-sha256  f7599057b35e67ab61764265daddf9ab03c35cee1e55527547afb073ce8f04e8  modsecurity-v3.0.14.tar.gz
+# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.15/modsecurity-v3.0.15.tar.gz.sha256
+sha256  c276c838df6b61d96aa52075aee17d426af52755e16d09edca9f9d718696fda7  modsecurity-v3.0.15.tar.gz
 # Locally calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index a90fa1d614..c06d890979 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.14
+LIBMODSECURITY_VERSION = 3.0.15
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
