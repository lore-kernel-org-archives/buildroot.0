Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356DCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:20:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B66C861212
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B66C861212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83FA5406B4;
	Sat, 11 Sep 2021 16:20:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KOybFyuUQ0JD; Sat, 11 Sep 2021 16:20:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0B1E40CF7;
	Sat, 11 Sep 2021 16:20:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B696B1BF304
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A55C261B9A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUYE80o3BSYB for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:20:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B55CC60B49
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 16:20:31 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id g8so7248804edt.7
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 09:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Cxf4fo8MRSLdVLbgWWWnY99U4GA91Ril5KWHWby+Ws=;
 b=XI9WB3q1YQKxb72Lzpy4UuP9gjy3N4pBlHzCpWrX7sx+n5eiKiw5oOcPs3oLlmh3HY
 F9IoOaIAp/FqC/2+Cug9rB2kFXJGf3MyLvlp9R6f6pQMHSKM0x0wRFtKzTBmqaPEj5aR
 F3VN7RLUP8HgE4sX+1HPWoh95mPbhIGi4uc00dLuEcZBD5zgiZ+6fShSfQQjSRm4iYfB
 ZIB56QY1ajdp9xfF3gxUY+wQvcT5DavqhNiZehS9d4ZBeOnmu5gVgZ/0TgOjrquxcv5e
 8qpKmXWXG5VubIQLn+7E/miWkiosTkUZHcpe2zDE9erpBvU6UkP4wkx/jLKgIG5S6TlY
 /OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8Cxf4fo8MRSLdVLbgWWWnY99U4GA91Ril5KWHWby+Ws=;
 b=3RmIk6W6cEu0oSXKC3ewVVU0tZHIMbr90N7n7MmCVLvhZFjldMb5fTW7q4qLRd0T7l
 hHNDybQq1ljNsr7qnhgpNY4kZO3Ojn5c6/dNXVHZieTRZK7cg+kaj7wA6zEM1p1bDI4f
 qkrOI3C9QkNM8ryEjgIINtGyKqvfEbG0uz5LxlzqvSDr/rs+s+y+f/gn7wwX1ZhBoHmA
 fQmAdALCZQjYpOaRzug3TTkUk1fqXAnLLLpYudqLGfwwMSrUcGU3hb0pj22gBL+EN1EN
 Kfl9wUFjP5RFdcp29FsGT22xOV58U1lfSQxITO867k2FT6ZTcpAQJ4lWqDz1OBxgURU0
 GaSg==
X-Gm-Message-State: AOAM531unArMYbpRmodTWELMYFj4R1Wp6zTuP6Zw5AQdk2QUJXOweUD+
 WCrJRN7PgWDMWDEdxk3HHv743JXKia4sfA==
X-Google-Smtp-Source: ABdhPJzcF8P/9viY2YkmFgZMJvZPfkJU8+LBaYo+r1ywcdgzMkiWrha6qUccbo/WApqpWdnO9zfkag==
X-Received: by 2002:a50:cb8b:: with SMTP id k11mr3906113edi.256.1631377229892; 
 Sat, 11 Sep 2021 09:20:29 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o7sm1130157edt.68.2021.09.11.09.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 09:20:29 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210830235951.24b82f6d@windsurf>
 <20210831173800.22088-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <8d32f7f4-7cfe-c562-0ec9-29c6cd481b2e@mind.be>
Date: Sat, 11 Sep 2021 18:20:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831173800.22088-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 0/2] Add and workaround gcc bug 83143
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 31/08/2021 19:37, Giulio Benetti wrote:
> This patchset add gcc bug 83143 and work it around for package ruby with
> a more specific CFLAG instead of the classic -O0. The work around has been
> suggested here[1] and saves lot of memory since here ruby is the package
> affected by this bug and it's pretty big.
> 
> [1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83143#c15
> 
> V1->V2:
> * fixed bug gcc version condition
> * introduce this bug for BR2_sh and not only for BR2_sh4
> 
> Giulio Benetti (2):
>   toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_83143
>   package/ruby: fix build failure due to gcc bug 83143


 Both applied to master, thanks.

 Regards,
 Arnout

> 
>  package/ruby/ruby.mk | 8 ++++++++
>  toolchain/Config.in  | 9 +++++++++
>  2 files changed, 17 insertions(+)
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
