Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE3EC3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 11:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9324F6074F;
	Tue,  6 Aug 2024 11:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-KXenZnXdN9; Tue,  6 Aug 2024 11:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF273607EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF273607EE;
	Tue,  6 Aug 2024 11:59:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FA1C1BF2E4
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 11:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CB6240382
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 11:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Upoe5HWGibEM for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 11:59:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D52EB40218
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D52EB40218
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D52EB40218
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 11:59:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D98F1C0002;
 Tue,  6 Aug 2024 11:59:33 +0000 (UTC)
Date: Tue, 6 Aug 2024 13:59:33 +0200
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Message-ID: <20240806135933.4e7cb36a@windsurf>
In-Reply-To: <20240806074539.1261315-1-zgyarmati@zgyarmati.de>
References: <20240806074539.1261315-1-zgyarmati@zgyarmati.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722945574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p/EBX5XaeYMLhZJy8HDAJpa9tZKUKG9mn526/rd5DTA=;
 b=jaO6YZI9kuxEwLXQRuhW7h0nZXEV4jpKCf7ZnIemkq5mrAzASepMxl+NijjcexXkCxioGp
 uge86jjNKiYwACrJ3tc6/75auJHRzFHIsaP1WHyb07IUVYMWZSgyztBqth4vDaWuK/0g/n
 ZJO9ErkkPwq3yEorVYMhrWmIxyJJ8545gCuhJON4QA6yiCbF67fZkrJrNjcPBCg7uzo1UT
 Kj+Q/a97cJlMVYXNlpkbWWXA9TwwIEbgcDXW8KwIjcNKn2yck54z5cse2CaU/SwrX6bmCs
 ClODmS7dmhQRzgi6eyV+5TKNX16C517U4qK42SI7cgsFcL4MjmWOT1ks+1OL/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jaO6YZI9
Subject: Re: [Buildroot] [PATCH 1/1] package/crudini: bump to 0.9.5
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

On Tue,  6 Aug 2024 09:45:39 +0200
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

> Removing backported patch and introducing new dependency
> setuptools-scm.
> As setuptools-scm doesn't work with github release tarballs, also
> switching back to download the tarball from pypi...
> 
> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
>  .../0001-prefer-shlex-over-pipes.patch        | 41 -------------------
>  package/crudini/crudini.hash                  |  3 +-
>  package/crudini/crudini.mk                    |  7 ++--
>  3 files changed, 6 insertions(+), 45 deletions(-)
>  delete mode 100644 package/crudini/0001-prefer-shlex-over-pipes.patch

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
