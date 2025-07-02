Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD883C83013
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 12:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44827414B9;
	Wed,  2 Jul 2025 12:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lhu07iBOJF2; Wed,  2 Jul 2025 12:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88EE84159F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88EE84159F;
	Wed,  2 Jul 2025 12:51:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DC23179
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 12:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3C9B41476
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 12:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCLA9yhFjBOI for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 12:51:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0449740121
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0449740121
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0449740121
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 12:51:15 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-60bf5a08729so9022040a12.0
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 05:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751460674; x=1752065474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WYZLMPvqoIe5uFPXTGX/i0YGW1f1ZDrwy8WTXNwdJ9I=;
 b=Xw224cQ56YRndaxburF5a/TF9rH7nTsCCsW3qcxpE57Xwx7fjT8Aaz8OUDSrEK+Tqs
 HIlvcVcvTJoLoOet4CPWWOtg6i2XpJ4kOWv4QdnrnmGE5FvswzzGQNefbnADhBukBeCx
 wSc+IgHX0gVho8+LIWS02Q3l44f0w14wr/m5JMhS57qApChWHPzBe5BR1Tt3f6Oe2GX5
 Z5od8+EuVPnPw2c2krFWmEFJ4K+Ll1K/Y+WJYSmN6wqCqOM6DTk+BwUVwp+QYn7Ertxq
 wJrUmkx3UmbHKCnnLE2Y+ymN4AnAVHPkYCEs2BQJMhMB94n5MGeMr8HoNpwmjcrPZHjE
 sDAw==
X-Gm-Message-State: AOJu0YxGbxmb+Wx+xbbtp9Rr5Cpi/FyRlf6g1QN6Qsc2Fnquw7RosNNb
 vYfRLspiooP3Co/FCJ+X7FRDzBgwti4o5MVXZ3rxEvgbXDssjy0JNHSsALMtZ5k=
X-Gm-Gg: ASbGnctdy9o+gfar4r+LFLnyq/4wvSXi5iKNKxylUBqtZxKJoej8dRyDyYki2A3biTz
 3jpvGC+4dMyn/glQMaTsjBj4srt6O8lMAR4M49/hCUpFo6OAHHQffOUf7B5pKxESOV+IN3I8IAu
 9EEhSS5cspEwTUVQkWazkes/EVYYJVEjsDvvXsWoZUeGIIRTlWYRvplZ0/wJ7iwPO21/7S8u2zu
 MipMMFfujfG+M5KqMCCno0usvdAW86LpUiggcLTDpJWOIn8e9K2AmFc+XUa9G1F94nHJnmTiEVR
 QJ4s00X/co14v4Eh+AQdxgSAr39jkS0pkxyC10CjHDUlUX9ZlRt5V9hPlkb0O8XW2vQnN0TSy02
 Qhg==
X-Google-Smtp-Source: AGHT+IF/ke9NW8kxVHdmAeFtogS68szEyeUwhmXltXYsePbZJ6ZQyLCDzduQeJQbuc6effH8Mu+Tqg==
X-Received: by 2002:a17:906:4fc7:b0:ae0:9fdf:25e8 with SMTP id
 a640c23a62f3a-ae3c2ca3ebamr255169166b.47.1751460673389; 
 Wed, 02 Jul 2025 05:51:13 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353639be0sm1059129766b.6.2025.07.02.05.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:51:12 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: elmehdi.younes@smile.fr
Date: Wed,  2 Jul 2025 14:51:11 +0200
Message-ID: <20250702125111.83553-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250527171400.78560-1-shirokovalexs@gmail.com>
References: <20250527171400.78560-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751460674; x=1752065474; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WYZLMPvqoIe5uFPXTGX/i0YGW1f1ZDrwy8WTXNwdJ9I=;
 b=e/dPO5fCA4wbvYN9mwRmaFtATZ+eExMg6cMaxQa3Ipo+E5ZATFfTArvyaxNiXa5O0c
 C0B6mqqT2EC+oW/pyBUxbXuRp28E9nP6guvdZWkaoEkEGQGE1ztqxCQoJY4FXshYi6mv
 wWPm9XF+/+TZJqbYKPWgk4fJwl/wOolZSfc+HqtD7ASffkWJrwC3OCAgy/6HPQjOZSou
 8fwcc9L3P1HIU4ICCj95dfsFGC3pdSc3uMYOZztkdNCTV5Rc8m6VziPxFryJXB4yIZwO
 xhCv0WKNlyGpIpj4vVBwQ6BlZs9dpd4jf/3G63QvTNiDxttYtHsRknOcUeFnqP5yV8CE
 ybRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e/dPO5fC
Subject: [Buildroot] [next,v5,1/3] package/uutils-coreutils: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> Looks good for me. Although, I'm still not entirely sure whether it's objectively
> better than v5, so maybe it would help to get a maintainer's (or someone else's)
> opinion on which version fells more appropriate in the long term. Since we agree
> that both versions are valid, having a third perspective might help us choose more
> confidently.

That sounds reasonable. Let's wait for more opinions.

> Thank you again in advance for moving this forward!

Happy to help! BTW, I've started a discussion on the uutils-coreutils side.
Let's see where it leads.

https://github.com/uutils/coreutils/discussions/8297

Thank you
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
