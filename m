Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D65ED59F73
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F5C24091C;
	Wed,  6 Nov 2024 21:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZEAqex2c9eez; Wed,  6 Nov 2024 21:21:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B703B408C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B703B408C8;
	Wed,  6 Nov 2024 21:21:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E85D4C38
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B937408F3
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSZ2MzpHlGsy for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:21:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1577B408D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1577B408D9
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1577B408D9
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE6FB40005;
 Wed,  6 Nov 2024 21:21:09 +0000 (UTC)
Date: Wed, 6 Nov 2024 22:21:09 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>, Woodrow Douglass
 <wdouglass@carnegierobotics.com>, Julien Olivain <ju.o@free.fr>, Asaf
 Kahlon <asafka7@gmail.com>, Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>, Robert Rose
 <robertroyrose@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20241106222109.7773f15d@windsurf>
In-Reply-To: <20241030190020.1444105-5-james.hilliard1@gmail.com>
References: <20241030190020.1444105-1-james.hilliard1@gmail.com>
 <20241030190020.1444105-5-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730928070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uqPgpqlE+JNyM18UaYP9DAsBL9LNt9P4QF74ZyxmIUg=;
 b=KqOBqHD6cKt4zJOPscFa0ASLNVR2u0pLmxjcfdXUiaeKj0BzyvY/tc4yEcxBtV4jDfMs0M
 nCgKdv7qxX0yIYdL87pULpQ2Lj/y3BemnVjOuIAU7SKG4aHeBLiLsSjV81h9D94fDlanOW
 0YY3+4f7p4iIK37BAcm+rkraA5Zow/kVRnk5n+W5eKa3CsU33VtFI/N29dYoQ8V0+2LrSm
 BXDPK/aSMrL3pLQ5DCidSCsSGhV/pG/HVC4QeS8obpvBmHfpxzBymH3NsrzO1kLaJLGw+u
 jBrvyj+VN5GV//EBYlxcAW45kVOvCvg/Lo5xM7heNxjMELsCwRo5IdvkU3CK5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KqOBqHD6
Subject: Re: [Buildroot] [PATCH v4 5/6] package/mosh: fix compatibility with
 newer protobuf versions
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

On Wed, 30 Oct 2024 13:00:19 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> We need to backport a patch to fix compatibility with newer protobuf
> versions.
> 
> Remove CFLAGS setting -std=c++11 and enable autoreconf so that
> patch is applied properly.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../mosh/0001-Bump-C-version-to-C-17.patch    | 49 +++++++++++++++++++
>  package/mosh/mosh.mk                          |  4 +-
>  2 files changed, 50 insertions(+), 3 deletions(-)
>  create mode 100644 package/mosh/0001-Bump-C-version-to-C-17.patch

Applied to master, thanks. This should have been *before* the protobuf
bump in your series, as it fixes an issue with the bump, but also works
before the bump, so it really is a preparation commit.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
