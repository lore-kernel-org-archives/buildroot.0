Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A7FC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:45:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 341A860F39
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 341A860F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF6D8401F1;
	Sun,  8 Aug 2021 07:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g8GZD-1aCpZB; Sun,  8 Aug 2021 07:45:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01070401CB;
	Sun,  8 Aug 2021 07:45:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2A931BF5A9
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0DBD401CB
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKHmjiFHr23b for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 07:45:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63CAE4016C
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 07:45:53 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id hs10so23387141ejc.0
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 00:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=E1Ey3p/kJJmfGkcsEcbIMH29JnNJoYsqB5I/194dRSY=;
 b=AJ6TuzWauczeNlIli1PHfPDh4XMHGFtPONV9Ah58c+xX0Mn0xrXzI1f5RyMCjIwncl
 40TY6L6JtIiZQYyieR/Xxf1v2YdSaJyq791BALpgbNIHViY6osP2BJvAqgtjCiECqEwo
 xKoyRdX7g0ZeSJp44adcM6HIyZpXx0QSdkwpMWFSrhvKI8pSQXEn56uOba5lrJBhx+Oc
 1e2LyiXAxpGYf6/CPEvCxK/lUYSRS95ISONfSy266HjxWSkz1YgriECNS97ysI3cn+h8
 Ovno/yG8hoHxV31+Y28bcpjn9XhRNNVanVXWJxrYtX42UYd65nMOE+7tVZTM6yCp1kRE
 NT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=E1Ey3p/kJJmfGkcsEcbIMH29JnNJoYsqB5I/194dRSY=;
 b=OrdV+vKzfYtkgVWFMmCOqqG7vtvmhOkiMQFe/LTC/47UCLdXMOJKlbk6CI/b4TaJiY
 bRkAW9j1DewtWxi8ChM1a/IWOMcHloaqM6XD4Gt99Vhg2WS/FU/6GyB00npzecOr7q4+
 ZYRY502iMmRMjV6CLh5RBg3rm91QlMh5LT0dP2eXUInYlr0Tog3oRBk+hHE/deYkM5Wi
 dCAv676FvKDMUlcmy9tcq/gJwY8FyqUlH21K3zm5ucxhoSgxadpzNd2ViZKI2e9WoPiz
 w5ExpYy/fBsACo+rVUHdc/G6GQtaW8504lGptCodBB7v6EaI4CioPMoZbfXR5nRMhR7d
 su+g==
X-Gm-Message-State: AOAM530113nlLdZcDhYeo+5GEiHl+cXpKl0972lcJroc67MO6M1esq92
 Dd9ha5kXTfy2LZzyKxpyvlroguPJ5bL4iA==
X-Google-Smtp-Source: ABdhPJwkm9ntrSySh1dWLr/iQootmVrWsCXPhlKNOciyCEBjjoCl8+QQtrMrf6mJ1V7DrWlKxbLBVQ==
X-Received: by 2002:a17:907:3e05:: with SMTP id
 hp5mr3290664ejc.527.1628408751445; 
 Sun, 08 Aug 2021 00:45:51 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id f12sm3571668edx.37.2021.08.08.00.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 00:45:50 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCdVG-00078C-Db; Sun, 08 Aug 2021 09:45:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210801223509.1360022-1-fontaine.fabrice@gmail.com>
Date: Sun, 08 Aug 2021 09:45:50 +0200
In-Reply-To: <20210801223509.1360022-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 2 Aug 2021 00:35:09 +0200")
Message-ID: <87mtpscrbl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/fluxbox: fix build with gcc 11
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc 11:
 > util/fluxbox-remote.cc: In function 'int main(int, char**)':
 > util/fluxbox-remote.cc:76:32: error: ordered comparison of pointer with integer zero ('unsigned char*' and 'int')
 >    76 |             && text_prop.value > 0
 >       |                ~~~~~~~~~~~~~~~~^~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6e718bb662aa4961ea264eb81e4b7e7b20485e30

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
