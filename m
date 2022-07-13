Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D31C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 10:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AABA041677;
	Wed, 13 Jul 2022 10:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AABA041677
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOH34Kp1qmXE; Wed, 13 Jul 2022 10:02:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47C0A410A8;
	Wed, 13 Jul 2022 10:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47C0A410A8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3B71BF391
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 10:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65163840A9
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 10:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65163840A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KeUxlsgU2nGD for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 10:02:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0C65840A1
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0C65840A1
 for <buildroot@busybox.net>; Wed, 13 Jul 2022 10:02:54 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id b12so6376862ilh.4
 for <buildroot@busybox.net>; Wed, 13 Jul 2022 03:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n3INLE2UCsXGVM5x/Z46TOSy2hUuDsyjmz/Q6QaM8Ac=;
 b=16SxGB2rBgsRU72XFvFjSZbriz2mlwiLRj5Rb7zH759vpAknglPaoIhatHkhyV10JX
 ob88CkCfl6dUOgceEwCY3HiC9mg8NSnoEEf5TdHs5y3Xm0UZceYpbPkeRZ6BWHpG5OiE
 Yw+9zTbdz3Vy91DwJk8ORWsUhTzx2cx4GbaZbTtHm26vfUQ8WwDy5JsAdUjx0dH0daA/
 dIuclju5pF6yzUiVaFC4hRcY6LBrFPmb8En1NggvpkLoOvD7VPyNPMo5B1gE+k+uRLXM
 cXtwulYJApqjR0bl1o6+DTu74+4DhOURutJ2TFyQDYmsiHes1R/E+JwZD4v4mGljJ/dP
 8SaQ==
X-Gm-Message-State: AJIora/qXfVfkS3cSJUEyNwhMnYcQEqb/tDh5p14Nb2Tie53i6wvDeY/
 AWD2BmuJ3n7paEAR71ML+Qgv1C39xIo=
X-Google-Smtp-Source: AGRyM1tp42ClHGkoGV6L1bPuuaDXg39b1vRm0j+Y+AxPj4mYeOvnAdR0KnKCyUhmPbi2ZH3AtQlqLw==
X-Received: by 2002:a92:6a09:0:b0:2db:efeb:6a5f with SMTP id
 f9-20020a926a09000000b002dbefeb6a5fmr1345023ilc.290.1657706573731; 
 Wed, 13 Jul 2022 03:02:53 -0700 (PDT)
Received: from einstein.dilieto.eu (smtp.dilieto.eu. [188.68.43.228])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a056602148400b0067502f79e9esm6076937iow.52.2022.07.13.03.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 03:02:53 -0700 (PDT)
Date: Wed, 13 Jul 2022 12:02:49 +0200
From: Nicola Di Lieto <nicola.dilieto@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <Ys6YSY68+419II20@einstein.dilieto.eu>
References: <d88aa72dcbbcbf5988e643e3ecd0a49e1a455d94.1654802516.git.baruch@tkos.co.il>
 <Ys5oV/gCnSknmvtJ@einstein.dilieto.eu> <87bkttec55.fsf@tarshish>
 <Ys5vPCrxDXWvj+ok@einstein.dilieto.eu> <877d4he9ox.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877d4he9ox.fsf@tarshish>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=n3INLE2UCsXGVM5x/Z46TOSy2hUuDsyjmz/Q6QaM8Ac=;
 b=NKRoZR8GrlgoE/uGczWn1yMRiEuDgAnOhqNfhY5CFcKxAyEY3/RHX/dZukdOuxFDKq
 Ircs1KmsDK22bo9ExNizeDvJxI0lTyLPgjTKMeaYgZF25od+pqoVq61sbx/gtj2t6Af/
 C38skwfnGMzQSUFYp98KGJJx9VJM5g9eQ+00obffjFiprNWxxBCoomEPeW5ONplLuip0
 fwuhq5DKMV3x0hrRwuCcUAO0NZDKKY0mxDTPGB0/LkF7oSshTAJmL/s8T8eUWMWxommS
 iA9CehLMRij0UHw0hMbaNo6IpmNsxh9O2rLAm5i/4DE6ziYSVOX+HIDj5ev0Y7yn/cnd
 Ok7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NKRoZR8G
Subject: Re: [Buildroot] [RFC PATCH] package/uacme: requires TLS support in
 libcurl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,

On Wed, Jul 13, 2022 at 10:38:45AM +0300, Baruch Siach wrote:
>I see. So currently the 'select' statement is needed because uacme
>itself needs one of these as a cryto back end regardless of libcurl. Is
>that correct?
>

Yes, that is correct. uacme needs to do quite a lot of crypto for 
implementing RFC8555, but it doesn't do TLS directly - it uses libcurl 
for that.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
