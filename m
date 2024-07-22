Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AE8C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACBBA40638;
	Mon, 22 Jul 2024 12:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRS_L7jGM6Os; Mon, 22 Jul 2024 12:09:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8982B4070F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8982B4070F;
	Mon, 22 Jul 2024 12:09:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B45A1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3969181158
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TU7Ts8HXtuDX for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:09:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0FBD881154
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FBD881154
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FBD881154
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:09:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67FB2C0002;
 Mon, 22 Jul 2024 12:09:10 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:09:09 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240722140909.5a861f34@windsurf>
In-Reply-To: <20240722085732.824727-1-fontaine.fabrice@gmail.com>
References: <20240722085732.824727-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721650150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YbsMBMT3qFm+/IhIw2kCSMII1K7JLxmCiOBIc+mwXII=;
 b=dLA5tSPejXxK83JGvKolTwHqadoWY3Y4fr0jJiinGL3mr6b/7WufOynJdHd89fYSaWQ5hR
 K5M4o+DUC5iMdC1t3QmTvSgqKVLqk9uDo1xNPI+5ecGgfYSwc9vTg260VPT0f2P9QUeMHO
 NZ1YU5cMJxTEwm+hVENyINwU5VpUF/wW7YRjxGQIVNwUtDT7e+Ek8AWSNhl9kIhzz0uOiH
 sZCoOxsJnAG/MiF57/IZYbnG0bhuUErlgWNorua9M8vqY+ib40elVeZiaJtuWckOdgMA72
 +mYmU+TBHjiCKYrOd9lJief/LJ8AB2TkLj1mTK8K/lyFb7HhWEU8vZ5EOMid9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dLA5tSPe
Subject: Re: [Buildroot] [PATCH 1/1] package/erofs-utils: add libdeflate and
 zlib optional dependencies
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
Cc: Gao Xiang <hsiangkao@aol.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Jul 2024 10:57:32 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libdeflate and zlib are optional dependencies and zlib is enabled by
> default since bump to version 1.7.1 in commit
> f5f3d8ca007d46c1b4a351e53b619209b232b113 and
> https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=29b9e71401621d3417599067a75bd9b13154c6a7:
> 
> checking for zlib... no
> configure: error: Package requirements (zlib) were not met:
> 
> Package 'zlib', required by 'virtual:world', not found
> 
> Fixes: f5f3d8ca007d46c1b4a351e53b619209b232b113
>  - http://autobuild.buildroot.org/results/a56d5917b5a1e8c75368349f75ec425aeba1ff15
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/erofs-utils/erofs-utils.mk | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)

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
