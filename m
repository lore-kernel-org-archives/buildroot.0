Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D37FD10BFD
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AE4F40324;
	Sat, 26 Oct 2024 14:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YlFyfBhU_tI; Sat, 26 Oct 2024 14:42:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C600140327
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C600140327;
	Sat, 26 Oct 2024 14:42:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D58965C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE8B76067E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIZ3Y6cXn9xS for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:42:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C7F2E605D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7F2E605D1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7F2E605D1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:42:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3D77C0002;
 Sat, 26 Oct 2024 14:42:46 +0000 (UTC)
Date: Sat, 26 Oct 2024 16:42:45 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Bart Van Severen <bart.vanseveren@barco.com>
Message-ID: <20241026164245.4d0a4372@windsurf>
In-Reply-To: <20240920062014.132862-1-thomas@devoogdt.com>
References: <20240920062014.132862-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729953767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZaO0907L1sJ5F42isCvxeEFQT3IFnWLJUxVq6zgavA=;
 b=K4rY0bSBZmWg2Ei1hifcOg2KGSkcqK3CWdkY/HkuCuTo5k1EWtKqwUdwhTkO/171JatXL7
 Cp3IOJp1BUEY7pk5hKFBRR2IvI+g/O7wKE7gQbcQH77pECg/JVmqzde8AqefcAMh42Rrlh
 mvUE7iiC8a6QSBrXypEz6FDzUR7SA1ML9b76steUWcWUkG8Jje2tRwMuZaJYk8mKgFPrUJ
 ou1FUzXI6T4kjLvYm4s7n8CSJUDUD8gIlsWgF6mlXzNOtXLWdSKzJqpiy+TkjbZeueKvNu
 e9Mt8MzQEYMcggjMgVyggBorhLeU1dsev45k0gmdbulFP3mvE8/BDwHtx8X4qA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K4rY0bSB
Subject: Re: [Buildroot] [PATCH v1 1/2] package/libwebsockets: add an option
 to enable lws async dns
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 20 Sep 2024 08:20:13 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> From: Bart Van Severen <bart.vanseveren@barco.com>
> 
> Lws now features optional asynchronous, ie, nonblocking recursive DNS
> resolution done on the event loop, enable `-DLWS_WITH_SYS_ASYNC_DNS=1`
> at cmake to build it in.
> 
> The default libc name resolution is via libc `getaddrinfo()`, which is
> blocking, possibly for quite long periods (seconds).  If you are
> taking care about latency, but want to create outgoing connections,
> you can't tolerate this exception from the rule that everything in
> lws is nonblocking.
> 
> Lws' asynchronous DNS resolver creates a caching name resolver
> that directly queries the configured nameserver itself over UDP,
> from the event loop.
> 
> https://libwebsockets.org/lws-api-doc-main/html/md_READMEs_2README_8async-dns.html
> 
> Signed-off-by: Bart Van Severen <bart.vanseveren@barco.com>
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>  package/libwebsockets/Config.in        | 6 ++++++
>  package/libwebsockets/libwebsockets.mk | 4 ++++
>  2 files changed, 10 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
