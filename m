Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB2AC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:34:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DAFD60E8D
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 12:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DAFD60E8D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DA8D60671;
	Wed,  4 Aug 2021 12:34:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jGDjSkwXICeD; Wed,  4 Aug 2021 12:34:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 832F260758;
	Wed,  4 Aug 2021 12:34:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3386B1BF2A9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EF0E827BA
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 12:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ybHf7tA5Pi0i for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 12:34:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C493683CC3
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 12:34:09 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id c9so2045583wri.8
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 05:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=eijax58qYeyTahLTX82zm9P/vezO4q1TOn+tFi0EnvE=;
 b=aLCceNpFTU1fk9zCtwC4J/eRgoJzUVm8ojhUr7G1jZY1z+QuF77RpMAPEXC32z8vgm
 4E7VMoSFAjfsJbT3H5UX0Dz/4osnv8/ODLmlzzqj9liDyHOmxFt6H3nqpbt25z84EdQU
 LmYH+wSjI0eLl4IlxYig5luVXV8tlyToPW1pWWVKY+JD/RypcNXxmMT2IA7orSwBGPbJ
 11moiTbJMKquU+AdJEtIBptpY3BNdoQsN1g/B+7J/OP7SUCENUIz10JLa/5Bd1V3y+CH
 YTUJghAhmNzIuWAN1o3vnDs2u0Jjd74KxfDJnoWnaghK0h0kPxnyqJqmWuRFsCVSq9ZH
 SeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=eijax58qYeyTahLTX82zm9P/vezO4q1TOn+tFi0EnvE=;
 b=IQJSaSIM67yf+kMyGxS+PIZZMZyoBPk+PVm+DnnE9negct0eX5N1WxDXNu9ITUQ1fl
 v52ZGrGQ+cHV6iWkDIhs6gGhplGDvFbfjQG60gDH6Y3ypcCcBJ9IuzKH1578vx6utDq8
 yzd9qmIBg+u0udNWhfFjeZ2QnhnLs9EGNPZPyUPDSNO/0kyjQEDv51aoC1w8UhtfPNu5
 LJmk3dYeM1OShqDpA6oj22QBJC7c/pikJqu8/jE2IjpyWM/7Hz8ZN1eS00PBPmDXbN8M
 ANuKqDg7T+K9mWHRKgBv04MKa3q50kgvldlq3b3rFDCzR0g/nfiKne2heBIiyHi4tkLk
 SNPQ==
X-Gm-Message-State: AOAM531C0kM38vo/enpx2gVaL2ooqh7L9fYlX+rDGLurkNiMBFHkC6j+
 +m1OwXlmFexfcDilmcg1ikI=
X-Google-Smtp-Source: ABdhPJx9O7svwD8XvYk3+mWI9wP4XsnBPsZB6urQXYEH6/sxKfsysxTp0vZq//12SJjBY386Obbwcg==
X-Received: by 2002:adf:82ae:: with SMTP id 43mr28433076wrc.73.1628080447690; 
 Wed, 04 Aug 2021 05:34:07 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id t8sm2661268wmj.5.2021.08.04.05.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 05:34:07 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBG62-00025C-G4; Wed, 04 Aug 2021 14:34:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210616061002.345235-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 14:34:06 +0200
In-Reply-To: <20210616061002.345235-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 16 Jun 2021 08:10:01 +0200")
Message-ID: <87sfzps81t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/spice: security bump to version
 0.15.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-20201: A flaw was found in spice in versions before
 > 0.14.92. A DoS tool might make it easier for remote attackers to cause a
 > denial of service (CPU consumption) by performing many renegotiations
 > within a single connection.

 > https://gitlab.freedesktop.org/spice/spice/-/tags/v0.15.0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
