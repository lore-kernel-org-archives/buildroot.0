Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA8FD2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D358B40B2F;
	Tue, 13 Jan 2026 19:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hx-oU3KU6t55; Tue, 13 Jan 2026 19:46:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 624DC40B20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333597;
	bh=Olx+9KE17OJqK4sN3P7FMNEa1XGniFzti4WibB9lr4w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iZXLrCBcKoZ1c4L6CLcZhfIlHz59p+3nuQM5W6avEi0nOpOu/z1YhvXdJqWDA/K9k
	 8QHgbA8qquY9uTMl+18vE97K43QeQIhfk3dX/uWp2OV0aei9dzE/iCbftqmUvOxBwu
	 xyhXoQfZO5YajHXNdyv3xk4oLpq1px+iq1M0KNp35EUS0oYwe+svyMXYfen0x4XFnn
	 lUp+W4nb2CytVIfN8u5qzyt3A2LIKwKBGYUbJbfkDWZBX4/4mUbGHp7/cLYy7ddtPm
	 mkpv9+bJAGIpuQtYJoGaKSsU/S/VF5y2wp+mfCfs5uksLuYK0cxgjyfySxnp5EgqxE
	 7ucDeKWpmVrng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 624DC40B20;
	Tue, 13 Jan 2026 19:46:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CFDF231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 998A684231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2jo3h59rqXr for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E0DA84206
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E0DA84206
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E0DA84206
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8274FB97A863; Tue, 13 Jan 2026 20:46:32 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:31 +0100
Message-ID: <20260113194631.98662-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229185919.4176115-1-bernd@kuhls.net>
References: <20251229185919.4176115-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333592; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=zbHiFCzlD3Z48lyJrhrD36lLT6dNR7MsTwB/5T77J9A=;
 b=CN40kwqSF4MjaZWKsmIkJ+qTsnknNtPaR/HLhIW8vYXGQRQRJYN3vEpwcaDtOuLbBnvoKM
 +NUW+VUJOnWnzJCOHTVKXK6POoUcecqveaTwZjNJzOEHfIRhJPnraEFLsobfIbAAn2vls8
 jhr9j3TCILq85K9coJjWvv3Gkw2xpq7mWM6FAmAxG6e1zmXEQDK8HUyw73CHMJVRvtjN4K
 bzc9QdhakBWMlYGOoxCCvzTAVFifkYonJ0FZxo1PuLaY6bW7psKj5eg7rWQ3yhgIHSmOpp
 M6dl6FGuUwJnhkN87NAA6/AGf3s6w3HPegLY8C4LET67IqhML3bgkhYACAqKGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=CN40kwqS
Subject: Re: [Buildroot] [PATCH 1/1] package/libupnp: disable blocking-tcp
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
> Suggested by Gerbera:
> https://github.com/gerbera/gerbera/commit/fcf31472239705e7d28af81cbe326f8f416f7f7d
> 
> CMake Warning at CMakeLists.txt:583 (message):
>   !! It is strongly recommended to build libupnp with --disable-blocking-tcp-connections !!
>   Without this option non-responsive control points can cause libupnp to hang.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/libupnp/libupnp.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
> index f29275d2b5..cfa1136db3 100644
> --- a/package/libupnp/libupnp.mk
> +++ b/package/libupnp/libupnp.mk
> @@ -17,6 +17,7 @@ LIBUPNP_DEPENDENCIES = host-pkgconf
>  
>  # Bind the internal miniserver socket with reuseaddr to allow clean restarts.
>  LIBUPNP_CONF_OPTS += \
> +	--disable-blocking-tcp-connections \
>  	--disable-samples \
>  	--enable-reuseaddr
>  
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
