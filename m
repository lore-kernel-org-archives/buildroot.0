Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C89ACD6E54
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 174C7852A6;
	Sat, 30 May 2026 12:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ho5_I1RrKAg2; Sat, 30 May 2026 12:46:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 410BA852AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780145176;
	bh=pr5CnIXyToEnDrcSMYN3BN5iswGg8n7v0jVPnmc92ic=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=oIA4TOyGtDL25YkfCSbvLkYoiy7Hf8UXlhm/cBh6ToL4NnHR4GUFEMSf1t7uLZUUk
	 q8duRTsyzjEfSZLCQTcJb09tsLvYZ4KdsDEMJYH+VwOWB1TZOp+UNYG0KVhEFIIZJ+
	 n8CcOQSXc7w/2Sae5tkWtP4oIudy/Ua7y3XvaS5g4TilQvvNMiRcOjHYu96IY3OOUn
	 IHPXZABNqgxq00+CVIprac7T7o0TEx+liGx1/MTd+c4aKVwmIC9zdH5c/ZRI6vF/qZ
	 cfAyCBfykLFw8Spi0kbwWj0IO7/z27Ihrcv0KwViqpblsC1Q3L28wr8Lp2wkdfji+7
	 JWYeevGUrccTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 410BA852AA;
	Sat, 30 May 2026 12:46:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C4D6F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 128AF412A6
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MuaPmXFDB5p for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:46:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F9D940C07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F9D940C07
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F9D940C07
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:46:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7BBF4B97C70C; Sat, 30 May 2026 12:34:56 +0200 (CEST)
Message-ID: <410696ed-2c91-4d32-bebe-d437e0a187b3@rnout.be>
Date: Sat, 30 May 2026 12:34:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260503144908.2807535-1-bernd@kuhls.net>
 <20260503144908.2807535-4-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260503144908.2807535-4-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780137296; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=mFc+kLKXGXc0nMJZ0Qxx3ethALMtKjgzCSTkMyCazlg=;
 b=fNx9wSPEGm5pFWea7P8CapOKG1zUKHkoURIitIdsfl8GyYkbEPtnKyITDWA07vavrheOPp
 VIM6bf8PEvlQwLZPujG6WnLSFaC+szI1ZWO1X2b3NTnuYhrKWpGf6mu6fMDZ/4ZUvwp3tW
 OQVlHAJzhgBATUJ9OtCgNQ1SJFhDiTM+9WmX+QZMURRO3PSVXqQXWWEsebrfCElEYtGE25
 OedjzyCOX9FFf2C4tfMny8iMn6PZlM2bh8LgcvSP3+Ky2u1UWZTM2eEVeBMfZ+KiH9JgtD
 rgMCoHRuwlj3PBp4oWWeT3g+mbxH96oHJE+uwPuj8IFnLEQME9i8QHKyRaZMNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fNx9wSPE
Subject: Re: [Buildroot] [PATCH 4/4] package/gdb: hide version choice for
 14.x for gcc/host-gcc >= 10
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



On 03/05/2026 16:49, Bernd Kuhls wrote:
> We need to keep GDB 14.x for setups which use gcc <= 9.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  We don't want to keep on dragging this old stuff around. Just require GCC 9 
for gdb entirely. That allows us to drop all of those somewhat brittle dependencies.

  Regards,
  Arnout

> ---
>   package/gdb/Config.in.host | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index fe639a4019..172446c70a 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -52,6 +52,7 @@ config BR2_GDB_VERSION_ARC
>   
>   config BR2_GDB_VERSION_14
>   	bool "gdb 14.x"
> +	depends on !BR2_HOST_GCC_AT_LEAST_10 && !BR2_TOOLCHAIN_GCC_AT_LEAST_10
>   
>   config BR2_GDB_VERSION_15
>   	bool "gdb 15.x"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
