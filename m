Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E93CCF2C4
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 21:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA6A40A8E;
	Fri, 16 Oct 2026 21:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id My1A8mCxjuzf; Fri, 16 Oct 2026 21:44:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4B8AB40A6A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792187069;
	b=iKnvwL9XqbTuld6mV4vQ0e7Q/AL9MPIK5xW+lG1smOExgeXIRW1RJ+TUuyFtkIfkfL9E
	 EtUb2VBRg7qzsPdWjJHsj6jrQvaA/2div0czVeCRruZlQD+x79tQbFREOhT37lJqtcQbi
	 MPgPBPxvEwEK43fUewvfuS/JYdpneJ68DcycsjgfmmebMfG3ZKeCj/AC6NA8atMy9S90f
	 3jO6xDDYxm9COPGUMpNoyQ3jERPZQJLn1Zy1MjQshQc5SbPzmOFsqyfTvO+5ElfasCPsI
	 jHJzsbByz0wrOdaMzK/ANXwXY4mzSzR+lIMPCCcOZhA0jVWHBxmB0xsuW1gqfaAsK9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792187069;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Reply-To:Cc:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=ckzdnRhe1wAn303iSNKoadqaUw2P0ELKbScf7kUVlz4=;
	b=gjLyOxTXj4bzbzIV8H4Zj9DAFRs++3ntc2S0szQyvUUm3KIGHmdGFXw+J8nGoBVl+8BZ
	 cNF+Bugunb+etTwdOVw9a4LP9x43ZTsn02nKaT/YUM37CaWz78wgT0MdgFza5N1cmHV1e
	 TwNVHYzECQ1ajb/qqVCyYJPNKmz4C9NYh4rudrNUgtf/bb/V8oSmxPibHgscojnABePUu
	 YDpjr60BMw5vUhsXQY0xdChOb6i7rSzlogF9oXQgWY+5n5ME1IE9oMriEWaCth6gumCtI
	 1ftpsJhILTRC6ClbkcWFQa/4n0XWNu5p4GHwzC5frnYGJAXWOBPWPs+Ef1mnaB/rSig==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792187069;
	bh=ckzdnRhe1wAn303iSNKoadqaUw2P0ELKbScf7kUVlz4=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=TCmkbm7Dd9cVDkP6lp4NuVsEq7wOL+T4UFFyzBKQCaV8WsBAsIszwmmcHJ/KFsPOV
	 /X/D+qLsqp/DnJ1sMQNiDDasc/sz2DhHx9G6weTXuCEdNV3U5gu5t61nnNfU00dhY8
	 RMgH+rOzSioBAX4UXC4sTlJiM5MY7rH4fOCG3oyShe9zY5OP3Kb2ULfFKw7Lc2zoos
	 sv4GBZVT/0dZasoVGguXy/Vy1aCWAXGtPkQi+yJ0fZp5f7H8SdGh2KbXzlsD8i7S6X
	 t08A3YiUaA3XWp5gqZZwOMMz2MeSsqUGqLZsZDKP7JyKTHaB/90DcXk5Jx37GY2Rjl
	 tfhqEdVIfMwRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B8AB40A6A;
	Fri, 16 Oct 2026 21:44:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C73E79D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 21:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 644D360A45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 21:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfiYfvCs4VUd for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 21:44:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0B568608E7
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792187065;
 b=Qp+IfDYfNhBu5+Js4vGonhy5b6SeSevuPmy/V05yGdZ9P+rKcE0hbfYgx4Iz0JEMwECg
 bf1JGpq+m7IaH48TjV01W0DZ8j71bW3G5favL25pCwS1E7iNiDWI4ECDyKZ/W2TiHlyLy
 K8cniOct4LlqIs8MsFBTMCDDwVHPwgLw2LtqaWZ6v02NmhQsgnvFx2UrP01TKeydUpwry
 eadk+T42vDyjPcpM4kXbA8QVxyPoG24VclsegB5CKHQ0sX8Zi1O/5kD+KlwwI455H1Seh
 CciArUTpjeZZkDVXTkwjQU5S6g9XtMB5mt/6pLM44y4/TcDLrYFIeHbkIbJU/894l1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792187065;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:Reply-To:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=a/MZxlCB0EkQi6PK4jbS/6TbY2LcdMmsnDEwlluQUQA=;
 b=gE+QT1Xeehq81HSliUmgkbPxzyoAzP8Wf5dg/LIefH1X9KRcL+Zg+qnwqma8vbtjsujq
 wEFHRXoa0hZnzoKlU++3Lrm0tc/MZbBGwKyE85gRqrtRYfzte3Zq1oSJ6sZ9J517BIvIu
 x9d009WhLG16fsNbh++GMnzLWSdAVIM9IrmOqgXsP9wBwPe5sZMIh6YgVdrHCosOFLWth
 tEhd2r36N6ZH1jAzHgr3uKl7/KhH92jPOb9V85vy7mKaIgdpoWxe9ZT3soO4DC+ioKHqQ
 WrWXIxaEngbl1XbDzOa5a4GSpEyz22YP7Bqb5jmiBLmULLvvz4eKobGMazjmHf7dCcA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=SytMAFsW; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=SytMAFsW
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B568608E7
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 21:44:24 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a19cba5c14so3585645e9.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 14:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792187062; x=1792791862; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=a/MZxlCB0EkQi6PK4jbS/6TbY2LcdMmsnDEwlluQUQA=;
 b=SytMAFsWgxl8ib73iQ2HRAJNBXKga8V5hSPTq9k+XkVzbPZufpvhk4lWKfX8gM5ln8
 Q9JPv5k2QJTGXFo65B8OVwY+xjv5xeYIFE4NGrn37nFjJV7YS5NpwOOmh9zcXvd/i1WL
 2Kyw4Ksn8MdiJPdbAzgXOM66PVCBbscXPmxkQraByZlTkHRns0LHagTKEJ/KsPkd37Dt
 ljxNPz0UgWC1bGi+s2Gtb5T99MhEKRndO5Umb/a/QZUPCfSc87lnraM6TG8cCQdNLmJE
 5F8AdmQvENUaW6u++ZNqrk6d2+ZrLJS8qODPFPeD5w38YQV3SNbwEfSFtclZJMff6hbR
 D31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792187062; x=1792791862;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=a/MZxlCB0EkQi6PK4jbS/6TbY2LcdMmsnDEwlluQUQA=;
 b=bfSJ5s1YUy13ymNYUJzuwMeJMB9DMzRhGBxKRHnlt/qt9T1Pes2v/r4GW0YGO5TgQB
 uQ1WLQ70QRV6K66b9oCLTQEdneDF0k+b1KQTEGoeZaitQyCdJZ5yeEFOxRub5INhsKW+
 2wuVW7qnTx3VvBpPNMIO3nBpGjRaNBCIjvEkpjfADqEjVFnqFwEkg7bOWctXs7GdI/9Y
 xUZDZ31SebqEcOYXCsuBKY+kqYUcsvvZSDJxt2MPirwesfrn7vhZSa0+7wneVsM81SZ2
 AuJLAzb91NG5bJUEh2aMZzeCrpao1fnRyrW/fwcxPrGFO4b2rWtx02O7DKHArfa8EFKG
 QOpA==
X-Gm-Message-State: AFq9FYIqNhNyEz9tkedPW53iKMusLMqVzZV+I7JyGhJ4eJ/ZzgI77Ldm
 ax4tbNzAZPhZ4cll8qqOlJoBC1Dr6HCUrPpEWhmIXhvTldVXLYhaMeyv
X-Gm-Gg: AYBFou2aCJI133UqdWORqvnPktBcZYZbjBm4oeLmiEF6BkVsj+cbKRoYlr6lMBgj8Ra
 mog9yq/7Hl9ApgsEH2a+TWMqWWLT6fhqNGj+pHBOG7dcxC1XqgxVxKgolHR485rhMMVZIJ/OmDH
 N5aZ6TgcFHmnl+bqiSFqHKDSE9tihqYFDGySjLaGefK5CzM0Kbh+k/4P/3uu2GqnAuse1RfIVj1
 iiJGel304jgLa0i0o3ovrLGdOvJ4BghGlLDDnsVtD5mtw+qvVzsJT3HcqtK6A5Z9Sq66fVUJYhT
 sz5xLxLD1nuN3EVdLFL+RUt2xRcx0vR42uk8yEvqBtBwkT/iD3/7Hqd8HQ9EahCuOzywS88OA4E
 04YTIPhgqqul+dC+4+lwZ7VE8oNVp02pFOVKEKnjja3eRabp4UQKXkhzBBgvuiS0ZGy4SVULoAc
 yduWYbmEg6lF5HU03mnzRZf7bp7tqJrtPU8Ct3DUdZX0oAzsnWd6cv/l2YqrUIA6qC2IDEZ53jd
 qxhaxYN81dvejeLYv2iLDy/LKH1cnbduC5+
X-Received: by 2002:a05:600c:3b22:b0:4a1:7690:d878 with SMTP id
 5b1f17b1804b1-4a1d7615cb9mr21856295e9.17.1792187062329; 
 Fri, 16 Oct 2026 14:44:22 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1d3e2e602sm54682515e9.5.2026.10.16.14.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 14:44:21 -0700 (PDT)
Date: Fri, 16 Oct 2026 23:44:19 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20261016214419.GC331129@pevik>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
 <20261010151121.876133-8-titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261010151121.876133-8-titouan.christophe@mind.be>
Subject: Re: [Buildroot] [PATCH 7/7] Makefile: add new target "yellowconfig"
 based on kconfiglib
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ps.report@gmx.net, yann.morin@orange.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

> As informally proposed during the February 2026 Buildroot dev meeting,
> this introduces a new kconfig user interface based on Zephyr's kconfiglib.
> The name "yellowconfig" is inspired by the yellow-themed curses interface,
> as opposed to the classical blue "menuconfig".
> Read more about kconfiglib: https://github.com/zephyrproject-rtos/Kconfiglib

Interesting.

> To run that target, one has to install kconfiglib beforehand,
> for example by issuing the following command:
> > pip install kconfiglib

> In terms of user interface differences, Zephyr's kconfig brings:
> - searching symbols as you type, and more symbols are visible in a single
>   page of search results [1]
> - symbols that aren't selectable (because of unmet dependencies) can be
>   viewed (toggling them on or off with the key "A") [2]
> - symbols y/n dependencies are displayed more clearly, each one on a newline.
>   This is especially appreciable when there are many of them, whereas in the
>   classical menuconfig one has to scroll left/right to view them [3]

> Having this as a new make target allow for Buildroot users to try it out
> and forge their opinion on this different interface without breaking
> habits and usual workflows. However, in the longer run, this could possibly
> allow to replace the custom-patched kconfig programs we ship in Buildroot
> with an unmodified upstream supported codebase. If this proves to be useful,
> an appropriate distribution strategy for kconfiglib must be determined,
> such that it doesn't need to be installed externally by users.

> Moreover, as unselectable symbols can be displayed in the interface, this
> would remove the need for comments in the like "<pkg> needs <condition>",
> where we need to invert and maintain conditional dependencies.

> As a final nice addition, having a Python based kconfiglib allows for
> programmatic access to kconfig symbols and settings in scripts, which
> could be useful in testing scenarios.

> [1] https://gitlab.com/-/project/2648174/uploads/8ae29a772927e7e555f85f6d31876bb4/2026-02-04-105501_958x1015_scrot.png
> [2] https://gitlab.com/-/project/2648174/uploads/8d27510cf738cab9fd95ffdd81f75bc9/2026-02-04-105514_958x1015_scrot.png
> [3] https://gitlab.com/-/project/2648174/uploads/6d51a4b608fce076ac8c0c84623531f2/2026-02-04-105522_958x1015_scrot.png

> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>  Makefile                    | 6 +++++-
>  docs/manual/quickstart.adoc | 7 +++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)

> diff --git a/Makefile b/Makefile
> index 7fa3ce4890..8fa95a86a6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -122,7 +122,7 @@ export BR2_VERSION_FULL := $(BR2_LOCALVERSION)
>  endif

>  # List of targets and target patterns for which .config doesn't need to be read in
> -noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
> +noconfig_targets := menuconfig yellowconfig nconfig gconfig xconfig config oldconfig randconfig \
>  	defconfig %_defconfig allyesconfig allnoconfig alldefconfig syncconfig release \
>  	randpackageconfig allyespackageconfig allnopackageconfig \
>  	print-version olddefconfig distclean manual manual-% check-package \
> @@ -1017,6 +1017,9 @@ gconfig: $(BUILD_DIR)/buildroot-config/gconf outputmakefile
>  menuconfig: $(BUILD_DIR)/buildroot-config/mconf outputmakefile
>  	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)

> +yellowconfig: outputmakefile
> +	@$(COMMON_CONFIG_ENV) CONFIG_= python -m menuconfig $(CONFIG_CONFIG_IN)
Please python means usually the old 2.x.

$ make yellowconfig
/bin/bash: line 1: python: command not found
make[1]: *** [Makefile:1021: yellowconfig] Error 127
make: *** [Makefile:83: _all] Error 2

Could we please have python3? Ideally allowing to overwrite it the same way
Linux kernel Makefile have:

PYTHON3		= python3
...
yellowconfig: outputmakefile
	@$(COMMON_CONFIG_ENV) CONFIG_= $(PYTHON3) -m menuconfig $(CONFIG_CONFIG_IN)

(I haven't found where Buildroot stores the default tools, I don't thing there
is any file).



With manually fixed:

$ make yellowconfig
/usr/bin/python3: No module named menuconfig
make[1]: *** [Makefile:1021: yellowconfig] Error 1
make: *** [Makefile:83: _all] Error 2

@@ -1164,6 +1167,7 @@ help:
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
 	@echo '  nconfig                - interactive ncurses-based configurator'
+	@echo '  yellowconfig           - interactive kconfiglib-based configurator'
=> could we mention https://pypi.org/project/kconfiglib/ at the docs?

And/or in a fallback of $(PYTHON3) -m menuconfig $(CONFIG_CONFIG_IN) (if not too
complicated)?

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
