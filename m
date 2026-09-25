Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02342C9832A
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC53E60DEA;
	Fri, 25 Sep 2026 14:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENoNVUENfNUc; Fri, 25 Sep 2026 14:45:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A097460D97
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347517;
	b=QyN2GpXPNQTojgqC+/UNYpx66hRRAOV//C5CVu29E0Fu5X20jOTwkALny4EoG641Ivdv
	 hYlcpEkg9rcexySzV2WCX+SeNGixRjcvL4e5rIMFKsdy8QkSyvMj8xfxaMglYgFIXsyIw
	 y+gyaQh86IHJclY3SOIVupo0Eb7d+JJtGNnlBPVxV58vw4cpuL5v7eU+L+ATJmE3Xr8pu
	 TlzxvfGnDQtUWmvLkunr5f5HoC5RFlVtzfI3b1dQ16OM2AptKRQOIn+qtgW09edjxNy3u
	 Y78wRybk7ze/1hvjyeS9iMwRgFaITdzXES9/lCpgEifEHkJFEZj3+4BcYAYPWjKLNnQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347517;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9910ygm+fnXkGx00dvld2lQih8DX2Hq5Jb8YQwxa0/o=;
	b=nqMPO5qgEqMn4XgjzdU9SgGeg1v9MY/LG7HkECgH2exDZee85osyiRjsLmFMzeqU+TEF
	 a/9Nx239HoOwvHpKbA5RH7LOXRZLolq29J57FtzxacshetIACeXdyEZmbEm/XEPU5ngVY
	 ZJLNymR/n7cJzpxKaAIzSPJpwItnHsgyFueonXTkNXCo2OE+EuxLkwzs/tKDimTsxX+Ne
	 qcD2pUsfH+Cj/cY2LEH6ynAcnZYYDCi+p0j6yj9AerWx1UOuwEIth6hqV1gZLs0F/nQ8k
	 rE+jF6Not+GVoScFayRf+LN1FbGjAhNE7NJvWrRXdXze/r5/7IT2KbQO4loKdGm52WA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347517;
	bh=9910ygm+fnXkGx00dvld2lQih8DX2Hq5Jb8YQwxa0/o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MN6txGCyc+5GZNEKhWsc8x5fZnjHscKq3auLv/vLzYnegiQqSGRVgZ6/YHZjCxZ7q
	 DeaQkwMbfIJXLlWcD8HgWcdmCYN2kZZ3LuV0zL8i9O5DvB6jm/V0ZkERUl8YHsqXfl
	 YhgTGDgV3LmbFvqrBvZa6PUvdI0X7q6mLJlptPIbv4FFxNoNIlV8Brn4sfDl1AryCu
	 nOSUuIHi5m05O+kQHohmgU+qukxEKV3plaQ10/MFWJdOlw3d0L3hODH4hEAEFJvWE4
	 X7fsSlYjECwVaK18eGIGhASrosjvtXRDpQ2Moj/nCFdzPLlHI+h9BXiXEyULNniwrz
	 1/NVMvkMstOEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A097460D97;
	Fri, 25 Sep 2026 14:45:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB9FF332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3B5D813A3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dIwdbRwZxBs for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 625C981352
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347513;
 b=PEFQ/HP3jR1psTzz1GnOXSF4mik3vu8/gW71xuv1sTaUgrqr5JU5QC83ZyG0Io2C7xHZ
 2BYzJG8ZYbd7MB7NDSYoe2ZcAScuSyuB4iHYeYItvb8/EnuX2rrlMbCylS2V0c9KIk9w2
 d2lppRtMfg9NL6rNxCp/p6ZafyAlLJhIsCmOmza82rQq+OzxDUBIlqE5EbfEhFz52mROH
 m7WZT1sKLSPOwHU4OX92WqisT8hxpD/ukbdLtW515NMwIhiWLJFS+n9VBEitvAH6wi/nK
 8n0I0w29Rp8J/sdIPvKJjVW2TD6KHe90pt/hyEqa/XQ7vJOFBUwxVzjywgThRRsdjKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347513;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=OfPv3qrl6LCYt8gXCKlssxp/sxNpBAJTUq4PFxy+yvg=;
 b=PVtro6gQCD/Ei4G1aKmzDJuFcY/RyvtS3xySFu6zPHNJEBL+g/as6yHF3xScb4Cbtel1
 iyVFf0CdIS34FbPgQCLjY6zo+cCpRszWEpwoWiKUTjDY7ANg5Fo9FSFjkuebpXsGl7Lmm
 SdYONROAIFOGMxZkR9e5/EVgSTUM0MVywS3O07z92SKOr87URATQqfXQSArGXbH57G5bL
 +pid1CkUKIZmWnDZB8JNCSJ2VXTvaMmRSGZKtpF4/1QThD681hbQvKCdBjCjuE4l4chvo
 NI4ZuDS539kQpZ158vWONW5OBu8ZBiaUWyYD7bYrDaeYeXL0R1dr11KET7hVWjoktcQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WCrApVBv; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 625C981352
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:13 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d391aso7218805e9.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347511; x=1790952311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OfPv3qrl6LCYt8gXCKlssxp/sxNpBAJTUq4PFxy+yvg=;
 b=L9J1l8Uer9q7OBPDzeqFm1GQa0AO6oNEnQTog9Fj8ut7fomuYtEKnFLdjvG0zvuvRP
 4PsrAvPpYe04FMZeC3+C2INAVKKV3tjcaGIgbehUuCW0cxyEGwBvMld5fuvtOiA4tQhZ
 pqhV0U1C5NU6Sn0OjL4v30qcGEQ0+qWtadjc1XFCq/l3ulgrMEv1rTWMmvTOhsBz3xLc
 VWC9glvkCGL8dV+UTzt9lrTRXGChcyHChbIm4IVHDXrjLJPeWdxuHkUHNlyZ9c+1SqzF
 WXAVJDPK7O7y0n3j1Ck9/DI9Y7YeI76MbSARVyizO+oPtNCrYC/0UOOh+oXNotvdDK8Y
 DjFg==
X-Gm-Message-State: AFuF++nF0sMj00PoDykFLg12ijWwYQKFRoefgPG0jktyy8Yfm8FTqmPo
 gzAIlqh3VZARlSnkfzC6THqrwF+n4d2XGe0smVkIDRhPVJeAnlPv/p7w6mQV0+IxwslvN2tb+ZW
 evqP2QSRvXg==
X-Gm-Gg: AYBFou3hoteud792PyRPpPb1D9WA/JVJXKIaAkMg0lMZ4BulgrjmgnZvR+FtFB5EeAC
 b76yy8kejgE4K4TJH4Iv8sb+ZG7kMcN2jbSYhL9RNaluvuYKOrqxEZ/G+VNHI4giSywmC+6NGE3
 X6pp3OUCUd1uqtiKhnXC3geM32LvD4bsrJlgjZnkrOx+j/Ozx0jrog1i112D/Yblk0xM0vSEbAE
 1cVS4GMjVz9n01nnU4/ETS9AH42th62ckVMYMFuWhlCPWcQZKzxL8MYbpNErBy9asICv+fwJnv+
 ZJw4+/br9rQnp9zvWXoGt97E/YMUzxMH+EMjPmyuuwB/adC/d5b07XACA4d1PLO9kVbFDUOHfYO
 U2eETUS925/19obqotgqEDeLw71eT5caNHpguFjUmOLONb3bmvbJ2PV3AFzzTTPcaTzogSYpVlV
 iv24pMYxLkKH/pYw5NpcuU5jHQOpqPZ3zXNP9sDDdU7dozpcD2c+GC88Q13F3I5swJmq7QmuE71
 zky1p/IXKXsryR5p5TThnNkUUymVst/4hsF1WmBuA==
X-Received: by 2002:a05:600c:4e08:b0:499:8b13:3a98 with SMTP id
 5b1f17b1804b1-49fe66c9f6fmr108520125e9.4.1790347511484; 
 Fri, 25 Sep 2026 07:45:11 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fef5f876esm50403025e9.2.2026.09.25.07.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:11 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:08 +0200
Message-ID: <20260925144510.4097346-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915095653.279455-3-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/zabbix: fix build without libcurl
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Building zabbix without libcurl enabled would lead to the following
> error:
> 
> /usr/bin/ld: .../src/libs/zbxxml/xml.c:515:(.text+0x1c64): undefined reference to `zbx_vector_str_append'
> 
> This issue has been addressed in the upstream commit [1] and backported
> as a patch in Buildroot.
> For more information see the upstream issue [2].
> 
> This error is reproducible with the following defconfig:
> 
> cat >.config <<EOF
> BR2_arm=y
> BR2_cortex_a7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_PHP=y
> BR2_PACKAGE_ZABBIX=y
> BR2_PACKAGE_ZABBIX_SERVER=y
> BR2_PACKAGE_ZABBIX_SERVER_COPY_FRONTEND=y
> EOF
> make oldefconfig
> make zabbix
> 
> [1] https://git.zabbix.com/projects/ZBX/repos/zabbix/commits/e8333ca2128
> [2] https://support.zabbix.com/browse/ZBX-27635
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...rver-and-proxy-build-without-libcurl.patch | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 package/zabbix/0002-fixed-Zabbix-server-and-proxy-build-without-libcurl.patch
> 
> diff --git a/package/zabbix/0002-fixed-Zabbix-server-and-proxy-build-without-libcurl.patch b/package/zabbix/0002-fixed-Zabbix-server-and-proxy-build-without-libcurl.patch
> new file mode 100644
> index 0000000000..b90c7536da
> --- /dev/null
> +++ b/package/zabbix/0002-fixed-Zabbix-server-and-proxy-build-without-libcurl.patch
> @@ -0,0 +1,69 @@
> +From 0a29a6b4cfa608e0c2e393125f60f4bbb271e8b8 Mon Sep 17 00:00:00 2001
> +From: Artjoms Rimdjonoks <artjoms.rimdjonoks@zabbix.com>
> +Date: Mon, 27 Apr 2026 12:36:47 +0300
> +Subject: [PATCH] .......PS. [ZBX-27635] fixed Zabbix server and proxy build
> + without libcurl
> +
> +Merge in ZBX/zabbix from feature/ZBX-27635-7.5 to master
> +
> +* commit '142cefe8703dd25afaf8c7f05379d61136e773fd':
> +  .......PS. [ZBX-27635] fixed or includes
> +  .......PS. [ZBX-27635] updated include
> +  .......PS. [ZBX-27635] added Changelog
> +  .......PS. [ZBX-27635] fixed Zabbix server and proxy build without libcurl
> +
> +(cherry picked from commit e8333ca2128bf9ac2ab50ee1ee06445766b6192c)
> +Upstream: https://github.com/zabbix/zabbix/commit/0a29a6b4cfa608e0c2e393125f60f4bbb271e8b8.patch
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + ChangeLog.d/bugfix/ZBX-27635        | 1 +
> + src/libs/zbxsysinfo/simple/simple.c | 5 ++++-
> + src/zabbix_js/Makefile.am           | 2 +-
> + 3 files changed, 6 insertions(+), 2 deletions(-)
> + create mode 100644 ChangeLog.d/bugfix/ZBX-27635
> +
> +diff --git a/ChangeLog.d/bugfix/ZBX-27635 b/ChangeLog.d/bugfix/ZBX-27635
> +new file mode 100644
> +index 000000000000..a8b07470a37d
> +--- /dev/null
> ++++ b/ChangeLog.d/bugfix/ZBX-27635
> +@@ -0,0 +1 @@
> ++.......PS. [ZBX-27635] fixed Zabbix server and proxy build without libcurl (arimdjonoks)
> +diff --git a/src/libs/zbxsysinfo/simple/simple.c b/src/libs/zbxsysinfo/simple/simple.c
> +index 599816c517a1..3bc324a08b1a 100644
> +--- a/src/libs/zbxsysinfo/simple/simple.c
> ++++ b/src/libs/zbxsysinfo/simple/simple.c
> +@@ -25,9 +25,12 @@
> + #include "zbxcomms.h"
> + #include "zbx_discoverer_constants.h"
> + 
> ++#if defined(HAVE_LIBCURL) || defined(HAVE_LDAP)
> ++#	include "zbxip.h"
> ++#endif
> ++
> + #ifdef HAVE_LIBCURL
> + #	include "zbxcurl.h"
> +-#	include "zbxip.h"
> + #endif
> + 
> + #ifdef HAVE_LDAP
> +diff --git a/src/zabbix_js/Makefile.am b/src/zabbix_js/Makefile.am
> +index 1e4fd93d9fd2..2ef20fb9f911 100644
> +--- a/src/zabbix_js/Makefile.am
> ++++ b/src/zabbix_js/Makefile.am
> +@@ -9,7 +9,6 @@ zabbix_js_LDADD = \
> + 	$(top_srcdir)/src/libs/zbxembed/libzbxembed.a \
> + 	$(top_srcdir)/src/libs/zbxjson/libzbxjson.a \
> + 	$(top_srcdir)/src/libs/zbxregexp/libzbxregexp.a \
> +-	$(top_srcdir)/src/libs/zbxalgo/libzbxalgo.a \
> + 	$(top_srcdir)/src/libs/zbxthreads/libzbxthreads.a \
> + 	$(top_srcdir)/src/libs/zbxmutexs/libzbxmutexs.a \
> + 	$(top_srcdir)/src/libs/zbxprof/libzbxprof.a \
> +@@ -23,6 +22,7 @@ zabbix_js_LDADD = \
> + 	$(top_srcdir)/src/libs/zbxhttp/libzbxhttp.a \
> + 	$(top_srcdir)/src/libs/zbxvariant/libzbxvariant.a \
> + 	$(top_srcdir)/src/libs/zbxxml/libzbxxml.a \
> ++	$(top_srcdir)/src/libs/zbxalgo/libzbxalgo.a \
> + 	$(top_srcdir)/src/libs/zbxstr/libzbxstr.a \
> + 	$(top_srcdir)/src/libs/zbxnum/libzbxnum.a \
> + 	$(top_srcdir)/src/libs/zbxtime/libzbxtime.a \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
