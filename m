Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0B4C3DA4B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 19:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EE3E409D7;
	Thu, 11 Jul 2024 19:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9KHH2dSKc_mS; Thu, 11 Jul 2024 19:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42181410F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42181410F3;
	Thu, 11 Jul 2024 19:00:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 845711BF42E
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DA424161D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwAttt7tnhWj for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 19:00:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08584413A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08584413A0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08584413A0
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 19:00:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E26981C0002;
 Thu, 11 Jul 2024 19:00:29 +0000 (UTC)
Date: Thu, 11 Jul 2024 21:00:28 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240711210028.275966b6@windsurf>
In-Reply-To: <Zo+rUe629arAZsdA@waldemar-brodkorb.de>
References: <Zo+rUe629arAZsdA@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720724430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vzFO9EbwPtPa1Pd6qUtO0wmstjR0tJCKZ+JJqYYktRg=;
 b=FzVicfJVOm77Ztz9k33ljt3CZQoJi40qUm21TB2IdHZTiGv4uoSpulbD536XpJWjB+8FsR
 GB1wXuwHTS+ARD2Y7EcxyuzfGHU7zHkki28A8kSnNqfFbNuLnBO8jtGI8LTMJ/adg5cLL5
 MBZgmj7eLF/ZwLKDrG37BuGCfes0+iXZEBFg86g8KT1I1LS7b0slJeyORCBS1OwXqPlhqq
 k5jyTW03fKTYzUlUtU1PtrS5KiNC2ELge13mU5GYcF7qdlFhV12sWub7o4eUpKagJEUnhx
 aaoLIq8xkZjChH+GjiLw1Xm2pPy84a7hmxpsD2XdZdaPQ0A8OZBpdkt7Rxa6PQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FzVicfJV
Subject: Re: [Buildroot] [PATCH] package/asterisk: update to 20.8.1
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

On Thu, 11 Jul 2024 11:52:17 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See here for a ChangeLog:
> https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-20-current.md
> 
> Patch 0005 is applied upstream.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...es-stasis-control.c-include-signal.h.patch | 43 -------------------
>  package/asterisk/asterisk.hash                |  2 +-
>  package/asterisk/asterisk.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 45 deletions(-)
>  delete mode 100644 package/asterisk/0005-res-stasis-control.c-include-signal.h.patch

Looking at the Changelog... this version update contains a security
vulnerability fix. However, deeper investigation revealed that the
vulnerability was introduced between 20.7.0 and 20.8.0... and we were
still using the 20.7.0, which did not include the vulnerability. So I
added the following text in the commit log:

    20.8.1 contains a fix for CVE-2024-35190. However, the vulnerability
    was introduced in commit 68a49128253f677f9e1b235c70d2316342372f7d
    between 20.7.0 and 20.8.0, and Buildroot was using 20.7.0, so we were
    not affected by this vulnerability.
    
Applied with this addition. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
