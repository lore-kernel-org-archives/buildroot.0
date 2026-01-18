Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB99C9832F
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 13:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C19961C00;
	Sun, 18 Jan 2026 13:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYYpkRDZv50X; Sun, 18 Jan 2026 13:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A93C461BFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768743594;
	bh=8bWJ+mh0H6MbIy5Ye7NyCHEOOKLj5vyBOUmHFpGXmpY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ciVgP70Fo8Bw8gEcLUa7hu/NKMI8aVaQW/+U3X0uVqX9yHdd5NGWlzruDWLs8LUe3
	 aZVDoj33F8MYHTgL07u1jZGHezwxYDea5AW4ybSE48kx0zbt74xeYxr84u9b73EE8o
	 qGZ/uR4FLcIY9UzG6Rk5INRSRqOzHvzWIAG13SX+aUztZxav1fs/cq+szsAvcYy05v
	 bGEeOm/wfCyvUet7mx9bspoXEVBD86YQ3xlv00t8FhyKXSbgQIYvymfhMCSU2diASh
	 3chnSG5HFMuV6gyD3aLESlN2YbBeeYtjfs30I5gqVHPuSscssFZGVAU9lTnUuZ/Aq2
	 Nyg+Qu6ef39Ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A93C461BFE;
	Sun, 18 Jan 2026 13:39:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1E8F347
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 13:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E12C561BFE
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 13:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIRClA1XcaKO for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 13:39:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3467861BFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3467861BFB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3467861BFB
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 13:39:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.111.92]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N63Vi-1vsFcj0UAK-010r2Y; Sun, 18
 Jan 2026 14:39:49 +0100
Message-ID: <3e3a0ada-ea55-4165-b23a-902986a0ab4e@gmx.de>
Date: Sun, 18 Jan 2026 14:39:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260118114734.955796-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260118114734.955796-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:v38ilTmU8HrINr1FLCEgF7p6MfeUb1G2YV9fe+q7Vh0CDSiTGM+
 cMaBWmd6+QAfL+LPOGtHb7Lgw60ZdlMzcrZJnuIcmQb70PPWwpgWMimnZqmRuItgLekomuu
 rPVvhi/jWJnvHqvWFBDJtSMG7V91GwQ9TOfhYJXj7Z2KdK7/CZtot/rndxzwsQvTzcuXC6y
 Hvhhvxk/phnRmrvPahK+g==
UI-OutboundReport: notjunk:1;M01:P0:IjePn6wVpU0=;yMYiPPrRtLh3PH8A964j7+8GkKh
 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
 GOi1YKZKDYh4ykCvvqGjsvO3RwX9V
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1768743589; x=1769348389; i=fiona.klute@gmx.de;
 bh=Vr1zuLQAfAhSQ+S38jqN3bpW6nDBV0rC2qRlUrQX2cY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=JobmhHLRctqi3o0ZwdUKwQm0/fsQ/lE6TiWKWVmItpnU3YSjbQcl47Jyp0wbGgdb
 OPyExgGPw4RJT5CT8bkb7bfQoyWSio3V1sOVKlmn7S9AupwJJaprYaysXeov3AYjK
 XEVFDm2hm9mChJ4DaO5ajEJVcQZtvT7BXFAX6G2xKCYisIrh26mbne5qRIOHd7d1b
 BsfJH9LAOG5ywYwmKbxfqx1AO88bmTYLJmlFR+b5fVACMSk3d2KOS3AqndTjUbccx
 nTxtz7CF41r7lgeWrRPHBiZKFL5Z0hmN6Zle4pxzl4008kLfXtAwWuIGXssRzuuHT
 15+JmmLG6WcpLzF4WA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=JobmhHLR
Subject: Re: [Buildroot] [PATCH 1/1] package/screen: set socket-dir to /run
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 18.01.26 um 12:47 schrieb Bernd Kuhls:
> Buildroot commit 4769724ee2bebd671f6a9372fb8922a8c22c5079 bumped the
> package from 4.9.1 to 5.0.0 which includes a major rewrite of the
> configure script
> https://cgit.git.savannah.gnu.org/cgit/screen.git/log/src/configure.ac?h=v.4.9.1
> https://cgit.git.savannah.gnu.org/cgit/screen.git/log/src/configure.ac?h=v.5.0.0
> 
> Upstream commit
> https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=78a961188f7da528c7cefcc63e07f35f04e69a93
> added an option to configure the socket directory which defaults to
> $HOME/.screen causing problems with read-only rootfs:
> 
>   # screen
>   Cannot access /root/.screen: No such file or directory
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/issues/123
> 
> Updated project URL to https.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   package/screen/Config.in | 2 +-
>   package/screen/screen.mk | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/screen/Config.in b/package/screen/Config.in
> index 81a9bbe4c3..453950bff2 100644
> --- a/package/screen/Config.in
> +++ b/package/screen/Config.in
> @@ -14,7 +14,7 @@ config BR2_PACKAGE_SCREEN
>   	  ISO 2022 standards (e.g., insert/delete line and support for
>   	  multiple character sets).
>   
> -	  http://www.gnu.org/software/screen/
> +	  https://www.gnu.org/software/screen/
>   
>   comment "screen needs a toolchain w/ wchar, gcc >= 8"
>   	depends on BR2_USE_MMU
> diff --git a/package/screen/screen.mk b/package/screen/screen.mk
> index 74453faff8..c7411ab6ca 100644
> --- a/package/screen/screen.mk
> +++ b/package/screen/screen.mk
> @@ -13,7 +13,7 @@ SCREEN_SELINUX_MODULES = screen
>   SCREEN_DEPENDENCIES = ncurses
>   SCREEN_AUTORECONF = YES
>   SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
> -SCREEN_CONF_OPTS = --enable-colors256
> +SCREEN_CONF_OPTS = --enable-colors256 --enable-socket-dir=/run

Won't that break screen for non-root users? /run is usually mounted with 
mode=0755, and changing that would likely create security problems.

I haven't checked how far you can use environment variables in the value 
yet, but in principle I think something like /tmp/screen-$USER would 
make sense (with the same permissions as the default).

Best regards,
Fiona

>   SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
>   
>   ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
