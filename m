Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4411AC10F16
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 10:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E5986081F;
	Mon,  6 May 2024 10:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jH-zaGOB5ksr; Mon,  6 May 2024 10:25:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99370607E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99370607E3;
	Mon,  6 May 2024 10:25:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BAA01BF5DE
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08FE5607E3
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kr24aNN80vX for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 10:25:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=ben.hutchings@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CC4F60658
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CC4F60658
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CC4F60658
 for <buildroot@buildroot.org>; Mon,  6 May 2024 10:25:00 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41b2119da94so10540865e9.0
 for <buildroot@buildroot.org>; Mon, 06 May 2024 03:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714991099; x=1715595899;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QUsAdEQRZvp3s997svKqnvR6wmXgNdL+/YCdf1T3gRA=;
 b=QYvcBkJYqvatPNHjbanbHD901qYFvh9dLL8IcYcCPc/BizXpwFywq9ZaK6VZp5VhUd
 yipRHtihB86KsYcEwzBqr2tk7b9nwUJGzXdtZpTbhkoG7EvwLLIOpWIPIvQXlsMMyhyJ
 +wANHEUrk8O9B/noDVEkiGGsA2qYEJIpet68trT8yOhvEo5gjDY0DWHxap8JDO8gW+iI
 x4r2ZCzqeSFymbZsJFpQtYn5BmuvQ9qh786sh4Yzsv+fqWN15rob5SkfjixMIPM6R4A5
 gumKncHuTf/OhPyry+NwXWG+vHuHW+Kuk6DDfJ/VtDE2eTY2Nf1IsW10DNnwCOPvBC1U
 p2zw==
X-Gm-Message-State: AOJu0Yz66qntgoibPlnBrr2bwBvGCKyK+XIVj5BrXb1+qt09SeFyLuNo
 dZblXvUC3jOMI7BwF37eLAQJjXDMzP0vX3FCgKyCqxYzGpl5CX+z71pVFZd/4F8=
X-Google-Smtp-Source: AGHT+IE7N7PzkWW1gYO7NcD+bKDbdkNLvUJ4vAa3Ts8gGVr3/tB1hxpRLqbo9u8anf9n6Nc+DBa8UA==
X-Received: by 2002:a05:600c:3596:b0:41b:bb90:4bf with SMTP id
 p22-20020a05600c359600b0041bbb9004bfmr7364145wmq.18.1714991099138; 
 Mon, 06 May 2024 03:24:59 -0700 (PDT)
Received: from cephalopod (213.219.156.63.adsl.dyn.edpnet.net.
 [213.219.156.63]) by smtp.gmail.com with ESMTPSA id
 k8-20020a05600c1c8800b00418a6d62ad0sm19431108wms.34.2024.05.06.03.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 03:24:58 -0700 (PDT)
Date: Mon, 6 May 2024 12:24:55 +0200
To: oss-security@lists.openwall.com
Message-ID: <Zjiv9wzmqtfy8DYr@cephalopod>
References: <20240411152016.1185109-1-ben.hutchings@mind.be>
 <ZhgCNMQXfxPXuqvs@cephalopod>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZhgCNMQXfxPXuqvs@cephalopod>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714991099; x=1715595899; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QUsAdEQRZvp3s997svKqnvR6wmXgNdL+/YCdf1T3gRA=;
 b=SDjdXhQu5PRfJgqOm3OScC358Vd9kHSqMUYRt2v9PNx2VSzhyGihfys/vb2Fadaawl
 2//G5qlPoO2SfZvzSoIqGHbv61Ku5e457Oorgv8sMU0y3QONawj0SL8pnD6GIoDSXUMz
 ajHRbz1pCGK+XuUyv02D35oXdmB5CZYMDtP3goC0ueG/ZtO0/0WOPqDla8BzJ8EB3b6b
 3rlk1jUyIFWNU2lOMBL0uBmDoUqtEIAEwKte5IeKeBNApq1bmxPNDmoRW1NVY+X71Frf
 NiP3OgYk2XUdOgu4M00RyX8Tobe0ipFbjAM19KPqRVOKyYofncidN5n/5zk97vqu7zYj
 oh3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SDjdXhQu
Subject: Re: [Buildroot] Buildroot: incorrect permissons on /dev/shm
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
From: Ben Hutchings via buildroot <buildroot@buildroot.org>
Reply-To: Ben Hutchings <ben.hutchings@mind.be>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Apr 11, 2024 at 05:31:02PM +0200, Ben Hutchings wrote:
> Buildroot is a Linux distribution and system builder for embedded
> systems.  Starting in Buildroot 2011.08, its default /etc/fstab
> included an entry for /dev/shm with incorrect permissons (sticky bit
> not set). (CWE-276)
> =

> Buildroot 2017.08 removed this entry for systems using systemd, and it
> has never been included for systems using OpenRC.  So this only
> affects Buildroot-built systems that use sysvinit, and some older
> systems that use systemd.
[...]

This has been assigned CVE-2024-34455.

Ben.

-- =

Ben Hutchings =B7 Senior Embedded Software Engineer, Essensium-Mind =B7 min=
d.be
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
