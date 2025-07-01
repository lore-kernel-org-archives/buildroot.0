Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F0FC83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 15:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E065681746;
	Tue,  1 Jul 2025 15:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Lev-3dtFvuW; Tue,  1 Jul 2025 15:34:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2599C81751
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2599C81751;
	Tue,  1 Jul 2025 15:34:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AED4C179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A03964189A
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwpX3K-9mhYO for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 15:34:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E394417BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E394417BD
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E394417BD
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:34:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4535fbe0299so20752325e9.3
 for <buildroot@buildroot.org>; Tue, 01 Jul 2025 08:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751384090; x=1751988890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hkq4fxgJMdM3IVA8WUgU3LBQQK/vvD7hSZFPLj1Po7k=;
 b=Uj0EGksieRMoxfyiTw5ZxmH3zSo2Ozp6Iq9zpP9RbqQcsLlNCQHepmTK93Fu9fWWOK
 ivBRd60Nm4hdjadeTOXjHd8VeJ6+QOZu0fkDRXhqrsB4QM1mJgQdxzcs5uHjttWp7bqN
 a11/gk3iMlT0brTFZDrJfJGdlBQ0PoUJE/lJ029PabY9zEhmsf4P71L37x8aSk6BYTnn
 5oMSyVlyBykxbPDMmoCItjlq9kSsoG/Wi+8CEj6PyHeb5ntZwEPs4gW8uyzqzk/GKVF2
 Yc6MMR6wzFSGEONc+T26Oasoy9ARz8YEylnvWjLfqphsChyHjsUG0QBgVeIQHsqP8ovo
 7KRA==
X-Gm-Message-State: AOJu0YzThmdhIlCPJbIMkgGYPEwa7jQhs70o8WfsO4wXsVP0shgx1J9k
 AxjhS1ydueSgEL41qluWxg3MvyunubVJJBAZXlIKXGML4oJBs4Bh0DY7QGxbfjIFYxkNUopUsKX
 vTrgz
X-Gm-Gg: ASbGnctr7nowSVefoev4X3QoPPjgvx9xcx9j9eV/0sQ204c1fM3pV6e6g4sZfVxP3Ei
 K6L1KTJGjmJY4u8mHcNsYYSOfQ+pX25A/0cSmz4fAOqHUQQhhAwGvE9i3V3gpf11jRzAG0pgOQN
 RABUqevwlQBqjzwO2GyZBvX9QW+vveGT+ArJD7v159M4++G9qXeP4C1ny2CtySrNLHmAqBlaEpc
 sHN+UueOgUTD1ezzaGs9+oQf1QGhSS226JYhnFoj2WTfdC0NqIkWe+jLphQmq29DMaDjtEugPUX
 n2ubA7Fs+yFuLnDPFrE7pX+O0i+ae/ikGm5FBKf2dlT8agjxHSsHn9XbTIO2+BTnqZhixDwvgmO
 uMLHVVMiLfg==
X-Google-Smtp-Source: AGHT+IH+kZ9+d2lxK9KHMsGY7JK51QpPBeiKq5Wz+j+1iTbi5gHpAeq4Safu4GKN9HnfiQut3eYyfw==
X-Received: by 2002:a05:600c:c167:b0:453:78f:faa8 with SMTP id
 5b1f17b1804b1-45422f11454mr30251105e9.6.1751384090121; 
 Tue, 01 Jul 2025 08:34:50 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e62144sm13785756f8f.92.2025.07.01.08.34.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 08:34:49 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  1 Jul 2025 17:34:48 +0200
Message-ID: <20250701153448.545594-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751384090; x=1751988890; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hkq4fxgJMdM3IVA8WUgU3LBQQK/vvD7hSZFPLj1Po7k=;
 b=FTSCC0Cp7wHfNQdyZEnsUPUjAtTE/+UixK292lNt32+zw5npGjkmDXslVUmsAOogb9
 /UzE3G3KmTVwW5jwJCJ2O5IyDEPJplb8ChWbwTZXv4NkoCefHLDtws19LqCQAT45Hk3p
 jpYhbVS9uSYU2CumGXALSAzu7ou6KvIGK9D4XatRHz7JKXUaP9g7rpt0hvqQTWP1epYI
 CJ0pINNLIplIW2d1T/dzDUAanZ8kI6EOWMW5wQabbceFLNyGqxoN2TUo/MOagODw8mGD
 334Vja0aXXpj+DkGY7JueC8XkO1U/OCApSmEi6OXPdDRqy8iZkLYjNmrKB/AKtdWATxQ
 xhNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FTSCC0Cp
Subject: [Buildroot] [PATCH] package/net-tools: fix regression introduced by
 CVE fix
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

Commit [1] backported an upstream patch to address CVE-2025-46836 that
included a regression.
Upstream later fixed this regression in commit [2].

This patch add that fix to correct the issue introduced by the original
patch.

[1] 323aaa9f54 package/net-tools: add upstream security fix for CVE-2025-46836
[2] https://sourceforge.net/p/net-tools/code/ci/ddb0e375fb9ca95bb69335540b85bbdaa2714348/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...46836-interface-statistic-regression.patch | 30 +++++++++++++++++++
 package/net-tools/net-tools.mk                |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 package/net-tools/0002-CVE-2025-46836-interface-statistic-regression.patch

diff --git a/package/net-tools/0002-CVE-2025-46836-interface-statistic-regression.patch b/package/net-tools/0002-CVE-2025-46836-interface-statistic-regression.patch
new file mode 100644
index 0000000000..60cae48aef
--- /dev/null
+++ b/package/net-tools/0002-CVE-2025-46836-interface-statistic-regression.patch
@@ -0,0 +1,30 @@
+From ddb0e375fb9ca95bb69335540b85bbdaa2714348 Mon Sep 17 00:00:00 2001
+From: Bernd Eckenfels <net-tools@lina.inka.de>
+Date: Sat, 17 May 2025 21:53:23 +0200
+Subject: [PATCH] Interface statistic regression after 7a8f42fb2
+
+CVE: CVE-2025-46836
+Upstream: https://sourceforge.net/p/net-tools/code/ci/ddb0e375fb9ca95bb69335540b85bbdaa2714348/
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ lib/interface.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/lib/interface.c b/lib/interface.c
+index a054f12..ca4adf1 100644
+--- a/lib/interface.c
++++ b/lib/interface.c
+@@ -239,12 +239,11 @@ static const char *get_name(char *name, const char *p)
+                 /* copy the digits */
+                 while (*p && isdigit((unsigned char)*p) && dst < end)
+                     *dst++ = *p++;
+-
+-                if (*p == ':')              /* consume trailing colon     */
+-                    ++p;
+             } else {              /* if so treat as normal */
+                 p = dot;
+             }
++            if (*p == ':')                  /* consume trailing colon */
++                ++p;
+             break;                          /* interface name ends here   */
+         }
diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index a227d6477f..0468a00bf0 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -13,6 +13,7 @@ NET_TOOLS_LICENSE_FILES = COPYING
 NET_TOOLS_CPE_ID_VALID = YES
 
 # 0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch
+# 0002-CVE-2025-46836-interface-statistic-regression.patch
 NET_TOOLS_IGNORE_CVES += CVE-2025-46836
 
 define NET_TOOLS_CONFIGURE_CMDS
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
