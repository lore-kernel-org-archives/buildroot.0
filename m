Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED64C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:35:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBDE760EFD
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBDE760EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B97C16077B;
	Sat,  4 Sep 2021 20:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KjCsFtkTgrKQ; Sat,  4 Sep 2021 20:35:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CB716076A;
	Sat,  4 Sep 2021 20:35:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 966F41BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 923F84014E
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cv2Y-ttqw81i for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:35:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1ECF40105
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:35:39 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id a25so5118570ejv.6
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=36rDr9YRGJmwgmU/WlRu9iv2lSP123R5GrFBUagEaMw=;
 b=Efa7Uq8UA1fgB0tobcIRm7tDV0npu4OEiYKHc/+Kvo+lszFB+1zdXswX3FNlyUhhAQ
 +huR4P48cBgDjNZX6v2ZhUdbkS6GcZQJwKn/aHWgFTWtnxSajs0ajWutzzFqp71uts/7
 ZoLlWGe/ttapc/4MgO9A0wT0awLn0JhLkyTxSJB0bu7BjjYPJ2IPb5QQMFblghPlYkTx
 2uHs0YnZIIuBvgS9hk6SuJA6Ik+7ACTzjSrDHDa6ezSGxdNyIN9UCG9VdLoonniMYuMR
 LOLbOTlB5+0B7cwBR7DXF2/an1kntZIpH2XLkcDmsYMxSwuRZrQ6pxjzRPws6TtH95bE
 313Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=36rDr9YRGJmwgmU/WlRu9iv2lSP123R5GrFBUagEaMw=;
 b=DP56/q226hhocndPPuxBkC7YgBm7Ec1KR7L5G/PVzzbsbrKy4LRg1XLqIgrkj0zKVY
 v7zt1XFcv2knRHwZ/UWUFbb0dylbRD2dDOaZzaqqS+jASz03TwqASVFYnDVPUsopxbGd
 k8WGcdPbmWj2wARlm1WrTDlH5o23SLOwb89V/J+25Hn1GMRozacQcZVzDuvtxoRQbFcI
 aQCe18KUNCscjfQzoKrqPkoj/40L9L5vZXVYLhNuLyoTF41r0hCIq4NbgNWxJyNTFqbT
 1cjmuSCay2I+S3RDpius3NCmMKeaegVG7A+efwHtCQn0jMZYp6Rtjr0EW4uPH9GhsX6o
 sGpQ==
X-Gm-Message-State: AOAM531vev6nVAckM+NkKu9uegl9ZkC9GkQHDf7Zusqf1KsWdwppLWaN
 wPDtVjVlUYcKvLOAVBJC8XI15LAXILQ=
X-Google-Smtp-Source: ABdhPJyyT2aqzCOo/lt7ajcJvWhXRGUkLfWnQD1OmWIc7ChqmDCsWY6SD45fEJDjx5tBk5qDXy7eGw==
X-Received: by 2002:a17:906:4d01:: with SMTP id
 r1mr5575385eju.471.1630787738213; 
 Sat, 04 Sep 2021 13:35:38 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 p23sm1859827edw.94.2021.09.04.13.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:35:37 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMcO1-00057r-16; Sat, 04 Sep 2021 22:35:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210815080648.536733-1-fontaine.fabrice@gmail.com>
Date: Sat, 04 Sep 2021 22:35:37 +0200
In-Reply-To: <20210815080648.536733-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 Aug 2021 10:06:48 +0200")
Message-ID: <878s0cnko6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-matplotlib: merge
 dependency comments
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
