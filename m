Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDCBE7717F
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 20:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6C554038B;
	Sun,  8 Dec 2024 20:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3dHNvr3G0In; Sun,  8 Dec 2024 20:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACA7E40384
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACA7E40384;
	Sun,  8 Dec 2024 20:06:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11F146F
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 20:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C8D560665
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 20:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9hmL_NdFFeg for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 20:06:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 307D360610
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 307D360610
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 307D360610
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 20:06:10 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-540201cfedbso134511e87.3
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 12:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733688368; x=1734293168;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EUeVfQdTm0VCtmO/6Smn4hlxcNyMUerJwWoHqt/pqf0=;
 b=bTLjfaBSFf+hKyQZ5HrSJDQB7GKpOuVxxbGBoXPfgPS6grzvQcFteGFoVPdT+jq29a
 F66IkXibMhc8eDIQG2w7FVBt5saCYU40rLY0tLndQxYeGc4eZTQ5PueNQ7n2PMmhdXuB
 dE2bZJFkEhMA+nHP2GIw9qavoeKpXZ7ALW3BFmnNHOU8HnebUqtETKynfmdZmMSlWZm9
 BQrm0jsJuniAya0KgPPa8+Wy3PMa3yuRY5EXLPGIRfMMFcJAwg7UPyROjOCaD37ppA7t
 TOq8q4g21qcPAnnjtwRSMQnDMJJkWKVVvP4dmlZWTSwniFrArILRJHyys7tcxrekSgjP
 /deg==
X-Gm-Message-State: AOJu0Yw/lzSdwbPOnC7Xuey97uQ2djqeqzZ+hym6d+sziTRtY7LBS/ie
 Q7+taz7HFbDlmtXphN/4alCaPmIFlEHO1i721qPt+YfBCxKTq5Cz
X-Gm-Gg: ASbGncsb0pDnLK4fTBB+u10FRwZ0gVPpDww+I1JI/0+amde/4gs+JLm1o2TLPiMZQjW
 lm6fUFiXR5dfqNtDXoeeGYWTRUi9WmrhRV3wI5jlTfS1TEGGSVY5/5JExchTcS44KjageS/7WHw
 Yt8WtZJ5hmLYpa2/Ikxix8n7EO0YzCpzH0cqw6C7CU2mGo365KwqP2wJVOqxJ2ekVGe5NtugkUK
 xR7GIxe5JfWpTQZSNAuKHP7knT12KpoIWU2CyLYYJYq
X-Google-Smtp-Source: AGHT+IF+2vON+h6gOK/ii1LOF6+T+OvwaM8iCzXzi5ZaCbsfpJtgR0gc1tyCtWuHEyzKXPTos3Gevg==
X-Received: by 2002:a05:6512:3b82:b0:540:1fe4:539e with SMTP id
 2adb3069b0e04-5401fe454e7mr259130e87.30.1733688367681; 
 Sun, 08 Dec 2024 12:06:07 -0800 (PST)
Received: from curiosity ([5.188.167.245]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e2297441esm1177910e87.61.2024.12.08.12.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 12:06:05 -0800 (PST)
Date: Sun, 8 Dec 2024 23:06:03 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Message-ID: <Z1X8K8PKSj-QZxF5@curiosity>
References: <20241207203633.598905-1-geomatsi@gmail.com>
 <20241207214732.69709f7f@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241207214732.69709f7f@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733688368; x=1734293168; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EUeVfQdTm0VCtmO/6Smn4hlxcNyMUerJwWoHqt/pqf0=;
 b=C7mCHEmstt2ga+pxUaqGmv6AvRgresY0lgDifprqyFFu+oRGOn6WijS6WxZScukje7
 UFnsmF4i3STf0U1JZoXyrsUSDmwhrPDXWAaAVg8vbYO7yLZa3oXKeQsb4uG3OsgGtjDd
 7iTZHuJBvHEal/tpjBOTC6P6RmieukEstjEj3Gbj2WyH5UUanmDm4KU4yPlqiuHvPjC/
 03amLDVpRCqqvx42g4trGvKkISAMitNcq/kTNZ747NY0XdMw2u7XlXpbghtx6CHQYxC+
 uygB3vUVm8UZqnir0CWvT/MV7tVVsDxHBQD0qdH3NztPwemTIBYZsvnbdKNVcBa5MvCF
 88eQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C7mCHEms
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

Hi Thomas,

On Sat, Dec 07, 2024 at 09:47:32PM +0100, Thomas Petazzoni wrote:
> Hello Sergey,
> 
> On Sat,  7 Dec 2024 23:36:26 +0300
> Sergey Matyukevich <geomatsi@gmail.com> wrote:
> 
> > Current toolchain install helper fails to setup external toolchains with
> > merged-usr sysroot. It does not follow lib symlinks when looking for
> > ld.*.so.* files. As a result builds fail with various linker errors.
> > Follow symlinks in find tool when installing ld*.so.* linker scripts
> > from external toolchain directory to staging and target directories.
> > 
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> 
> Thanks for the patch!
> 
> I need to get back to my backlog, but I believe I had investigated some
> toolchain issue, and came back to the same patch/change as you.
> 
> This regression was introduced by commit
> 92207bc03f2358b28e0fd2cc3a41e40504b5d3d4 ("toolchain: handle toolchains
> with multiple ld*.so.* files").
> 
> I am wondering how I got to debug this? Are there some autobuilder
> issues?

I didn't see any autobuilder issues. Actually I was working with a 3rd
party vendor toolchain. Thanks for finding the commit that introduced
the regression. That commit enabled the use of multilib toolchains with
multiple ld*.so.* files. It turned out that my toolchain had both
properties:
- multilib with multiple ld*.so.* files
- merged-usr property

BTW, I did the following quick test. I baked a Buildroot merged-usr SDK
for aarch64 starting from qemu_aarch64_virt_defconfig. That SDK had a
single ld*.so.* file. Then I rebuilt qemu_aarch64_virt_defconfig image
using that SDK w/o my patch and w/o any issues. So indeed, we have to
use multilib _and_ merged-usr toolchain to trigger this symlink issue.

Should I resend v2 with 'Fixes' tag ?

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
