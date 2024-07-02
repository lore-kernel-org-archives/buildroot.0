Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC81DC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8644B81F89;
	Tue,  2 Jul 2024 07:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Ya7aLwdPOav; Tue,  2 Jul 2024 07:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D90D813A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D90D813A3;
	Tue,  2 Jul 2024 07:05:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A07061BF313
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C470607D2
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYmW5RhivP0T for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:05:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 744A560789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 744A560789
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 744A560789
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:05:06 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so44813021fa.3
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903904; x=1720508704;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mGJHugBga/5hFVuHkw7SnasCKY0MHOgZKpz5lKMuGl4=;
 b=V7aHHyAbDBX6D8CzAGW4xxQ1TCoXBRXLBkMXPYBozG4OvKHxCxH77eCDNi8dtDOp85
 RFjbJZIH3d/Vh8+O48IlMyHq2tow7Yqu+AdXgBM95WAgj0A/P0JxVZUuKIQWHJb955iI
 PTnNqrNX6meL0LQHGXuJEfkvaOLpphW/pIeRbE8N6V5tEBv03LEpnn1905h0kssG67ze
 9ux+0vsf9Ybwxx1nwE35TwMqVU+S2Uf8dWTTQlXK2pI2pgTxoLk93cGATunww0vBzrn/
 NiCbwGz4VkvzJdBqFbI3w1FceGy/T1E9QG++9T7Q+nuDJ4/XgZnHrJYBJOnATVPU/aiU
 RJnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdcZgjKhZBYJREJ9dRXn54jaE4S9fqPOTBY0xqyL7WpUNtdWFLNFL40S1BGaGoNc8vzSZjDJbdlppseMMwbbvqe2JQ4t3GjA==
X-Gm-Message-State: AOJu0YyfOLYiiIyyxv3aLLDTdvZMsItvCrtn8UR9VID2BFwJupmN69QW
 yS2UKWg/XrVXQouHFNPS9979xGdMRi+lERQirLHh5yRsw8OdfYmffG/oKOgTXYmnIbePBxUHRA5
 x
X-Google-Smtp-Source: AGHT+IG++QKobOI6WmhPbUr31ZwGMeJNnCx83GT3suPI0HF3FXCzuCRCqa7XCbVfv1OScUj4n11HFg==
X-Received: by 2002:a2e:300e:0:b0:2ec:92ad:19ad with SMTP id
 38308e7fff4ca-2ee5e34575fmr44020181fa.7.1719903902378; 
 Tue, 02 Jul 2024 00:05:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af55aeasm181824815e9.17.2024.07.02.00.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:05:01 -0700 (PDT)
Message-ID: <fe028654-feb8-4255-b6ea-8f4ab7a20e4d@mind.be>
Date: Tue, 2 Jul 2024 09:05:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701182128.1740656-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701182128.1740656-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903904; x=1720508704; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mGJHugBga/5hFVuHkw7SnasCKY0MHOgZKpz5lKMuGl4=;
 b=c9SFCWYxt1oi8o7oOE+TDsi3F42WiJveSN1h7kzeqfqi2w3/GhNE3hboYImWOFPxEx
 Ov2ZDY8qpjJKbQZnLWTAX5ryanH/XcMB5AJiE5i2XVJmiPxYEusGrKpi1A02G1JIoWek
 YitJyEUIxB/HcaMdirPgnOgvQXAE/6HTw8mYFdwzEkY2W1Go0TFVegrdOj3tBjS2Pbf6
 +waxNMiL2PcxXMkY/uLMTxyrxt0FkzMVY5sFjb2Sy03MpOUlGkTbVq1XqRdUYlG4bbpN
 1yasvuyISujZirhPQt6HIb1asWcu5MmaMk/c2IUDvII912ySiOpXiapHMPbuy2cq0DiJ
 SWmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=c9SFCWYx
Subject: Re: [Buildroot] [PATCH 1/1] package/python-beautifulsoup4: bump to
 version 4.12.3
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/07/2024 20:21, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-beautifulsoup4/python-beautifulsoup4.hash | 4 ++--
>   package/python-beautifulsoup4/python-beautifulsoup4.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.hash b/package/python-beautifulsoup4/python-beautifulsoup4.hash
> index 0387af8a65..149eeff67d 100644
> --- a/package/python-beautifulsoup4/python-beautifulsoup4.hash
> +++ b/package/python-beautifulsoup4/python-beautifulsoup4.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/beautifulsoup4/json
> -md5  b49a6696a762e946c2be97c36a5adaa8  beautifulsoup4-4.12.2.tar.gz
> -sha256  492bbc69dca35d12daac71c4db1bfff0c876c00ef4a2ffacce226d4638eb72da  beautifulsoup4-4.12.2.tar.gz
> +md5  4ecf1fb561e84adfb3146650e3d51394  beautifulsoup4-4.12.3.tar.gz
> +sha256  74e3d1928edc070d21748185c46e3fb33490f22f52a3addee9aee0f4f7781051  beautifulsoup4-4.12.3.tar.gz
>   # Locally computed sha256 checksums
>   sha256  55b4d8d4b1e5bc86d10efac91b74c87bcb77526b0f5b9edaf8b9cd2adc7397b2  LICENSE
> diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
> index 4c8b996d07..bb02807cdb 100644
> --- a/package/python-beautifulsoup4/python-beautifulsoup4.mk
> +++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_BEAUTIFULSOUP4_VERSION = 4.12.2
> +PYTHON_BEAUTIFULSOUP4_VERSION = 4.12.3
>   PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
> -PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/af/0b/44c39cf3b18a9280950ad63a579ce395dda4c32193ee9da7ff0aed547094
> +PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/b3/ca/824b1195773ce6166d388573fc106ce56d4a805bd7427b624e063596ec58
>   PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = pep517
>   PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
>   PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
