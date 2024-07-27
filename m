Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFC4C3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 14:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C71D940CC3;
	Sat, 27 Jul 2024 14:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zE4dWx88hyil; Sat, 27 Jul 2024 14:08:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9790340CD3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9790340CD3;
	Sat, 27 Jul 2024 14:08:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E3FD81BF84C
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D252960630
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdVIqX4wF5FA for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 14:08:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 210B8605D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 210B8605D5
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 210B8605D5
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 14:08:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00E51C0002;
 Sat, 27 Jul 2024 14:08:32 +0000 (UTC)
Date: Sat, 27 Jul 2024 16:08:31 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240727160831.79443fdd@windsurf>
In-Reply-To: <20240727081344.1382341-1-james.hilliard1@gmail.com>
References: <20240727081344.1382341-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722089313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vIC+LQlJh5UEOt0m0obWSvTnE/Y+G6pgFdlaUxAIfE=;
 b=AwHaBqhld4GZ4MXtaZKJSwnivOY0Tri9yLYDFaqd6DSnTsdQDN8kWjRTceEe0i0usxpznD
 Cb7vLkdZSu3w16OQ+8ZQ42yvoGS5tyLFQq5D3gGk6R8Z5epgiqB4FBrA9TeI7hB3ufNGz+
 wHn6pYMeT319zccIQ7IVKN2bqs5EC+D40mbvHFfJgJ+VFSdhsixVDBozHSSqlMPBtXaiwV
 P3XHPjdc3q4TKkwVboBX9IBu+qd8mCf7Gpgrt2w63EiK52EVCnfFCoyJJpq2aEbAIp3/72
 ti+7hGP/0sbIJtY9UeiQHds10p0rSojvMhutLLmH/zkfzCQp5KA53oo1RAyVnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AwHaBqhl
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: bump to version 256.4
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 27 Jul 2024 02:13:44 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Remove patch which is now upstream
> 
> Rebase fix missing LOOP_SET_BLOCK_SIZE patch.
> 
> Update config options to match new expected format.
> 
> Add new nsresourced, mountfsd and vmspawn config options.
> 
> Add new systemd-journal-upload user for journald-remote.
> 
> Add new kernel config enable/disable options from systemd readme.
> 
> Add new optional dependencies and config options as appropriate.
> 
> LICENSES/README.md hash changed due to additional details added:
> https://github.com/systemd/systemd/commit/fb747bd8cdcbeb55f9ef3c62289fff8ff5a25b68
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...g_loop.h-fix-missing-LOOP_SET_BLOCK_.patch |  10 +-
>  .../0002-basic-add-bcachefs-magic.patch       |  53 ---
>  package/systemd/Config.in                     |  29 ++
>  package/systemd/systemd.hash                  |   4 +-
>  package/systemd/systemd.mk                    | 334 ++++++++++++------
>  5 files changed, 263 insertions(+), 167 deletions(-)
>  delete mode 100644 package/systemd/0002-basic-add-bcachefs-magic.patch

Lots of changes, but seems fine from a quick look, so I've applied.
Let's see whether this blows up in the autobuilders :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
