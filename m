Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98757FF8867
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 13:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68E1B42377;
	Wed, 29 Apr 2026 13:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZjUnmJDxLDb; Wed, 29 Apr 2026 13:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E32042393
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777467999;
	bh=5HZ/ypkyZWh3d4DObS4KXkNJ0exeDDJkOQDcOy/8HBA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ly281wa511Thhr/uwh817Ntj4z7mvlRz9yqUmG3meEgz1lH/Ieipc+u11Q+uz4FwQ
	 vzRRmrsrwhJJUs3KsUfL/QnCZc6hDU5lz9bYf/d22zMQGbNzIjUnvjv9oHXpGHNd69
	 sQkGekndg/btE3LFzss9f/icvHGzVBZSoH0WJt5Murv9iIfOE97/vzA8Wsn6+cDBIa
	 T37NyaIl2sv35ONLxdWDaSVZvhLnQFPTTJ1ijGXpvLFhPixc4ILomuIFnO12xkjwcv
	 Q7fsrxoEqRt6noirWSFyPKRJKC7/FMWjAXnoMBGTYn8BqgIskyAH83np45Pg5ffAGz
	 RMonfXTK1dAeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E32042393;
	Wed, 29 Apr 2026 13:06:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C9E61B8
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 13:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF33B42393
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 13:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uD09NT4ewIHJ for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 13:06:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E91942377
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E91942377
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E91942377
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 13:06:33 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2b25cf1b5f0so68755745ad.3
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 06:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777467993; x=1778072793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bBMU1xxlQ+xgMzGQhIFhFNfVrTEWo0ogYPjv8wNbDnA=;
 b=OHh4L7W5Hj7GyM0xV7VZyY/NYeeKQS7S32l6MwsV1jU+1Gjp5IXaAQFZM7E5f6brXU
 KMxcgCpsxdUO8gmTeVabcreNJwZDyxUbJypFTePy6kZQNZMSi3HTXSRVbnzj20DSHYVE
 +QpXwOp+qrVs2GBmbYXcI35vN+x7CunhLvB1NCQXd+mqzxKy712/Gzlrg35ctMqj10nJ
 IaSX8W5cQPiYx5UKkanQ/CT03IO9UUiT5uCTGpbOYQ+0qMPGFDQ/Sh902a0zpGA5Naxu
 GJWYzgjO8ngrYJ648Sw8cqBUT2gHmRUeL9XxMLBwXhjDgDElPGzfaviAMHHHGaqmKV5O
 ZNyw==
X-Gm-Message-State: AOJu0YwPDc+eLHrRBZcMSRyKa6cblMYQW5fweMg2MH1LJkZnfQCHaA9z
 V3mxmDiC+p3KXm41mypYarqpc2wpxWrvRulSpx9JhEYcFnbDpf/t6AOdE6Yu/g==
X-Gm-Gg: AeBDievs36JoJ75qZqtRJR1oaB7uVckqRLXK1QzyT5p9VmdZLSuqlTwCQHBErdUwJVG
 BSdqSrxCfuH6gcMq1phhwtGph/1A2xUU40QXHCqmqmpKBsnnfTO9A9kvhSMmP3iI2wmn+VME7Jp
 JEpb9dUg4TY3b6BqCra1PjZuE0cEmMcxdel+qvZjajXJY/tSEMHQZF9Ff6/4bluM8r+/7bOPkKw
 K0eg8RGJ9O/Cjdh2eRelQzArRs9nNlhQQ1noVhScXEQ8YCpmH5F6u6GYfVIna/p2+KN390NEjds
 /nBNUz/6QgtQBmV5WMxAenMIh2tYutGP/oWGC7gM+b8WZOOBhzH1vKdqFs5+yUsYOrmds98+TAk
 9b1ewUFlw6F+cz3/AbSWmdT7mrtqG8Tn1xk0BwL2iXy3/VVsXMFCwIYqO5TFFANsExXNBtdFjrV
 5gN8ZjHEllLFoG5DNQhruJ7k69XCY3yKICbdWb0ozQmzFY0Q==
X-Received: by 2002:a17:903:985:b0:2b2:ebed:7af8 with SMTP id
 d9443c01a7336-2b98730c6b6mr33480585ad.1.1777467992604; 
 Wed, 29 Apr 2026 06:06:32 -0700 (PDT)
Received: from fedora ([2409:408a:1d19:530e:b98a:5a06:8ea0:9b10])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b9887ab3f3sm21775955ad.34.2026.04.29.06.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 06:06:31 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Wed, 29 Apr 2026 18:36:14 +0530
Message-ID: <20260429130615.7679-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260418073313.37718-1-chakrabortyshubham66@gmail.com>
References: <20260418073313.37718-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777467993; x=1778072793; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bBMU1xxlQ+xgMzGQhIFhFNfVrTEWo0ogYPjv8wNbDnA=;
 b=Q7Bddc8Q4bGqiOdvPAKqdH7eMqaXdr/6cr/sh8c48QzjQ3oIc1m3CRj8uEiOZ5Ku3Y
 0tSdwRyiVl6zfhyQY0bfcj1VIKYKf/ERH8fxpwntF7Nf80gACyMDvMUhE9jf8IV37icG
 yxi/iMI0EbILbdTcbGBSt1V1JYV1PBqgKnR4Cj2F2c8pZjzTmMYDzfdG36V/FTpOObDo
 OzlRUHV3U6mjxP0mNw/fDjKsgjmb4xS5w6TaaP8LIQTuA6u8plAkT03vZmr+dGWh2Ud3
 +/n2+dPV1LwAAOCl/HYk1g7nJvcJO4tH9WnnJZ/erpAjA20Dramgi4KA+iFaYu9xSLgK
 vdQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Q7Bddc8Q
Subject: [Buildroot] [PATCH v3] package/psmisc: bump to version 23.7
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

Changelog:
- v23.6:
  - buildsys: Fix DEJAGNU work-around (Debian #1015089)
  - killall: Use kill if pidfd_send_signal fails (Debian #1015228)
  - fuser: Do not mention nonexistent -reset option (#42)
  - fuser: Use modern statn where possible
  - pstree: Better AppArmor support (!30)
- v23.7:
  - Fix --disable-statx build option
  - fuser: Add stat() fallback, ignore EACCES errors
  - pstree: Fix assumption about root PID
  - killall: Output formatting fixes
  - Update gettext to 0.21

https://gitlab.com/psmisc/psmisc/-/tags/v23.6
https://gitlab.com/psmisc/psmisc/-/tags/v23.7

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

---
v2 -> v3:
- Include 23.6 changelog in commit message (Marcus Hoffmann)
- Squash into a single patch (Marcus Hoffmann)

v1 -> v2:
- Put back upstream md5 and sha1 hashes (Julien Olivain)
- Restore "Locally computed" comment (Julien Olivain)
---
 package/psmisc/psmisc.hash | 6 +++---
 package/psmisc/psmisc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/psmisc/psmisc.hash b/package/psmisc/psmisc.hash
index fe146f90c9..f16b95eee3 100644
--- a/package/psmisc/psmisc.hash
+++ b/package/psmisc/psmisc.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/psmisc/files/psmisc/
-md5  014f0b5d5ab32478a2c57812ad01e1fb  psmisc-23.5.tar.xz
-sha1  a16073f459a19288c1ea2b413a84e1b996cab595  psmisc-23.5.tar.xz
+md5  53eae841735189a896d614cba440eb10  psmisc-23.7.tar.xz
+sha1  89046d35a8919def79200115c9cc78e91b98ad53  psmisc-23.7.tar.xz
 # Locally computed:
-sha256  dc37ecc2f7e4a90a94956accc6e1c77adb71316b7c9cbd39b26738db0c3ae58b  psmisc-23.5.tar.xz
+sha256  58c55d9c1402474065adae669511c191de374b0871eec781239ab400b907c327  psmisc-23.7.tar.xz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 3229184459..85caf30653 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PSMISC_VERSION = 23.5
+PSMISC_VERSION = 23.7
 PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
 PSMISC_SOURCE = psmisc-$(PSMISC_VERSION).tar.xz
 PSMISC_LICENSE = GPL-2.0+
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
