Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9609C0219E
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78EA6403C9;
	Sat, 14 Sep 2024 22:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-GLBL6jT7qY; Sat, 14 Sep 2024 22:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 224174065C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 224174065C;
	Sat, 14 Sep 2024 22:14:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05BF41BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E912684116
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9sxjT8isriF for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:14:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A02A681DE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A02A681DE0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A02A681DE0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:14:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9077120009;
 Sat, 14 Sep 2024 22:14:39 +0000 (UTC)
Date: Sun, 15 Sep 2024 00:14:38 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240915001438.03ec32c4@windsurf>
In-Reply-To: <20240909121115.1165942-1-roykollensvendsen@gmail.com>
References: <20240909121115.1165942-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726352079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y+wwZDti1KqKI8EyS4fl4Ntx7JOzv5fBY9M7kvmuXLA=;
 b=VLYavuC/gDS0IY59OpJDqhanKO3djHJCzwLxemLz4YV2NbfhtPT9gXC/KkU6+DA7Mk3Lbz
 9m1wBftJ9bhknHUSP/wtzW8ew4l2IkHrIIIJNOkYx6Tmx5gAf7u4RZnllPNo6TB8aW44RR
 BBUF5/N3BtR6Ou0xK+d10XP63OFoldDQb7byeIfSzAhTSJTzCwhZJSLetgKfttJh/UCgoB
 +k7BMQUuHFfwwOZ5Gk0Epzno1rdii2d3MxiYZ8FmDkxzogKHL2JqfYQL3wbaE/qy+lxVhG
 OBJ67s/kMqVxs3sa8S6SKvrsZdXVv2YWR0LygOzqMnTiq6vyrl+BM1IsMMrS0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VLYavuC/
Subject: Re: [Buildroot] [PATCH v4 1/2] package/dlib: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy,

On Mon,  9 Sep 2024 14:11:12 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

Thanks for the patch!

> Should I enforce using system libraries where alternative internal libraries exist?

Yes, we always want to use system libraries instead of bundled ones.

> Do I add too much license information here? (I assume I only need BSL-1.0)

I think the license information you provided is good as it is.

> diff --git a/package/dlib/Config.in b/package/dlib/Config.in
> new file mode 100644
> index 0000000000..77ff5086ae
> --- /dev/null
> +++ b/package/dlib/Config.in
> @@ -0,0 +1,60 @@
> +config BR2_PACKAGE_DLIB
> +	bool "dlib"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  Dlib is a modern C++ toolkit containing machine learning
> +	  algorithms and tools for creating complex software in C++ to
> +	  solve real world problems.
> +
> +	  http://dlib.net
> +
> +if BR2_PACKAGE_DLIB
> +
> +config BR2_PACKAGE_DLIB_GIF_SUPPORT
> +	bool "GIF support"
> +	select BR2_PACKAGE_GIFLIB

I think you should drop all sub-options, and instead rely on automatic
dependencies, i.e:

ifeq ($(BR2_PACKAGE_GIFLIB),y)
... enable GIF support
else
... disable GIF support
endif

and ditto for all other options.

Last but not least, the addition of the entry in the DEVELOPERS file
should be done as part of the patch adding the package.

Could you adjust those small details and sent a new iteration, which I
believe we will be able to merge?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
