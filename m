Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09459C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 252FB80FAF;
	Mon, 12 Aug 2024 20:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJOhz_3uYLyI; Mon, 12 Aug 2024 20:45:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3F5180F76
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F5180F76;
	Mon, 12 Aug 2024 20:45:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 234F11BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93F8D40423
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mILDp-L7rxYF for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:45:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22CEC409B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22CEC409B9
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22CEC409B9
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:45:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4343220003;
 Mon, 12 Aug 2024 20:45:13 +0000 (UTC)
Date: Mon, 12 Aug 2024 22:45:12 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240812224512.418bec51@windsurf>
In-Reply-To: <ZreMcIb1cZbWA5ww@waldemar-brodkorb.de>
References: <ZreMcIb1cZbWA5ww@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723495513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zRp77V193grhZPuc9s9IazfsQA1GWftmUlrvFIP/cdY=;
 b=NU7qPoZ0vPmmFugt66QXzJxXLyukfChViS9hjwa0LrFGiv5/TFTP2HzYZT/1UBHYhCtaZt
 lmfOuGzLLxogjWUOgQqdgONj52KhjuqUh+mLK/ZoXCmDGuACN8RGiCnC7gsnCpwIYjdKG3
 l4MXK9el0APnkaAfjrZhebOAJUI+0A2gJLu1fDK4T2SXUrfgtoGF5BjNDEKw1tvaQ8+MoE
 V6BAU87En+FXj/7BhKTaeJ4uk8ozHJWLGKn5Ed1qVLf9EZDdcvFFPutSZ4XIFVE6n5gJEV
 X5WPjvpoJDVeBUgX5yqWCcFV3OLpZpU3ZaAa7KO5cj0cHXoivfDQ+7pbUOcocw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NU7qPoZ0
Subject: Re: [Buildroot] [PATCH] package/stress-ng: update to 0.18.02
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

On Sat, 10 Aug 2024 17:51:12 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Patches 0001/0002 are upstream.
> Stress-ng requires Thread support.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...sock.c-fix-build-without-SO_ZEROCOPY.patch | 56 -------------------
>  ...002-core-sched.c-fix-uclibc-ng-build.patch | 40 -------------
>  package/stress-ng/Config.in                   |  5 +-
>  package/stress-ng/stress-ng.hash              |  2 +-
>  package/stress-ng/stress-ng.mk                |  2 +-
>  5 files changed, 5 insertions(+), 100 deletions(-)
>  delete mode 100644 package/stress-ng/0001-stress-sock.c-fix-build-without-SO_ZEROCOPY.patch
>  delete mode 100644 package/stress-ng/0002-core-sched.c-fix-uclibc-ng-build.patch

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
