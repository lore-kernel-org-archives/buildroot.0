Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD2AC25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41AD183D9C;
	Thu,  9 May 2024 15:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJu4BW6LmuPT; Thu,  9 May 2024 15:37:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 460ED83DE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 460ED83DE3;
	Thu,  9 May 2024 15:37:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A14D01BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B52C60FB4
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0S6N-kxJ7Jp for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:37:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BDD060F4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BDD060F4D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BDD060F4D
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:37:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C14F240003;
 Thu,  9 May 2024 15:37:45 +0000 (UTC)
Date: Thu, 9 May 2024 17:37:45 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240509173745.3f28d735@windsurf>
In-Reply-To: <20240418135615.457970-1-giulio.benetti@benettiengineering.com>
References: <20240418135615.457970-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715269066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWna8g/IbVcjjjlUT13owto1j/gd49NkNJsAXYW16NM=;
 b=Ygnh45/dvo7NZFErhWJ+xaVeMdlflqG+7LLiaqjAQ3Z+voe+OWVMeSsX5UR8xiibq1++V6
 yxjoP7p5sogQBj4++Hrulf51INn7GXmGNr9XQ9vCtAKpqfgNavQ6pdh+tBu+992aM9nnUB
 gaRdV1dFrsKXLBhM7qR6D2ikB1DQT5/Jfjvtd/OQQgz1hDf6WTIdFFMxy9y+bSiAMgUpF8
 U9A+OacpZFHrswlp1M3suOD3ehLHbmtwL6B8XrEMZtUmlBl8jBPINEHtFjAg3mKToGYuG+
 qdjDDhVhkQuipqlsX3Q5+YBSo1TFu3kphnasSCDlld0VtzaUby9UmhKqC31M7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ygnh45/d
Subject: Re: [Buildroot] [PATCH] package/elfutils: fix host build failure
 due to missing demangle support
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

On Thu, 18 Apr 2024 15:56:15 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> When building on hosts with libstdc++ without demangle support this error
> shows up:
> checking for __cxa_demangle in -lstdc++... no
> configure: error: __cxa_demangle not found in libstdc++, use --disable-demangler to disable demangler support.
> make[1]: *** [package/pkg-generic.mk:273: /home/giuliobenetti/br_reproduce/c2524c7580d97f7387ec22da62be71d77f2ed8ec/output/build/host-elfutils-0.189/.stamp_configured] Error 1
> make: *** [Makefile:23: _all] Error 2
> 
> So let's disable demangler for host by default.
> 
> Fixes: still not showed by autobuilders. Reproduced on Ubuntu 22.04 with
> Ubuntu APT g++ 11.4.0
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/elfutils/elfutils.mk | 1 +
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
