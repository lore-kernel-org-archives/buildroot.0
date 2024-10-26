Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6A3D10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 15:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0313C81911;
	Sat, 26 Oct 2024 15:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORtmdh9DoiK4; Sat, 26 Oct 2024 15:57:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08FDD81916
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08FDD81916;
	Sat, 26 Oct 2024 15:57:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC7EE5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACC0D40198
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AliYFyFoHzSe for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 15:57:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E4B840207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E4B840207
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E4B840207
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:57:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B92411BF203;
 Sat, 26 Oct 2024 15:57:34 +0000 (UTC)
Date: Sat, 26 Oct 2024 17:57:33 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <20241026175733.7531ca2d@windsurf>
In-Reply-To: <ZuhBfPCMmYJqIZBQ@waldemar-brodkorb.de>
References: <ZuhBfPCMmYJqIZBQ@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729958254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VvC//Dgk5Jmd6+ZB41kkdQYku6mAw/q64I3iIy5JEa8=;
 b=j9UNxjVIgD7JtvwvNBqnjM3MkFIsnn+4qM2En9JCuFpsU5+SysR0MgEZ6oUw42vK5HeKL4
 xVyA0ozlWbmA3WOQCHzF24MuG2r2mtQWO32SNLl7JMKvlCDQxCzMtJeAEZZNog0vNq12ai
 pIfEVS8UNU95ivYNuYtHkDYn2SRcjMUQoL5+EY8WH97tWYWHX9wMT9CALi2fVuo0Oavmvv
 LHxiHiA7mna5GBkAGju9bKgc2HuEWpY5sJxnJkXJQNKuLRVYXxSVeK9mSqK3TIvSx1ezYa
 +avScLiWFsliEnbHjJcejUOPTnMiMWwFCaIYx+Z0ZtxZg3Zne8kzJ3PYWkBRTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j9UNxjVI
Subject: Re: [Buildroot] [PATCH] package/evilwm: add missing dependency
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

On Mon, 16 Sep 2024 16:32:28 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Add missing dependency to xlib_libXrandr.
> 
> Fixes:
> 
>  https://autobuild.buildroot.org/results/9928181557c7f99b7c74065d981f005cbd95145d/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/evilwm/Config.in | 1 +
>  package/evilwm/evilwm.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

It should be noted that we merged this package using autotools-package,
but it isn't using the autotools at all. It has almost an empty
./configure script, hand-written.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
