Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE05F9D0D5
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E7726F497;
	Tue, 14 Apr 2026 15:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTKOxJa2ClID; Tue, 14 Apr 2026 15:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 183D26F488
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181471;
	bh=50m09MIdL9cFJDQhJNIExiGIAdhZKG2G/KWdG0PL7uc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DLOe80r94drI7gdYOSGTf9dh/gL7ZBocCGa17H6wQh9o+o/ntgAFr97whmN5MOQGd
	 eoi39nmXsfpVKuoqPKsf2C47KC6kvIQBosbXOyMCidebRrQuq8v8dWHs/yNHyhlC5x
	 PAsMA5vzZAG8hL34IO8DIwnsOtDnE2n4VG3Px0cd9pbw7eJjb47W3cIXlpCrRw5VBa
	 /N8+odFWGGZA9vd1RvxYUO090b/ZijCc91n5l4htTdg5v4yaXu7Crfn0S3ZMg4qX8C
	 RVdY9EYU6oIeS19L8f+znT/7XBx8NltMuitEIEIKvtRM3J+DDNF7xk0i3TOF0bPsG7
	 QQSOq5rKa/uUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 183D26F488;
	Tue, 14 Apr 2026 15:44:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08C98283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE5F46F488
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WUeIJbkpLe1N for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:44:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E77FF6F47F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E77FF6F47F
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E77FF6F47F
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:26 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so77386165e9.2
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 08:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776181465; x=1776786265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=doEkUwtYrDhPSNATvNwnFgUK6AUVjos3yHxmNHkESus=;
 b=TWIwueV+2l5F3xNPEFTNQtQUYq3zV43L8PK/LGF2YkRV8L1YZRANAqO5TxCjCLNXDV
 mgPnxwXj/0qrunoEOeqhqrNwxq1lkNQhOUKV9VjW0jOyrtq0VdLZEoiKqWCBZJj3Wm0U
 4c4Z4XXTJNjNNyyMVsAxbJ7KBbUq78DUO2w+Ul5Gy0Vfecn4aD9Vx1RepntyjCqR4cUQ
 4KLtcOwe0MuwD2Rt20Szznj23mie27YXF2h9pui0VWGu5oILUZikS0ZjIoRus0GUbWUP
 8VXFzXGOnwTAbf/RVC6wnW9MAt7MW12uHG7U4lWlguanL1XcKxnk/gQMPfjROZbpWz2T
 0kbg==
X-Forwarded-Encrypted: i=1;
 AFNElJ81Pok+4xpDLKAXj4c5TFmn+sX5DB0Dya8gWQWoieYBSNJeNjNfpJchrNyhO6F/nGsBMbaoMrRtdcQ=@buildroot.org
X-Gm-Message-State: AOJu0YxKbjBKdD6xxrEv5oU/nrtMfjXuuTaoaOrKcGhdM51SygDQU6qf
 5QpZ797UzIXRIBQu24ZzUAwI0rxeJO+g5oh5AMV4i18Cc12JNoHKD1LRIdTYFFRMrYA=
X-Gm-Gg: AeBDietzxKQT8F7kt5CH3XyDPFGP2rvf12KHD4a/RVMDnU9xaKuwD/F9ohzm7wialDn
 KPtHk8Uyym/I3H4dDJnPVwXKmKfP4SSjccdCY33PzK7MfeGUNiCb17uCqi0yZDzkXeust3tJqTw
 wr8bzvfFmDq0TWYQ94/RJ7Q+v7v709c+1GZ0e3+8rIZkWyYBlO7Szav5jkt3aq9IpooFK6xdfH2
 FZuPPN07vmuricCy0S6Ikb1+0/ubJmvHHqmM+q0oM5tul5gCcAQEdVEPMHvAjVIruZv/CRBpmgZ
 pSoeYXx7YgIpaDEtl4RsQGxJFcf5Og95fw+JnFsmwXpCxCKVGmCOiifrOtsCk2VHxL9xVHktJ0j
 f3XzBa7OjpvnMZRvx6lxUoaY/lZKVfShrKx01B202wUUrPKF/ozhzY7gQ9Eq7PRfw5GcTF8flRc
 b8gZONeyop73mp+I2N
X-Received: by 2002:a05:600c:820a:b0:488:81b1:ae36 with SMTP id
 5b1f17b1804b1-488d688688fmr250803475e9.23.1776181464655; 
 Tue, 14 Apr 2026 08:44:24 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede24eb0sm64276335e9.8.2026.04.14.08.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 08:44:24 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 14 Apr 2026 17:44:23 +0200
Message-ID: <20260414154423.334928-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330150605.300571-2-titouan.christophe@mind.be>
References: <20260330150605.300571-2-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776181465; x=1776786265; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=doEkUwtYrDhPSNATvNwnFgUK6AUVjos3yHxmNHkESus=;
 b=OqMwyWRxulK4GQtLgTupCAhhAPyiZXlMszph4zAdCOZ6fBz2VXx+gOnuAGgxe181sF
 AjueDP+BvGn2LZO9lLZ7Y0fBDiTbQZXk5XkT7DJMHhKE3fKYyWa32kKIm9dRQMp+4HCa
 1Ug2DOV56hxxvhRsGgwSHAaD30zUqEdvQdAiPnbHjgqvslu4ixOYVYRLWA4Ldp49qPkn
 cl82R6doJkjWjrX2jl1rg3SPq5s1HX1C++R+dULpfvx9v0JiLoEJ3gmcm1XLXehDLZ6d
 GaqpJbHb2z8UnFn204ELrAxq/vlkasAyQ7nQMzHq5VaKOA6luGiiD7KxBK3mshRXQzRH
 PyOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OqMwyWRx
Subject: Re: [Buildroot] [PATCH 2/2] package/cpp-httplib: bump to v0.40.0
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
> See the release notes:
> 
> - https://github.com/yhirose/cpp-httplib/releases/tag/v0.38.0
> - https://github.com/yhirose/cpp-httplib/releases/tag/v0.39.0
> - https://github.com/yhirose/cpp-httplib/releases/tag/v0.40.0
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/cpp-httplib/cpp-httplib.hash | 2 +-
>  package/cpp-httplib/cpp-httplib.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
> index 076b30cfa1..eb2b77bcd8 100644
> --- a/package/cpp-httplib/cpp-httplib.hash
> +++ b/package/cpp-httplib/cpp-httplib.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  909766cd7697153c9e588b0f96defe1868b7bb11d94b8d4f0c83bb4875bc9066  cpp-httplib-0.37.2.tar.gz
> +sha256  b52ecaebf0f94086c8b3305650412359d920c5267f6d9ce87f883198783af678  cpp-httplib-0.40.0.tar.gz
>  sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
> diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
> index 56e8c27fc4..5cc60565c6 100644
> --- a/package/cpp-httplib/cpp-httplib.mk
> +++ b/package/cpp-httplib/cpp-httplib.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CPP_HTTPLIB_VERSION = 0.37.2
> +CPP_HTTPLIB_VERSION = 0.40.0
>  CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
>  CPP_HTTPLIB_LICENSE = MIT
>  CPP_HTTPLIB_LICENSE_FILES = LICENSE
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
