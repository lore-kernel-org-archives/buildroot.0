Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC7CC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 07:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4A8D61376;
	Wed,  7 Feb 2024 07:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RGoH07zA0ZuC; Wed,  7 Feb 2024 07:08:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D370761371
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D370761371;
	Wed,  7 Feb 2024 07:08:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51B3C1BF836
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 07:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F52B837D2
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 07:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AbG5Cnn9kUUD for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 07:07:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D17E8367C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D17E8367C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D17E8367C
 for <buildroot@busybox.net>; Wed,  7 Feb 2024 07:07:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B2CA1C000B;
 Wed,  7 Feb 2024 07:07:55 +0000 (UTC)
Date: Wed, 7 Feb 2024 08:07:54 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20240207080754.606a403e@windsurf>
In-Reply-To: <20240118182808.551258-1-francois.perrad@gadz.org>
References: <20240118182808.551258-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707289675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4I8NjxgkDLRvuhcUV0yq8y2iX0raVxyYUaUnRYvG98=;
 b=TO9LbkIznirZbuQTaxbagf5fn1IVhos3B8AY6WggXFuNXXdZLn8TR1m8DuqwNbnrY3WT1f
 pFCU7AmaPBrWJyAg5kjLOsUIW4ZCPFNqhj8ss0mYOhAkqkuuJrFPG5h5+7FrmSneEw01dE
 BeEkQ8m70BUyyRLD4dTRrQ7ic9wvyzA2h5oJVGD5db2hAeFNbxb15YDlFCt11bnLj5p27Y
 rb3lUDNKbUXqfaJ8nKtAUXKTciffxOqhdZLig+Hwn9JKd7T0wIV5xjP1WJswh/qWz4gsOv
 7jwuK5JDOZEKu+rGFowWbnRKmaxuBosnxoXGqwzohOcyeoCjOPPH2QJFM0EiPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TO9LbkIz
Subject: Re: [Buildroot] [PATCH] package/autoconf: bump to version 2.72
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 18 Jan 2024 19:28:08 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> https://git.savannah.gnu.org/cgit/autoconf.git/tree/NEWS?h=v2.72
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/autoconf/0001-dont-add-dirty-to-version.patch | 2 +-
>  package/autoconf/autoconf.hash                        | 2 +-
>  package/autoconf/autoconf.mk                          | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

This version bump broke the build of host-erlang:

http://autobuild.buildroot.net/results/cab/cabca5a5ed9bb0874ed33e58a69947b50a6e2318/build-end.log

Could you have a look? Perhaps it's just the host-erlang configure
machinery that is too strict, and simply their check needs to be
relaxed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
