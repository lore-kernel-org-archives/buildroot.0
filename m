Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5234ECCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CEF040AE1;
	Fri, 16 Oct 2026 15:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LtF1j3If-aAF; Fri, 16 Oct 2026 15:04:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 259B640AE9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163048;
	b=a8ay3W1ggLbX9hb8efSz1uWD/V+j8qFJsK7qxd/iohFAvAV+nFV+541TUvKu5W/dkN4H
	 cvYWUGyjdPYGEdSh3HpsiRIrrPCCRxnB7uilLAkdjoNGDaWMaqaX+p5CPt3Wl2YSgQUdf
	 s+J/DheVWiMvCqE+h9eFN5eWyAMGtN38YyFHgtfYOQK4TyohHT58++ZdRS95VmWXC8sJ0
	 sdA7HQqaK4YvuLuR3oW23nC62gdmTFjwi0LuEZWRF4ZUipYMwEJ4IV3nmEbQx2hBFSIFA
	 a/+XhhJ0qK+x3QpfKQys1qHmEemBNX412I6cRTGeqtxrN9ynPj1i9I0tR99LZ4IFljg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163048;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=XWupTyJcDMBzH3e26br0foH/zby92aiWzDqaNfL+5GA=;
	b=PROkawbuMEwM8rxnLe4YSGLmXM/WaFGrCurXQ7rCFOt41o1hb2Pvv/L/38dT123ntYsH
	 FKVExNjf+32OczpEzp47TfTI+iBLxOzVoTWzEW9mbv/E3XWJQkY4443QhrDhT24q3kBpR
	 Zmqw0v9X6FthlYADCD0fCRmR++vtTQ1h9jfsbyHAMSY5lBiWvNpeIux5qGz53k/gGsN36
	 jC2PiS0kxEfGfUn0Ke2OBGVlYzPQ+vNIlTD1fq7MB30VItPy2Fwu0q9kEBVz33nb9MV7S
	 hYKRMgXc30Grvx68oyxoOfPGkBZ/PuEwtvJ25DK+ScZhpQeT9PArn5dJdOY0ztgRoCA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163048;
	bh=XWupTyJcDMBzH3e26br0foH/zby92aiWzDqaNfL+5GA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FoLnPw+3YnaFOZOV6KM/7DAwq0OCTPws4AWCPVOx/p53JxgkadFVcidagJY0GKAGH
	 tcxKd6iGfPW6RGJ9COMPbAtv7pDgmEeT6e8sCLaqv1SsIR29DN4oexqc1HYZDV+efn
	 6xKolgOiGujQkqjn03p5Lgn1+PmjuukNJHauBWzGvAT7Qe5zvsBay2KZFB72m5TiLY
	 /qlJq5wNWvviYE5gMcy05BPQoFJB3Ljj6F907Pp9g5aDL53skilh6UKP+uO8MwGPlo
	 AHp4OJHfnpVG1s2g5QjuRxBDE3vj3nYo/Ytt2g675/SRt4pdyidPR+ZaEQV0VtHgWl
	 kj96yKwnv5jmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 259B640AE9;
	Fri, 16 Oct 2026 15:04:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4D587AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D246240A9F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IENX3N33vkQe for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:04:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C105440A5D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163046;
 b=R+BQ6Azlsoow7fiEqPkK8q9kD/90H3Sa4HFu8/m/9qBJuW7M84NJuj0mCCgDZoyIGDmx
 IgU31p9OpXpinoLM3B7ycDVPPw/cLQ6540yM6TdVGDFlPCw/D/hio235rrzZokPd8QTfX
 0ovOEbUCQ63TPJAihhDVWR34fK2sYgE9XTV/F3mt7NF2VywJiRuwS0fpC1ylJqn0gj3ay
 mB2dOav8540G2aXvx2H4c4lhfCg2aYyOpbxT568ewYaLDRS+0X8ohT8se3Q1NUiY4h1Ne
 ECWRcZ75/Nz27RE9K3uFiBod7FavmUK/nHOPh+onIGqZK81/ShBC+zeahFM6FnXZouw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163046;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ynONZcirzRmQKdtfEkHNR09nLOIOp0Ogc+DM9wjqNrk=;
 b=bCZlOdtwYly/1ohIbvGVkWx2cM4WLmm3OFgcUvf0WY2I9CO+lH46XXKmriyUYoeyS8rN
 WSWvBme5nrA7VEj4dGiUcuf/EtvujWWmHvn5H1LrId6XpeT0vB9u2urxD5HLeAq3Fztws
 MawIuTMomHfRfk3M5Lky6PxA2KlcR8/flzTlXmHXsYFtWj9Sk5dOb30mVYdfLfNIoc9WR
 g7DAy5ptfwOonPv7N7agX8ULLgXD8WgHSVQbSeQl18TwrGVXKP5UwRyVdvnPiny8HrL8v
 GCTTCASVl/6NR+eDKi8d8BQCigzUp//LARfHUrRqqtAM8fc7cPzVP1TxJRrgEiZ3Yeg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hnNX9YFn; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C105440A5D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:05 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso263445e9.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163044; x=1792767844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ynONZcirzRmQKdtfEkHNR09nLOIOp0Ogc+DM9wjqNrk=;
 b=Kgy2lABnxQV0DRPoRk+TRlLIRI0VBpTeCHEq9d2Hl+10XwG8hiPpdj6D/Q8XbOggbG
 SvexoosL0+6X1sLhUmjkbW9h3jlXCeWVZabtIRvQzBeLnfg+x50hwlcU1NPJxby1AmpN
 8nuPEg80qLoTCj52O1lTnZ8IlZGzu6Rhs1WdVh3+JOsEkv7maX96vnSsaoviargGa4d8
 IclyunpktzNF4Nvj5I+Vq55p455Dz1JHfd/GZqdFjZZHEfsNvm44iVBhVMg929MIpFAx
 rWyUtsc8L0XLt6RBiyZ8t5jqlFT6ugzHzmnTmcWI4UgK7OkIAM0B3nvuBrWV7gUt0OL6
 OFwQ==
X-Gm-Message-State: AFq9FYIXua64KovGGUBN0O8A3qtgkwlY/Ad0RlhaE/6Xb1ZBRmhcXoKH
 v56r78jHTiLlWrH1LQleHGn1lZqDYvELqJNvK55BBcKh6WFCVtEJFD0O/3tYJwzTudX2vSlflDZ
 mhSaO+B4=
X-Gm-Gg: AYBFou1gGtSzIgaVL61bFbPu0bdwDasE3RR0RLg+erdnBrcxsfmrFQyM0oSKtDoeOei
 SlNW2qyzOhm/TO50HTsNFdmZkRsLR1CiRhcXjB4rvR0FF+RvcYgeGFXfh74Gs0Ik1jL1a5yHntf
 +iU+84If7pBcLGUdUtUsZtDc0U5FCfIdiKPDVUT9ADHIXqBNmO/4OTVk8PhimtvhJAWZXTfIRL2
 F9YXkNspwbdk6BOZTmWSMxntl5tOZdZ5i/udVc02eVdKZs8SQMtu1LlGEbZP9d/6hTeKT4Lm+7+
 8G5SW/91V2mMLtur6aFfzd9KPMLt0ZuvOiX3LpV0JibvrBnEshvk7iAuwFt452K1/yADAZsaUCe
 S96M5KJ2Q1/XBisQLb9MRZ0aqBWPLTGIvScyJqYlJTYRSPxNncHg2SBvOYWrP0wwA6e1o8qohE1
 VJJSZ9kMTZxV0mgr1SeHbc4J5rMtiWNxGyQFVMhZbX+pmLmuFbq+ND8gXbrf8+rVZ2EomsFWZfq
 7J71OxMtKMbVTUy2jLIp+dhGn2daLxU48PAmqcL1j0BZGZjKr12
X-Received: by 2002:a05:600c:4f81:b0:4a1:d456:ddc8 with SMTP id
 5b1f17b1804b1-4a1d760024cmr1484355e9.7.1792163043620; 
 Fri, 16 Oct 2026 08:04:03 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1d0e2bb8dsm39796425e9.2.2026.10.16.08.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:04:02 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:04:00 +0200
Message-ID: <20261016150402.67354-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260929090753.3570630-1-yegorslists@googlemail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] utils/genrandconfig: reject qemu user mode
 on hosts with large pages
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
> Qemu in user mode cannot load target binaries laid out for 4k pages
> when the host uses larger pages, as the 16k pages of the Asahi Linux
> kernel on Apple Silicon. The dynamic loader then fails with e.g.:
> 
>   GLib-2.0: error while loading shared libraries: libz.so.1: failed
>   to map segment from shared object
> 
> or, depending on the target:
> 
>   qemu-aarch64: .../GLib-2.0: Error mapping file: Invalid argument
>   torque: error while loading shared libraries: libz.so.1: ELF load
>   command address/offset not page-aligned
> 
> This hits every package running target code through qemu at build
> time, i.e. gobject-introspection and nodejs, on mips, sparc64 and
> aarch64 alike, and is not something Buildroot can fix in the
> packages themselves.
> 
> As this only depends on the build host, reject such configurations
> in genrandconfig when the host page size is larger than 4k.
> 
> Fixes:
> https://autobuild.buildroot.org/results/4848e735fe83dfeef4f24d32655c567951fd113a (mips)
> https://autobuild.buildroot.org/results/089ddac5bdaaf5650cbc5c26d48952b5bede0ca6 (sparc64)
> https://autobuild.buildroot.org/results/c30c6719a0350370ebe3cfe262123727f4057734 (aarch64)
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5-5

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/genrandconfig | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 727c8193c4..8437d6342d 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -124,6 +124,13 @@ async def fixup_config(sysinfo, configfile):
>      if 'BR2_PACKAGE_LIBOPENSSL=y\n' in configlines and \
>         'BR2_TOOLCHAIN_HAS_ATOMIC=y\n' not in configlines:
>          return False
> +    # Qemu in user mode cannot load target binaries laid out for 4k
> +    # pages on a host with larger pages (e.g. 16k on Apple Silicon),
> +    # so packages running target code at build time (gobject-
> +    # introspection, nodejs) fail there.
> +    if 'BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE=y\n' in configlines and \
> +       os.sysconf('SC_PAGE_SIZE') > 4096:
> +        return False
>      if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
>          configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
>          configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
