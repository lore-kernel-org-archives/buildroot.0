Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7DBC5320E
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 11:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E30580ACB;
	Mon, 19 Aug 2024 11:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5WUB6Kcxd6g; Mon, 19 Aug 2024 11:17:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEE3980BE6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEE3980BE6;
	Mon, 19 Aug 2024 11:17:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 277C91BF3DF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15B9380BE6
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEzOlhKQOBCy for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 11:17:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E462980ACB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E462980ACB
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E462980ACB
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 11:17:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F14D440005;
 Mon, 19 Aug 2024 11:17:25 +0000 (UTC)
Date: Mon, 19 Aug 2024 13:17:24 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240819131724.461ee618@windsurf>
In-Reply-To: <ZsHFY4nLrUaZgEDD@waldemar-brodkorb.de>
References: <ZsHFY4nLrUaZgEDD@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724066246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XU5AOER8q9avGJgsyHducvfwV6vhe+tcOQRB/pL/6mk=;
 b=Zuw4ydtvqxUfUs0jcKDzW5Knu+/dTIy9Pl1vA6sIpmrGH7bm++GV4r8JPYJPYHnhghaj7l
 6k+Hfg38higIxGiGzTDB7ZZgFmWiwt9oLS6Vms3W+BB3V071kHuJQ303jY+gwC3n1kSh3e
 b6mPs5GJEDoybHvRJacHqIBzvNcl+aKGbMoL21q9VUoMlNPKznYQ4Ez1ahND9zMogNzrxe
 dI70Yo2lYDzhBdcy2M1nikunk7PCy8NCO2NjziOToylzHR3mYtFfbWdrebQcKOQ7+15cyw
 3Wv6F8gqBzmlFMKbsgBdy/WRdO64jfsubQi/0FUzYV22HdtPRFy3kxl7DHBCcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zuw4ydtv
Subject: Re: [Buildroot] [PATCH next] package/e2fsprogs: allow uclibc
 toolchains for e4defrag
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

On Sun, 18 Aug 2024 11:56:51 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Since 2014 e4defrag was only available for musl/glibc
> toolchains in commit d770abad335a85884cfc2ec7574a331c29522810.
> 
> I believe sync_file_range() was already available in 2015 in the uClibc time.
> 
> So enable e4defrag. Tested in Qemu on a ext4 filesystem.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/e2fsprogs/Config.in | 5 -----
>  1 file changed, 5 deletions(-)

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
