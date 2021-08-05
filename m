Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C22C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:12:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB32C6104F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB32C6104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACD74403CD;
	Thu,  5 Aug 2021 08:12:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Je2ey8dVmslM; Thu,  5 Aug 2021 08:12:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F877403C7;
	Thu,  5 Aug 2021 08:12:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6AC391BF853
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 652A5606FA
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:12:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7SXZUlPc8v0f for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 08:12:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EF6560597
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 08:12:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h14so5315317wrx.10
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 01:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=q8ST5vF2QrlHj8MzQVdQtN3XDheODk0IJE71kPiE+mg=;
 b=JooyMU4f4eZ2G94YuF7aN2nWnDBJv9dXYEV0i5X7sX5LHHl6TE27L3+Rts7Jacdnd1
 eOmlbsfr+eZOXhe3xABt+JXSFSJ6K8AKlvTDFrx1hTBvGLa5Qsb1JmRaXic9Y5d5SoqB
 71/tah57webbymNjLpXt7F5NRzQoG61/NmzV5vAoX6XiwytDK5LpbUleEL5uqNKPowut
 nXn5E67suxN6TqIL8kSDsinD3HdTPk0ffb++0aj7PQ+UjeB0b9VjAXvpEbyDuPrU2LEo
 U7KTna6foCAw1tO9hhzMbYFHCFiP4pfXM8wUdojfC7/ydkJxeBes6LS1XkqP4YKGUVYe
 Qeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=q8ST5vF2QrlHj8MzQVdQtN3XDheODk0IJE71kPiE+mg=;
 b=VjNATZCcxbwmYL41RML2sJWEvk46lmlKOZbFcHCbBNxyf6zKLAScRPTVrwRmXH9IZE
 gvADZn/AuXBxBh+jDTGr5xlq05w2Ja/DQJDqnFQQbsv4Ggr2e5NxAhLCekpxiN1n2PNL
 FFFHT6H1aeFXQSgeT0v6J7QGbxnNc5MdPiV/lZdpHbV3ndcQU4mmz3ZYMZdR96vBpjfD
 Eiu2rihOJAGRtmOdFCHZbkEBLDXehzwEqUuHayhbKyP/1Ev5bx0e+2jXmN/KJ5P/A+yl
 hq5dxslqRBc6tmZUpZNdRTxx9ZbzzWIIyskNtUH6V+NSnlz0d1bSUTAMQmCKb5l8ZXwx
 5JVw==
X-Gm-Message-State: AOAM531vK8DRO+UJSAa1lg2w85VKoJWcj30Nfx0cHgX5v7XSmVEditCy
 EZ236OH1afMpKvUEZAnxOC9bBnuKaZY=
X-Google-Smtp-Source: ABdhPJzJQdjQBS3DQXGJFrGTWZ5Ay5jWwbke1DyoYS/DRIuFz7Bjl8Fbv0vnUf4LmymSiCbG5r7cGw==
X-Received: by 2002:a5d:488f:: with SMTP id g15mr3800455wrq.98.1628151127767; 
 Thu, 05 Aug 2021 01:12:07 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id n8sm5131200wrx.46.2021.08.05.01.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 01:12:07 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBYU2-0006Su-D2; Thu, 05 Aug 2021 10:12:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210730072323.3645837-1-fontaine.fabrice@gmail.com>
Date: Thu, 05 Aug 2021 10:12:06 +0200
In-Reply-To: <20210730072323.3645837-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 30 Jul 2021 09:23:23 +0200")
Message-ID: <87im0kmht5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/refpolicy: fix build with
 minidlna
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
Cc: Antoine Tenart <atenart@kernel.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix build failure with minidlna raised since commit
 > e3c31814adaa3e773c310cd97e28ffea9b980a10

 > Fixes:
 >  - http://autobuild.buildroot.org/results/52490172afd9b72b08a7deb0bd3c2124398bbffa

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
