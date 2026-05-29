Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA254CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8185E84511;
	Fri, 29 May 2026 18:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZ3tcd1P41Dw; Fri, 29 May 2026 18:10:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00F3F844DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780078220;
	bh=vBJsRCQpDYg0PRM/Rl0kKsjJhNh9ppnxKCDUEq7RUQw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KhClJszbVo4aSpJcf6+SdXtsmO0n3leDe/6GAhjf/ad5a6i7ps6HesLFr2W9tbudl
	 FeHKox+CSwzznHewasqGIN8JZLQVov/PUqMtRaPmhDMq5Q9U4kcni6qpJRTKCpRQ9b
	 Wc4QragChfFTgv6I+XQKKDu83OnhbuT3yEZFFMfTAvqtIdhiUfU83brqOzAWtQsUmC
	 A45Xq0wKuiO/zkxgeDU/6R7DwShlb5zNMvpnmSK6qHfRpnnF+36WVJ9bxZO8oB2BvC
	 dmeW+WLei2UxrixRIfc+MqqtMllhojr8nPLSj1U6p/G/b0msRCxVO3cx0avfUYPJFe
	 1PZZyG3NBT5jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00F3F844DD;
	Fri, 29 May 2026 18:10:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E914288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D585615FF
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zAZe4LwS1i2 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:10:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E37D61606
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E37D61606
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E37D61606
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:10:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 712BEB97C675; Fri, 29 May 2026 20:10:14 +0200 (CEST)
Message-ID: <bf2f6329-97d7-4089-b98f-cbe7e040a2b3@rnout.be>
Date: Fri, 29 May 2026 20:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>
References: <20260527210017.3567220-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260527210017.3567220-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780078215; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=MIEn6CgA965KMGw2uX5JVZaAoE3d2dX1NP2uxzTbaeo=;
 b=Ns6tZKfm5cHwSpmBpIGdMmmZyS+P75GglydWUDMhpiEvyluG2JtDeimFVmjRp6FWyiQH0w
 F0hoxtpwalB90lTT6i/Q4UdnvNkiNMujN6vdKAnMIPWFtwUvTWTvWpruCyN2A2BqDhyBTX
 6BZiP163bTD9a0Ybdo+X2E0YLlTOcDlrpQWTJ7xRwpoxwVNeT/fxCr9tmuDr1fzVuEbRMk
 6I0mfGhImXEF4zmTHMel0sagEP6GRfbZlhfAXJYxOFg+WGE2AlP/fT+IwNeXhLpH9j/KyO
 7HDP01wD6Nzx0EbgnvxT1iqZskbEoJzNlcdoLUpKEqVSFmq7tz5QzW31RXqKVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Ns6tZKfm
Subject: Re: [Buildroot] [PATCH v2 1/3] package/odhcp6c: fix build with
 glibc >= 2.43
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/05/2026 23:00, Bernd Kuhls wrote:
> Buildroot commit 227378b5930b681c79a13476ae60a98753a98a03 bumped glibc
> to 2.43 causing build errors in odhcp6c like:
> 
> /home/autobuild/autobuild/instance-10/output-1/build/odhcp6c-f19dd37fb467c9cf10cad57aefa0d048312d7dfd/src/config.c:
>   In function 'config_parse_opt_string':
> /home/autobuild/autobuild/instance-10/output-1/build/odhcp6c-f19dd37fb467c9cf10cad57aefa0d048312d7dfd/src/config.c:338:21:
>   error: initialization discards 'const' qualifier from pointer target
>   type [-Werror=discarded-qualifiers]
>    338 |         char *sep = strpbrk(src, ARRAY_SEP);
> 
> Add upstream commit to fix the problem.
> 
> Fixes:
> https://autobuild.buildroot.net/results/efb/efb43d2dc069f5ba9c56816d670a8a2a3682d9ae/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied all three to master, thanks.

  Regards,
  Arnout

> ---
> v2: added result of Gitlab pipeline passed by series:
>      https://gitlab.com/bkuhls/buildroot/-/pipelines/2557223551
> 
>   ...p6c-const-cast-for-c23-compatibility.patch | 102 ++++++++++++++++++
>   1 file changed, 102 insertions(+)
>   create mode 100644 package/odhcp6c/0001-odhcp6c-const-cast-for-c23-compatibility.patch
> 
> diff --git a/package/odhcp6c/0001-odhcp6c-const-cast-for-c23-compatibility.patch b/package/odhcp6c/0001-odhcp6c-const-cast-for-c23-compatibility.patch
> new file mode 100644
> index 0000000000..cdb26a7434
> --- /dev/null
> +++ b/package/odhcp6c/0001-odhcp6c-const-cast-for-c23-compatibility.patch
> @@ -0,0 +1,102 @@
> +From 3b69378125aba61b3391bf5fe607983ce75b839c Mon Sep 17 00:00:00 2001
> +From: Rosen Penev <rosenp@gmail.com>
> +Date: Wed, 8 Apr 2026 14:14:56 -0700
> +Subject: [PATCH] odhcp6c: const cast for c23 compatibility
> +
> +strpbrk is now a macro that returns const based on the parameter. Cast
> +it away when we don't want const.
> +
> +Signed-off-by: Rosen Penev <rosenp@gmail.com>
> +
> +Upstream: https://github.com/openwrt/odhcp6c/pull/156
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/config.c | 18 +++++++++---------
> + 1 file changed, 9 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/config.c b/src/config.c
> +index 54e2d35..c1a3a99 100644
> +--- a/src/config.c
> ++++ b/src/config.c
> +@@ -338,7 +338,7 @@ static int config_parse_opt_u8(const char *src, uint8_t **dst)
> + static int config_parse_opt_string(const char *src, uint8_t **dst, const bool array)
> + {
> + 	int o_len = 0;
> +-	char *sep = strpbrk(src, ARRAY_SEP);
> ++	char *sep = strpbrk((char*)src, ARRAY_SEP);
> +
> + 	if (sep && !array)
> + 		return -1;
> +@@ -362,7 +362,7 @@ static int config_parse_opt_string(const char *src, uint8_t **dst, const bool ar
> + 		src = sep;
> +
> + 		if (sep)
> +-			sep = strpbrk(src, ARRAY_SEP);
> ++			sep = strpbrk((char*)src, ARRAY_SEP);
> + 	} while (src);
> +
> + 	return o_len;
> +@@ -371,7 +371,7 @@ static int config_parse_opt_string(const char *src, uint8_t **dst, const bool ar
> + static int config_parse_opt_dns_string(const char *src, uint8_t **dst, const bool array)
> + {
> + 	int o_len = 0;
> +-	char *sep = strpbrk(src, ARRAY_SEP);
> ++	char *sep = strpbrk((char*)src, ARRAY_SEP);
> +
> + 	if (sep && !array)
> + 		return -1;
> +@@ -399,7 +399,7 @@ static int config_parse_opt_dns_string(const char *src, uint8_t **dst, const boo
> + 		src = sep;
> +
> + 		if (sep)
> +-			sep = strpbrk(src, ARRAY_SEP);
> ++			sep = strpbrk((char*)src, ARRAY_SEP);
> + 	} while (src);
> +
> + 	return o_len;
> +@@ -408,7 +408,7 @@ static int config_parse_opt_dns_string(const char *src, uint8_t **dst, const boo
> + static int config_parse_opt_ip6(const char *src, uint8_t **dst, const bool array)
> + {
> + 	int o_len = 0;
> +-	char *sep = strpbrk(src, ARRAY_SEP);
> ++	char *sep = strpbrk((char*)src, ARRAY_SEP);
> +
> + 	if (sep && !array)
> + 		return -1;
> +@@ -433,7 +433,7 @@ static int config_parse_opt_ip6(const char *src, uint8_t **dst, const bool array
> + 		src = sep;
> +
> + 		if (sep)
> +-			sep = strpbrk(src, ARRAY_SEP);
> ++			sep = strpbrk((char*)src, ARRAY_SEP);
> + 	} while (src);
> +
> + 	return o_len;
> +@@ -442,7 +442,7 @@ static int config_parse_opt_ip6(const char *src, uint8_t **dst, const bool array
> + static int config_parse_opt_user_class(const char *src, uint8_t **dst, const bool array)
> + {
> + 	int o_len = 0;
> +-	char *sep = strpbrk(src, ARRAY_SEP);
> ++	char *sep = strpbrk((char*)src, ARRAY_SEP);
> +
> + 	if (sep && !array)
> + 		return -1;
> +@@ -471,7 +471,7 @@ static int config_parse_opt_user_class(const char *src, uint8_t **dst, const boo
> + 		src = sep;
> +
> + 		if (sep)
> +-			sep = strpbrk(src, ARRAY_SEP);
> ++			sep = strpbrk((char*)src, ARRAY_SEP);
> + 	} while (src);
> +
> + 	return o_len;
> +@@ -555,7 +555,7 @@ int config_parse_opt(const char *opt)
> + 	struct odhcp6c_opt *dopt = NULL;
> + 	int ret = -1;
> +
> +-	data = strpbrk(opt, ":");
> ++	data = strpbrk((char*)opt, ":");
> + 	if (!data)
> + 		return -1;
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
