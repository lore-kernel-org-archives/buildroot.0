Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B05C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD30D417F4;
	Fri, 12 Jul 2024 13:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSxG2AxALRW1; Fri, 12 Jul 2024 13:06:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 880AC417F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 880AC417F6;
	Fri, 12 Jul 2024 13:06:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C217C1BF861
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC2A48460E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMviyGTthekS for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A25A78460C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A25A78460C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A25A78460C
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:05:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E0BC1BF209;
 Fri, 12 Jul 2024 13:05:57 +0000 (UTC)
Date: Fri, 12 Jul 2024 15:05:56 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240712150556.416eac03@windsurf>
In-Reply-To: <20240207170959.2672846-1-buildroot@bubu1.eu>
References: <20240207170959.2672846-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720789558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jxwkhsV2lxY5JrL+39zGxz+83oMn6Hk9KzKUZAYhGNk=;
 b=o0Yb/4wW7xLzYVUgFKrtmpgubkGa+/563Tk6Qhu89b6nFQDPBKDdA00ug1SkM8tb0ow4FK
 eMwFRkoAW+1W78DuDGGF7lnp1CivSk4vWNml1WORM2Sp4xhB1SUI6C9ehPXOCkWN/uRf+V
 +t4ZRf+bI2fgDGDLtmadkoKs8OMJv9SYqfU4qR5RY4zHgwpRBbTKuzzX6/fx4lBB5fQYaV
 2lvrNQoRnYWxbe1mZy6b4OPHhSSqxhsml68fn/mgXdca0t2LI2K9R2N45WV59n6cURnS8q
 UReIETP9fOIwMHpC1GqU6yJm8L41iSVdKdDqMf8UpEy5BZWRNBTPyaLosfTx5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o0Yb/4wW
Subject: Re: [Buildroot] [PATCH 1/4] package/python-ruamel-yaml: fix comment
 in hash file
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Feb 2024 18:09:53 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-ruamel-yaml/python-ruamel-yaml.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
