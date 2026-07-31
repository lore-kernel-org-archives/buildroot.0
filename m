Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48749C5516F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D08A40FBB;
	Fri, 31 Jul 2026 12:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tCht_jR-xFjE; Fri, 31 Jul 2026 12:05:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1852B4104E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499548;
	bh=MZ7INpRX2oP4/wBJ2ujtKalGc6BMUXBUEgeYjZwKh84=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KEnbSZ+vDsXl3ih1gkDOw1/nnyBdn4dwqaib4pRhbdwki4cBWJzphrCjmXrBIswaG
	 UPu4G4bwGaWYdwiIkAYZC2urK8ztUG1DKUQnGmHFMu0abo4U4Oiu5J0PHR9Jx/m62w
	 OQgW1CXbuEN6EHr9mc2Qs237JGeJHZ3KEvbYxsnH4Ilr7WqQcVkDjfxbpWwbCd5JYc
	 wupAAuCDDybY/U7F2a6++cQ61hZVFQy8NH00RBvZBgRZL8z7vtuSf6afo0gGG1CP2C
	 aFs0uKpuuxBMhU7AhMdgvfHUxEdEcZkKylECmYAWGaJ7MKhVczUI9LKATAr0InPecq
	 BlDeyV/wBAdUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1852B4104E;
	Fri, 31 Jul 2026 12:05:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F4A827C
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C74D8133B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtR6IsnGPAEA for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF4B98133D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF4B98133D
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF4B98133D
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:44 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-47f3b39f2a1so219892f8f.2
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499543; x=1786104343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4ZAonod6VPjzg2qIa36Qz2voDx7klvZkPX+JRKC5ccI=;
 b=DJ4DgxooClwNxgcTpc/vDrCTvZKUZKWKQFwpj+vTH98ALopn5J3BlJ/4VzNxUZV4yw
 6/0QvvzFJF/7nrlnA8wRhDei1/2/M29nyZWv5TpxwOLaszHdl8gllVrK88/h1JPdf87C
 2oUJr33GjZH88N+Jdn1CTyZ9Xsp7DIIDBgwjv5cAo4xJfHSTJ15fONhZ8mIPzpbYiMkI
 SA4mFHQEu4o6pMopTGTXWpE+dzwAWuOfhs35c184W2hyniw6Cu1iKbmCTOJdylBezEdO
 gGFRXPoDqcLNuorWmOenyO+3NT1fUI6ASiZxzslupZytRjNtE1zfcTaDlxaY8ZnO6v5t
 PuZQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqj0eEfzUR/9b8g8R5ZWKrAQp5GkPG2eyKtBKINHhzMfVzFms+IPUvtyaWXf8QJgLOkhdVg2mg/3VY=@buildroot.org
X-Gm-Message-State: AOJu0YxD3gqXC2v9U9RhcsdLE5/GPuH7MxmlRAF+i1xFMDCZHGI2cD2c
 x07oXmfC5CttPN6SDZP1m8UnqXD4c30F134zpuhQK+GLpfNwcZ1pGQp+xDUaBPUTKGgRr2UiI6k
 26w4q
X-Gm-Gg: AR+sD13LnHseVjg5miGJzcoTx107TatuEuiAgQa6p80aMZybYj13x9p/NNrkmoVMKGN
 SGbovK6dOID9Y1goXGqiZbupmbEflDpYBpju4z86b663eNl7TOR7u5rS8m4+Bna24j4xUrbpAC+
 zSSlf5x6hWSK/0YQcX4dCYIHHm2Xq5MoLFTnz+NErvWj8lHh4Ihzf6mxCJRmJbop4/HfsvU8dNz
 zBeMhhqwfkyvbX6JmKhJXzNR5Lybh24putCH6F20qML31mBQ7jtif6zLwPusyCIr1juiOGZQXy0
 CmO9Mkoi7R5ZxJjAqfrJADIs6HDHQXG+2YSnGHli00bfJBN2djv2ksi8G1VcJ4o1hzZ5sh6BsVv
 Pp9U/z23/2vCqbGKUNb0PzZWVPi3OWC7PL+mDuIt5L57gjQEkVhkA6le4xQ1d20MxQVHHIoqBST
 hKe5SLs8RWwFJABh8KQ0aq/li4dgf163/vJAKsvitB7AZU5O9YdHrVDJF76qs/QEzD0sh60sh5I
 2p+uhBhmO9yLC6HAvd4OEyRAA==
X-Received: by 2002:a05:6000:25c1:b0:47f:81c4:36a5 with SMTP id
 ffacd0b85a97d-47fd2adb96emr4021176f8f.15.1785499542968; 
 Fri, 31 Jul 2026 05:05:42 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd456a5a4sm4162673f8f.20.2026.07.31.05.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:42 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:41 +0200
Message-ID: <20260731120541.3944-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722153224.624762-1-fiona.klute@gmx.de>
References: <20260722153224.624762-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499543; x=1786104343; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4ZAonod6VPjzg2qIa36Qz2voDx7klvZkPX+JRKC5ccI=;
 b=Lrqk5CNrlxpfHIwkJpqcUhm/ywyK8MeOWTeFlCVuELvdH5XQ1TtwhXbG2/V/lA242a
 RlXLM4hcPlvPwvtyG6hJew3HCOz085buZJJOMa3mxnwh4rKHb0+2swFf4fCDnC4/EBwN
 j/Lhg6wFvM4xlq7thIYeQt3MC2ncWoT34i9rQIcI9QrkNczQtD60Is7AUHk3U5Yjjcna
 UPHyXp+N9uzL2MHnx4UGTWlWTqeDo/vT0Q+NIuWGDX81FVJthtphR7ZAgS2jZgvF0dbz
 y3hvY0p6l1Y1fbIAp88BkWGfhIr+EldiZLpzfBIJr76kNVLCIoIbGypfgKeLCQC6ew4f
 j85A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Lrqk5CNr
Subject: Re: [Buildroot] [PATCH 1/7] package/skeleton{,
 -init-*}: add license information
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
> All these packages are part of Buildroot and thus under
> GPL-2.0-or-later unless stated otherwise, as described in COPYING.
> 
> package/skeleton-custom is excluded because it provides a way to copy
> skeleton data from any location chosen by the user, the license of
> which is unknown to Buildroot.
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/skeleton-init-common/skeleton-init-common.mk   | 2 ++
>  package/skeleton-init-none/skeleton-init-none.mk       | 2 ++
>  package/skeleton-init-openrc/skeleton-init-openrc.mk   | 2 ++
>  package/skeleton-init-systemd/skeleton-init-systemd.mk | 2 ++
>  package/skeleton-init-sysv/skeleton-init-sysv.mk       | 2 ++
>  package/skeleton/skeleton.mk                           | 2 ++
>  6 files changed, 12 insertions(+)
> 
> diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
> index 4a67f51c19..299f2643b4 100644
> --- a/package/skeleton-init-common/skeleton-init-common.mk
> +++ b/package/skeleton-init-common/skeleton-init-common.mk
> @@ -4,6 +4,8 @@
>  #
>  ################################################################################
>  
> +SKELETON_INIT_COMMON_LICENSE = GPL-2.0-or-later
> +
>  # The skeleton can't depend on the toolchain, since all packages depends on the
>  # skeleton and the toolchain is a target package, as is skeleton.
>  # Hence, skeleton would depends on the toolchain and the toolchain would depend
> diff --git a/package/skeleton-init-none/skeleton-init-none.mk b/package/skeleton-init-none/skeleton-init-none.mk
> index 8181aa0354..d96af89e19 100644
> --- a/package/skeleton-init-none/skeleton-init-none.mk
> +++ b/package/skeleton-init-none/skeleton-init-none.mk
> @@ -4,6 +4,8 @@
>  #
>  ################################################################################
>  
> +SKELETON_INIT_NONE_LICENSE = GPL-2.0-or-later
> +
>  # The skeleton can't depend on the toolchain, since all packages depends on the
>  # skeleton and the toolchain is a target package, as is skeleton.
>  # Hence, skeleton would depends on the toolchain and the toolchain would depend
> diff --git a/package/skeleton-init-openrc/skeleton-init-openrc.mk b/package/skeleton-init-openrc/skeleton-init-openrc.mk
> index b0538ad03f..b6b97a4e3e 100644
> --- a/package/skeleton-init-openrc/skeleton-init-openrc.mk
> +++ b/package/skeleton-init-openrc/skeleton-init-openrc.mk
> @@ -4,6 +4,8 @@
>  #
>  ################################################################################
>  
> +SKELETON_INIT_OPENRC_LICENSE = GPL-2.0-or-later
> +
>  # The skeleton can't depend on the toolchain, since all packages depends on the
>  # skeleton and the toolchain is a target package, as is skeleton.
>  # Hence, skeleton would depends on the toolchain and the toolchain would depend
> diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> index b312fe33e4..601285de28 100644
> --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> @@ -4,6 +4,8 @@
>  #
>  ################################################################################
>  
> +SKELETON_INIT_SYSTEMD_LICENSE = GPL-2.0-or-later, LGPL-2.1-or-later (factory/var.mount)
> +
>  # The skeleton can't depend on the toolchain, since all packages depends on the
>  # skeleton and the toolchain is a target package, as is skeleton.
>  # Hence, skeleton would depends on the toolchain and the toolchain would depend
> diff --git a/package/skeleton-init-sysv/skeleton-init-sysv.mk b/package/skeleton-init-sysv/skeleton-init-sysv.mk
> index 009dc100ea..dc9793d44f 100644
> --- a/package/skeleton-init-sysv/skeleton-init-sysv.mk
> +++ b/package/skeleton-init-sysv/skeleton-init-sysv.mk
> @@ -4,6 +4,8 @@
>  #
>  ################################################################################
>  
> +SKELETON_INIT_SYSV_LICENSE = GPL-2.0-or-later
> +
>  # The skeleton can't depend on the toolchain, since all packages depends on the
>  # skeleton and the toolchain is a target package, as is skeleton.
>  # Hence, skeleton would depends on the toolchain and the toolchain would depend
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index dc754f1244..fd606c8085 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -4,6 +4,8 @@
>  #
>  ################################################################################
>  
> +SKELETON_LICENSE = GPL-2.0-or-later
> +
>  # The skeleton can't depend on the toolchain, since all packages depends on the
>  # skeleton and the toolchain is a target package, as is skeleton.
>  # Hence, skeleton would depends on the toolchain and the toolchain would depend
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
