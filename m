Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416C8CCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 16:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3419846CE;
	Fri, 10 Oct 2025 16:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H7DfgwXTSRHZ; Fri, 10 Oct 2025 16:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E73E846CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E73E846CD;
	Fri, 10 Oct 2025 16:21:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CA1314B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6A79614F2
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2HbIPohRbbr for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 16:20:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76A8B60E36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76A8B60E36
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76A8B60E36
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:20:56 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e2e6a708fso14902125e9.0
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 09:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760113255; x=1760718055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r1xbmwBsasD4EgBDuVoJb7AR64oU4itgiLLBzcUB5V8=;
 b=IGwUqBK/QkfIBOXkbmT52tozTYPCKjAcPHH8eOnzIY5t+nNxKxoo+2106jrIUvWKFQ
 EX9TrYZrwgq7WDQwUJa8pLQQRw2Z7iRevWUvT/RaYd7jG/uEotnu7WeMUfcT+eQYZpgp
 y6riytyvUaMw1nsorUHrW6Cm6k6arQWdejx1oEjz3Vt3kH9XUmWCGUCatBWOUMUD4qbk
 ovVxRprK1dUiWnXonJ/GfchNWXThOOFJRDIsbUn9MN45QvuRwSkv7IblzLYXXmHpqCC8
 aAWncWEnGP6b0efYF1EHgtXdB6k579nZOEBhp6Qv3VRC/8ofKQ2ap52GkaBoSeAvE97a
 Yh6A==
X-Gm-Message-State: AOJu0Yxhw2qTCoLLEv7cbUhQXhjiIJ+lTdtBL39Kn0MmTMfS0+b2cs1x
 qkHBHxgvzX9nO8q9S6wJtIhECfKZvO3k8awonVnzH1hvFgr41ZOL3pjKXbC8w77JYcTuRKSaoJo
 xdbBI
X-Gm-Gg: ASbGncscrI9fjtzaPj1CCRTQPCMztukDA8wS5z9KQub0ux8RsRL/thUwQ7ndd9KEksM
 neJoqpWoCjRbRQJmftIjyfXmVkixXv1gDkzGW4dcJO1NjJov4jjfvB5TGuGa2Olj1NqMm1noPjl
 4BkHmyS9EEvBg2fE8zOOz824NDbWg0DPZtIfJ48kDZXIhK9k/+Tq2qN90y5NYQxT+rfsjX6PMmq
 XArHp3Arns3aHZusBzP3d/JC+2wqyHGF3D+wnHx+WPxrqaCgDCgYajEybqTEDRzw9nsDhSP/ZvU
 UxBHhIkwv87sx3AkGveONND5EwnSemfQ8Gy3Z5tprQ4BHZOjlX67rf0nF4CZbXy2D090Jij1S9W
 6t4MDB6cVpLJihbiDzHo010adbbqsuzpq+iLvfLwlBk6PimfUCbQsez64
X-Google-Smtp-Source: AGHT+IFJiA3YEzbcwAZPUgJ3KdQv2Umn8gDFBGFs5OumurFs815h4LqZ0ZcoqSVJekMiexR+HNARkg==
X-Received: by 2002:a05:600c:890d:b0:46e:32f7:98fc with SMTP id
 5b1f17b1804b1-46fa9af3656mr70097365e9.21.1760113254604; 
 Fri, 10 Oct 2025 09:20:54 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3cd658sm65290075e9.1.2025.10.10.09.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 09:20:54 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 18:20:53 +0200
Message-ID: <20251010162053.238542-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760113255; x=1760718055; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r1xbmwBsasD4EgBDuVoJb7AR64oU4itgiLLBzcUB5V8=;
 b=BfQaRps2ej8V3qnxGcDOc5gsqgGyVVYB5uxpSpmeXgOKGKPp30gmRZ3c2Ru3erKxGW
 dlS04wxSklvrl4gSCCdfzW8IKUDzFYs4XysrGu9V+DTWVJRS3iTi48fm18W6giiicIfg
 ErPYG8857ekjY1Vgh1HHMn/A2tKilu5ys2B0jo2a7wRcjJRiQeWy3jO9/D9WveMbTeA4
 srRlkp2Fya1/XHaLc1C2A5AhcSx2lhnyt8iboLOzBGG9U/FduvGhDls0oSR71BZsM5W4
 pzsoHDLsplKMYnj+BizvrWvpwHPkaTGYsKJbuXALdIdAWGj7WQG2dAJrgANmbYMQgUQu
 xIwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BfQaRps2
Subject: [Buildroot] [PATCH] package/zabbix: security bump to v7.2.13
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more details on the version bump, see:
  - https://www.zabbix.com/rn/rn7.2.13
  - https://www.zabbix.com/rn/rn7.2.12
  - https://www.zabbix.com/rn/rn7.2.11
  - https://www.zabbix.com/rn/rn7.2.10
  - https://www.zabbix.com/rn/rn7.2.9
  - https://www.zabbix.com/rn/rn7.2.8
  - https://www.zabbix.com/rn/rn7.2.7
  - https://www.zabbix.com/rn/rn7.2.6

Fixes the following vulnerabilities:

- CVE-2025-27231

    The LDAP 'Bind password' value cannot be read after saving, but a
    Super Admin account can leak it by changing LDAP 'Host' to a rogue
    LDAP server. To mitigate this, the 'Bind password' value is now
    reset on 'Host' change.

For more information, see:
  - https://support.zabbix.com/browse/ZBX-27062
  - https://nvd.nist.gov/vuln/detail/CVE-2025-27231

- CVE-2025-27236

    A regular Zabbix user can search other users in their user group via
    Zabbix API by select fields the user does not have access to view.
    This allows data-mining some field values the user does not have
    access to.

For more information, see:
  - https://support.zabbix.com/browse/ZBX-27060
  - https://nvd.nist.gov/vuln/detail/CVE-2025-27236

- CVE-2025-27238

    Due to a bug in Zabbix API, the hostprototype.get method lists all
    host prototypes to users that do not have any user groups assigned
    to them.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-27238
  - https://support.zabbix.com/browse/ZBX-26988

- CVE-2025-49641

    A regular Zabbix user with no permission to the Monitoring ->
    Problems view is still able to call the problem.view.refresh action
    and therefore still retrieve a list of active problems.

For more information, see:
  - https://support.zabbix.com/browse/ZBX-27063
  - https://nvd.nist.gov/vuln/detail/CVE-2025-49641

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/zabbix/zabbix.hash | 2 +-
 package/zabbix/zabbix.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
index 979b6c8e3f..787a0acfe9 100644
--- a/package/zabbix/zabbix.hash
+++ b/package/zabbix/zabbix.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0d01b393dd22b2a60b36fb37a98fcf1081c683ad98832a2ddd87943a1200839e  zabbix-7.2.5.tar.gz
+sha256  44b51a09897e83b7d25cd706f88c0462224991d780881d6157d88fd804cc3a6c  zabbix-7.2.13.tar.gz
 sha256  0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0  COPYING
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index 3e685f1ea2..caa69fda38 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ZABBIX_VERSION_MAJOR = 7.2
-ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).5
+ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).13
 ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_SELINUX_MODULES = zabbix
 ZABBIX_LICENSE = AGPL-3.0
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
