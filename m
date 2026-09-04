Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B455C79F87
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3384860D53;
	Fri,  4 Sep 2026 12:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3ZkRdcZ5ENS; Fri,  4 Sep 2026 12:17:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5C14F60C26
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524259;
	b=n7qlgDUadb4ZOJaaeV056krwe9qGFrVRcYqurXKG+3+eAls2jvptdslR4NYP1N1/b5P5
	 pIhA7UC8s4tJEFcoiAA2pxJgH8Nn2QnqAyY2Pq4ETrzhFr8kwM5NHu8PwCjao0YIeznUv
	 gOEsDP8fJtZH6zSF6J+Nxk+JAyYadKpL+ZwcFJeyMhGsvZgGkAB4hNNSEf4W2AefxfMfx
	 PWcq3cUi+s2kaKHyZPO/Oag8PtZQ1qpnTpCBdIgh/aVK+dsWxng3I42eN6JqejfyTEN6B
	 v4jXytpwKPxMK7g2v+sZfNn0kBfl+JJkF8xDr3md35A7fB7Bruj8NhMjawzq5aaZVlw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524259;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=J4aahUumukm53wbU3L526/qvLvI2PBfvhHh3n5JwbYE=;
	b=MsvVNb3zgvuGkojXxcJRc0ddqVG2yd0Po0Ic5nt67gpR/pUa32FWc6lbj+2x/Tg85cqF
	 eY1JvLZTVzDLvw+m6Jq1NMSGCH46tDwwoHmsezr2TSUJdDb6tqcpZXvU3dpMm+DyxbUh9
	 yWSxxZpeJEIHhtkhoexkhfRJ/WXVCypMLMRFPxu0atqBoB8yuRyOOQ08gLzZYYDa/6tmn
	 hs4S6K6K+4wJiibskFJgvfvDQ42LRlFmPX+HvbPOlpJiOe+Ihzy7BpF+xP2TyAb8fs6Ii
	 RoRycWpLDXM5VafPGHCiMwHOo87i30yd4e72aCCdGsQtUwe1Vn0Ts4VMoyT4UW3GpGg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524259;
	bh=J4aahUumukm53wbU3L526/qvLvI2PBfvhHh3n5JwbYE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EJqm5igN/6cV+ZA9YMyjFJ5oVOUMFmlREBK5y8QvTQWPvcZIJMZIMR3Z8n5q7vjm0
	 yAWmCPVOF3vFtEKN2KWeydRjV+nQ75GRHO37tlOzJOuPpPjyvux7q3hCerj/yNXqC7
	 ENhDKfSwPH5mP0Qmc4MQAW/fPxurqgTTLur3QPkasdPUo8ForbQ3AG8WLu0L8ZUxLJ
	 ZgkH6Rh3j1ImhRBQDkLmYs1Q+TYVcDb0bHuKnrjbo9FW46FmKON7e1iou5u0l/97ol
	 gNgDVmsq/ivyJ95bMCS9RdMHGvIi7rMH8uy2+cHDugADVU48svWw16NDUMUzz/qB1n
	 bxl5hdc6u/etg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C14F60C26;
	Fri,  4 Sep 2026 12:17:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C074F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CAD460C0A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqBF-x_4aY4E for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6A07F60BEB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524254;
 b=neVXIRSMPyLutqVs9ljf1oyIVAC8dydRCKG7UWgWmS5DKV0mzjxcCp5wwkPZL09a9s6X
 rTasFptJEJXKjkz91FguSeGKT6Cc9dGzqFaHqgKYSF3I2eT+9op/olWvBPoIbF5VM4bAW
 AzQFJprPhuXs0NmLJQi9qidOoI4pdSgNjynNceiS17hgrSoao02fJBXwffWUc5l33NctF
 f7GSDmXS+3mqRc9jUW8b4PaIF2oCArpwT+HnwTDos/wphPfmAJvocidG8PMFiqtVuFL2u
 UBKLYbwzPrDiUw8xl9qT4a0oIfxd4HvQIZuSYUHw3q/0PxYQhtfTRNGEKjkQBPlkGYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524254;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=Yyjusg6Ux0XU4NkKoptlmV0gX1qy22v7WvkH3bq+BIs=;
 b=h3IRlpHzWOOXqEZnZLlO06VOW6Np/qTpVm7sxDVfSYSJNHu34wy9NFaiKy6wluD7vQTE
 1B5crTbx+IMf49msC/7CXToR2BEC1zeN2qBLG8lVORZzfeSxY6TG4DY3qtnjAomKyT60q
 wYCSuR1XbxC2roy4pGr/Li2AIyD3iXC/Z4KrQplfXwJ1tzWVowI6QyrxvhWxe7iRc2Q65
 g4jo6dMoHzw7zRzQGewWUPm92KzMgAINxLhXo2NM86nHqqNVA4gPRHH9XjMEU3+zQ97CK
 xOVniLOfl10c9hNJBid3EL/6j2LvOEd5Rafs2eeJuf8wwMXFtfjnK5yC4L+ZZc3r7EA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EtNYpvjh; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A07F60BEB
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:33 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48431648f33so1421328f8f.0
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524252; x=1789129052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Yyjusg6Ux0XU4NkKoptlmV0gX1qy22v7WvkH3bq+BIs=;
 b=agfUvdBqCcstSY5FakbZo8Oc4GtBU+6SiQjFV/2wkU3s3aT0HOsz1x8p2KcXYP3jTV
 vPkfh8ha17s5tXO3bjTWRukNIjyA3yfFVblMsLFW5dLsA7+Z7Y7sLnPz7ZUnx5p18wgb
 w1fIQDUl15G8iyFx31M/+blasWQIppUITA1EEE/9cjiCWVNt30iOExfftZnprrDOr1el
 EcMLFGTgnhxDbRUURA+HA79kZoZ9nEHjuSUd6XHB/jfGVLyZDSgmx8TVq0CecuPtNpVn
 q6smXfY3vqSLCQ94ED03jR6SLJ2h1Fb0jPT4jahwk4qL4KUMLV/IFQitBKL8MT3iKGyE
 B4ZA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwGzs+ohSzwagZHEyDMOLAnWosFS7Fy2udrG7vAbN2yxPrfbNJDmd5PdPB+9AtkZ8BS4c8/HhKbFF0=@buildroot.org
X-Gm-Message-State: AFuF++kqhC8sGyX9YDbkT/l4JTz5fROAiyTO594gN7Af54NAAsi/kyqA
 qzyiwTigNJzGUdO1+7rImkylTXDOJ0YfhFNI1BoLAAQlLtJcXdMtqyGndd7Z0ZwdB4W++29tpCU
 b2jji
X-Gm-Gg: AYBFou1KewAmkljGvKPJUENXdlEwsqSpURALTW77k+Y5s3j3xNAP3hXEczBVo5zazQg
 Xc4sHt4I7uzWPBNkJYrP7JKm0ah91dLwcUyhWkLcZ3d4y/173x/nUJdQYfW6+9uw7g/5mi2QNPR
 unzrA+6QRn4sWwU4iSK8ooGRTx57alitCO8nuYtJRqQIfX8RyXmFk2pep6j0ppsjWEfJXoPjBuA
 UE/8ncjtB89X/y7/y3ReYMMRfu7MRvhqEAJWxpk7cMgXVKSqZ5KEX5VHuStuAgz/8akl0E5vc7s
 l/9Rzi1JQbNxB19RHuFxViCJlLncf+4Xe6sES6DkNvLRzCKI9y3kIhlzr9QU2R/nBCpPqObRsgi
 4Np2T3WvTWrTy442NUZZSrfeTHL1qA53git1mTOtnBLsvOXYhYtEEdHRI1sVX2RO8WMqHFx2Oiv
 ZOrTfRvSIwAmBaopmniB2nYbrZfPfIGEy1xDU0WQINrSUW5EuApxm2joh5c+UvtVLkXxg=
X-Received: by 2002:a05:6000:27c6:b0:482:ea3e:882a with SMTP id
 ffacd0b85a97d-4857e4dc23emr11745475f8f.6.1788524251763; 
 Fri, 04 Sep 2026 05:17:31 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883c074asm5807825f8f.23.2026.09.04.05.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:31 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:30 +0200
Message-ID: <20260904121730.403800-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826150620.4062409-1-thomas.petazzoni@bootlin.com>
References: <20260826150620.4062409-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/dahdi-linux: backport commits to
 fix build with recent kernels
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

In reply of:
> Fixes build with kernels >= 6.15.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/ed73aa844a18cfc15e942ced4ae363c3d0d09015/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2026.05.x. Thanks

> ---
>  ...ppers-for-del_timer-and-del_timer_sy.patch |  38 ++++
>  ...se-ccflags-y-instead-of-EXTRA_CFLAGS.patch | 186 ++++++++++++++++++
>  ...pper-for-renamed-from_timer-function.patch |  35 ++++
>  3 files changed, 259 insertions(+)
>  create mode 100644 package/dahdi-linux/0004-kernel.h-Add-wrappers-for-del_timer-and-del_timer_sy.patch
>  create mode 100644 package/dahdi-linux/0005-Kbuild-Use-ccflags-y-instead-of-EXTRA_CFLAGS.patch
>  create mode 100644 package/dahdi-linux/0006-kernel.h-Add-wrapper-for-renamed-from_timer-function.patch
> 
> diff --git a/package/dahdi-linux/0004-kernel.h-Add-wrappers-for-del_timer-and-del_timer_sy.patch b/package/dahdi-linux/0004-kernel.h-Add-wrappers-for-del_timer-and-del_timer_sy.patch
> new file mode 100644
> index 0000000000..aac013016a
> --- /dev/null
> +++ b/package/dahdi-linux/0004-kernel.h-Add-wrappers-for-del_timer-and-del_timer_sy.patch
> @@ -0,0 +1,38 @@
> +From 96a67c8e51997a18bfc0942416b815057e279caf Mon Sep 17 00:00:00 2001
> +From: InterLinked1 <24227567+InterLinked1@users.noreply.github.com>
> +Date: Tue, 8 Jul 2025 18:35:56 -0400
> +Subject: [PATCH] kernel.h: Add wrappers for del_timer and del_timer_sync.
> +
> +del_timer[_sync] was renamed to timer_delete[_sync] in kernel
> +commit bb663f0f3c396c6d05f6c5eeeea96ced20ff112e, and the
> +compatibility wrappers were removed completely in kernel commit
> +8fa7292fee5c5240402371ea89ab285ec856c916. Add the wrappers
> +back on newer kernels to allow compilation.
> +
> +Resolves: #91
> +
> +Upstream: https://github.com/asterisk/dahdi-linux/commit/67d909a8a73364d6fa47bbf8baf314175c94f546
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + include/dahdi/kernel.h | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/include/dahdi/kernel.h b/include/dahdi/kernel.h
> +index ab129a8..ddd3eb4 100644
> +--- a/include/dahdi/kernel.h
> ++++ b/include/dahdi/kernel.h
> +@@ -62,6 +62,11 @@
> + #define netif_napi_add netif_napi_add_weight
> + #endif
> + 
> ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,15,0)
> ++#define del_timer timer_delete
> ++#define del_timer_sync timer_delete_sync
> ++#endif
> ++
> + #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 18, 0)
> + #include <linux/pci.h>
> + #include <linux/dma-mapping.h>
> +-- 
> +2.55.0
> +
> diff --git a/package/dahdi-linux/0005-Kbuild-Use-ccflags-y-instead-of-EXTRA_CFLAGS.patch b/package/dahdi-linux/0005-Kbuild-Use-ccflags-y-instead-of-EXTRA_CFLAGS.patch
> new file mode 100644
> index 0000000000..857f317173
> --- /dev/null
> +++ b/package/dahdi-linux/0005-Kbuild-Use-ccflags-y-instead-of-EXTRA_CFLAGS.patch
> @@ -0,0 +1,186 @@
> +From fc3748466d96fa465fe665403b73d6f4f75c124b Mon Sep 17 00:00:00 2001
> +From: InterLinked1 <24227567+InterLinked1@users.noreply.github.com>
> +Date: Fri, 21 Feb 2025 21:42:19 -0500
> +Subject: [PATCH] Kbuild: Use ccflags-y instead of EXTRA_CFLAGS.
> +
> +ccflags-y was added to the kernel back in 2007, in commit
> +f77bf01425b11947eeb3b5b54. Recent kernel commit
> +dbd83ea09699390892e5efecddd74ae43a00f071 has now completely
> +removed the deprecated EXTRA_CFLAGS.
> +
> +Comments in Kbuild and the Makefile for the oct612x library were
> +added back when it was created in 2013 in commit f65299e8b2e6ffb0b07089759f8c4ff33a695c09
> +to use the newer ccflags-y based on the kernel version,
> +but the change was never made to conditionally move away
> +from the EXTRA_CFLAGS.
> +
> +Now that the older way no longer exists, always use ccflags-y.
> +
> +Resolves: #76
> +
> +Upstream: https://github.com/asterisk/dahdi-linux/commit/9d5b120cb5573d39bcd9e3d8a7b212e25ab5c2c4
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + drivers/dahdi/Kbuild            | 4 ++--
> + drivers/dahdi/oct612x/Kbuild    | 5 +----
> + drivers/dahdi/oct612x/Makefile  | 5 +----
> + drivers/dahdi/voicebus/Kbuild   | 4 ++--
> + drivers/dahdi/wcb4xxp/Kbuild    | 2 +-
> + drivers/dahdi/wct4xxp/Kbuild    | 6 +++---
> + drivers/dahdi/wctc4xxp/Kbuild   | 4 ++--
> + drivers/dahdi/wctdm24xxp/Kbuild | 2 +-
> + drivers/dahdi/xpp/Kbuild        | 4 ++--
> + 9 files changed, 15 insertions(+), 21 deletions(-)
> +
> +diff --git a/drivers/dahdi/Kbuild b/drivers/dahdi/Kbuild
> +index cd0365b..9c9355a 100644
> +--- a/drivers/dahdi/Kbuild
> ++++ b/drivers/dahdi/Kbuild
> +@@ -75,13 +75,13 @@ CFLAGS_MODULE += -I$(DAHDI_INCLUDE) -I$(src) -Wno-format-truncation
> + BAD_KERNELS_VERS := 22 34 34.0.1 34.0.2
> + BAD_KERNELS := $(foreach ver,$(BAD_KERNELS_VERS),2.6.9-$(ver).EL 2.6.9-$(ver).ELsmp)
> + ifneq (,$(filter $(KVERS),$(BAD_KERNELS)))
> +-EXTRA_CFLAGS+=-Drw_lock_t=rwlock_t
> ++ccflags-y+=-Drw_lock_t=rwlock_t
> + endif
> + 
> + # A number of Fedora 10 (9 also?) kernels backported hrtimer to 2.6.27
> + # as part of an ALSA backport. TODO: Any better way to detect that?
> + ifeq (1,$(shell fgrep -q ' hrtimer_set_expires' include/linux/hrtimer.h 2>/dev/null && echo 1))
> +-EXTRA_CFLAGS+=-DHAVE_HRTIMER_ACCESSORS=1
> ++ccflags-y+=-DHAVE_HRTIMER_ACCESSORS=1
> + endif
> + 
> + ifeq (1,$(shell fgrep -q 'wait_for_completion_timeout' include/linux/completion.h 2>/dev/null && echo 1))
> +diff --git a/drivers/dahdi/oct612x/Kbuild b/drivers/dahdi/oct612x/Kbuild
> +index ac53fe7..5015f7e 100644
> +--- a/drivers/dahdi/oct612x/Kbuild
> ++++ b/drivers/dahdi/oct612x/Kbuild
> +@@ -24,9 +24,6 @@ octapi_files = octdeviceapi/oct6100api/oct6100_api/oct6100_adpcm_chan.o \
> + 		apilib/llman/octapi_llman.o \
> + 		oct612x-user.o
> + 
> +-# TODO: ccflags was added in 2.6.24 in commit f77bf01425b11947eeb3b5b54. This
> +-# should be changed to a conditional compilation based on the Kernel Version.
> +-# ccflags-y := -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
> +-EXTRA_CFLAGS = -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
> ++ccflags-y := -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
> + obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_OCT612X) := oct612x.o
> + oct612x-objs := $(octapi_files)
> +diff --git a/drivers/dahdi/oct612x/Makefile b/drivers/dahdi/oct612x/Makefile
> +index 5d29143..d01997b 100644
> +--- a/drivers/dahdi/oct612x/Makefile
> ++++ b/drivers/dahdi/oct612x/Makefile
> +@@ -23,8 +23,5 @@ octapi_files = octdeviceapi/oct6100api/oct6100_api/oct6100_adpcm_chan.o \
> + 		apilib/largmath/octapi_largmath.o \
> + 		apilib/llman/octapi_llman.o
> + 
> +-# TODO: ccflags was added in 2.6.24 in commit f77bf01425b11947eeb3b5b54. This
> +-# should be changed to a conditional compilation based on the Kernel Version.
> +-# ccflags-y := -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
> +-EXTRA_CFLAGS = -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
> ++ccflags-y := -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
> + lib-y := $(octapi_files)
> +diff --git a/drivers/dahdi/voicebus/Kbuild b/drivers/dahdi/voicebus/Kbuild
> +index 3bf9640..45026d9 100644
> +--- a/drivers/dahdi/voicebus/Kbuild
> ++++ b/drivers/dahdi/voicebus/Kbuild
> +@@ -8,10 +8,10 @@ ifneq ($(HOTPLUG_FIRMWARE),yes)
> + dahdi_voicebus-objs += $(FIRM_DIR)/dahdi-fw-vpmoct032.o
> + $(warning WARNING: You are compiling firmware into voicebus.ko which is not available under the terms of the GPL. It may be a violation of the GPL to distribute the resulting image since it combines both GPL and non-GPL work. You should consult a lawyer of your own before distributing such an image.)
> + else
> +-  EXTRA_CFLAGS+=-DHOTPLUG_FIRMWARE
> ++  ccflags-y+=-DHOTPLUG_FIRMWARE
> + endif
> + 
> +-EXTRA_CFLAGS += -I$(src)/.. -Wno-undef
> ++ccflags-y += -I$(src)/.. -Wno-undef
> + 
> + $(obj)/$(FIRM_DIR)/dahdi-fw-vpmoct032.o: $(obj)/voicebus.o
> + 	$(MAKE) -C $(obj)/$(FIRM_DIR) dahdi-fw-vpmoct032.o
> +diff --git a/drivers/dahdi/wcb4xxp/Kbuild b/drivers/dahdi/wcb4xxp/Kbuild
> +index 80606bf..59ffc8d 100644
> +--- a/drivers/dahdi/wcb4xxp/Kbuild
> ++++ b/drivers/dahdi/wcb4xxp/Kbuild
> +@@ -1,6 +1,6 @@
> + obj-m += wcb4xxp.o
> + 
> +-EXTRA_CFLAGS += -I$(src)/.. -Wno-undef
> ++ccflags-y += -I$(src)/.. -Wno-undef
> + 
> + wcb4xxp-objs := base.o
> + 
> +diff --git a/drivers/dahdi/wct4xxp/Kbuild b/drivers/dahdi/wct4xxp/Kbuild
> +index cf01ccf..eeeb2f6 100644
> +--- a/drivers/dahdi/wct4xxp/Kbuild
> ++++ b/drivers/dahdi/wct4xxp/Kbuild
> +@@ -2,16 +2,16 @@ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCT4XXP) += wct4xxp.o
> + 
> + FIRM_DIR	:= ../firmware
> + 
> +-EXTRA_CFLAGS += -I$(src)/.. -I$(src)/../oct612x/ $(shell $(src)/../oct612x/octasic-helper cflags $(src)/../oct612x) -Wno-undef
> ++ccflags-y += -I$(src)/.. -I$(src)/../oct612x/ $(shell $(src)/../oct612x/octasic-helper cflags $(src)/../oct612x) -Wno-undef
> + 
> + # The OCT612X source files are from a vendor drop and we do not want to edit
> + # them to make this warning go away. Therefore, turn off the
> + # unused-but-set-variable warning for this driver.
> + 
> +-EXTRA_CFLAGS += $(call cc-option, -Wno-unused-but-set-variable)
> ++ccflags-y += $(call cc-option, -Wno-unused-but-set-variable)
> + 
> + ifeq ($(HOTPLUG_FIRMWARE),yes)
> +-  EXTRA_CFLAGS+=-DHOTPLUG_FIRMWARE
> ++  ccflags-y+=-DHOTPLUG_FIRMWARE
> + endif
> + 
> + wct4xxp-objs := base.o vpm450m.o
> +diff --git a/drivers/dahdi/wctc4xxp/Kbuild b/drivers/dahdi/wctc4xxp/Kbuild
> +index 9f97498..2f1bfbf 100644
> +--- a/drivers/dahdi/wctc4xxp/Kbuild
> ++++ b/drivers/dahdi/wctc4xxp/Kbuild
> +@@ -2,10 +2,10 @@ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCTC4XXP) += wctc4xxp.o
> + 
> + FIRM_DIR	:= ../firmware
> + 
> +-EXTRA_CFLAGS += -I$(src)/.. -Wno-undef
> ++ccflags-y += -I$(src)/.. -Wno-undef
> + 
> + ifeq ($(HOTPLUG_FIRMWARE),yes)
> +-  EXTRA_CFLAGS+=-DHOTPLUG_FIRMWARE
> ++  ccflags-y+=-DHOTPLUG_FIRMWARE
> + endif
> + 
> + wctc4xxp-objs := base.o
> +diff --git a/drivers/dahdi/wctdm24xxp/Kbuild b/drivers/dahdi/wctdm24xxp/Kbuild
> +index 22cc71a..c9d96b7 100644
> +--- a/drivers/dahdi/wctdm24xxp/Kbuild
> ++++ b/drivers/dahdi/wctdm24xxp/Kbuild
> +@@ -1,5 +1,5 @@
> + obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCTDM24XXP) += wctdm24xxp.o
> + 
> +-EXTRA_CFLAGS += -I$(src)/.. -Wno-undef
> ++ccflags-y += -I$(src)/.. -Wno-undef
> + 
> + wctdm24xxp-objs := base.o xhfc.o
> +diff --git a/drivers/dahdi/xpp/Kbuild b/drivers/dahdi/xpp/Kbuild
> +index e46a9d7..02d3149 100644
> +--- a/drivers/dahdi/xpp/Kbuild
> ++++ b/drivers/dahdi/xpp/Kbuild
> +@@ -1,4 +1,4 @@
> +-EXTRA_CFLAGS	=	$(XPP_LOCAL_CFLAGS)	\
> ++ccflags-y	=	$(XPP_LOCAL_CFLAGS)	\
> + 			-DDEBUG			\
> + 			-DPOLL_DIGITAL_INPUTS	\
> + 			-DDEBUG_PCMTX		\
> +@@ -32,7 +32,7 @@ xpd_echo-objs		+= card_echo.o
> + xpp_mmap-objs		+= mmapbus.o mmapdrv.o
> + 
> + ifeq	(y,$(PARPORT_DEBUG))
> +-EXTRA_CFLAGS	+= -DDEBUG_SYNC_PARPORT
> ++ccflags-y	+= -DDEBUG_SYNC_PARPORT
> + obj-m		+= parport_debug.o
> + endif
> + 
> +-- 
> +2.55.0
> +
> diff --git a/package/dahdi-linux/0006-kernel.h-Add-wrapper-for-renamed-from_timer-function.patch b/package/dahdi-linux/0006-kernel.h-Add-wrapper-for-renamed-from_timer-function.patch
> new file mode 100644
> index 0000000000..6651083ee3
> --- /dev/null
> +++ b/package/dahdi-linux/0006-kernel.h-Add-wrapper-for-renamed-from_timer-function.patch
> @@ -0,0 +1,35 @@
> +From 13e360f1bc65dba29ba22c46f30ba868bea9805d Mon Sep 17 00:00:00 2001
> +From: InterLinked1 <24227567+InterLinked1@users.noreply.github.com>
> +Date: Sat, 12 Jul 2025 17:52:40 -0400
> +Subject: [PATCH] kernel.h: Add wrapper for renamed from_timer function.
> +
> +from_timer was renamed to timer_container_of in kernel commit
> +41cb08555c4164996d67c78b3bf1c658075b75f1 as part of updates to
> +the timer APIs. Add a compatibility wrapper for kernels >= 6.16.0.
> +
> +Resolves: #95
> +
> +Upstream: https://github.com/asterisk/dahdi-linux/commit/0d864e9f97ba22e340380ce24a1bd366ca33ebc2
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + include/dahdi/kernel.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/include/dahdi/kernel.h b/include/dahdi/kernel.h
> +index ddd3eb4..01fe113 100644
> +--- a/include/dahdi/kernel.h
> ++++ b/include/dahdi/kernel.h
> +@@ -58,6 +58,10 @@
> + 
> + #include <linux/poll.h>
> + 
> ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 16, 0)
> ++#define from_timer timer_container_of
> ++#endif
> ++
> + #if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0)
> + #define netif_napi_add netif_napi_add_weight
> + #endif
> +-- 
> +2.55.0
> +
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
