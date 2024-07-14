Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEF1C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 13:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F4C0605D0;
	Sun, 14 Jul 2024 13:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fgQ0F4Ril1K; Sun, 14 Jul 2024 13:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FFDF605E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FFDF605E9;
	Sun, 14 Jul 2024 13:24:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3E381BF3D8
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 13:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1AEC605E9
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 13:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yO0kr3xNdj3 for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 13:24:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9639605D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9639605D0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9639605D0
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 13:24:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47BA1240003;
 Sun, 14 Jul 2024 13:24:36 +0000 (UTC)
Date: Sun, 14 Jul 2024 15:24:35 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240714152435.5a67a6df@windsurf>
In-Reply-To: <20240712201943.457747-1-james.hilliard1@gmail.com>
References: <20240712201943.457747-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720963476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mgq8wjJeWLGMHFRusyDOdfSnwRCJGG3QiUblTysH91w=;
 b=o1abJqWwMCn2/zDt+f+4wX7wkZnY6P1xcQiiLTxXHil12DGHvZTok00fud7pkfShxtcrUC
 iU1xR7Wmb6U7ge+D4FJmUtECyv0fwEOMr1pjvILCfJN0frna4vSpIOPGjOmdOMsbqOdgK4
 XJPGjd04IQ9qRScQyXvfBfgCn+h975jD4InaFqiSTuWYP6hZZ3frIrq8PP+Lu7YL2JGOev
 lZzUkJLyK8iE2e8OC/R478VBkm4ayxKn1RGC3/Hrp9JPTQiCvnqceD7jeGiOJT45HaFU3+
 eAdP4QRt/YWfcV/TVzGE9mJOTw1p56WOj+4PKuXhCsXng5LvySYS2OxnfNc+2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o1abJqWw
Subject: Re: [Buildroot] [PATCH 1/1] package/prelink-cross: bump to version
 ff2561c02ade96c5d4d56ddd4e27ff064840a176
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

Hello James,

On Fri, 12 Jul 2024 14:19:43 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/prelink-cross/prelink-cross.hash | 2 +-
>  package/prelink-cross/prelink-cross.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Unfortunately, I had to revert this bump (and the previous one),
because it was causing breakage for the two things in Buildroot that
use host-prelink-cross. Indeed, newer versions of prelink-cross no
longer build/install prelink-rtld, and that breaks
gobject-instrospection and dracut.

Note that I did keep the patch that you added to fix the build issue,
and verified that host-prelink-cross continues to build on a machine
with host GCC 14.x.

I think investigating prelink-cross is probably not worth it.

Indeed, in gobject-introspection, the use of prelink-rtld can be
replaced by "objdump -p".
See https://git.openembedded.org/openembedded-core/commit/meta/recipes-gnome/gobject-introspection?id=767e0880d4d729e659e859dd99c1cdb084b8ba51 for inspiration.

And in dracut, I believe the same could be done as well (though I have
not investigated in detail).

This would allow to get rid of the prelink-cross package entirely.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
