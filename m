Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF05E9A048
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 13:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 545154097A;
	Thu, 19 Feb 2026 13:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVfT8bTSXUVQ; Thu, 19 Feb 2026 13:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7415B4098E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771508922;
	bh=xJQd+VjcyKZZdXbCxxNcLBV9P9LOk5bp/5u/NJ+pjMM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=lOo+m2KKO4dJiOS3apmu9YOVQeGkgPBa+KhLZETcCPzuUoUW87hybDS4Jc83uxpeB
	 Rzheo87+SFRgla5ARkEcBBQpxLgO7FAEwGa3/gUNyVjy2bceffXTolI2tuGfTkpuXj
	 8PvWUZqzE7BouS1Eal+G+NQRgqylBtJ6A1sZ/hl+Vyv2vmA3mlZzBtmDjm9+FNuVAs
	 lRB06e2QU2UDWgfJSXFckFt5YjhL1xsslDFRjKa875mcgCeuBnFZjkzp+jcXYNISfg
	 W52LRYiSS5XwrWoxsh8SAZpdcVqh0eRU15/PaThkN12XzrY7M2gHcmClvT5Glzf70F
	 ulvPvSUxzSTAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7415B4098E;
	Thu, 19 Feb 2026 13:48:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F34DF1CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D85AF403E3
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrBaYiqrpTSM for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 13:48:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 763D1403CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 763D1403CC
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 763D1403CC
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:48:39 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so14735405e9.1
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 05:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771508917; x=1772113717;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gKBVgOJcnX3ZyIWjB5wOyQVLnemoPaHDZmmT0CNkgKQ=;
 b=nP8/TihM1QN6GU/tsysK9JYiJdFDqYeKfgqONusH65HUb/ZEzn07Y48n+vGWKXZDB2
 mWxy9SVkTQSyEZQz4jIVYcRjHAXFuaPu6rp/WCCrYwC++/9Rp86Z6oi3R8yCauGHsMH7
 iE/915uwAlRhCXWVsJzc8hscf9A84bNiO6tj6S5dCdvbarY7ZsXdcztaP9ZDM5CKbZCo
 If3G0racegWdSRjusu6CQFqnSWEk0Sw4zY0NvB6kNkIMAV4V798A6sjiFc4PJU0ZWllz
 5rbrLekkBjFQVlUD/wkHUDB9Kx7VtFPmH6/BGOZCMpgdhYEA380Pp3E3LiwtCUvzp/19
 VRdQ==
X-Gm-Message-State: AOJu0Yz07YNsmNVMmT3U1x2/FWG4ta9skVDQTY1sZPZpIUCWNELez1w3
 /MfjSeJLm2YXJMK4BWNiSBjq+s8vJe5hD/C8uymQzz7D6lYFZds0YmwhOmZQZD8TlN5tqiRwd+D
 Phkic
X-Gm-Gg: AZuq6aLT1Qolnee+nqQYZpg5sp4kEvD7KE3TgjdWZKPlqZbP+3hzk1y1cTZYlPpRreP
 S+iROt6Llxh12tmVT0Dg+Y4fzfExOtNEYxAOEb0CKpiG8QjkaCYUkWn/URAAVCw4Xsu5q27RcAh
 zWBMdJW1js3Mtjd/zs6DoIyg7rpNzwDMhFQ/VIMnQLYibs9K8r/ZVl3qwzrdd9p4hJPPgMt1sV/
 CzJPqJdGqvFbpGZzjRwLJ6g2a2HcNCNPKSnyV5GU/tSu1kSA7Jr5KUwpppsha1mjhs77qpvCaPL
 AlUOhvZbig2pvXBRrXmO9ZAbkyZR3oZukUzS2bsgzx4MtTi1X8PM6bLCAAZY0kQYFJxu/1O5CJJ
 PWYZiWuAy0RPrN3giz3Q2gyzt3YIGMHphdcxbg9QsHV1h4db/RuEz10qCR0Z7sER0+jU8wnwPuV
 I6TrX0HGYnguq6NwdEzksYej9xRGhiyTEePt58HlqzAbFGvohce+59TuuSmBTLOW7+Xi1zaSM3x
 Y+rzyNZCtcVkDGSoNMbplKoXnYs8qz5MXOjUphzHMy/nYxJWJ30
X-Received: by 2002:a05:600c:214b:b0:47e:e051:79ee with SMTP id
 5b1f17b1804b1-4839fe90522mr26482735e9.3.1771508916754; 
 Thu, 19 Feb 2026 05:48:36 -0800 (PST)
Received: from FRSMI25-GRAVITY.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839f97831bsm16604295e9.12.2026.02.19.05.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 05:48:36 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Thu, 19 Feb 2026 14:48:28 +0100
Message-ID: <20260219134834.151782-1-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1771508917; x=1772113717; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gKBVgOJcnX3ZyIWjB5wOyQVLnemoPaHDZmmT0CNkgKQ=;
 b=y/znyee7SfPCxg1younUtoN5f+aR4Zsn0WtBcE1MwVhn8FxWFl4SmT3OQC4EP5+uRE
 0+gwdHMZ/bbP22FJpwfMS3bY7jpoc3EmWb2BF9Es5WZvP3lC1rdsyyF4f2njv+Bh4RjD
 lHBgGIUX5Z8UpSplfNGuItVzaWm0ipsqgPHkA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=y/znyee7
Subject: [Buildroot] [PATCH v2 0/2] Linux kernel CVE filtering improvements
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series adds support for generating compile_commands.json during
the Linux kernel build and provides kernel CVE filtering based on which files
are actually compiled, significantly reducing false positives in CVE reports.

Changes from v1:
Following Thomas' suggestion (https://lists.buildroot.org/pipermail/buildroot/2026-February/797289.html) 
this v2 implements kernel CVE filtering directly into cve-check rather than as a separate script

1. Kernel build generates compile_commands.json (optional, via Kconfig)
2. cve-check script enhanced with optional kernel CVE filtering
   - Automatically activates when --cc-path and --cna-path are provided
   - Uses CNA database to determine which files are affected by each CVE
   - Matches against compile_commands.json to filter false positives
   - Keeps CVEs where affected files ARE compiled
   - Removes CVEs where NO affected files are compiled
   - Keeps uncertain CVEs (CNA database lacks information) for review

Fabien Lehoussel (2):
  linux/linux.mk: add generation of compile_commands.json
  support/scripts/cve-check: add kernel CVE filtering based on compiled
    files

 linux/Config.in           |  20 +++
 linux/linux.mk            |  12 ++
 support/scripts/cve-check | 118 ++++++++++++++-
 support/scripts/cve.py    | 292 +++++++++++++++++++++++++++++++++++---
 4 files changed, 415 insertions(+), 27 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
