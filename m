Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3032FB3CE3
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 09:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4958F4080E;
	Mon, 30 Mar 2026 09:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRoYYDgTz2ro; Mon, 30 Mar 2026 09:07:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FF9F40816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774861620;
	bh=1fxLC6EbG8+NBgcQTiSYhQLLTX4Ug9FFKf5Gtx3VvLc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=qe1BZI0BP7dkji73xUlXpc5MXP9cvlFvXYX7pv1jtwnyuZJEINC7wTyrR4Ru5X8mE
	 qrGMo+PnfceehZgi6Z/t58jnIfnAaNG5dJx7akA9aiJ56/L5GvjjG/T1af2Gekr9Ip
	 aThjOKafuc4MYXMUwgb4p5s31fJmzsO4ltS6Vbgoi2HD0nne1HfmaiWsmnzhx2noHt
	 FjhqBSDvjCAV0WV3xF2xrD/3pRnwEnz8/z8q3kcHG4Wa9vX7Xp9lm53a6b9pmEJDpx
	 lrBnxPNetVPyGYuI3g91Kb4gNm6YsE76Q9ohW7nqfXkdOMPGTjz/It18D7eBcz4Xoj
	 d+v94qsbuuGVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FF9F40816;
	Mon, 30 Mar 2026 09:07:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 855362C5
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 09:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 713F8400FE
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 09:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vKMBSne5qX3K for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 09:06:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 24FBD4041B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24FBD4041B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24FBD4041B
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 09:06:54 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48702d51cd0so50547735e9.2
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 02:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774861612; x=1775466412;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N2l4hc8DOXqstpi52hNIMZwhUDvEnqdzp/QIou/vezQ=;
 b=XgKVWY5dcn256d9vkyu58ZgS+2UbfXJVlp0IjROnslfbfvVtUU5qspue37mwOP8D/H
 e9t3ouDVJhrfEuW8STEXFGz2a68bHKxSgJQRvvh9NYqj63vC9uUDPyB4x2y0lduDLPJ0
 8Dd8jeNRFFUfFuBErLhYIdHDTJGgr85PybvHvswEBQTmJOAQsqCHtzSGv38LiB7ROD69
 y+Ccuq1utIGhj3brlb+Ug35zZLl9jDbeGRMXz3YrK8L+ctc01U7jyU53b7WCU7T0lMia
 2fgtGymsJefMUkYlBaj3zI3Xm8xy7TPneFZuSO2KSzsST5jqhnjKHfaUSjO+zTriCfKM
 y3OA==
X-Gm-Message-State: AOJu0Yw4kVspbEolL8pFqeWv8JlxsqFxUwUqg84GiJNUCedNfp78usXo
 d6J7YOQYz5CReTB/o3KrRkdlcc0n7TQim5YPEQAqPmzVeM64EssUH24Bp4QLSb5o5fFVxxNWxOM
 Iov4OARY=
X-Gm-Gg: ATEYQzykWznLeRbsGnndxgl9K4Vg6IPzo57WMziisvCTOU43//tp0+B2ygz18vVfdnE
 w74K8RCWtTGiHTCllzm9j7gcpI5XGApzQU+lxrGRw5t3yBV+zdlOxzfYOoOnckly/O8V1VDMlOk
 Sl+yoNR//g0qvzitwDjtImWI2kIV1Hhjg3tm2duXUSTF3SYCD9G0JcMvKn/x0H0i4/AXMqZB5hn
 7L8fSSs1kkdZs3fvP5mD7BLoicHiGytU5U7pET9LGMNMhRMOh90M3nbkLuWSpg3kVjNt6ta3Ppj
 kCoMKp3nmX11nf0FiszEwoVoMRP0pFCDdnrHvSMuXiIPReDfTWpHvR40pLcZV4upvL16LJ71nwx
 UHPDB8L3ME6x5miezubXaQbdN12Da0lOOHU343lQYwRJy/R7L8M1dhz7Az+cTnnJoLfrnKXLqny
 015Inr/xkAIcw03uuUUf8Nn+EVro4UtvjvaUS5hvt2jIYrE+xzBfN/TNsQ7eF8e7QuJuTmuE2Vq
 VyQ
X-Received: by 2002:a05:600c:a00b:b0:485:34b3:8587 with SMTP id
 5b1f17b1804b1-48727d8ffc5mr198755425e9.10.1774861612440; 
 Mon, 30 Mar 2026 02:06:52 -0700 (PDT)
Received: from dragon (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487270f1943sm95773575e9.7.2026.03.30.02.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2026 02:06:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 30 Mar 2026 11:06:48 +0200
Message-ID: <20260330090648.14672-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774861612; x=1775466412; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N2l4hc8DOXqstpi52hNIMZwhUDvEnqdzp/QIou/vezQ=;
 b=FOQbZraVWD/dCj6vKSnbFPQjG6azZVSYx6/KQtFeLpbcP23CdJuqcwArV3GfylwXN1
 BdA9HXfOmoB5YbKFUky52Ssx8W8sF63Ko4B1TcLhR3jXnApuyjAthoqKcdJMWpBcRSsc
 fDm+aRGbW0RWqzGPd+gptN2B1wDwzTcjHwu+eoZI1gxRUsjbUeqr/q/O5rJQpsBLHL65
 0t1UUz5SSdDrEaRGDWENBE4hKraAS3qxvXI4N2B7aZIikwjNPHoKeWp7KIkpcoZAsYR7
 AyfWhR0xaclo0EH7nnc3KFpR0xBAKVreFsZd355TuCyFi+aji+Lbd9nuMfm8rWSRe4Ls
 DOQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FOQbZraV
Subject: [Buildroot] [PATCH for 2025.02.x] package/python-django: security
 bump to v5.2.12
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:
https://docs.djangoproject.com/en/5.2/releases/5.2.12/

This fixes the following vulnerabilities:

- CVE-2026-25673:
    An issue was discovered in 6.0 before 6.0.3, 5.2 before 5.2.12, and
    4.2 before 4.2.29. `URLField.to_python()` in Django calls
    `urllib.parse.urlsplit()`, which performs NFKC normalization on
    Windows that is disproportionately slow for certain Unicode
    characters, allowing a remote attacker to cause denial of service via
    large URL inputs containing these characters. Earlier, unsupported
    Django series (such as 5.0.x, 4.1.x, and 3.2.x) were not evaluated and
    may also be affected. Django would like to thank Seokchan Yoon for
    reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-25673

- CVE-2026-25674:
    An issue was discovered in 6.0 before 6.0.3, 5.2 before 5.2.12, and
    4.2 before 4.2.29. Race condition in file-system storage and file-
    based cache backends in Django allows an attacker to cause file system
    objects to be created with incorrect permissions via concurrent
    requests, where one thread's temporary `umask` change affects other
    threads in multi-threaded environments. Earlier, unsupported Django
    series (such as 5.0.x, 4.1.x, and 3.2.x) were not evaluated and may
    also be affected. Django would like to thank Tarek Nakkouch for
    reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-25674

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 1cd2959b69..b1859b0647 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  051357d45eb71a115a64e6d2a79c7c51  django-5.2.11.tar.gz
-sha256  7f2d292ad8b9ee35e405d965fbbad293758b858c34bbf7f3df551aeeac6f02d3  django-5.2.11.tar.gz
+md5  9b60bb1145abcc97d276694f3f82a3b8  django-5.2.12.tar.gz
+sha256  6b809af7165c73eff5ce1c87fdae75d4da6520d6667f86401ecf55b681eb1eeb  django-5.2.12.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 4b840701f4..52d0a2b740 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.11
+PYTHON_DJANGO_VERSION = 5.2.12
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/17/f2/3e57ef696b95067e05ae206171e47a8e53b9c84eec56198671ef9eaa51a6
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/bd/55/b9445fc0695b03746f355c05b2eecc54c34e05198c686f4fc4406b722b52
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
