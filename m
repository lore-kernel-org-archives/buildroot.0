Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32BEC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ADFA4034F;
	Fri, 12 Jul 2024 20:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcNORNXwzwO8; Fri, 12 Jul 2024 20:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F13F4062F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F13F4062F;
	Fri, 12 Jul 2024 20:39:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2F091BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F43C4015A
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zg9DocpA5YuH for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:39:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5825740119
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5825740119
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5825740119
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:39:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86FAEE0002;
 Fri, 12 Jul 2024 20:39:15 +0000 (UTC)
Date: Fri, 12 Jul 2024 22:39:14 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240712223914.784c35a5@windsurf>
In-Reply-To: <20240520095205.81575-1-ju.o@free.fr>
References: <20240520095205.81575-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720816755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uj2kfUffMO7UdOlWcwWFMH8ERznNA1SgpgXaCiA8dU4=;
 b=QrXfVe7ceKxaRSDkdMQ/tppqR1Jj8i4ABpyg5rqgX8QtGQeHCUMbpFnKQzBgiXywVJjhVy
 fVo4nVb+fwh0YcUOmo46rx4GT0bjv4VKWJqAygUtCadFnyrRCVQWzdy4IqBA9zjgr5UOac
 sJpjp1wjyhn4+URXgtUn+oEuxRvRKGqRpkTcqy3IFZIfWfA2DoOW1eEAFpN3FvOhupXs/N
 1NvqMHSBYoPdNyeKGMu+j96VsXwpXkYrH289qcCQr7k4/6dpBvk8xv/MP698ePEQ+zvFkm
 sI0UK0AAU3bnfyKAejGT10gu9bFslwljj81cCCueJlJ0a3wpukPC8D/0DFFkIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QrXfVe7c
Subject: Re: [Buildroot] [PATCH 1/1] package/fwts: fix build with host make
 >= 4.4
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

On Mon, 20 May 2024 11:52:05 +0200
Julien Olivain <ju.o@free.fr> wrote:

> When build host has a many CPUs (more that 20) and GNU Make 4.4
> (included for example in Fedora 40), fwts can randomly fail to build.
> 
> This commit adds a package patch to fix the issue.
> 
> Fixes:
> 
>     mv: cannot stat 'dtcompilerparser.tab.c': No such file or directory
>     mv: cannot stat 'prparser.tab.c': No such file or directory
> 
> See also:
> https://github.com/fwts/fwts/issues/7
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Note: this patch is a follow up of:
> https://patchwork.ozlabs.org/project/buildroot/patch/20240420132251.1349622-1-ju.o@free.fr/
> This new patch allows to keep the parallel build and also fix the issue.
> This is why it is not marked as v2. I marked the old proposal as "Rejected".
> ---
>  ...fix-parallel-build-with-GNU-Make-4.4.patch | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 package/fwts/0002-libfwtsiasl-fix-parallel-build-with-GNU-Make-4.4.patch

Now that your patch has been accepted upstream, I have updated the
Upstream: tag in the patch to point to the final commit, and applied to
master. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
