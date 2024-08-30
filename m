Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F1CCA0EDC
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 16:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EB834013C;
	Fri, 30 Aug 2024 16:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_ZwIdYIKw1U; Fri, 30 Aug 2024 16:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA965411E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA965411E5;
	Fri, 30 Aug 2024 16:57:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86B4A1BF35F
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 16:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 737DC42455
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 16:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XTdWH-ml1SP for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 16:57:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1BE1342448
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BE1342448
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BE1342448
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 16:57:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28B8E60004;
 Fri, 30 Aug 2024 16:57:42 +0000 (UTC)
Date: Fri, 30 Aug 2024 18:57:41 +0200
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Message-ID: <20240830185741.44c5f222@windsurf>
In-Reply-To: <20240830101327.2000179-4-niklas.cassel@wdc.com>
References: <20240830101327.2000179-1-niklas.cassel@wdc.com>
 <20240830101327.2000179-4-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725037062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ep3zEKCqyyq/lOtOnSjciAP98vEU6OcWj3KzR7qPaSc=;
 b=UhIuedmRPhSgVABruB5d/8SugcSbnEnArElJLi1jQ3jcSza/HQwyVOVjlOhu+aIyedh19Z
 av34nm9HIzN8LNHHaWs87IQvGzP4arCkJdXPK5BNAsNhTZqj7G0bpMm/hP6YhIlsBxNrQk
 VQJW7UhmWMbqPw8vFBinwOdef+tyZStYCpGlXeDoq33O+yaYLnqF833Eo+89Z8XSQT2zW/
 s7rJxNt8WbgoEw7wmkIxEEzvxhfIK3O++H125xKCsH9jQAIbuAf8uNoheyIorzJ7/I7Kei
 FSi1dYBt8fvmMyBNKBBM4I4GfN+eW0ds4N/TRbkkFSjSY+OdHPO/bfVV5nCFGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UhIuedmR
Subject: Re: [Buildroot] [PATCH 3/4] board/radxa/rock5b: do not let the
 kernel mount the rootfs as rw
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>, Niklas Cassel <cassel@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 30 Aug 2024 12:13:26 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> From: Niklas Cassel <cassel@kernel.org>
> 
> Do not let the kernel mount the rootfs as rw.
> There is no need for this, and init will remount the rootfs as rw anyway.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  board/radxa/rock5b/extlinux.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
