Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873ACC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 13:40:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29F4D606A5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 13:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29F4D606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE9FB6080F;
	Mon,  6 Sep 2021 13:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2sadSg9S_8KR; Mon,  6 Sep 2021 13:40:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E319606D4;
	Mon,  6 Sep 2021 13:40:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59DB71BF2BA
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 13:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A33280D50
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 13:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z60gee6LNspv for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 13:40:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CB7B80D38
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 13:40:17 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id x11so13682458ejv.0
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=faB9W4kOkuQBSdaPEvvtp9XwUBV+bHE9nUEPD+yAhxU=;
 b=daUkL3XLbiteYCPOw1b9T+g+FfTW0j+Uq0iWv3tI7M7mqm8t+Hy8PIjy3rSNaSW9VK
 bEe8KQ20DbzV2ld9Up9o2QRhIJj3ebc2xsFH6CcymX8ZxlSbCCVEXAJ/kxl7STrd8lWu
 T1gsgZKuAwYS+f8BJ9QBR+tCV5StxHG3A16Ykj/GJVcNalRKCYaUpIa0FRCX9ekwIDcX
 tPkZ9mPS6chAS76IvQGprCagYmvoqx36OV3DxY138PkYnP3j9fAieSqZj/b314qc2mXU
 7Ytv6YzhC5nX4A6Ur6lk6B4UY6KSa+DTIa9eiTJftWjDJKRhofvWV9PTzQBy4NcgTReG
 PmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=faB9W4kOkuQBSdaPEvvtp9XwUBV+bHE9nUEPD+yAhxU=;
 b=JbwpPWdinmEgUhGilfAZd1VbNB0JcxOS+5M6GG1/NnzEp2BQLZuPgcCsgHkK2Mm2Rp
 hqMbvKr/SW1BfrXMzAriqp5RNDUH1gNbFdywT8ij3Rh5mXDL4dCDR0Y0n4QaKkwRgDjN
 y75la/T6CnsPmq5sF9NSbjCcT/SKHvvh050LmrAtR7hBt+Ds7rMYACV5t8EnORqZm6NI
 MLiltRRH22GtFnTCfTy/+IBh+jCDGtwplPWNqkYYuRtgrgWMMpETL1iZzmoUVtnCVCvw
 2VFcbHmqGcd4/UMtVBtQfmmsc5UX/mmrpxAG8MchU1itqBI7RnHiZWExAzYmjPT0xhmR
 1N+Q==
X-Gm-Message-State: AOAM532OnrQYmxYhxXVI2sN+q0DbudETOZbQsY3QXJPGZ/ltlY50lmx+
 avLnjs8QNxU5I8L0Ig2JMQucab07TmE=
X-Google-Smtp-Source: ABdhPJxkW1KBZ023xdcQ5uGl7jBLsaqCN3ANr4ayYb9BpWMqAsOFr9NiaMDNR3CXLRZ7TL/PKkS4jQ==
X-Received: by 2002:a17:906:bc89:: with SMTP id
 lv9mr13575015ejb.110.1630935615796; 
 Mon, 06 Sep 2021 06:40:15 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 a11sm3938491ejy.87.2021.09.06.06.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:40:15 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNEr8-0002Lt-Jh; Mon, 06 Sep 2021 15:40:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210817221530.2343233-1-fontaine.fabrice@gmail.com>
Date: Mon, 06 Sep 2021 15:40:14 +0200
In-Reply-To: <20210817221530.2343233-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 18 Aug 2021 00:15:30 +0200")
Message-ID: <87eea1kekh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/libshout: enable
 optional dependency for libressl"
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

 > This reverts commit 46b8fb7500ecca65a79507318fd3052208559c09 indeed if
 > libressl is selected as the openssl provider, the BR2_PACKAGE_OPENSSL
 > conditition will always be used and the BR2_PACKAGE_LIBRESSL condition
 > will never be triggered. Moreover, libressl provides a pkg-config file.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
