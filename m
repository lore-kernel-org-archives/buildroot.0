Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB931CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4EDE60B35;
	Fri,  5 Jun 2026 12:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwLHn5EtZffP; Fri,  5 Jun 2026 12:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9ABB61078
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663818;
	bh=BchHRjNzxknsd3A6zGYALTFvsREKhlXV+7viyQv1QYc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e0gK6+ynZ/5lmKH/zah/ntx7Y6xlPtr43bxpuDi807xjuZxvxiKqURMyIlnPtiN2u
	 j3ms0ghhYFrDiEjTr98LXNxed6J1A7coSruDSXdXs5Yrt17RnfNJTTedC+UkazZXcr
	 NLt+aH/QrReGR8NlhxaZJ9/lcsH6pT9iiZ+XLIVjMGdisNc6Bt3UPjSIPo1McDlC0r
	 bAmHXnLmH0szWcyf9Rt7zgrVOMm34nwEJF4L7oEYrNgIs1rMUuTPoaYCS9EpQfhQCj
	 ZEdiJW/WtsAgTWn2r3cBlQ9ZLbbMocsAtgYzv40QJJefy3GDBvnHsNQTpo4XFf7zeW
	 6l6nIRksPNBzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9ABB61078;
	Fri,  5 Jun 2026 12:50:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A972F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B1A641EFE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1opDKBA1acmZ for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8254E41F00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8254E41F00
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8254E41F00
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:14 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4905529b933so18931235e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663813; x=1781268613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Vqt3obepMTAHJxwe7Hz64nuaaIf3at6ekEyfV30tjUc=;
 b=dW5jGqHMNDgEkX34+Py7/+S6Q9GskxkHHQTZrown5NFVMWryGUILMPY3Pu+MujaClR
 dWu+6lIcbm3mkVVbKxZoRI+ubQU5ffCVpSwaYBkHYamx5DNqIdZylWT8LtjEA2msgYv7
 QyXQD6DZVrJQs5HPZ0q2wxdIFVuXzYrHJW+oBSceiDkDK5asrg51GyyuqZmb5TyU28+H
 I8zcgrFKtt9wgylDOJ3dQTYzpTIDVT757QDddNuL/LgBsy+E2BiQS5tHDH6zbJM0Tx1S
 v4QWcBWNXVLeUyEoQ90lCXPiDufbmz5yylMrxgyL3b5UzzjTb3QdRY9Omu00t0RUIulX
 tE7w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/BWSRMzVX9Cyw6c7n+VfKCtLZCQeBrWoqyWSaLjwpJITkGrDXmVZ5+Xnmr2DuxicijP32krwgWYts=@buildroot.org
X-Gm-Message-State: AOJu0YzYZFcv48Q9NUJSwFgz5qki2BTTGuUYPHRgAhrOLcyc5ln7zf+0
 UCxV+wyCxCdOJhsydUj/se6r6FaZj7nzv66Qy+eJI1KgaODiHmcNy5eyzEprksLVDIQ=
X-Gm-Gg: Acq92OHKs/3LtqAEpvGukW+PHzEYSaxP9YnklysEy+YmT8Dby+j7vsDPeWh2mne6kVJ
 f1pEBauTXhfQKYjmbgoHpZPd0hbI9zBX7SyMW4C4/WI4q7cRLtViuc95Hoz6ZoZKeEPX2YpC/3q
 gcZ1W/zaeJXPzEbYNuPH4u5U7QCYlO6zdHa2I3Q8bOwtEAOCap10KOgPEyVv/z0CbLRZy5UZfZV
 3L7cM2SeKD0PjhFj0eSrTIO1wYqWSVEiESGkdZVJeqJwnBlLiO0EuBW98P71ahvTOqnlBEBU1KS
 Znz5fvWCkKUrMxjSUZ7/LH9aR+Abac5PGZyDxEOxzTO/k4+ejcr4kSYKiAgkSXDmoKnhFE5SxXn
 7Gud/iTWqUMygSl+Tdc5NEq8Fb3lXVzZQQm1H++9GLB5o1ZhRyWvnh9OmqeKss1Q9NP4+JhG1m0
 GnN4Sirn8WomXE341nhAPNFQgW21iN7EdaHuhk
X-Received: by 2002:a05:600c:314e:b0:490:9d1b:2022 with SMTP id
 5b1f17b1804b1-490c257bb25mr57353395e9.13.1780663812518; 
 Fri, 05 Jun 2026 05:50:12 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcb13sm25015334f8f.2.2026.06.05.05.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:12 -0700 (PDT)
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:11 +0200
Message-ID: <20260605125011.272667-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260324-qt5-5-15-18-2025-02-x-v1-1-9d25b343a6e3@cherry.de>
References: <20260324-qt5-5-15-18-2025-02-x-v1-1-9d25b343a6e3@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663813; x=1781268613; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vqt3obepMTAHJxwe7Hz64nuaaIf3at6ekEyfV30tjUc=;
 b=FHDBQFt6Ub+73mt/bT9p8MWhBVPXfS7X/bZTh7fIN5XQDdB8SnbNMp5ANmx+nk0CSy
 Omp/euh6zEIbkvMEKVehU885UvNT+EexGbUQvTufmWWAoe8N/B6rUk5L7Ta5CvfwXgcO
 F9EDHS/0M7mH5dHO9HvnWAf6CWe6nq9lCQo899c3myW1T0rwVzWYe7o/K7tFeHqNx/7t
 9A3MIxPKw7YFjvGkS5s5aCrM0Wl14wFD3EnhT4a5qKk58rJ8qFz6FIooicD9i95kjcAY
 Omgom5p02DKj0NyXTmMq9uJxjp3Bmv2UfXmyupeO5BSuwSGMpVOmhLg8f/mAk1WhPq0x
 AqCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FHDBQFt6
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/5] package/qt5/qt53d: disable
 assimp support when BR2_PACKAGE_ASSIMP is not set
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
> If we don't disable it, the assimp module from the sources will be used
> instead of none. Unfortunately, it currently doesn't build so let's
> disable it when BR2_PACKAGE_ASSIMP is not set such that one can still
> build qt53d.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/qt5/qt53d/qt53d.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
> index 8d9babd704..459b019902 100644
> --- a/package/qt5/qt53d/qt53d.mk
> +++ b/package/qt5/qt53d/qt53d.mk
> @@ -11,8 +11,14 @@ QT53D_DEPENDENCIES = qt5declarative
>  QT53D_INSTALL_STAGING = YES
>  QT53D_SYNC_QT_HEADERS = YES
>  
> +# command line argument separator
> +QT53D_CONF_OPTS = --
> +
>  ifeq ($(BR2_PACKAGE_ASSIMP),y)
>  QT53D_DEPENDENCIES += assimp
> +else
> +QT53D_CONF_OPTS += \
> +	-no-feature-assimp
>  endif
>  
>  QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
> 
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
