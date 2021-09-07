Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B0EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:37:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7F0861102
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 06:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7F0861102
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A371860BBC;
	Tue,  7 Sep 2021 06:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dQZXZYDOt6mK; Tue,  7 Sep 2021 06:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 062B060B90;
	Tue,  7 Sep 2021 06:37:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0CDB1BF2A5
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE12B40624
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 06:37:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sK7FRgsxRfbc for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 06:37:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCBB240599
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 06:37:11 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id e21so17538724ejz.12
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 23:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=HV95UPVwZkIGsiNnN+vDSF0ZyWI8VHLUVRauomIcB0E=;
 b=cOu1IcN+HNjThDFV/45fp1OWnuy1qvmku44nuJ37fDDQ45oX0v+oEuYY8ieCub8Dmv
 b3zW0pvvUOdXabPWUmIGyZWmkIcoz+1jt+Rw/aYh0VvHT+8zNYOFrIxKcnMt13B454vD
 L44AE7AkC2GXUMin7AKr2NOCnOEABr930GEgydVXiS3OVCr5pmmYlxzfRv7SZCcUffW2
 vN2S1vcX/wWHImNOdXRHrM9HvqeECQgVj20sJvN0sCm46TPeRH1FHHQ7xZceebV1hOYQ
 ErDw0ib3hRkF6YFIBOby5r8pQRWMDdS4am2cSTDfeqYNwvUD1PT7ojstHceLFi9rz9PY
 aknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=HV95UPVwZkIGsiNnN+vDSF0ZyWI8VHLUVRauomIcB0E=;
 b=Ms/rxysl3cLmLCpo3tDCj6wmaYRImnoCXsQI3shtxNqoHwK9fnA/pktGn9UYI1ORrD
 cBBlnO9/hQeeYv/YaeeGG9bPnGm/F3ZZEFCUMGbTiAszq5/caWhL2wDL/Nd3Dm8/VAA+
 dsAxs7qGaScaSFqZSMBLV8oiq40KMwrPgRbG3Pr5MQ0LqsmOdZPhLehvP5VklnsAKi/J
 c7NSG4wTrwXQihOlTEtFUdaBhf9nRXhtRBNrFMnyfBeSdaolUimr3L+6k1rDIKMx+Lnh
 mxaz+br5iY5CXt0xT4D/g2NaM5xQXhwNVlUTgno/0qeV31XbLtSQFCRTIVHtR3l+Krxp
 ZbXA==
X-Gm-Message-State: AOAM532MgK8kwuXfBoB/6vWx6s1J8Be/EcPJI9JuO/wu+cfK83yqOuXV
 oxauxz/l7DJJxdTigVGoO9DYSwofjHk=
X-Google-Smtp-Source: ABdhPJwA+EhFCQ/U7d0gVVQN9iI/AKoEV/D421bZgi8rj+HYzfqc0SmjCN4O766ke2zTYNyVi8C5NQ==
X-Received: by 2002:a17:906:2f15:: with SMTP id
 v21mr16988241eji.444.1630996629936; 
 Mon, 06 Sep 2021 23:37:09 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 p16sm5801009eds.63.2021.09.06.23.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 23:37:09 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNUjE-0001ST-Ry; Tue, 07 Sep 2021 08:37:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210824193904.127514-1-fontaine.fabrice@gmail.com>
Date: Tue, 07 Sep 2021 08:37:08 +0200
In-Reply-To: <20210824193904.127514-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 24 Aug 2021 21:39:04 +0200")
Message-ID: <87a6kohox7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/belle-sip: add
 BELLE_SIP_CPE_ID_VENDOR
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

 > cpe:2.3:a:linphone:belle-sip is a valid CPE identifier for this package:
 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alinphone%3Abelle-sip

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
