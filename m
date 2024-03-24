Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD781C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 16:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E0274026A;
	Sun, 24 Mar 2024 16:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7FbSH0QF5d_v; Sun, 24 Mar 2024 16:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FEDB403A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FEDB403A2;
	Sun, 24 Mar 2024 16:53:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1F0A1BF4D6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 495F8403A2
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QLZC2ww3ki3R for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 16:53:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 21E484026A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21E484026A
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21E484026A
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 16:53:43 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33ddd1624beso2208984f8f.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 09:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711299222; x=1711904022;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9btPeOMz0yd9hyLeIFD5qXKED9You72qgwzjkcIanUQ=;
 b=QRwZudwIHNLBuyBQRNfsIxud5T47firnBGpkeXw9ZJrAAGIKq0LUjJnOp0o1w5cQfa
 37B1EA1lcCTbfRiX6XHwbyXJ1lIlRzNhgCwfv7OsV7UAcoEXK2Zl0YvUj4sT/XSC0tLH
 fxtQ93YsxoVZrTLIteNRMCDsa6JK831BjCSDHsRD/Ar1gX0qDEp0pKvzO86AJZYZpIWx
 4qfDXoRJbvRYSQIEBbfwH5wM1KKdBwKHcmYD1MfLg6X/4a55uIXxeERovV6rOO0dbWER
 +ClM9Bsv7gy8GJ5Xeka65uXZd+kMOZaocT4wOmRxw30qwY+fTmvLZxCemy6X1tJMBqpX
 kG6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbts4h2oJTSfl9I77rLyfmyiRnoIQwcUajX9iyH8iJ+sODrj7FyahDbzJqwVZmhN+gdZktt/2LfsVIlVu37RfZw+AnmtBQ7g==
X-Gm-Message-State: AOJu0YyUUn+Mpeg/fdflXMpWbkVT3DKHl2vQuZ6GoKkf/ckWi+IREB59
 vAO6Lc+rAyB9pD+mwxpK5JxTm/Lqwh+gbv956bq/RyjiFqgghlPaJaB5xSeo4SA=
X-Google-Smtp-Source: AGHT+IGB2Ug4guc2hwjlEYsnRToB17zJ2PeG/XqKfCT/6CQ5wQOpeQXezTbC+kNH3SsvtyGZH+mhZw==
X-Received: by 2002:a05:6000:d41:b0:33d:61c7:9b2c with SMTP id
 du1-20020a0560000d4100b0033d61c79b2cmr3402314wrb.34.1711299222093; 
 Sun, 24 Mar 2024 09:53:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 df4-20020a5d5b84000000b0033e7b433498sm7192618wrb.111.2024.03.24.09.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 09:53:41 -0700 (PDT)
Message-ID: <93841bce-0ecb-4773-bd2a-3b9530faffbd@mind.be>
Date: Sun, 24 Mar 2024 17:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240317105529.253562-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240317105529.253562-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711299222; x=1711904022; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9btPeOMz0yd9hyLeIFD5qXKED9You72qgwzjkcIanUQ=;
 b=RZSO2Z91PiZv1mTCHpOZhOGHvsQ1HTUz10tLut6FNxfXXwh2qhWBFhQkpSL98Cj9z3
 L2FXo70kQxivao24MceW5s7zIoQ9mbh/nyFLgzrLoQDUjBINp7IqlVosn9BkckhMXYlI
 wT16LplzSrem2xS5dw5HuwMzPxc1AQ7UpOn+EVFnCzQ3ylYYA3EpHtE73HuSmZ/EV6DW
 cEkkcvtT7B3UOPISFqrcGapYX8SBw/R0MHbORB5fTvsES4N8126AAaJHFJ8KFGZklufm
 YWzyn/rgYgmFyQAicTBTIxvEw9IZQeAbTBUVn0IC3f0vvz/u/GzUlHXwYUaOM0iV1H4r
 wjsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RZSO2Z91
Subject: Re: [Buildroot] [PATCH 1/1] package/libunwind: fix libucontext
 handling
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/03/2024 11:55, Fabrice Fontaine wrote:
> Commit 6ea2a27f9047696ce1c463ad55fb4a78df136954 forgot to add -lucontext
> to LIBS resulting in the following build failure with zeromq:
> 
> /home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/buildroot/instance-0/output-1/host/i586-buildroot-linux-musl/sysroot/usr/lib32/libunwind.so.8: undefined reference to `setcontext'
> 
> Fixes: 6ea2a27f9047696ce1c463ad55fb4a78df136954
>   - http://autobuild.buildroot.org/results/893defe1588b2ca03c115b59b47be3f4aed438fb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libunwind/libunwind.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
> index 15c4e4863f..94e9bbd1b8 100644
> --- a/package/libunwind/libunwind.mk
> +++ b/package/libunwind/libunwind.mk
> @@ -17,6 +17,7 @@ LIBUNWIND_CONF_OPTS = \
>   
>   ifeq ($(BR2_PACKAGE_LIBUCONTEXT),y)
>   LIBUNWIND_DEPENDENCIES += libucontext
> +LIBUNWIND_CONF_OPTS += LIBS=-lucontext
>   endif
>   
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
