Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEC7C43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 098E861099;
	Fri, 26 Jun 2026 14:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3SdCw4NQGt-y; Fri, 26 Jun 2026 14:55:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 154D660FDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485732;
	bh=dAYx1p0zBDRDfhL0TJC4Vz7BlQMcwi/NcaQy6wWVyYs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oTDKtTiZaIjMHwsDS08CQ+gMpkbx5BqpSk565D9QRHb71MLHPGSNPuA4Ndr+udil0
	 3TcYRpacSxTepVBA7TOFR5xmU6vxMG5hVDN/brg2YN6gIPmh0UKfeuYVZI34bNkfCW
	 A7SVtMJep1kzMDSoqChX0vqfGv1pADC9HDf9+501KZK2rQfYNCkVzlzOBDJrqU9Wva
	 2RSoSfu7Lf3TCM823EVMsat4jQurlpi18e/vqkivwqgkl3BH2KfLzOmLuWlN3vO9qh
	 E47yRDo6nc+yFm28GU8Nuu395WekUppfDTM6U5kdgnzmiKFoq0S9rXu3KOnB/+mxA9
	 K5vffAAj7RhCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 154D660FDA;
	Fri, 26 Jun 2026 14:55:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0E71231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A23A64066B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_Q31JHhOE5n for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:55:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 969554068F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 969554068F
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 969554068F
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:27 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49258ac7294so7311705e9.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485725; x=1783090525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OoJrb5BLXpJY86RFQPmsjxe4/2l4Yik34kW2fTFA18M=;
 b=lbxjHY2ymw63MVzjMksqhtTXUQRxsaY/iY3+QtJMJHVXpd9JJYjVN/goEf9OryuLis
 BSzBLV66y7Lh4ebCj3WA5byVNN4mI5dYyzRGWu7ToI/hDfnIXIeCqzTcDPaDepkcGXQW
 SfTYJPCG6PEMnFARDPT96jCpPOud86/LDa/2wwS5y+gElB0FmUjFYHk/BLnGCKMzxK5b
 EMnHLAQaOajFn1Z3ZgQXwKQqSmcbVJUo1969mBsHzuLFe7sGCuMzIaKKOI7M6umKolM/
 JEz71qFmC36LdjfFwHM5GvLJVDOu2MZtK6N1ii15+0s/j9A1j0HjYzsCB9Gy5k7kkV8d
 ILXw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/gW3mnET0HeGrXBef6KCPS83ptAerTrgqjiLm6vTQYpJjGKW/Yq+XN+kWqInaVcw/wAy5yuQn+cEA=@buildroot.org
X-Gm-Message-State: AOJu0YzHEaDhjdZKxDUovn/AALe/BjOf/1BauDWVwVy/kkZkBgpIrGLr
 Vjtr+Mo8sPmPoNsqzrhTnA6a+vkuT+C6XZEsvwmxYW80UWA71971QOtV5PMq9rF2eak=
X-Gm-Gg: AfdE7cnxYHp9BJgwi1+Zpb99Zy2kpM5Q1YJ1nM8JroWkpBQnoiMO2dxY8bc01Vu749q
 Zmx1wj1iH1m8UgywOoh52M1/CEJ2qFtqeSE3bvHgdkUiqB3p37iQMP8P+V3lnMaWF6+cthUdjGw
 hrBB9jcMmXvpl4dZyF8Lob3VqGlp938WxDY73L6e+PywSnVX5MuCrQVkpYwPoHFzH3b0JdyqucL
 YV9+EwZXixf+H5ZM/fZ0LIJC2J/m9B3+cJJaVEWx0wTJRa1d1Enh2JeywQZ0JujFaAw5U1Yjex5
 bcmGtQRc2XBHSPQwLejws+RMujggXN3B+0d4r+by1mPdMXzHUBU+9qvWeboQumovvr0y5u3Py1a
 MKc1noSy3fdPL7wTc0pwvHMVSzW6t39tc2UoPyk5uuIwqNvTCJ97mKl97uhLJ1w3ijiOegafRZi
 5w+H7LXfYVcgkDVUI=
X-Received: by 2002:a05:600c:6094:b0:490:da12:f1fa with SMTP id
 5b1f17b1804b1-4926689343bmr108413125e9.31.1782485725488; 
 Fri, 26 Jun 2026 07:55:25 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49269002511sm82949545e9.8.2026.06.26.07.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:55:25 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:55:24 +0200
Message-ID: <20260626145524.342840-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618075411.969878-1-giulio.benetti@benettiengineering.com>
References: <20260618075411.969878-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485725; x=1783090525; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OoJrb5BLXpJY86RFQPmsjxe4/2l4Yik34kW2fTFA18M=;
 b=A8vMG8sY9s94h4x24isIeKgtMxft7xpuCQFircxPYpxc0bw0x8VOs8Zn+TgCgGNV1E
 HN//jE6ieS0oou0fdgoZpqjMd9eJq6XA+hi5ZgqI1JFvCvw560jgrF/r1T6ACEmgp0WZ
 9dkb7GCszutlo1Z914At32B0JNfq4Pc7KpK7XHq+tfg/eBPXHreVuGWG2O+zcsMHibzS
 90s3XbZ0hTPDLNR8bLATL6Jn7+jlDZWyMFrfAknmdOSjn83kGAO8TUqcUtTPyS2AIxzU
 CjXMuNF6XlFm1FC7wt1bMEnp5dsxONog/b52l9dLgUQyHnf3UzYXBg/s5I8VV7jIZyUU
 VD2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=A8vMG8sY
Subject: Re: [Buildroot] [PATCH] package/util-linux: security bump to 2.41.5
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Security fixes:
> 
>  CVE-2026-53613 - mount(8) TOCTOU race on target path.
>    The SUID mount does not pin the mount target directory, allowing a
>    race between path resolution and the actual mount syscall.  A local
>    attacker can swap an ancestor directory component between these
>    steps to redirect a mount to an arbitrary location.
>    Reported-by: Xinyao Hu
> 
>  CVE-2026-53612 - mount(8) TOCTOU race on post-mount owner/mode change.
>    The X-mount.owner, X-mount.group, and X-mount.mode options use
>    path-based lchown()/chmod() after mounting.  An attacker can swap
>    the target between mount and the ownership/mode change to gain
>    control of arbitrary files.
>    Reported-by: Xinyao Hu
> 
>  CVE-2026-53614 - mount(8) SUID bypass via LIBMOUNT_FORCE_MOUNT2.
>    The environment variable LIBMOUNT_FORCE_MOUNT2 is not filtered
>    via safe_getenv() in SUID context.  A local attacker can force
>    the legacy mount(2) code path, which uses a two-step bind+remount
>    or propagation sequence with a window where security flags (nosuid,
>    noexec, ...) are not yet applied.
>    Reported-by: Xinyao Hu
> 
> Full release notes: https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.5-ReleaseNotes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2026.05.x. Thanks

> ---
>  package/util-linux/util-linux.hash | 2 +-
>  package/util-linux/util-linux.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
> index 5a5656212c..b6393d6ec0 100644
> --- a/package/util-linux/util-linux.hash
> +++ b/package/util-linux/util-linux.hash
> @@ -1,5 +1,5 @@
>  # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
> -sha256  a8c213cc06048862602a42b2d299b340001f6d05c4407b549f3e03521df83688  util-linux-2.41.4.tar.xz
> +sha256  f586e35d320ff537aab3ffeca37e9ecd482ccbe013590db4429a414d8aa6a728  util-linux-2.41.5.tar.xz
>  # License files, locally calculated
>  sha256  4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711b46cc13a40bb3  README.licensing
>  sha256  527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f7544a6161938ed1  Documentation/licenses/COPYING.BSD-2-Clause
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index fcce9a7dc8..20bdcc5c3f 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -8,7 +8,7 @@
>  # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
>  
>  UTIL_LINUX_VERSION_MAJOR = 2.41
> -UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).4
> +UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).5
>  UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
>  UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
>  
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
