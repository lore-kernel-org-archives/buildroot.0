Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3E6C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:34:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F06EC60EBA
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F06EC60EBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBD0D605DE;
	Sat,  4 Sep 2021 20:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LSHPcxPtES5C; Sat,  4 Sep 2021 20:34:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A008605CC;
	Sat,  4 Sep 2021 20:34:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA4701BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA28F605CC
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhSLaGpSWeLl for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:34:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 029B3605C8
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:34:06 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id jg16so5137908ejc.1
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=SYK17Mpd14FB4xcVSGr7OBj29VsSkWjaocpPdVD1EIA=;
 b=jA5CkfUwbL23CO4h9BVsZMcMZIpQH72sW9mKG4rQevJIb65vQ+doyH8FnKgUCYUXvE
 qKJwNX7dT3A/Yg+7d5dYUk0EeT+3Kn6L8qr6wKzXgEMuH89a/DOABS4ZUEZVQutVCo3b
 iV0LvsOI2dWSZdGYADwZ/OiPfVFqHTq8BpGF67YXVurgwTX1nYFudVbMwDtKLegjN0/R
 pVKfqqGz3UjIXhnVjdZ/6rSXfd0Di8jowyPvvfdFs8VSMH+0cKAb5OXkcVkeabNtN9Vi
 4ook2QwRtsEJV2Y3wWyzFepr4Q8PVloHFwBvIHVZgy7t2yErIhL16PKaQn4jx1OkVTeC
 DDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=SYK17Mpd14FB4xcVSGr7OBj29VsSkWjaocpPdVD1EIA=;
 b=CtgEfdcHNJP78srTFgfjggYFHMQt9ugOb5xMLppo1r0NT6SKFadnnv1Sqx26+k23An
 7F+VOiLdNYYhUKpGEBvuUhHWjyKW8rb5RPsBc3tMwynNplHlAN/xrLJhEJvS+EBGME6N
 5tumcAuBUfm1aqUIJE2Hawa6xBZu76jf9NmxywtazlhsJKFseTmaqXXJGHugkMDDahOv
 Kgim0PfybccNmtoYSdg0iO/D9FITKRMKYOlhEM+ofTGEL1DosZizeYWG/BqX+3EZS8WU
 qfr509Uje/a8WUlkwPaS6iiQGhWy0cRBv98sG8QnWr1OYEkXObhkCkzGJ2nLCMyQGDEe
 WZBQ==
X-Gm-Message-State: AOAM530gLqg2E9zbpmD+v44vDS9psLCGZghRfHtYHFKjBaGVyhG52b9g
 X4OAOeDH8rqmMl0+Im7tomc=
X-Google-Smtp-Source: ABdhPJxY3IV9CBDOVQYcpvR8bia9z31QT8jR6CungODF3nAvvDQz7TUfg149jdOZ/6xGRsxta/GXzg==
X-Received: by 2002:a17:907:7651:: with SMTP id
 kj17mr5816724ejc.303.1630787645305; 
 Sat, 04 Sep 2021 13:34:05 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 r18sm1795258edd.69.2021.09.04.13.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:34:04 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMcMW-00050r-4m; Sat, 04 Sep 2021 22:34:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210815073936.438659-1-fontaine.fabrice@gmail.com>
Date: Sat, 04 Sep 2021 22:34:04 +0200
In-Reply-To: <20210815073936.438659-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 Aug 2021 09:39:36 +0200")
Message-ID: <87czponkqr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/jszip: add JSZIP_CPE_ID_VENDOR
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:jszip_project:jszip is a valid CPE identifier for this
 > package:

 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajszip_project%3Ajszip

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
