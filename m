Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47CBC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CA7760F2C;
	Fri, 18 Sep 2026 13:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7lZ-jlHJ1nj2; Fri, 18 Sep 2026 13:08:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C225060ED6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736912;
	b=EyHrpXIwdWvHEefH6f/pDhd9o7ReumTByntK23nvJunZ+h7NaHmdIPqr6vskEPvNqRvI
	 IGxuPq+TKDlrOlPAXcSe1610lWr1wJcd9dskcYriVOmwIhh4R9gI9W6EszTUVQ6HaGTxB
	 GUI6tJzwX0NZ6xJ5zcJxX5ezeuJDeyrXSE4nia5OS7dNaB+ckrUGYDwSS8hWgUAyPXU1c
	 e6LbJKCFzybGzrtZyFXgkaxr2D4EPjTFu85Hm7zIUsrF6UgtLqh1+sG6W/n8fSKJJ09f1
	 SFuZf/T8JNMoSV3SaenpKfn+efsc2fCFdckyGRyUekbcrcHsQ6YslRO+CUHhse+1ACA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736912;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=T4ZFmuwW1ys4U32QmYkqah6ohKkNzPCgyxuRsQ3DV+Q=;
	b=OQl0tzTMxv22qFNLWMlyAcjbea6R7iWlqCw7CpUyk5SRUur1rLNKjqli7UsmK5V2nWOA
	 hTqR5MEFyQC882ReFqO9HHKBSO0GTUI8RRoHmABubxfM81QeMWbHS76V6Ztbu9au27h8O
	 4z+501oXbhHKxmS6HuHDHDP0c2Wn9+KeSCWm9Fajn/qYAl6GMaqghX8k/TypWjZnC7KKm
	 enJ833ziISrzLEo7EbFvX9yxJmJudZrSJmi6D6KGM17wp/+0cjfrqqU7mH2WLJVgcTxw6
	 XFSFZAjvZ4gcWnLXx3AH3eNIqTbBHnzPGGv1seqoq+NfJgQZ6JFR+9T2q+C6qCE0qPQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736912;
	bh=T4ZFmuwW1ys4U32QmYkqah6ohKkNzPCgyxuRsQ3DV+Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TINCm9DFL6UFFYdDqnQK9LhOWAeEF/OmDqIAhI7nWdRpcE2KB81iQTJ+3mXdwprmm
	 rdhpg5S0tgavrE9lqHR13c26UgmdLQN3osyM9hHBeBHpikb+iZcyam1/GkKvs1V7Jv
	 4HTt95fF8mbn8DyMgWGHSq6a4wP747LsOMUsVALIrYBI1XnvsaBrxj7yEeSKyx4bKK
	 YQl78Opb49qrtwuF3sgCzx9UDH4skDimKbAO9WQcIhhh0QMEYSrLZGtAzoJbtZ3eqG
	 CbSAtnrbcuXAqDnqZC1xlekeDkuleBS5sOAzUn/uencguOYYNsU4RWHXkNTBs28T7A
	 1f57sIRVYl62Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C225060ED6;
	Fri, 18 Sep 2026 13:08:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FEB313D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7162A60F08
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKED5Au49EhN for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:08:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C42DA60EFB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736903;
 b=iNMzhG6kAyTfLgZqDkfg96D1K2bn4j9c8sdDYO75vwX3cVA2/H/EjQQj5CPo8+Rvv/IY
 UAbvmQsnTvL3gp3M5h60G/RThQ9YzpiKxoqg0xJn1BNOYD4eTKB00SGfakWIu2HmdM5+2
 5YXUnuR0Qpvlv7y64SqzCeeDZMVLLcO2dvkuN+QaBy9L8n3pAk9sU5v7zdBDRHHXQgcmZ
 Ag0sHoJmRf62Dfb748oN169gjf+VUnfF7f3wSraHqe9L/XsZ28yM4yLEkXRVivO+Eg2g8
 AqYfJ3lvheq0t7dc5QwwWMDjMyR77vCOBOHc7XA5soIWgoxBwkGwIdFVRcOx8j/VSyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736903;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=0doG7CH0K0WH5vu0RQDQ9wdiEOdbs6PQ/m1UnVObnk0=;
 b=pigAV0MMNqUGryBJaBQFjEaO5Jg1kVtIo5eAMiUV/geB4JrO0JTJcqS6XS12aYtef2xi
 CnFM80o8qDSsb/jg51gL1CIJycBJ50m9axuGQAEQH+yVSEL70/HSa4QbLUp98sljsu5IQ
 L1uhS99O/1zvIjJIzbmDqe/bINtcw5/3Ed3FwY+GYNaPqIp85P8e9s4XUIIRFGhn9KxwR
 ytkNJgrePbrXCVI89WF382JBlGrHnuT1MPHOUSZyb2XXFe0S7ZaTuEXI3/MFj8/cMptBw
 JIyrPsJtGkGFEsAIOzGl3u3FUg3UQHkINs6SoMdIk6ykBRzGEtpzknhnky6lh1McotQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ggq0Ze4r; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C42DA60EFB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:22 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912d8239so5459545e9.0
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736900; x=1790341700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0doG7CH0K0WH5vu0RQDQ9wdiEOdbs6PQ/m1UnVObnk0=;
 b=zNqUfJTMOF2GRdkolNBJsmhcTdXYfDlHe4R+Lfn3HUEO8+h275wQP68tJdOkx39EpI
 GKrkC6cR13DDUzIuHGDpOoq8HNG5MyaSSk8g9QHPdinLnkca6bu2vqQUDflaoWCwnPB4
 QASLMlbdR1ars4Kj2ttkDpyNWqegpCvTUM5WW7nEkVswpRE29Js1XtK90h2zBFRf5F3M
 mQ1PCblW0DhvsY+yBZpaqxHHZcwTvPcTmXPrUSfXZ1hNWbXvYGSLLKabiyHeqNEMAgv8
 FUL9iC/gymPQKI5+YoaM3NprPuQJgsBcyNyNETc477HqrI5CvIRJM+VoAUlvnoAPWop2
 XM2Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBx+q3nClEEzOeVVMxE5TDePRMj4XdS2Du/TGHBy2poYcjFusMUNJbFaMldkRWzvZdrbvF2ZRxz5OuI=@buildroot.org
X-Gm-Message-State: AFuF++nHLmDKLiek0JlV1cNGtf/6eV/nTpRT5pkBd47Nu39NXPpSTOgn
 BbgztZl0rHZILDNTgDDR2jl1WXsXfZQmUHEezT0fLu6v/aeLGBJh2X9hqJdb6H/bSZPs0EJy8lG
 GvFna
X-Gm-Gg: AYBFou0d+4qse5FQoW/pJ0Jq2NS95CRV6PgvDeVJnRZ6UUpYiiGwzDaxFy2GnyrqOlM
 qMsD+/K8uAsaoLbYNWUBQqD9lFCufywdejNRovy8C8QQ8leabUDy0QbqI/Q9E2O4p8qnHsx7s+/
 5XaYZsgD/capMPApHoJVQq14CGJs8wj16gtMSPm3DPvdZM8/04POUUwaJLhdt8Xhzpv9mrGE4r6
 9xxEji9iTDEzWpKfzqFbxmyGsW2PWu0zNjg0UbyJ4OmRPB6mZzFnouH4ymWSAKmo+XD7GttkDPE
 BlGwe989vPHsgK/3aoLjX0QW9xnpBws8S0klfvEpnFA3LDgh3PoAjv+Qn+5TiBi35s5Qv1uxYst
 XjMEWAsGD8EHKjnjeK1yPoF8XU839kkwE5316EEfEl4qVTzBK2bFfj95TS+Fx9WttqOTECxPkz+
 oIQ1L7M/xRf8087m0+9tVMQr3Zmda4f2YYprhhDSlWFCj8MwWVfoyxs2mqHIq/M0ws
X-Received: by 2002:a05:600c:3f07:b0:49c:dada:30b7 with SMTP id
 5b1f17b1804b1-49fc5672704mr32086855e9.2.1789736900469; 
 Fri, 18 Sep 2026 06:08:20 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd232d5bsm158632075e9.12.2026.09.18.06.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:08:20 -0700 (PDT)
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:08:19 +0200
Message-ID: <20260918130819.161882-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910230816.1937334-1-aperez@igalia.com>
References: <20260910230816.1937334-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/xdg-dbus-proxy: security bump to
 verssion 0.1.8
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
> Fixes and issue that caused broadcast messages to skip some checks.
> Release notes:
> 
>   https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.8
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/xdg-dbus-proxy/xdg-dbus-proxy.hash | 4 ++--
>  package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
> index e5be1f0cd3..bbc1762acb 100644
> --- a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
> +++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.7
> -sha256  3ad3d27ba574e178acb5e4d438ba36ace25e3564f899c36f31c56f82c7adbbe7  xdg-dbus-proxy-0.1.7.tar.xz
> +# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.8
> +sha256  b6630bd24f8161b0e2546d2acbb014a3b3249f5c0d75f2a863ade898b9034d3d  xdg-dbus-proxy-0.1.8.tar.xz
>  
>  # Hash for license files:
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
> index 6c3ef5c9d4..7f9fe16f28 100644
> --- a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
> +++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XDG_DBUS_PROXY_VERSION = 0.1.7
> +XDG_DBUS_PROXY_VERSION = 0.1.8
>  XDG_DBUS_PROXY_SITE = https://github.com/flatpak/xdg-dbus-proxy/releases/download/$(XDG_DBUS_PROXY_VERSION)
>  XDG_DBUS_PROXY_SOURCE = xdg-dbus-proxy-$(XDG_DBUS_PROXY_VERSION).tar.xz
>  XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
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
