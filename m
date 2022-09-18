Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4354CC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 12:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3B5260E40;
	Sun, 18 Sep 2022 12:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3B5260E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bqcc-D2_LCS1; Sun, 18 Sep 2022 12:23:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFF4360E2B;
	Sun, 18 Sep 2022 12:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFF4360E2B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BBEA1BF228
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 174F060E2B
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 174F060E2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B83jlIYbI422 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 12:23:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 107A860AB1
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 107A860AB1
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 12:23:44 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id n8so11356620wmr.5
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 05:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=u3W5G2gUU6AcfA1XnIWKrjVsAcoJ0LrxNQG6+z8lVls=;
 b=3eXyUtyG+bD/74myC2oMIn8L2IqcjtoIhNAGg0klY+vPpf/s3uADCq03GEBE+43XXf
 aU0hMNo2xI+j4RzNwfxYWfUvzqY0sMcd8Q98nxONhr4SK2ZWBGw+6Ks9nIAAqlXYIXg/
 uJC7EAbyanJmK+UCtKio+opff1TdmsyRoS8raJFKon2MIVhz8ZJiSSXsaUlmqhtn+w+I
 6VuGaRb3ZJL4mh+n2iCqkM/egIwTTaQyST7LeNKS9cQaJHwKMrVlE+BFZd55tvFUhb4h
 yf5Zk29P21CnwJReXDX6PrX+pQ0V8MxEUYtO1fS+3VTls17HDtG3PRpnslHVnWq8AWec
 JAsg==
X-Gm-Message-State: ACrzQf29fQGk1/qVr9HyfGhe0WQsCLOe1+F3lAS23a38jA4MHoecmC8P
 ZmoDhKPH95PCGnHKDRuYhLs/hNY/PVDaZFyq1kY=
X-Google-Smtp-Source: AMsMyM5QvCe5paHoTreS5pYYK3WJilHokP8sFoSa7XJtyqoD8VG0J5Y624HrEOspWuFF5Xmq3LZtUA==
X-Received: by 2002:a05:600c:22c7:b0:3b4:92ba:ff99 with SMTP id
 7-20020a05600c22c700b003b492baff99mr9649267wmg.190.1663503823192; 
 Sun, 18 Sep 2022 05:23:43 -0700 (PDT)
Received: from [172.23.97.104] ([79.140.217.34])
 by smtp.gmail.com with ESMTPSA id
 bg31-20020a05600c3c9f00b003a5f4fccd4asm10274598wmb.35.2022.09.18.05.23.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 05:23:42 -0700 (PDT)
Message-ID: <d65d7597-60bb-2553-d7fa-cadd99ab8920@mind.be>
Date: Sun, 18 Sep 2022 14:23:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: buildroot@buildroot.org
References: <20220918122239.189147-1-arnout@mind.be>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220918122239.189147-1-arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=u3W5G2gUU6AcfA1XnIWKrjVsAcoJ0LrxNQG6+z8lVls=;
 b=VXgc+zQyvKTU+BcF8VDN+chygOaVLuphNeZu8a0S+IRpDhxTLEneZnMOUI7vGHp/E6
 j7i97bVom2d0QNdAsT+KpnQ/o74vOS+MK40HOeoqX4ZhFwtocroK9P2viSr2ko5rz9QL
 nQhjdBKgvsVQ+VvQPg5iXKVogbfJnEChnhPCxQ62f/4813+cS18SXCWBkhxqV70eBkY3
 LeZUXrziLL7rU6xnKwKiNw2a8frD6jHUqcCbR+ZOUYqKfJcDroAaDIYO7N9XBzs4MX7x
 nE9UUrLQ2iX5tP8A472tybTD2nxps7IezHBMvE7jV98gliDUp0PDemQOMh4z36DJFqj1
 UyfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VXgc+zQy
Subject: Re: [Buildroot] [PATCH] package/pkg-golang.mk: add osusergo and
 netgo tags in static builds
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/09/2022 14:22, Arnout Vandecappelle wrote:
> CGO (the Go language C bindings) normally links dynamically with the C
> libraries. It seems that passing -extldflags=-static is not sufficient
> to make sure they link statically. As a result, a build using CGO will
> fail with
> 
> runtime.gcdata: missing Go type information for global symbol .dynsym: size 72
> 
> There are two modules in the standard Go library that can use CGO:
> os/user and net. Both of these have pure Go versions, however, which can
> be selected with the osusergo and netgo tags. Since these two are
> standard library modules that get used in almost all Go programs, pass
> those flags in the common infrastructure.
> 
> It's not entirely clear if this is always the case or only depending on
> the specific way CGO is used. In the former case, we could instead
> disable CGO globally if static libs are enabled. However, it turns out
> that this doesn't solve the problem completely anyway (delve still fails
> to link, with different errors). Also, it is possible that other cgo
> modules do still work. Therefore, just stick to adding the osusergo and
> netgo tags.
> 
> Fixes:
>   - crucible:
>     http://autobuild.buildroot.net/results/c2f/c2f29f55b461899e8e15c0494578304e6f74bf51/
>   - containerd:
>     http://autobuild.buildroot.net/results/699/69910fc6b9f474a7eb0ca7ffa27ac5512cc1bb37/
>   - delve:
>     http://autobuild.buildroot.net/results/552/55225d5da17e85271943f7adce6f07d014d9717d/
>   - probably others...
> 
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

  I sent too fast of course, I still wanted to add a reference to this[1] 
"docuemntation" of Go and static builds.


  Regards,
  Arnout

[1] https://www.arp242.net/static-go.html


> ---
>   package/pkg-golang.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 0b3dc3d32f..a4fc353e78 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -100,6 +100,7 @@ ifeq ($(4),target)
>   
>   ifeq ($(BR2_STATIC_LIBS),y)
>   $(2)_LDFLAGS += -extldflags '-static'
> +$(2)_TAGS += osusergo netgo
>   endif
>   
>   # Build package for target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
