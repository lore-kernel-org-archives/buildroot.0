Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBBAC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D49848379F;
	Fri,  2 May 2025 10:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DAbuZsFTgY5c; Fri,  2 May 2025 10:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 195F78385D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 195F78385D;
	Fri,  2 May 2025 10:32:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86F7FEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CE25605E6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eq6CrzjvN8WE for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:32:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93742605D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93742605D1
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93742605D1
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:32:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D00C71C1113; Fri,  2 May 2025 12:32:28 +0200 (CEST)
Message-ID: <739b79e1-7b1c-4e2b-8748-b0af5f17bbeb@rnout.be>
Date: Fri, 2 May 2025 12:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
References: <20250418102922.13048-1-thomas@devoogdt.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250418102922.13048-1-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181949; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WBtvYgjvWZuzhB/d7Y9ZLoIEZP2Ed3YosgiUpIVheNU=;
 b=hg5DWNOn4TvL87hj3H7vl9cDHcc/0ifgIHnHXhW2xD4ILep0GvcPlDC0DfZDDJLc+5x/H9
 5CqE5IWRR5aXllpd2GHif6tqy1hQHcgao/pezJQY7AbR+LyHQmqQnjEJBNCcxjZmjklRfG
 eesBdphrJ4o1X+Js6n5QJSb1qj2qv4jVeKdqJcRpQ37/KaXnOjXWa19Tbps5t6XTLTJGhv
 fCFA4fNioRMZuKeazzaaQqVlLI7LFJdjJloSWj2MZpzOO7ei8vJdkJi/TvKtcDdzx8lvJS
 AEgeSzMzHnmTj2pzHfJpP/U9BSJAhew2cn05y5lXH/dMPNRBnWGiSgIQBYxGSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=hg5DWNOn
Subject: Re: [Buildroot] [PATCH v1] package/fluent-bit: fix missing object
 runtime error
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



On 18/04/2025 12:29, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> $ fluent-bit
> fluent-bit: error while loading shared libraries: libminiz.so.3: cannot open shared object file: No such file or directory
> 
> Commit 527deef "package/fluent-bit: bump to 3.2.10",
> dropped the BUILD_SHARED_LIBS=OFF off part, because miniz uses
> static linking by default now, but runtime execution shows otherwise,
> so revert to fix.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/fluent-bit/fluent-bit.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
> index 013d8d3b37f..768dff7f804 100644
> --- a/package/fluent-bit/fluent-bit.mk
> +++ b/package/fluent-bit/fluent-bit.mk
> @@ -68,6 +68,11 @@ else
>   FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=No
>   endif
>   
> +# Force bundled miniz to be linked statically.
> +# https://github.com/fluent/fluent-bit/issues/6711
> +FLUENT_BIT_CONF_OPTS += \
> +	-DBUILD_SHARED_LIBS=OFF
> +
>   # Move the config files from /usr/etc/ to /etc/.
>   # https://github.com/fluent/fluent-bit/issues/6619
>   FLUENT_BIT_CONF_OPTS += \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
