Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBF4D3A67B
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 18:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F5FD40137;
	Tue, 29 Oct 2024 18:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BsxVN9RPQ9E; Tue, 29 Oct 2024 18:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70E844013A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70E844013A;
	Tue, 29 Oct 2024 18:51:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E8B64969
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 967F6805AC
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3IGyUPmtANC for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 18:51:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7782E8054E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7782E8054E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7782E8054E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:51:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FD941C0004;
 Tue, 29 Oct 2024 18:51:19 +0000 (UTC)
Date: Tue, 29 Oct 2024 19:51:18 +0100
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, Marcus Hoffmann <bubu@bubu1.eu>
Message-ID: <20241029195118.7d1ef917@windsurf>
In-Reply-To: <20241029121345.1889745-1-buildroot@bubu1.eu>
References: <20241029121345.1889745-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730227879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=moGECqVVWN7clF7NykYJxgEJNMqhO/PWJztVUZGDR1U=;
 b=VhgwGumtrOlGYezq9QHmahBfLCz+cgUQtzkcF/Ond8qsvFwTUZtIqfucVe0e99vGoXqkpD
 7uYht7hsfY97dND6aaTle2RSnZlcktvXCmdpTEG10lwVtuJze+ZVijcFUO6Qfkq0YOdhFX
 y4qgmQ/qQttZt3azFsy6Vlbg313aVnc8jOPow3YDFHgshMWE6BQPZ0gh7MGocU4Kuea47l
 KvW/Y5J58qd+NOt0Ti52m/51e1V1Mn31SqbmpjY7O6R8G71foLRKcAWWBOy1EROW0M604s
 56650im45y7H2KgWDrW2OjGOqTlmOm9BE++GEFSX6jngo5MvbU8OMl+lKFRRnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VhgwGumt
Subject: Re: [Buildroot] [PATCH] package/nethogs: bump to version 0.8.8
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

On Tue, 29 Oct 2024 13:13:44 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Remove patch that was merged upstream.
> 
> Changelog: https://github.com/raboof/nethogs/releases/tag/v0.8.8
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  ...termineVersion-sh-prevent-traversing.patch | 31 -------------------
>  package/nethogs/nethogs.hash                  |  2 +-
>  package/nethogs/nethogs.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 33 deletions(-)
>  delete mode 100644 package/nethogs/0001-determineVersion-sh-prevent-traversing.patch

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
