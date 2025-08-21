Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25ECCA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74654847CF;
	Thu, 21 Aug 2025 19:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J16SNIh4-PtS; Thu, 21 Aug 2025 19:22:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 949BD84734
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 949BD84734;
	Thu, 21 Aug 2025 19:22:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1CEE1C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9404D846DE
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id riGS4o4H7tTr for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96AF28476F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96AF28476F
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96AF28476F
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:33 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b9dc5c8ee7so1268483f8f.1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804091; x=1756408891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mEBWS86UyyrXGE9A+MKmMbXSKjWZBPfRrN3KyabS2o8=;
 b=rzqLaR39Dwx6R8WQquJK9P4iiMYJxYAA9jps84zDNl3+iYeLSONf9b+FyKutDYA2DQ
 Ioa4pxYLv3bXJpzEKIfLdK3XQovcr91ebaviAHeFupRMXGFgeNi/sPnZ4Lac9HBCbrv7
 EZMP1p2ruuUjcFk9KTgH4qXPw5r60/HQFHgWplCe6p+YdbCuyVIPtMIpWYy5++q4tnCT
 aK7PUvYwWCwXnq0kIL/jgmbyY1cpgefdcmyx90ykCyvePpVX9k6a4wgMg6wg/DuVcKjy
 PcZCQ6vG29SNUle1QYtYhlJlQNMfTsyd7J+UFhd2nTtowVrkgT0U6rlKzgsjQFWqnxYy
 rwPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2ZctVfWhGiVjndVoNXyDeCTLhOdcwP+De88tvvrzRzaFTEAR15gfTUpPKT9EefsWh1ZnIASpt9T4=@buildroot.org
X-Gm-Message-State: AOJu0YyOWCxCPezjbdVqsUe5r2rDEQFxRPt4yBOyTqNTTpB2Ne0I9pXn
 vqdE964fkSiAEHjkhal2w24XbWkyVR8zmdodMLIN/ncSmf8PDrF79Ka8aZTQcavXaqo=
X-Gm-Gg: ASbGncsX76MEWT8hWHHlCs8XcCOMUG4DBke6Eoohyu8Xb6p8JjVu6Pii0A5aGFiz3LW
 xLYbTg+5L0AOQgV11SduaU33uyNu2mvNBS0DGavi9C5Xy+LyKc5U6D78xJBGRY+ZPIEBwBDJ/4o
 u8zioUJMxdRHNJ5hfp9Wle7m/G2DHocQMnhNznUNmdocs/mQJMAFvc+CPU6ZBKbFKxN6RqC9XcR
 GQi/a+eovqiAf1hgdxw38ICcx/u3ifhtkUcWDbMDzy4GRCKbwcaTRjsbpjf4Ao2G1cG+hJY2imj
 duw65626H1QeQ7QbYqE1pMw1a4rHHaoMiEqECFDgFYenazc6XQfQakHx0swdbTlWhfCEbzUy/le
 Netk5c2fYxeTXPw==
X-Google-Smtp-Source: AGHT+IEDcRI2XCnzNUWoCCv0rQOjC6X0TEObBzOKWenywKtt4HEat0NhVx92eH1RYx8tVIS06xwm4Q==
X-Received: by 2002:a05:6000:2012:b0:3b7:dd87:d741 with SMTP id
 ffacd0b85a97d-3c5dcc095c3mr114784f8f.42.1755804091534; 
 Thu, 21 Aug 2025 12:21:31 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50e0db29sm8417955e9.23.2025.08.21.12.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:31 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:30 +0200
Message-ID: <20250821192130.24989-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820071127.3466191-1-peter@korsgaard.com>
References: <20250820071127.3466191-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804091; x=1756408891; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mEBWS86UyyrXGE9A+MKmMbXSKjWZBPfRrN3KyabS2o8=;
 b=du0DL9lWYklU/FoH7XA1akf8iUyD12oaHK7SosgNdv31SLwPCzijW2luHy9Q+Jn1Yg
 JDX3K9zRINfcQKur06k2szxlRnx/4tn0ubTizz5Jg8vOKHpcgIwUVa+QOUjFLZ21qbF8
 xQFo98wO5NWcY0KWtSSfoTS8+5c56JhP9qL4uZ63BnHddED6sruXHeQL34hUUm1DLhMn
 xbTLDfMLISqm06jTu+83y8JDahxOmKLcC82QT3bSY7x5eJKmPAEIVzwuXJWZrFkaqvGF
 goZbYIS90kp/SzVoGI0hsaxzZTVfma+SJgPTozNp54/Jljuwl4xx0taQaGem9zowiT+A
 haew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=du0DL9lW
Subject: Re: [Buildroot] [PATCH 01/11] package/gstreamer1: bump to version
 1.24.13
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
> For various bugfixes. For details, see the release notes:
> https://gstreamer.freedesktop.org/releases/1.24/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
>  package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
> index 7cc992a5cb..edfd60d9d3 100644
> --- a/package/gstreamer1/gstreamer1/gstreamer1.hash
> +++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
> @@ -1,3 +1,3 @@
> -# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.24.11.tar.xz.sha256sum
> -sha256  093a379602a250d5cd33b88e723757c80198317efde33893edf3c87b6e53b907  gstreamer-1.24.11.tar.xz
> +# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.24.13.tar.xz.sha256sum
> +sha256  ed4678e1d0708db01a469ae5dd31c10cac73c0fb3f7c2c471b0d3cab0affc7d1  gstreamer-1.24.13.tar.xz
>  sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
> diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
> index e06309beb4..e9299e9e93 100644
> --- a/package/gstreamer1/gstreamer1/gstreamer1.mk
> +++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GSTREAMER1_VERSION = 1.24.11
> +GSTREAMER1_VERSION = 1.24.13
>  GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
>  GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
>  GSTREAMER1_INSTALL_STAGING = YES
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
