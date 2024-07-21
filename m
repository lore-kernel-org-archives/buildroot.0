Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A43CC3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5452F605D4;
	Sun, 21 Jul 2024 16:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDcWZEG1XnNA; Sun, 21 Jul 2024 16:25:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D8A06068B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D8A06068B;
	Sun, 21 Jul 2024 16:25:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 430AF1BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F78C80C05
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bz0tkc6XxHEy for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:25:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0795E80C03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0795E80C03
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0795E80C03
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:25:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 485E91C0003;
 Sun, 21 Jul 2024 16:25:45 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:25:44 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240721182544.7d4f5e0c@windsurf>
In-Reply-To: <20240721074913.95765-1-fontaine.fabrice@gmail.com>
References: <20240721074913.95765-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721579145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VY6pGYxeR9fdR5QiNIoKb5IgRcUYknqX7k70YmE33C8=;
 b=l2CI2zXnNexDrwF6fK1VvQzWXty/eB0QVADbgt80XEoI/v6mWmsPXhPJGJMR/cKDmbJw2e
 UJdA5aJnaKek2o6KENtxBJxcAqDpkbr8uF4cms9w048ES7rm72XvsmcDoXZFIcvt2Qtivf
 UuDE7gb9o/lLSVdHYoAPQaM/Rcax/bNkW3dkLnoEiM5Wv/Oyu8nf+nsksMaDKkheEanIkv
 JbeIrxzuIQxhdb1qvYg50vu2LSeaxfUSb1e5AmMfiu35EYLMHUugTZCB+5pu9TVM+eGygZ
 J0lcR3D4RCxW9ySkaTXkaclevtWBzyKe2FnxMZO8faasoDBQFbsrUPL58622MQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l2CI2zXn
Subject: Re: [Buildroot] [PATCH 1/1] package/librelp: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: David GOUARIN <dgouarin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Jul 2024 09:49:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> librelp unconditionally calls the (deprecated) ENGINE_* logic in
> libopenssl resulting in a build failure when
> !BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
> 623d3bbe43e9193aa8e3395367d01af59071b859:
> 
> tcp.c: In function 'relpTcpExitTLS_ossl':
> tcp.c:1992:17: error: implicit declaration of function 'ENGINE_cleanup'; did you mean 'EVP_PBE_cleanup'? [-Wimplicit-function-declaration]
>  1992 |                 ENGINE_cleanup();
>       |                 ^~~~~~~~~~~~~~
>       |                 EVP_PBE_cleanup
> 
> Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
>  - http://autobuild.buildroot.org/results/68a1e94e077d8d57690a2543e557ba3f2974b03e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/librelp/Config.in | 1 +
>  1 file changed, 1 insertion(+)

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
