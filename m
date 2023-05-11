Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3032AC77B7F
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 22:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44A6C40BDC;
	Thu, 11 May 2023 22:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44A6C40BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rz4D70pyLV4H; Thu, 11 May 2023 22:15:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 829FD40A9F;
	Thu, 11 May 2023 22:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 829FD40A9F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D00551BF280
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 22:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6D5083F3B
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 22:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6D5083F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 706u125VUz0l for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 22:15:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A1F583F16
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A1F583F16
 for <buildroot@buildroot.org>; Thu, 11 May 2023 22:15:03 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so83828293a12.0
 for <buildroot@buildroot.org>; Thu, 11 May 2023 15:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683843301; x=1686435301;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5BdLX0aVWXNzEKpLWm+2Z8/jEcX9iKp9c0SYL2BuJtI=;
 b=liz3LcCS/U/PArTjOaZXJKSVEdMF4cCP8pD8huWEYEpPxtIrROe0ZIeRpZ0PvtiB2r
 A6Y0sOwOAwbzL5vRputhzWIfcsbk5r1Zy4W+kvU0miEO8ldDN+1HIreKwIYPCE+jlKnK
 fiThKGBdyLjwisNr2GM6J6xoagp4auiTNWFZG43GV6M9agIJTUPCL0k04YlNS/6OTKNh
 HdAvaPwg4tceUNF20PaoFJDcwc2kR8wPxKVP9YIl8tG+sDaPnkm+v1G0ZSJTen7diDms
 xzF9FQA+gSOpNFHeT2PEQz1iXO5ti3saxoC1O5cthW763Np3IgMmnnI4Cl1jcWVBmzpV
 0eIQ==
X-Gm-Message-State: AC+VfDz3OH3orbqwgr0v96OUs6yYz1QBOEe8uxYLtxr2H4cj4xVp+GtB
 fQ63pm5ncRpRd8DA8d5Nq8WM9pPSSdxWevh1qjCb2x1qQL4Tiw==
X-Google-Smtp-Source: ACHHUZ7vWrvLtjqaB05qlVf1ZA/QwUg9j/din0DjEhU2b+avsyIdQGaNbn3PGDbR3sqxafKElZhsq/lDy4mNRgaEt3Q=
X-Received: by 2002:a17:907:988:b0:965:ccc1:5468 with SMTP id
 bf8-20020a170907098800b00965ccc15468mr16524416ejc.36.1683843301392; Thu, 11
 May 2023 15:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230511200257.607495-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20230511200257.607495-1-giulio.benetti@benettiengineering.com>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 12 May 2023 00:14:50 +0200
Message-ID: <CAB1t1CwmW56EOPfTVYoFELaoFkmd23YvM2WMk0NM85zTsFBXhA@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683843301; x=1686435301;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5BdLX0aVWXNzEKpLWm+2Z8/jEcX9iKp9c0SYL2BuJtI=;
 b=TRduhUzM0LyR+3BflcYJVgZyd1Z8wdWf/Lf0HIVQRThDhkCt1BR+E9uLDgSA+aTndn
 RvvaRezlZLAN3ljaFslNZZS6z3kMe+5YC3ZQAnlSiBXa2vkgt/ifqmWxSVe5AaFY7lpZ
 ucsvoMLyv17vcdLMQkPSjC32RP7X1aZnj4SLYbw4wJiSOtPtmJDDGFwLQmFK4+OlTRRT
 2vQL0hyUmDySwYhWVogP6K/c21Qq6/grDxXHmspD8qhMxLpHvhbYe6Bu/4tCqEmi6+B8
 QZywwY4nIh8KOJHjJtvcXM8p6Z7hxDpODkjM8EtfzUrcB6VIqkO9l/cRmLGCsDbv9NQa
 P6yQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=TRduhUzM
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump to version 2.6.3
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

LGTM, thanks!
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
