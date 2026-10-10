Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D97CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E6B160902;
	Sat, 10 Oct 2026 09:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNTZsFxItO2K; Sat, 10 Oct 2026 09:23:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A217760A38
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624192;
	b=JMs7B4IPczJlucjN85niHOsPgQTe7IKovbqsZ2JqNfUNsYcfSdzFZrFDm7UUWT/lDdsk
	 /9W99cWhpEJl9j75V8AXfhGXe3/jTED+JGIK2MunKC5E31Ll/pXRPN/lY8FECYKK8woFK
	 BYEhzE3HMgkyzpkfWp5ct2glmBpDtFZBse0kHyCU4Vyz8i+vp+BByZxkMIRDiO1xPTt8i
	 nrwefqEwIdk+5pFzrAdJBnBucExGBZKttLURJtXTlYax2e0POA7T3rUg38ty2xYPIisg4
	 RB/NraDTgf2QKhA79ywYnGiwO38NYQFQtIzBHDibqDot/W9IaR0TF5eD2Uja5UxlBeg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624192;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ijJFaELlqh4YVaDQ0XXv2mzVqPobKFNOHSBQMcJmiQQ=;
	b=osnMsApKvmDpCANLNhb/w0+OdeC8AYaPqu53RdU9KfFbDotWlRSlzRHIeh8takD7djH/
	 DMs9iE2N21sGeRMqtPWWWVuQ/VyxlNUbzJ56CFc+LWhvLgCE4BfycjnOGcIBoWDpJzUiU
	 pzH259Yf2Tbw4tq69v1WB0BwUYJsfEnmuUSg1zJ7FReUkTJ1ZJKwy8XRM7A6//LKC9s1s
	 IrOWp5eJKZEAMJhCCBZEkoDWisMKCzWtibBtCoK58KCYDV57yb4zmzCfuUllkyoQ0gv2M
	 2JrBEXAth0lH4ISRhtp3JpD5OnksGCR+Y1bzwWlaorXOZOCab/t08ebHp1ZeRw+xS6A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624192;
	bh=ijJFaELlqh4YVaDQ0XXv2mzVqPobKFNOHSBQMcJmiQQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EMLPLXyY2pBrtlhpmEhWaTz/CRrQEA+GQ0/2jXfmEIyTcuaDvQxiGfQTRy2yKLDYj
	 /V/fOMIHIeLcdfS4iQRn/M2hW7GFzBoNDX9KIq/F6LS5nsijqt1ibSjxw5Orr5BGMi
	 0/dT7YkWIJclEBG56bt4GF2UEwoEaFR9pKd0lIHzrorCmV5qgcrHGUDTQeDnZhXfLO
	 Ri1PLwODuax44CZZQhIYEfyhMaYaHqL4FIg6/l1cjqVFola22550GTEfROC0HuIpni
	 dhrDRLbhiFRWvvBWjQq5GtnC/1bzEJMVfub7tFkd9O08J/tw5sI08oi0ueSOkmi1WQ
	 FUFP5jdORx+yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A217760A38;
	Sat, 10 Oct 2026 09:23:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D62C075
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D30C860904
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGEFRpNQg8sg for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:23:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 55E77608DD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624189;
 b=bXJJoDPpRS8jsjzUwGw1UnYkGDlOeCaFKeU+giw0nY4IwVGnnkY9NKrifROLVxoLIJ2s
 X+PEfv2AWB7LES5u6TrnCHY0q9fEze4cPwfPB4I68pXfORxbckLw7qDq/P5TqbZc61r2G
 jpPEMVefhHnNph1plKbPIviqvfP9AlGFLfGxB2UWXK0sLRo9x23RhkenIj9PkIx1VaC+p
 brkxSoaubL10bhatuRn/liuZvSZXY9izyILMY0QGUqTQCyIiErX0NLtr53kYWUJVLyrSl
 TCVQcFC4kWmbWZLb6gxF3UX8R/S/lZJk3sypx16oeqmUGqEmgFL+s0xloQjEJeZSqaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624189;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=Km1LSPcVt+HiJlC3c2N25jamOBBumEySIeMJGxBk9L4=;
 b=QygNTnNZG1QyBzWXYfdJA8BHglkItOZrm7PKOciontF7BYNFpEVYNZBwDfbGqpAvQ/Uy
 xP/zKTkNXm2U5qN896HCPAgAGPp6tACA6ixK6Ykb7DCf7OHMGpWxV+UscFaq/CEJ6lY7n
 ANVT1WnrmEQSufb/Hhl2vmp2G+HwCvCTADyhreNYwH6uA5ZB/xoWE5gRgL5zuJn3ysGN/
 9F7UErySQUAwRLCOigYnc5zMDAMYxcI2wgFN8VTVn06hBSIXycft47CPLW0/dTm+dQIwP
 l3lS80Voo5qX4mW5/2dJNNCmA1IRHsgedSbakBckWUttFSJvok+HV/dqTrYscU48Zlw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fY9Rr5lI; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55E77608DD
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:08 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48c4d870d54so267728f8f.2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624187; x=1792228987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Km1LSPcVt+HiJlC3c2N25jamOBBumEySIeMJGxBk9L4=;
 b=LHtj4klCin/fHDREz62+xFEWotwpJEdbhXdvBHA31p+k5U9RKQldYWAgDYgTzhf/l4
 /NyjzbUpv6xWmYLc/74gkCl2CZhXJi7GLmhkW7jMk1LV66iwBNdlPmnsBjaS1vXWR1+B
 AIGAN4eVugUkhHaC+4gTTVoibojESBkBQ87+/J+JUvVfBvkdv9I/qZIXZZ8vGclsMnXI
 oa2eIJPfvo/wPv8tmuTac9lS7JywqPn4ArRXe/akDUddFkzzH/M3lOGtlcJhk1RIlstJ
 leahYM/S+y89ES+ytrhEnfFHLvytf2U2evHinY4avjepZi18333IktyQ9Pj2U5KYKf68
 mxHQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzFx75vmOmpnll5pHdF15XdM0aGBBMcK4v1MDQk7jzq32X2Ik9O8GGM8/gtbjV3gxTOem+qST30s8c=@buildroot.org
X-Gm-Message-State: AFq9FYLOt502UrKNs6D3D7tAQ3PDcTicnzemz/4e82Q3dM/TpPPShM3X
 CcID6pl58LncDHYXmg7O1eXjtdl8//SfKkuc61PXxsHltAkOe98pJBKnSnO5UMleHRs=
X-Gm-Gg: AYBFou2yInBmounEtbVFACPsCJlaEhpPmOsHpY0W8IOy6tN1Rn+T+GrBE36e9+ZWJ5p
 xJthIfNqgFCClrR9qJ3S9gDCO99x3ow6IufLi87GwV3fdUISAR4b+v530j/hnAx2xxzrWOYXJvH
 xC7YcrFrHl+Y5ELYq5/QYf3Q/Wcy+orpIO4nCpBpGHZl2ZXbpRAjuwjGO11P/zxKj6YjHYU7JHo
 CWRUENfs8g29kGkBoDO4aCCSHLp9YpRHXfxsn9kVfPzb/2/4NBqETsjHMJq2MUZyVcwZRvPYhRg
 qLoGIaf6LzYdJJrmA+ccpzts+KZI0a0eP5MEfE3/CJIiSCz6hZ0BdjiyVQAmE1aSUSxTITAgwaU
 tfZ0hKA/DEjq3J3XxCLJo1Yl/Cqunt9pmfh9Kx06SwzaKqp/+KyoiTiuocoyvqHfqCgpss4MaRk
 QpbxlBfwhEyPDxiGZrqdYxYPXS4zUT8vk9XWs2nYzaWa9tyMts4IOZOWa/FD1gXDJoDXGmuWvev
 6ItM6l1d2l9jOd3C+vOcq+qXeZH9rMo6tR26sPopHJaAmSyu+x5+RsY
X-Received: by 2002:a5d:5d09:0:b0:482:fd9c:3740 with SMTP id
 ffacd0b85a97d-48dbaae8af0mr6856133f8f.22.1791624186904; 
 Sat, 10 Oct 2026 02:23:06 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9ab981asm8133573f8f.30.2026.10.10.02.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:06 -0700 (PDT)
To: Florian Larysch <fl@n621.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:23:05 +0200
Message-ID: <20261010092305.139031-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918123409.22775-1-fl@n621.de>
References: <20260918123409.22775-1-fl@n621.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] linux: fix pahole discovery when
 BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE
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
> Around Linux 5.11, upstream started introducing checks that execute
> "pahole --version" for feature discovery (e.g. [1]).
> 
> However, when building with BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE Buildroot
> only lists host-pahole in LINUX_DEPENDENCIES, so it isn't available for
> the configure step when using BR2_PER_PACKAGE_DIRECTORIES. This results
> in the host pahole being used (resulting in host-dependent behavior), or
> no pahole being detected at all when the build host doesn't have it
> (which will then disable Kconfig options that require it).
> 
> Fix this by adding host-pahole to LINUX_KCONFIG_DEPENDENCIES.
> 
> A similar issue occurs when running "make linux-menuconfig" and friends
> because PATH deliberately gets stripped when pkg-kconfig.mk builds
> x_CONFIGURATOR_MAKE_ENV. Explicitly pass the pahole path to fix this.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=5f9ae91f7c0dbbc4195e2a6c8eedcaeb5b9e4cbb
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  linux/linux.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 3599a10b50..cd80904113 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -125,6 +125,7 @@ endif
>  
>  ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
>  LINUX_DEPENDENCIES += host-pahole
> +LINUX_KCONFIG_DEPENDENCIES += host-pahole
>  else
>  define LINUX_FIXUP_CONFIG_PAHOLE_CHECK
>  	$(Q)if grep -q "^CONFIG_DEBUG_INFO_BTF=y" $(KCONFIG_DOT_CONFIG); then \
> @@ -387,6 +388,9 @@ LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
>  # therefore host-ccache would be ready, we use HOSTCC_NOCCACHE for
>  # consistency with other kconfig packages.
>  LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS) HOSTCC="$(HOSTCC_NOCCACHE)"
> +ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
> +LINUX_KCONFIG_OPTS += PAHOLE="$(HOST_DIR)/bin/pahole"
> +endif
>  
>  # If no package has yet set it, set it from the Kconfig option
>  LINUX_NEEDS_MODULES ?= $(BR2_LINUX_NEEDS_MODULES)
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
