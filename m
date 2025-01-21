Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77B8C02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 18:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6630760624;
	Tue, 21 Jan 2025 18:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Euiyh9iDZfJF; Tue, 21 Jan 2025 18:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A75E6069B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A75E6069B;
	Tue, 21 Jan 2025 18:31:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F6E8959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 18:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 600F56069B
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 18:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dihxgsp_S3qh for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 18:31:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60AB660624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60AB660624
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60AB660624
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 18:31:56 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso5969695e87.2
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 10:31:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737484314; x=1738089114;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gM+lSoaRam//GS1Taqfc98TvF0aF2M15yq8DYnONhmY=;
 b=QuOSt0ToZLigJsRg3ECu2boCF8jbrE4PYDZM2YjtkulnBtlfQGcE/J6UYNVAy1Ji6m
 4g4/7puWJiCowuv0Y3+RoIIy6p8HmXkih5IHFPY64x9zAOnwEIIMxCOpIwBa/07/7amQ
 +rG4tMD0vaV1AMFrfKpFXxRqTsY/Kw4sYCP+TiA6X38LL6VUoS1JXP7xZj6tBimqxucK
 Z56P2eJuUvtvnyBzrXfVhctifGvnkpAI7yQFGsPLIRT8DxWn/dbf7yvUDWbOw5f75fqw
 rZypDjX5Fip7fWF8EbcxlJugYWCqN0WvgCj7gTkyhNQfGa1zzxws/8HEEj29kHcqn5sU
 jmgg==
X-Gm-Message-State: AOJu0YyZEYmPPzqK2clfzpKHMeD8spuFRtUuWkbNg8vq8K8ZLPd+adEH
 b3hVWlP2oTjc8/2TwpFB9EhgS/fF56l4ZDOCb3StIbm0QhcDE0xw
X-Gm-Gg: ASbGncvv/184xZdKgG66QfvWjYFiTVifaZfM6qRIZFPs3LukEu0qmS82T6FD2zquvNL
 iymbbE6hpy9yHlW2gSbp0KrCLr4IsGiESJvq/zNvw/328S6PH45PT1SDYIrNaBPJcqEsgOx89lu
 iNWGZEaNjuA0bl/qBBkqo7W3wzfFUIwkjUNsJjKVDuBMvQ+o/3zLMWw5COyXIXEpYhVJsRXnar4
 x5qWbooIBFSwyeZQurxgFlThUYLHSvXmXQ2LFWhoS/W/V4sWAc7RQtiyx6P
X-Google-Smtp-Source: AGHT+IEKH6scSXHd7Q+LbenEcx6WOKydDT2pfUr0NhJYj9hC5BVud2i2MgbLLrkkfMvIxtR21NWuhA==
X-Received: by 2002:a05:6512:3989:b0:542:8cf5:a384 with SMTP id
 2adb3069b0e04-5439c21f299mr5693384e87.8.1737484313789; 
 Tue, 21 Jan 2025 10:31:53 -0800 (PST)
Received: from curiosity ([5.188.167.4]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0eb3bsm1941055e87.75.2025.01.21.10.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 10:31:52 -0800 (PST)
Date: Tue, 21 Jan 2025 21:31:50 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Message-ID: <Z4_oFjjAe17fCOcN@curiosity>
References: <20241207203633.598905-1-geomatsi@gmail.com>
 <20241207214732.69709f7f@windsurf> <Z1X8K8PKSj-QZxF5@curiosity>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z1X8K8PKSj-QZxF5@curiosity>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737484314; x=1738089114; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gM+lSoaRam//GS1Taqfc98TvF0aF2M15yq8DYnONhmY=;
 b=kE1psPF/bKw63SRYLXxX6Zj82eewEbu4Prb1VmGNGMu0tO33VnO+n8asax7o6vrvA2
 WdktDZYxw6JIWX8WkwR2PYn3k2BvtYjyVlq7ynuvAsFR5IiienYR5g3u2XfxDeZeyqm+
 +06zWN1IGs8zEHIcLLsSNNvHem4MA6GVvmJIYQ1M9xVIGSxXDADkK0tAT+F1GBhUC0DV
 8tdv989jsIJKNYBsEvQnQR2/sH3KztBn7cjkKsw65DVF/DHtsdYlN//i2pnR0FOSeMOC
 TElmxDzvv8QJqYsTdK4Zx+GW5Jc2nvRZVfngiFUbiWMlE/pWxxnsgFA6ntsMoQQxqVqH
 OqyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kE1psPF/
Subject: Re: [Buildroot] [PATCH] toolchain: follow symlinks in ld.*so.*
 install helper
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Dec 08, 2024 at 11:06:03PM +0300, Sergey Matyukevich wrote:
> Hi Thomas,
> 
> On Sat, Dec 07, 2024 at 09:47:32PM +0100, Thomas Petazzoni wrote:
> > Hello Sergey,
> > 
> > On Sat,  7 Dec 2024 23:36:26 +0300
> > Sergey Matyukevich <geomatsi@gmail.com> wrote:
> > 
> > > Current toolchain install helper fails to setup external toolchains with
> > > merged-usr sysroot. It does not follow lib symlinks when looking for
> > > ld.*.so.* files. As a result builds fail with various linker errors.
> > > Follow symlinks in find tool when installing ld*.so.* linker scripts
> > > from external toolchain directory to staging and target directories.
> > > 
> > > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> > 
> > Thanks for the patch!
> > 
> > I need to get back to my backlog, but I believe I had investigated some
> > toolchain issue, and came back to the same patch/change as you.
> > 
> > This regression was introduced by commit
> > 92207bc03f2358b28e0fd2cc3a41e40504b5d3d4 ("toolchain: handle toolchains
> > with multiple ld*.so.* files").
> > 
> > I am wondering how I got to debug this? Are there some autobuilder
> > issues?
> 
> I didn't see any autobuilder issues. Actually I was working with a 3rd
> party vendor toolchain. Thanks for finding the commit that introduced
> the regression. That commit enabled the use of multilib toolchains with
> multiple ld*.so.* files. It turned out that my toolchain had both
> properties:
> - multilib with multiple ld*.so.* files
> - merged-usr property
> 
> BTW, I did the following quick test. I baked a Buildroot merged-usr SDK
> for aarch64 starting from qemu_aarch64_virt_defconfig. That SDK had a
> single ld*.so.* file. Then I rebuilt qemu_aarch64_virt_defconfig image
> using that SDK w/o my patch and w/o any issues. So indeed, we have to
> use multilib _and_ merged-usr toolchain to trigger this symlink issue.
> 
> Should I resend v2 with 'Fixes' tag ?

Friendly ping. Any thoughts or comments concerning this fix ?

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
