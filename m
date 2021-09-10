Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E921C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 18:11:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1897A6109F
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 18:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1897A6109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF6C0402BB;
	Fri, 10 Sep 2021 18:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gp8aqVOmUm7k; Fri, 10 Sep 2021 18:11:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A285401F3;
	Fri, 10 Sep 2021 18:11:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88EC51BF424
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 18:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 762ED849B9
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 18:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eZ6K40SiCEdm for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 18:10:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47849849AC
 for <buildroot@busybox.net>; Fri, 10 Sep 2021 18:10:57 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id n10so3678707eda.10
 for <buildroot@busybox.net>; Fri, 10 Sep 2021 11:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=TaZqcsvr+UZ7ixcs6hotC94zfi0RC1rkjeS+RstVcc4=;
 b=TDCJoHaBmNwX3d75EV+YNhbYq/n0OPuN1S6EFkrqxen9mc1f5K++fwovsK0kmgUBQs
 mZoVn9DZGEflmfMuFsWp5jde7N7r/AHnRXXh8qKlRA3MPFQaKnezAo0Kiv8DmHjwXNGL
 9uT745lCEEkqmNHb/DLM55ezTTUxabuvMZi1U60InPzgp3Zfi0552xHdiegYlf7GH2gs
 Askhw0yYe7FDZaAVNm/vkoDkjMtYb9dWyyUju5MfkGMSbS37CA8V8JVNGVVMj1i957GB
 wSJhk2b1h1G6sZDYxK5ThTxXfE32WJoQECcBwIr6IN26+pLoysXavERo11jBa5ZMoXiP
 /aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=TaZqcsvr+UZ7ixcs6hotC94zfi0RC1rkjeS+RstVcc4=;
 b=ZxdL1tCz4OCYPEi4OgOUmugHa7YZc76Pm5PRxwtx2ZzeqF35aJMCak0x+QB/5rhjps
 sOI5gUMs7c2E4LOmtVKYt+c8DtHRmRjsdtECg1Fxi4KVlUHkK4KqXsodm/JoTjcFKtQf
 48lxMmKa4VRrJKijkPUtNt8hSsY1gCp5OIuvjj7CIcWEIgxtNnnIECy/21F5u1DENvVa
 eCScIAu03qK0Z5siqf1ZrhA59B6F0n+DN3q9UU5Jv0IqP9QjGYfxtirBkV22JybmN1t0
 GsRzxWXBJ+tu3A6N1jjmK7JHaEBGCIezO7KxGADLHRuunR7YdFSKk3/ViZxJU68zHRZl
 R4TQ==
X-Gm-Message-State: AOAM532Ws6ItoRgEjtWKNb6neVLUg8X2lc4GAbFBksH8iiOmlzxRkWzL
 oAkydS99HcAyFkxdnlvU9yI=
X-Google-Smtp-Source: ABdhPJxdhWs2aOMCm6ygXffJq+wKAVXk4jj+LrHLC8rLc1CS70ZziGIV+R2B+l+s9IYId9m7LtI8zQ==
X-Received: by 2002:aa7:d3d1:: with SMTP id o17mr10355381edr.272.1631297455491; 
 Fri, 10 Sep 2021 11:10:55 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 a18sm3172293edj.52.2021.09.10.11.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 11:10:54 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOkzF-0001Sv-OL; Fri, 10 Sep 2021 20:10:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <fperrad@gmail.com>
References: <20210909083514.2066928-1-francois.perrad@gadz.org>
Date: Fri, 10 Sep 2021 20:10:53 +0200
In-Reply-To: <20210909083514.2066928-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Thu, 9 Sep 2021 10:35:14 +0200")
Message-ID: <87k0jo713m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gnutls: bump to version 3.7.2
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

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
