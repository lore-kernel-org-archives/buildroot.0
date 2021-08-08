Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016D6C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:13:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7F7860E96
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7F7860E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D54B402E2;
	Sun,  8 Aug 2021 19:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9nHyyAmIOPF; Sun,  8 Aug 2021 19:13:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B28B40284;
	Sun,  8 Aug 2021 19:13:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3D4A1BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B478E606D0
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qfJd4caL_fWo for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:13:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F185606AF
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:13:24 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id b15so915232ejg.10
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 12:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=/dJYA15AXbCOdo0a25vUL0nQ7JG4gaLvVJtEpy7SXjs=;
 b=OxTcDNUl9YDYvSlO+YCtXAXslci85bqAKzrVPb0vigiJOemwnZGKTEh9FdijG1C9eA
 77Bo85FthgKGARdRVKi51XSiIX1FPUfXCy7JK5T3NippGvzDBzLoQnd/KnnOQQwtG0MI
 vV1YJ62eL4Xb2fOIsVtnYq2fl7amzYOdBYTmtDY2Obeu/gXHyt2SCA3klFhEmruiHaV4
 Mx78xzUQ68/gpVnNu8SDEYoXyF3WP6omwoVij5hr6c196LY4t/I9t5bOMdwUmmvQEJ4q
 7luHONLsjBompNR/PQ0uzzvoGkbFnEMLj5+LyRnct27Us1o3eRrilukT1TfPEVxpefE/
 +jFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=/dJYA15AXbCOdo0a25vUL0nQ7JG4gaLvVJtEpy7SXjs=;
 b=q5+OBmrekCZ+27bkwmYXdSy3TbYzxwYWME543HG3kwkrWrTKC7r85MoDmF/xidsiZu
 m6g2bq/2V4lnKxY6rj1cIEnxzo/pul+mKqdp8m6R3XhpFN1NupXDmUCwuOnSbvMLw6ef
 ZFqY5ryCZ3TxgXmloCWK4DtWXs+R7nrd9cc1oIaUypdtbBTcLmJJbntqHS3Z2/leYZuH
 lLIaHIz5r2ZzVQ03O4AckQSYWSTLmr/oh7rcSMKRXMXB7airy4/g9GdRT2zlCOzfCBuJ
 NGvBjd4zXYN/ns5RBWOYuKWGHP7aAvOWw8euhzo/U7gMDWyG/K4inMJlnAsn7gk2JNKW
 HUVw==
X-Gm-Message-State: AOAM531HlMY4ifg9o86CoqNAiO1KAS4M4mlddV5h+eY+W+GgXsw9rcYK
 J2WS9jBc53ND0cl/rHdLCgc=
X-Google-Smtp-Source: ABdhPJy7XqWUuTmyIeqRjm+hiEvSzjXWxqw7O6pT4bCZze7uWqyx2PclzV/pLmdZTiQSwxl2hFHsyA==
X-Received: by 2002:a17:906:769a:: with SMTP id
 o26mr6655168ejm.18.1628450002289; 
 Sun, 08 Aug 2021 12:13:22 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id i6sm5218318ejd.57.2021.08.08.12.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 12:13:21 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCoEb-0003QG-4y; Sun, 08 Aug 2021 21:13:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210804204442.1466003-1-fontaine.fabrice@gmail.com>
Date: Sun, 08 Aug 2021 21:13:21 +0200
In-Reply-To: <20210804204442.1466003-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 4 Aug 2021 22:44:42 +0200")
Message-ID: <87y29bagxa.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libqrtr-glib: add
 gobject-introspection optional dependency
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

 > gobject-introspection is an optional dependency (enabled by default)
 > since the addition of the package in commit
 > ea64e05a1bfbe3b258a69013462f94d7db7a9c0b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
