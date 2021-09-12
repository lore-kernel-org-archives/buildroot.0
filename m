Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43D9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 18:56:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C3A7606A5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 18:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C3A7606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B25940449;
	Sun, 12 Sep 2021 18:56:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6owGmhIhnGb; Sun, 12 Sep 2021 18:56:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7F6D40402;
	Sun, 12 Sep 2021 18:56:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CB3E1BF40E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 18:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BD588177C
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e8tUzHVWWgHt for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 18:56:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 549F28101C
 for <buildroot@busybox.net>; Sun, 12 Sep 2021 18:56:51 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id b10so9367127ejg.11
 for <buildroot@busybox.net>; Sun, 12 Sep 2021 11:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=64hsHoEAerfbD2XesXefx3mfN7OzP/xvdjub+7l/Uro=;
 b=NFPGeaCakuKxM82GoslhZSW9WueQK19oA6ymy0D6Psk7i05HvWWpFoF7uENJDlPvJ1
 Tv1h+39xfKXTnidoP0E97QoU4AU9vix/N6etxYAW+5LTS+vObFrYHdAUR1doo7wxHJmD
 Bwi4ukaxEKMfIbmYA6DUo2GUJNUYqMuTLQnMB4q9GOXd+jYgRUrYPWuTzNO7yU55Hy9c
 PntLbIN9sJK8aQtjKM71dDd6HIJxw0V5g/nkvaAtDFFx422a5fdCpXhi2hMiG2I7tP6X
 Ouho6nIW7YFbVKsDqqUkZVLeZ3zAL71NGU44ox9xmK2Pxb9+Zlzp3ZFHtIG6evtJF5DY
 CmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=64hsHoEAerfbD2XesXefx3mfN7OzP/xvdjub+7l/Uro=;
 b=l3VRs6VMUvcarAVWRJuhW3/EUe+VEbKEwOvhh0Rg/BmcaW+L9Oq5yMKF+S4Akc6EXO
 WP6Dgbv4gHeyv1nfVzun0upxhD77UhtNHOuvT5dGq/kXe6IaDjG7vDPd+E3jflu4Sh+j
 TBgTfGMtg7mw6l+Ee1IrFM/ooaWxPQiAUncIpE1lZTGYUMP+jHcawK23tfeMi8fxzLEy
 EUD+m0KLl6nJj+4pbPnNHZmmmHq8Qpb1i7Yz9QbTP+zDPo+KTUELLUxbq6gh0T652C0F
 QM/4pWCIFiKsyXbx2TZa9UhqpmdhFuyRBDFPYnZi5ttJQGeV6q4tYfl2Yzurd8zC04eo
 85Mg==
X-Gm-Message-State: AOAM531igOV38qhaoozKiS5OUl3pfCpe/m7FJN5RsHVWJ89cCOpCshfW
 6mm3cnV0QJzLCthJzOWuS7CpG88byn0=
X-Google-Smtp-Source: ABdhPJxxyPhuDTTBAS7Wa0ML8t6NaW+xP4APqTgtMqpLhmcdPpP0HcmCMufDABKYVHZoWpknWdtXTQ==
X-Received: by 2002:a17:906:c1c9:: with SMTP id
 bw9mr8733827ejb.3.1631473009496; 
 Sun, 12 Sep 2021 11:56:49 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 s18sm2425577ejh.12.2021.09.12.11.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 11:56:49 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mPUem-0001cb-98; Sun, 12 Sep 2021 20:56:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <fperrad@gmail.com>
References: <20210909083525.2066982-1-francois.perrad@gadz.org>
Date: Sun, 12 Sep 2021 20:56:48 +0200
In-Reply-To: <20210909083525.2066982-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Thu, 9 Sep 2021 10:35:25 +0200")
Message-ID: <878s014o7j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libgcrypt: bump to version 1.9.4
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

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
