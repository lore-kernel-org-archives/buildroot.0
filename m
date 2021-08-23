Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02003C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 22:26:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5475F604AC
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 22:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5475F604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FA8F606ED;
	Mon, 23 Aug 2021 22:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RX3R0fZbp4-r; Mon, 23 Aug 2021 22:25:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45BFE606F9;
	Mon, 23 Aug 2021 22:25:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9458F1BF2F7
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 22:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81DC7606F9
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 22:25:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7kNSUnQpg8k for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 22:25:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A87B1606ED
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 22:25:50 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id me10so11765927ejb.11
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 15:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gpNCdc964KEoWLVADaZ8DDvu+9XmwCJfECfIow8nHpc=;
 b=eeq1Lmm9W0W6MQKXgWkW7L1slh9JueTqjknbeERywJDIFQzGCbFgpP48zK8mdNE5z2
 JZbtuPiAu34puZ+wZvPdjy2lze8AR+vX8iwhKqwN1SYiXTO/PDkahsWtVMiATPrX7M3X
 vpFyTb0isZcKlZgeVD+xX3RXCbtSTTyfI5V91KlpgJ6aI2R1PJDpNLQYyTvTWRVnglgP
 SvFFUKb3VbNNIA6nP7rMPlQHYDq3daalB6PlOsMx346Jp2cTd5NMD7+EJZgHSdmIRy0P
 ArmMnelvOHXmNtQXe0L5Nz26Jeob9KGUmVBwLgMtVvx61mXZv9cmGRDlIpWPj2aB0+n+
 +Jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=gpNCdc964KEoWLVADaZ8DDvu+9XmwCJfECfIow8nHpc=;
 b=i80ln0QWA/Eo1NtwYds+wIRNXXvYk0Bv4hzUfhFKo+bnACsrUTQl7lHAlZPOMK0pth
 4Dpjiq2AepWqXA4M4mPAaxdGa1Loj1yp9kpqbXc3xt2LPmWw5wOwZa9xiUvmE7cOnPE6
 PX9aSsEIJPw/6DLPRjJg3W9TmVpElUu8golx93WjMhfxXVv9r2fh1GqCRsmG642E49kt
 L+mWF/WyEAvw+QbMHCT4BJoYAL5aYYq07jQa3k9guSoWGo/D7AVavSv5VyG6qj4rFiQ/
 9J++snP4kZT1TVZBfQ64HZSi0DrHelvGExvuXjwE7dseaW4WSlRUOUGsJQddXPnvYsBc
 SerQ==
X-Gm-Message-State: AOAM532sduCgnfDY6qO+SEIScxSLorfDctsJu56+/4yj4mCWXIU+t8Mg
 z6GGX7ektdctsRctR2P8rGe59A==
X-Google-Smtp-Source: ABdhPJx3TYyQoDEbizZ+9VWT+Qk22T6c0j46fgTlae3SVw+C9cJBHbQZPcj+9fKRD9UG/4GkIuEM1w==
X-Received: by 2002:a17:907:2d2b:: with SMTP id
 gs43mr17241242ejc.437.1629757548768; 
 Mon, 23 Aug 2021 15:25:48 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x9sm8017014edj.95.2021.08.23.15.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 15:25:48 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210821230613.470903-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <60ae8d41-7b62-b5bd-dade-cdb0d347ab59@mind.be>
Date: Tue, 24 Aug 2021 00:25:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210821230613.470903-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/libmodsecurity: fix build failure
 on m68k_cf
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Frank Vanbever <frank.vanbever@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 22/08/2021 01:06, Giulio Benetti wrote:
> This package has -fPIC gcc option set by default but we can't use it on
> m68k_cf since it doesn't support it throwing a gcc build failure. So let's
> disable it by passing -fno-PIC.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b92980a563fe7ee331e70f288ce041be0bf29d40/

 Applied to master, thanks.

 I just changed the subject line from "fix" to "disable -fPIC". Most changes are
fixes, so that's obvious, and "disable -fPIC" is given a lot more information in
few words.

 Regards,
 Arnout

> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libmodsecurity/libmodsecurity.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
> index 66e7e522a1..be46eb6e02 100644
> --- a/package/libmodsecurity/libmodsecurity.mk
> +++ b/package/libmodsecurity/libmodsecurity.mk
> @@ -52,4 +52,14 @@ else
>  LIBMODSECURITY_CONF_OPTS += --without-maxmind
>  endif
>  
> +LIBMODSECURITY_CXXFLAGS = $(TARGET_CXXFLAGS)
> +
> +# m68k_cf can't use -fPIC that libmodsecurity forces to use, so we need
> +# to disable it to avoid a build failure.
> +ifeq ($(BR2_m68k_cf),y)
> +LIBMODSECURITY_CXXFLAGS += -fno-PIC
> +endif
> +
> +LIBMODSECURITY_CONF_OPTS += CXXFLAGS="$(LIBMODSECURITY_CXXFLAGS)"
> +
>  $(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
