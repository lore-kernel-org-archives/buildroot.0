Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BDDCD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD23380AF9;
	Fri, 15 May 2026 17:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRSvqtWeHovT; Fri, 15 May 2026 17:47:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3C6D80A80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867253;
	bh=Gs8hY5ld9oT6kY/psgNPGFWje6zLwEYva6iuB3bd6Z0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=THwUzaM1/d5zA/OLyOloHWOpNv4DZSFtEEepnnu11+PhqaNrVhyABtRzAHioFUHDH
	 p7r5S2g6nHsFl6lXq3NLtOwHSWbGj/jcALytnZYVGTc+n1JRADmCjdc+3xwHAjztKn
	 It/j0Jx/H/h3KaZNaan5/1XVaVCgkf7VqmOdYQniAReOkRRIy+HwsTB0zgfg8LylKp
	 IgSrL7ZPjW3vhFzr3COh66Qc3jnJjnFZeY7NbnHiM7j7PjzAc0+RyiXscdwbubz+Yb
	 tnl7bZF1AnxMhED5K33daNTFdMnzybVDWzke16Rz+ReUvsuA9tg9oTHpuNHFgOf3XY
	 UWJNoJ6yYJa8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3C6D80A80;
	Fri, 15 May 2026 17:47:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1662C23F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06A8361697
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9oCIShjE8pN for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E929B61623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E929B61623
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E929B61623
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:53 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-44b052142e1so23682f8f.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867212; x=1779472012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U4oj1vlbNJRiOZ3sf0/MzvtHtiNd7l2SJkZCaQ+2204=;
 b=AcQ+zlYrqz20ENTIincj06LcQzvQFebngRs+3iHJhlpY0DP6s5H1Ab5+o6hRymLj2q
 GhmkJE9h62x+ecYIAmud5CCF8woFAD/VnJPgyEonulldHbl55EysmmFdJ1e7sHR+xEgp
 5vEA8LCKAlwDFNH/oNgimnLTFkziK706OpPi7uS9kLdIp67lxUdGU0kxbSMLIuslN1KT
 w43YVb4SgCjdVG1TTf5LBxMowIGpO66LJLc8qofQCNRzB/2KHhpPQ5HnwG14tUjuxjxZ
 NnTe2LkjwHyLRn4uiw5tAHsvHwtFp9bE4XbBwNELJZsNmQyMvwGtyUXRcqwQiz9H4br1
 1zBQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/0GxRE6wHmn68Me2KCS5p7roxFVLE6PLURmrTJVCjv28XH+n+FyA4GWfqHMhoNeXgfArAG/I/Rrfo=@buildroot.org
X-Gm-Message-State: AOJu0YwaQ6iQpo9nx2lt4hUNj7CrVO8bUcsCixc11rjH+EHEHjGA0zTN
 z5RsOWLM7UnNP0/W0osh5ygyqFaCQYp6jUbhcjoDMx2IslYUxFJ071YnB8msanjzZEp044eWYX3
 j1lDd
X-Gm-Gg: Acq92OHSAKfb3m3cqdbW8er3+1w+v71ZAp9zESoOTILs7ssHpxf1CvbXOrTad7hbnmq
 PbLQlDdbOToIYgwZxObg3qUFJshQ6ye1CBDZTmj1uAvlLytGv2VeKHMSlquV5pyKatdwBtnJNi0
 wVLeGkXbmNH6mBnpZn6gdu/Sm5/o2ADhc+gTlqdVQaBOyJ2d7TMmV8OWdSnmdqNDcRSLbfNkWuD
 KKgRJkC7Pmct04/tAlTj1GZy55GokXwNAbxZzR2YMdptE5yq/1oe1+I8BT0DSGGmkgVznCzJ4Gf
 Hr1kYseVOiJYDNLbwXXaeFDWHAy1PgAhSgqFZV0Jkvr0Hm+pnDSAhRumHin8lUpl2BtVWh/BAaO
 1AMkg0mq9I28Objt/5hsGtxfyJ1BaqRyR21SAIf/wYq2uuwOfwp3pXw4QPlE/63Z8P1rTOoE8M+
 g2whlS5zzo5xJpJ1K1UMwzamri9cnW1U5rMp4dJAZRZ4pO
X-Received: by 2002:a5d:584c:0:b0:451:3b12:9bca with SMTP id
 ffacd0b85a97d-45e5c5f2714mr6815220f8f.25.1778867211806; 
 Fri, 15 May 2026 10:46:51 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e768bcesm17461978f8f.4.2026.05.15.10.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:51 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:51 +0200
Message-ID: <20260515174651.530966-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507171905.3974201-1-bernd@kuhls.net>
References: <20260507171905.3974201-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867212; x=1779472012; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U4oj1vlbNJRiOZ3sf0/MzvtHtiNd7l2SJkZCaQ+2204=;
 b=JJoO7BP2UzVyerkLdQU9fDdhwCUr8LQkqJuy3FPM4SKsI4jXyuwaiTvuMAhqiyjcht
 FSaft43ztl4dew/+9ZEv9uS6Z6kJdjlHisjqD3PZgd2y9znFbei+LqC/Zrj+Ty//Mv8B
 dbQrAzwe1+EahddVJ5q0qnYw1ys02Sz3G7/Gv2V+Wk2JQdm/kNrH3GzryrVvcPM5ZAPk
 3BD7fhp52rooKonfoVm6sizQFfIVvehfnZ7GMDl2qJlvnYu848UENmC0uXbaBeKmQPE0
 tP5Qt3H8KMsXS4ZeghNxAT4PkRKa6+G2HgKZysqT4vhZrrPWIdLJJC0dYOBOHkjK2ufR
 ovnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JJoO7BP2
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless-regdb: bump version to
 2026.03.18
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
> https://lists.infradead.org/pipermail/wireless-regdb/2026-March/001844.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/wireless-regdb/wireless-regdb.hash | 2 +-
>  package/wireless-regdb/wireless-regdb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
> index 39fc1a78d5..bdca077781 100644
> --- a/package/wireless-regdb/wireless-regdb.hash
> +++ b/package/wireless-regdb/wireless-regdb.hash
> @@ -1,4 +1,4 @@
>  # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
> -sha256  0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6  wireless-regdb-2026.02.04.tar.xz
> +sha256  5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac  wireless-regdb-2026.03.18.tar.xz
>  # Locally computed
>  sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
> diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
> index 31bc9e9a22..7e0c585401 100644
> --- a/package/wireless-regdb/wireless-regdb.mk
> +++ b/package/wireless-regdb/wireless-regdb.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WIRELESS_REGDB_VERSION = 2026.02.04
> +WIRELESS_REGDB_VERSION = 2026.03.18
>  WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
>  WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
>  WIRELESS_REGDB_LICENSE = ISC
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
