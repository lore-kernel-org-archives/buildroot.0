Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1F9C02189
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B11A84589;
	Sat, 14 Sep 2024 09:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VnbguO7v6QuC; Sat, 14 Sep 2024 09:10:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F4678458E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F4678458E;
	Sat, 14 Sep 2024 09:10:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D47091BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF43D405E1
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkahB1IM49ot for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:10:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 893B9405F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 893B9405F0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 893B9405F0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:10:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C5DF20002;
 Sat, 14 Sep 2024 09:10:29 +0000 (UTC)
Date: Sat, 14 Sep 2024 11:10:28 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240914111028.6d4db226@windsurf>
In-Reply-To: <ZuEduoEnuPo43RqP@waldemar-brodkorb.de>
References: <ZuEduoEnuPo43RqP@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726305029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nlSgV8luGLhMBN9orWj3NuiKcvc4dMQLOMD+eU1hybI=;
 b=jN/1pOuGpmXQ4yGG1sUUOXrJqU8nnpMkaIcbwp3+myCna4pWcM9ZA8eRz2OzmZcmbJn/dD
 ZjE00Wh1HZOwQOt4zNImkbBJcGpxQSYJ2inz6yLMLSObV/2voe+xD+5X+R9p2AdhNyahY7
 pekjMLv/wVuAMkSOGmwhhD1fAlshZx3RXqU3w7nG2+5fzh2Nfn/86lRi0Ri45DVJVwCyqm
 Q3DqEkVr9TT93vn7k7ey4kW1MgZJs/bXqufMvYLjQ55YqfbmteUSUuk/dWjLyIC2mzXX7z
 3sFUGhohAUjaR+cmyqBFagNiHi6/0MAPEP/rM49hsk1u6WHQKwmA0tVqtZR7mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jN/1pOuG
Subject: Re: [Buildroot] [PATCH] package/libssh: update to 0.11.1
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

On Wed, 11 Sep 2024 06:34:02 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> For a changelog see the main page here:
> https://www.libssh.org/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/libssh/libssh.hash | 4 ++--
>  package/libssh/libssh.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
