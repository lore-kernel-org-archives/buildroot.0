Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06242C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:43:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24D2B60EE6
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24D2B60EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B386B60812;
	Mon,  6 Sep 2021 14:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cTomric8aJAc; Mon,  6 Sep 2021 14:43:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15DF96080F;
	Mon,  6 Sep 2021 14:43:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3DA71BF34D
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CEFC81A58
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tzjb16mhqVPT for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 14:43:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69F7481882
 for <buildroot@busybox.net>; Mon,  6 Sep 2021 14:43:12 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id v5so9820997edc.2
 for <buildroot@busybox.net>; Mon, 06 Sep 2021 07:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=pFWdMyVkfhbwKl5c+0f03Qz86s1EaxWCuUyWGpQXeac=;
 b=hcyAlZ1Ly2MLc/pcSBHLxh56hYwhjq5i9GqxngNHCKk8jYJ4l/oKXptdjLspj4408B
 fXY9kSt+JR9wR7lwUb7s7e9si3OM340hGxLwxJxgWK56ESSJo87jRvWLbveV1s1SHxWO
 6+uonjtWOeRugYgUceD5hxQQkvi4j5XUInV/pBrIUU5sH35MCPnUEGN3QKZrQrKAoEq2
 ep0DuBiMJl6VrpvUv4nWJFdXmLhKTJSVQHBqp1u4++7vSs07kFVEfi653dblCTTk/Bfr
 YQrOrE2U/oxgtC2IXVFM3GD3aPXiCtV5VNrDF6pT215DLp+ig5t/rjaJ4Zcu9wr0J9Ic
 Oqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=pFWdMyVkfhbwKl5c+0f03Qz86s1EaxWCuUyWGpQXeac=;
 b=OrzMLgMqHJQOUewlmHQVN288tIFAzJGBiAWevxCM6XgiyWkR+CtRMWmlonsi6AtTNh
 dXI7uBOzx71FWdMNTgxU64o/3NvpAjZGxXXWNZeIEn19yev96DSMV3Qzm6rTO7DycGBW
 nEhj3a2bIDFG3xGWbOWaw2YuQ/Y8+wyPU6GnJfpMdSqonjgKhsSbxKFpwRLMPTw5yo75
 N2vwClz3j/msszWUuDhY1SdRNz7i2fByDg8y3qinHL6S9gs40izYCHUTUcHYDP+CBCw6
 QK4Q7xeZS0A8v0MXjS8ss9w4hbjf292RmsA6+nOoOXw8XjfavNf7YhFc4EWVGmw0pawG
 BORg==
X-Gm-Message-State: AOAM532acmCf0wN8/iwnM8+yvEy+5BlUhHiOjcslXZW6X7K6VetTRjf5
 GBGUK1pCmcPvBYXQ1ZWzS1vS9gnrf6Q=
X-Google-Smtp-Source: ABdhPJwy93kJdLNXLqgwPtP/y0gMJamHVqdF6p4FxvIz5Og9S55bYTQH6boDDxO+ww2bbAhNFVNqMw==
X-Received: by 2002:a05:6402:6ce:: with SMTP id
 n14mr12870904edy.194.1630939390622; 
 Mon, 06 Sep 2021 07:43:10 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 f10sm4036864ejc.51.2021.09.06.07.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 07:43:09 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNFq0-0006NX-Ms; Mon, 06 Sep 2021 16:43:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Michael Fischer <mf@go-sys.de>
References: <20210817142420.32435-1-mf@go-sys.de>
Date: Mon, 06 Sep 2021 16:43:08 +0200
In-Reply-To: <20210817142420.32435-1-mf@go-sys.de> (Michael Fischer's message
 of "Tue, 17 Aug 2021 16:24:20 +0200")
Message-ID: <878s09kbnn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gdb: bump version 10.x to 10.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Michael" == Michael Fischer <mf@go-sys.de> writes:

 > Signed-off-by: Michael Fischer <mf@go-sys.de>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
