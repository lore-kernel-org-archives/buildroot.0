Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC00C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:38:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A27C61163
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A27C61163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1FBF40165;
	Fri,  6 Aug 2021 20:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aeSIliOF4kOu; Fri,  6 Aug 2021 20:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7FA44010C;
	Fri,  6 Aug 2021 20:38:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D19F1BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BAD94042D
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kCEmWPgdDYxh for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 20:38:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C407F4041F
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 20:38:24 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id hs10so17154128ejc.0
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 13:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=VdJCvwvr3jw5dZlSaNvACVas6V+mb2rU63+vPAggMfY=;
 b=g63rpQJawXawfTmvFFFrfatKE2GGcbMGhBi+vAKI2Ur/aL7YJ++JJalYfR9JYlbDXG
 btwKN4tJD10DT38qucgI2QP0ftGYJLYeXTM/ZHEWD13j5WlGNhHFUbWgcBgOnfwKqD3r
 HKbFtXl205fuG5uAeIDCDagQZMus5lDMUtO3sgTYWSYXTtzKsFYTKMqVHnlE0zi1GQ3l
 EWS2xm2GG84uHZ/H2RsCCLM/lqJ7rWtZXnOzw+PBCnMebMv1ikvBXZA97xluLmXpDQLA
 +i8bmY9xxF1mETsGLuLicAD184/I8AvlTQ/q0nYjfin9inNF5Z42E7EywCl7PvLJpfw8
 e6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=VdJCvwvr3jw5dZlSaNvACVas6V+mb2rU63+vPAggMfY=;
 b=iHHAh0g+PVJvsVxcNV0psccfpdyIYgFt8K+OeCGfwSYZZQK2HYBv2Fa1iufVHdLpTe
 3m2aExaZIRa1CkoIZOyiX/HpwUp82na03Y26Tapkn/i38LWu88rm541LL7VaTd7158K+
 SlBR1FUoUcEwDid6hrQ4eoMVLaWrRdy+V9rGD3Uat6doQPCQ1qEBWd96Fg7/Hd97cv/r
 91dUlkR1/JhhFfkAcbfhgoP+XG+Kb+CA0BA9dGG5268lLB8UPVHXR/ZxcmWihEF5NiuS
 ekkIKgjY789ml97D3cPkLW93gR/XXsYR/IHo5M77aJkzGxcYSfn0Ylr25gtrIB1Q5lFL
 apUA==
X-Gm-Message-State: AOAM533BT9bxMXgoWMyBz/UtP5nd81nzOITeWDg+98+53hDxVVQXUxNZ
 JLBil7yHLbjnJF7ORSAczol1nbxMdCYqUA==
X-Google-Smtp-Source: ABdhPJwUZuaV4G94n0oka+iL9hpY3nYbPnoTZClnENyyBRpIolngJBFY/aU8zwdwKg6R9C3YCCW0Bw==
X-Received: by 2002:a17:906:d925:: with SMTP id
 rn5mr11185757ejb.429.1628282302883; 
 Fri, 06 Aug 2021 13:38:22 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id w5sm3215983ejz.25.2021.08.06.13.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 13:38:22 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mC6bk-000881-Ay; Fri, 06 Aug 2021 22:38:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Michael Nosthoff via buildroot <buildroot@busybox.net>
References: <20210729202618.59238-1-buildroot@heine.tech>
Date: Fri, 06 Aug 2021 22:38:20 +0200
In-Reply-To: <20210729202618.59238-1-buildroot@heine.tech> (Michael Nosthoff
 via buildroot's message of "Thu, 29 Jul 2021 22:26:16 +0200")
Message-ID: <87r1f6gvgj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/cwiid: update url
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
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Michael" == Michael Nosthoff via buildroot <buildroot@busybox.net> writes:

 > The project URL is 404. Link to github instead.
 > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
