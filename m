Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595BAC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:54:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5FE361101
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5FE361101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9440080ED9;
	Tue,  7 Sep 2021 13:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Df3F8aySLo2S; Tue,  7 Sep 2021 13:54:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F211C80ED7;
	Tue,  7 Sep 2021 13:54:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB0F81BF2CC
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB41460767
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQKoh9diTp2z for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 13:54:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A2D0600C9
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 13:54:18 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g22so14024053edy.12
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 06:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=BjLRT1b2ON+LayR5jv11JMbp01+mmnTFM8bIpOx8Orw=;
 b=mZJRvyB63VuJ3AvxelDbgbUN3aSAC0NJXl3kP+PRTBMj/iLCfjnVA2gJRiW8nZerHR
 wC/5QIEU4zCJwrnXT284Mlh+Bj+ZlY5+QADOsgBkSG0WvOqWOxngZTDKh2296gj5ZlKS
 8D0kDmoK9IMpjiDwCKSLOoB7fo6UTrBdQ1VW2+l245DVUtspli9KPQzu8QrlGOnCRcxp
 yK7LZq7nhm5Kq5K+ikaW3ZJzhm2nnsl3ealyTspdJMYhP0wAyGlhY8gHPlFfCU9lji8u
 wNbSanPTe/VVxB+F16j8eZqMpDsfXLnRvvTHlz1gJrMQ2pJXGXi+1TMaQFiNUn3b3VHE
 j0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=BjLRT1b2ON+LayR5jv11JMbp01+mmnTFM8bIpOx8Orw=;
 b=R0Bx7aNTcdrQ/GFIfCL9FCX4G4jxbIlE6Y8HERpEQWwA7FLpXIfhHYsiSzVkGd53C5
 oIG99Q8n/ZhEphXtD+QdTf8lx3UkY8zjuswVEJ5IejSX9zgwsMZJ3w6muhPVvQT2tG5l
 0oaPji+nbltLN2qWYr6PgpzRON1A4y8g+qLhGZaEWAC0c9cnS8RAMFO/L83wBIPhLYTq
 9OYeuydp/SOgon2fJQDAkHLPZyvp/+HpbpxqAOtBZWq8+Mt7Uv/A3XKsWX3vzJcolYmv
 94FEAD0n2BGoRg7yCKKYiJGjM83vNKSsyzG658RSQVIExN+9IdMXWFEr6o4ZZyBkv9iT
 0/pA==
X-Gm-Message-State: AOAM5325znACi3+HpDsNo6Ok/bP+hJfFd3vPMKbM2t4h6CMB1WIsIopK
 7fHTNbCsCIqrj75OlUstfOQ=
X-Google-Smtp-Source: ABdhPJzEy942LkCJ32xMesiAFFdCQn104qvGxO1k3koA8eUJbK01xKckjRVxNgebn8o5d6hl9Ucoqg==
X-Received: by 2002:a05:6402:1642:: with SMTP id
 s2mr18495623edx.135.1631022857396; 
 Tue, 07 Sep 2021 06:54:17 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 h22sm5509753eji.112.2021.09.07.06.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 06:54:16 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNbYG-0003cy-6C; Tue, 07 Sep 2021 15:54:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210828150604.946236-1-fontaine.fabrice@gmail.com>
 <20210828150604.946236-3-fontaine.fabrice@gmail.com>
Date: Tue, 07 Sep 2021 15:54:16 +0200
In-Reply-To: <20210828150604.946236-3-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Aug 2021 17:06:04 +0200")
Message-ID: <878s08ebjr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/c-ares: add C_ARES_CPE_ID_VENDOR
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:c-ares_project:c-ares is a valid CPE identifier for this
 > package:

 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ac-ares_project%3Ac-ares

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
