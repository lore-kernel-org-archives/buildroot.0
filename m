Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24BEC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:33:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8214960EFD
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8214960EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 321FE6063C;
	Sat,  4 Sep 2021 20:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b5Z3cBC-Well; Sat,  4 Sep 2021 20:33:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95AEC6063F;
	Sat,  4 Sep 2021 20:33:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADCBB1BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9970680F79
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IfSC4uUTEqgi for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:33:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3467080F6E
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:33:06 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id mf2so5074163ejb.9
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=fmpl9hdg4WQn1GV76121UfQHFEdrPmZ2PGfYbq61RQ0=;
 b=CDcYoBLLa7Yan23BAfDUYcFrwluRSLTwCR8O5DvFcto43S3GR91fKZ/+oFeLUkqp9O
 G+XOsYCDAvzH9m9Z6QVcPoyhY9WSpvvg7vfrDrUkHAUXacDbQfPvZm/zZolRZDaqvT5u
 N3l5kJpAE56q51U4/CFqkqa38+PsVdjq1ykhgMh9DWYAO5B2UeIRn1US26BBXmwROJWU
 Ozm1/A8n4FQYswUV3jMyWYCizFG6IiiaY/o00geeSkLLpMxQ2K/KKPgW0lMqwBrLhEY3
 EbVFjBCL3TBUC6/iwDCEbzWVaWp1MRJGiQliaUPvWiOwlHExMlO/ViG2lQq967Y/z27j
 urQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=fmpl9hdg4WQn1GV76121UfQHFEdrPmZ2PGfYbq61RQ0=;
 b=VH6ffBIAigYfXBi9SsiECa8khA5r2XAKC5oSsguIH0EibakA2ZwT/TBE7sNks6TblG
 EUxpKzC0X7ol4Mi/VSqtYqh6/EDTn+kO6zNmVa70P5bT2EiihfsIolaBT8LDIkE/XeCX
 41GochWR//DtbtC6kU1wbwEKELftD66UUIMzF4uPWAF7hMwMLDB2n8OgOXNPOu21HoWS
 OS3ziNsV9b+tkikkdtHsMQ9wWndWebhLddT7zzCRTF5Wzf4plIujJFf8uKDz0Wbghw2s
 G+9BJ0AH/QR2A7iOQ9938Kwm3xNmjepxQ2AcwoJACTMyqb6YFb7quFIi+ES78CgmWeMP
 LYfg==
X-Gm-Message-State: AOAM530GWDPU95OzfnPBy/wPLP/Rg3UO2fyg5qB4sRSSiB8Sz/zt2KjY
 iA6T5jqS2LQsNA9f8ntY/4U=
X-Google-Smtp-Source: ABdhPJx/MEjX6wBhS9tnqJCpbbHYJZCjZOA2BtfRFzo1ochmrTUJJy1ubj02r9bZ8bCKyMSqNAqbCQ==
X-Received: by 2002:a17:907:3e05:: with SMTP id
 hp5mr5562841ejc.527.1630787584347; 
 Sat, 04 Sep 2021 13:33:04 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 l7sm1854545edb.26.2021.09.04.13.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:33:03 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMcLX-0004yK-2W; Sat, 04 Sep 2021 22:33:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210814210042.354849-1-fontaine.fabrice@gmail.com>
Date: Sat, 04 Sep 2021 22:33:03 +0200
In-Reply-To: <20210814210042.354849-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 14 Aug 2021 23:00:41 +0200")
Message-ID: <87lf4cnksg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/sylpheed: add
 SYLPHEED_CPE_ID_VENDOR
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

 > cpe:2.3:a:sylpheed_project:sylpheed is a valid CPE identifier for this
 > package:

 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asylpheed_project%3Asylpheed

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
