Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D67CDE008
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 08:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B17A82036;
	Fri, 26 Jun 2026 08:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lUwf4DSmszuI; Fri, 26 Jun 2026 08:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB8F82043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782462540;
	bh=FCw0y4Gna+mdhw/HMMKwrGDwtcENZGrwUZ+qTNRNP5w=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ZIkJjUO/EqD2kA49qXxZXYFQTDGnS1pJb3JPvCVnbK9Vcn98bTdlc3ERWDoqKHwKW
	 lcWZcxBmJqt2u9xJHoqOaSaSLGNphAzEgANjmIVxprCIkUqZVfUHjmwrrOmJMDDr2e
	 9hDln5cCO8Z8ucuxaLDQcDNMUqhgyJ9m9ddZgAfl/1IgqfMEW/YpgcVvkpanShr9AR
	 lEOb5ph6tv6o3lbDmnoekpU7r/ayiMCs2JtQcOH3fIrKamURF3OqBztBhmJDwRHosG
	 XcSMKUA1Dm3smzCkJUxdcvEDcKIEpocRyx7kkuftQAfn0j1TdB1R/gHWyZ+zjqFo6m
	 oGtY772yvlrMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEB8F82043;
	Fri, 26 Jun 2026 08:29:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6009F14A4
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 08:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C44640D1C
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 08:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpzYGcQTwdYk for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 08:28:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 55BE640CD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55BE640CD5
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55BE640CD5
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 08:28:56 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so7893625e9.3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 01:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782462534; x=1783067334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+agb+6RaG4POHcR7j5hCmq6tnNGKjEeb9PyTj2+t3WY=;
 b=WCcS5z1bpMMRE+Be3rAcSCnq8I6yVGF6keJaZfSiTTl4vcQZ+J5T4AtYIBriyGXXEO
 PcYVkgcYE9nQSRRoGh4AOwJ5sXbq207bjgV2jaKnn51SAeig/POcMnqqJOwc91fAodwx
 r12DXj0FcB2PIb4pp6Pni4IlZ1vvybk4gGdM+Lq9qwsy/f/3FFKBMVz/oysrluV/I1y1
 lnKmh7GWJds2pCnCTDDVwDtJFHvyvUeudn6nNy3K8RvdLbKbRjpl4I/dpiVrYAASMjWM
 4goh2p27AvjYAynY/81o9boB5Fzb4ndpsyZUXGDfB1QURW2wC5fjsCLLFhdWjciGeZpA
 Cgrw==
X-Gm-Message-State: AOJu0YyXkJ5huYCmJQ2eAZznM3AtUejKOKX/qgqu4qOXtYUP87adUXdL
 /w3+tVrx/1COvCfhTZ48GbjA0v+6vPer+T4+X3NyO10EVmGmf/KXGqLVHWm8qgIPcKwNxX5l8NA
 q0DhI
X-Gm-Gg: AfdE7cnxHx38K3Bm1ngp6YDXmoPoW/Gx5Y5EIaUcJydk9QyzzUuhLVyVEqQyHpynaQ9
 rnv4dL2pFs7Jg86Kf4R+Q4piGMKzTxrxJECSQHXDONJirM1RmpCKa/y5va4d9t72supcTTJdvBQ
 mJVG+gHDKw4t2WG5vHIytSPbgme57jHsTG6/mc1rIAmGepRTiGzaNVyF4+A7rcTGx5cDTwYZ28C
 Bs70DSU+0f89PdRpgjD9YJDEnz2OHNDpTt1b/YfbzmL7V95o7Jx6xRtrxEA5nIQnqlIq0aWbwgA
 hasfiK7PSyhDQbxG1Q3j1gg0YrGa/VD0JlqUO6FoWXcSU142ih9f/LgeOz38xj8cLnVlPwyc6m5
 23bKTbp1BLnR1h2KHJAuV7Xz19deNa4W3ec/RNYHgVEca5V23w130gESJurXu61VHNBdRYkZz7u
 ecnhoN
X-Received: by 2002:a05:600c:a403:b0:490:9782:3eb8 with SMTP id
 5b1f17b1804b1-4926689fab5mr68865925e9.25.1782462533869; 
 Fri, 26 Jun 2026 01:28:53 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268fe31b0sm67003175e9.4.2026.06.26.01.28.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 01:28:53 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 26 Jun 2026 10:28:51 +0200
Message-ID: <20260626082852.96329-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626082852.96329-1-thomas.perale@mind.be>
References: <20260626082852.96329-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782462534; x=1783067334; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+agb+6RaG4POHcR7j5hCmq6tnNGKjEeb9PyTj2+t3WY=;
 b=MN8gfvOUdaHsaSjfETDfGnsqPhpbFa8IVmw5hLpIWpKNGo/ORpIlCbTU7UsalWDBwP
 Q3+Z3xKiz0Ecyp+mKaSteVThP+P6YIUzO02qbM7h1c15gbFQxJ1q5LVqUJ7fFf06X2vV
 bGLX3qFhouW+1bW8vH7+N/EysUIVUEPPAVMXzhbfwTUiY8l5DWtEXSzINybBCRA0NlCp
 TKuOmzokntqBphppBZfuV8A86XqNQ69R1q2qR8Di/4F6lLiazgZIINB//XShS6GRdOUy
 4Il9EIzuCwFfVnVYkOGVX1/wzBejuA69Two3iKaVaJdywFtTere0ERj23ofGI54i3a6A
 ieoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MN8gfvOU
Subject: [Buildroot] [PATCH 2025.02.x 3/4] package/squid: add upstream patch
 CVE-2026-47729
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- CVE-2026-47729
    Due to a Improper Validation of Syntactic Correctness of Input bug,
    Squid is vulnerable to a Out-of-bounds Read attack against the FTP
    gateway.

    This problem allows a trusted client to perform an Out-of-Bounds
    Read from random unrelated transactions when accessing a misbehaving
    FTP server through Squid's gateway feature.

For more information, see:
 - https://blog.calif.io/p/squidbleed-cve-2026-47729
 - https://www.openwall.com/lists/oss-security/2026/06/12/1
 - https://github.com/squid-cache/squid/commit/865a131c7d557e68c965043d98c2eccae26deef8

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/squid/0005-CVE-2026-47729.patch | 49 +++++++++++++++++++++++++
 package/squid/squid.mk                  |  3 ++
 2 files changed, 52 insertions(+)
 create mode 100644 package/squid/0005-CVE-2026-47729.patch

diff --git a/package/squid/0005-CVE-2026-47729.patch b/package/squid/0005-CVE-2026-47729.patch
new file mode 100644
index 0000000000..5a8b0e3e08
--- /dev/null
+++ b/package/squid/0005-CVE-2026-47729.patch
@@ -0,0 +1,49 @@
+From 865a131c7d557e68c965043d98c2eccae26deef8 Mon Sep 17 00:00:00 2001
+From: squidadm <squidadm@users.noreply.github.com>
+Date: Sun, 17 May 2026 18:04:47 +1200
+Subject: [PATCH] Improve parsing of certain FTP directory listing formats
+ (#2408) (#2409)
+
+This surgical fix restricts parsing to the input buffer when the listing
+entry date in "TypeA" or "TypeB" formats is not followed by a filename.
+It does not improve rendering of listings with missing filenames or the
+overall quality of FTP listing parsing code.
+
+C strchr() always returns a non-nil pointer when given a NUL character,
+so its callers must be careful not to supply a NUL character if a
+"natural" one-of-the-regular-c-string-characters membership test is
+required.
+
+The bug was probably introduced in 1997 commit 3fdadc70 and then
+duplicated in 2017 commit 3d872090.
+
+Co-authored-by: Alex Rousskov <rousskov@measurement-factory.com>
+Co-authored-by: Amos Jeffries <yadij@users.noreply.github.com>
+Upstream: https://github.com/squid-cache/squid/commit/865a131c7d557e68c965043d98c2eccae26deef8
+CVE: CVE-2026-47729
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/clients/FtpGateway.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/clients/FtpGateway.cc b/src/clients/FtpGateway.cc
+index 164fd0e499c..e04bb603d96 100644
+--- a/src/clients/FtpGateway.cc
++++ b/src/clients/FtpGateway.cc
+@@ -622,7 +622,7 @@ ftpListParseParts(const char *buf, struct Ftp::GatewayFlags flags)
+             // point after tokens[i+2] :
+             copyFrom = buf + tokens[i + 2].pos + strlen(tokens[i + 2].token);
+             if (flags.skip_whitespace) {
+-                while (strchr(w_space, *copyFrom))
++                while (*copyFrom && strchr(w_space, *copyFrom))
+                     ++copyFrom;
+             } else {
+                 /* Handle the following four formats:
+@@ -633,7 +633,7 @@ ftpListParseParts(const char *buf, struct Ftp::GatewayFlags flags)
+                  * Assuming a single space between date and filename
+                  * suggested by:  Nathan.Bailey@cc.monash.edu.au and
+                  * Mike Battersby <mike@starbug.bofh.asn.au> */
+-                if (strchr(w_space, *copyFrom))
++                if (*copyFrom && strchr(w_space, *copyFrom))
+                     ++copyFrom;
+             }
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index e072ec6137..439d65e479 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -24,6 +24,9 @@ SQUID_IGNORE_CVES += CVE-2026-33515
 # 0004-CVE-2026-33526.patch
 SQUID_IGNORE_CVES += CVE-2026-33526
 
+# 0005-CVE-2026-47729.patch
+SQUID_IGNORE_CVES += CVE-2026-47729
+
 SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
