Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257FCC3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 20:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE1DB403B5;
	Sat, 20 Jul 2024 20:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIjyPXxAI6VP; Sat, 20 Jul 2024 20:52:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96E2F403B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96E2F403B9;
	Sat, 20 Jul 2024 20:52:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDA011BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAFEF400D8
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ND8vRdRjoy3 for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 20:52:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6819740151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6819740151
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6819740151
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 20:52:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96F7D1BF204;
 Sat, 20 Jul 2024 20:52:26 +0000 (UTC)
Date: Sat, 20 Jul 2024 22:52:25 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720225225.5ace40cd@windsurf>
In-Reply-To: <20240720124008.460751-1-fontaine.fabrice@gmail.com>
References: <20240720124008.460751-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721508746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wx+ERhmZTRTpjqNUwkrM3sK31Vp3BxQ9jIxhbdQj1ts=;
 b=VmTaFkvUpO+4JFj2WqfygTzpaInEQpH2WDUhsWEGpIvcbj1B2Z8Vn+UVKGhmwPnijtLCIK
 P9hIGIcvWgVmeMvTVdv4NuJR2E8A+pgzEhHL80RAYtF+3LhJ7BNU7CfkD97UbaRvNJzf90
 R+qSkGNZ5JPqtWp+28eDiriuyGPC4La6zMqwZut55NJAMMUGu+Hq4PzfHUTxZng+4o9jmZ
 Dy7b0o9VqmCtf4zirlXNnTv4W1KxZsARZ0/SCXwf4qeopCurnAC3vkfccBycHksuzoLnEc
 Q1QbopaqpQZ9ajG9PT0LjHZqBQ2kBf/uLCzMgBK64AOkNBDhrY/Pa0AXmqnjMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VmTaFkvU
Subject: Re: [Buildroot] [PATCH 1/1] package/cpuload: fix build with gcc >=
 14
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Jul 2024 14:40:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc >= 14:
> 
> read_cpu_stat.c: In function 'cpudata_new':
> read_cpu_stat.c:49:17: error: implicit declaration of function 'error'; did you mean 'perror'? [-Wimplicit-function-declaration]
>    49 |                 error("too many cpus");
>       |                 ^~~~~
>       |                 perror
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3bca2659011d123d7b7a0ca19c4e868643d45766
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Changed-error-calls-to-perror.patch  | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 package/cpuload/0001-Changed-error-calls-to-perror.patch

The patch is a bit noisy with some changes to the .gitignore file that
are clearly unrelated. But OK, that's the patch as it was submitted
upstream, so fine.

Maybe you should react on the pull request, with a thumbs up or a
positive comment, saying it also fixes problems we are seeing?

Thanks, patch applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
