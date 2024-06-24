Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCF7C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 19:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D80886082B;
	Mon, 24 Jun 2024 19:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXBhoiu64qNy; Mon, 24 Jun 2024 19:26:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09D4D60AD9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09D4D60AD9;
	Mon, 24 Jun 2024 19:26:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09DEA1BF95D
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 19:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC36860AD9
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 19:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwg3n2vors5I for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 19:26:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D184860A9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D184860A9D
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D184860A9D
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 19:26:36 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42499b98d4cso1626395e9.2
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 12:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719257194; x=1719861994;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H5odTzp5aeyZ7ObFs6amRFsv3Jw9p5wuKhYgcREHKMM=;
 b=IagnThcE65RqY0IaknMVvDOCt0Lji+aKNmHY2cr2zJC96DqYRM8YtQ5QXdTqSB5oXe
 o07U8uLdNRawIFxk80jqCaYDusFez1NebldsBXGmZR9GJ3WK9fvMU8Hsvd+stEFxlFOC
 Z5jHiNNR21FiojexiORG1FPqAdjBWmyYcnLuGIHu0Q5UwrQ9s6OhBlNnD2zLjD6kNglr
 N+7uzKUltEYIzbGnPzH8Us1DvTUQrcF8oRL8v8tM8B7YFaeXSAAopl3pAbIzis3Hb0wU
 LXO+qFSFUU1T0dgNTQ0ykBHVniARgwWyIWCUnwtbOZUpgIcTks7UrrfCNHbsGWvdlcX/
 87Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBb8IaSq4wFu2H4VxPOrzYreH9NsvjbbPj0crhvUAtWLDQPFaL2fnap5G1NQg9wNEKuvQpd8pmuC5w7SHDAc3NTpFcrnkUuw==
X-Gm-Message-State: AOJu0YyF2Yt9vpOubq8wdfly/9piCa7Z9D0McKYdCCyt9TUA9Ye8BMds
 0KsKHHp9bax7Oap5apcNKaPHkaloSyoQGsHn+oO7T+udPOU9Iezs+OHf895rnVs=
X-Google-Smtp-Source: AGHT+IFzWvS1y0sNF+fISMMFhXVn5bSjgY8+4EnG9QHGztemtlOkmd3xxG7Vx09yIli9t+ShKT6vTw==
X-Received: by 2002:a05:600c:3b9c:b0:424:8d36:4a37 with SMTP id
 5b1f17b1804b1-4248d364b42mr35337485e9.28.1719257194042; 
 Mon, 24 Jun 2024 12:26:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0be841sm183549285e9.20.2024.06.24.12.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 12:26:33 -0700 (PDT)
Message-ID: <556b4a68-914a-4025-9cac-d1bfb13f10d7@mind.be>
Date: Mon, 24 Jun 2024 21:26:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240520194136.2470200-1-giulio.benetti@benettiengineering.com>
 <20240520194136.2470200-2-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
In-Reply-To: <20240520194136.2470200-2-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719257194; x=1719861994; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H5odTzp5aeyZ7ObFs6amRFsv3Jw9p5wuKhYgcREHKMM=;
 b=N3UUdIE71BA5Q8vkk77dtGsLdku0AOAgwb8UnDh6dddjJPAXeSb4nCLVv+6SUnL/Ka
 F/aBJcY1t2BaxuuKxK0Qi07NzIkOu6PEnqyeWuLKN0eEkVJ9KlfP+Zh6/yWriarg0rRT
 Gooeb1BB0rafrq6NRXEMTcfs01G59YBhPpug+102XZI7rFByECbkdXkzdQ2X7ruIQrYU
 MJ+ZimY76FRNB4+5OGUGnA1Q9lDQpCyUOew/qskqUrzBDRQH5VkRHjozpYwXENjXA6JU
 rWyrAEJ7/fe6dbRuhTPwzdxh+B/jHOC4BLopcEja3GxuCg+v8ZJQzNvA5PUeudb+n95r
 bk0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=N3UUdIE7
Subject: Re: [Buildroot] [PATCH] package/rtl8189fs: bump to version
 2024-05-19
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/05/2024 21:41, Giulio Benetti wrote:
> With this version we can build with Linux 6.9.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rtl8189fs/rtl8189fs.hash | 2 +-
>   package/rtl8189fs/rtl8189fs.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
> index 2746194f43..5ed0bbd376 100644
> --- a/package/rtl8189fs/rtl8189fs.hash
> +++ b/package/rtl8189fs/rtl8189fs.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  b28c15f4631f4151ea6fca96d59aec931766af49ccb7a0d5e1080fc41a323713  rtl8189fs-eb51e021b0e1b6f94a4b49da3f4ee5c5fb20b715.tar.gz
> +sha256  a5063b1554acd08bcc084926d1ff80148fe8521a6aefb7061cae68b7c4a7cdb1  rtl8189fs-9a82349c2c40515f9d20b9f6721670f76b4e1c7a.tar.gz
> diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
> index 174bb346ca..afb8685bac 100644
> --- a/package/rtl8189fs/rtl8189fs.mk
> +++ b/package/rtl8189fs/rtl8189fs.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8189FS_VERSION = eb51e021b0e1b6f94a4b49da3f4ee5c5fb20b715
> +RTL8189FS_VERSION = 9a82349c2c40515f9d20b9f6721670f76b4e1c7a
>   RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
>   RTL8189FS_LICENSE = GPL-2.0
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
