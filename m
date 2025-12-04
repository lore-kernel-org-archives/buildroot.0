Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B1AD2A537
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE45F6E6AD;
	Thu,  4 Dec 2025 20:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NL4PkrPuvx_p; Thu,  4 Dec 2025 20:44:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB21A6E43F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764881040;
	bh=ondQaQxoOk8g0PelFRnucptRsIKjFpGa68h+KaXeKpQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F65QlSRdaEjFUqj019KIQptSxQsnAPKjoA0xQDisQxUk5yN8d8DBndy0ejwCb1Llp
	 A+rPgk0KIDTu/jRHt7Ihzm0MlyNt7kLnY7G2r7tuzyDEqpCb3xAobiDYIa7JZD/UHQ
	 XlCN5KhvYF2nVnkxEIC+aA9eNMeM++cpTGcsUULSzQxLHu6pHwBv+Er4kgIe56rTg0
	 IsFagGbIX+NckyuFfTWZXQRwNErxHI+NAy9uR/u2I5wUaDT7CoAQARLvRdI5rkee5a
	 k7o5mGqO2Ib/w3wUOVVDlM8NWi6mD37tG8XgFVwMhniE3CoJTJ7CIP8tt/pyJ3NCQB
	 h/YjQ0SAXtorQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB21A6E43F;
	Thu,  4 Dec 2025 20:43:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DBB11A9
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 442BF4049F
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_kB_VPCNYuG for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:43:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66AFA40428
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66AFA40428
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66AFA40428
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8D0EDB979ECE; Thu,  4 Dec 2025 21:43:54 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu,  4 Dec 2025 21:43:53 +0100
Message-ID: <20251204204353.13472-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251129150114.2732552-1-bernd@kuhls.net>
References: <20251129150114.2732552-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764881034; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Xk0+TDHz4qc26Puhq4MjKzLKddV62pU6fbwajsRHQ1s=;
 b=WgXC1ls6ibkBgCZh/Qk4YF1EsMxOEjQRNhQN/nO1Ta8v0j/z6P7OzXdvLogrSk56YHM0TL
 TV8/o86xOwMgah1QCjlAja9OWsUxtYqzCMojWzPnV/4+pCn3of0JZIzDtVDIAHQFVaNSdw
 VjIuxVVGFn5VxCvy6Bp5wcfgoUmEdkkamNZ6OZqlKwK0U1WPTdLs4ghKg7EMA1iuXustzS
 FKWUVG/2SwPb0t0YtgRpflZbqxA3oJrS8F5Xqg+crqdIfXV/mcNmbkJ0gp0oFpc4Lw9ju+
 WshYwwQu8AqDCvOpjcNhpoAU/1fGo5s69O6nRpCHLQVtdGWeuWTrvDmtM/IFFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=WgXC1ls6
Subject: Re: [Buildroot] [PATCH 1/1] package/sbc: fix build with gcc-15.x
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes:
> https://autobuild.buildroot.net/results/2d1/2d16eb4bb0c7f095d0d52af8553c498f6f9a295c/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.08.x. Thanks

> ---
>  package/sbc/sbc.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/sbc/sbc.mk b/package/sbc/sbc.mk
> index 7a37a99643..115867fa0a 100644
> --- a/package/sbc/sbc.mk
> +++ b/package/sbc/sbc.mk
> @@ -12,6 +12,13 @@ SBC_DEPENDENCIES = host-pkgconf
>  SBC_LICENSE := LGPL-2.1+ (library)
>  SBC_LICENSE_FILES = COPYING COPYING.LIB
>  
> +# gcc-15 defaults to -std=gnu23 which introduces build failures.
> +# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
> +# versions will work, since they are using the older standard.
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
> +SBC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
> +endif
> +
>  ifeq ($(BR2_PACKAGE_SBC_TOOLS),y)
>  SBC_DEPENDENCIES += libsndfile
>  SBC_CONF_OPTS += --enable-tools --enable-tester
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
