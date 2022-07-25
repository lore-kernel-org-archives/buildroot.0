Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA7EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 07:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECE4D40CD9;
	Mon, 25 Jul 2022 07:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECE4D40CD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZNzd8lR1sfd; Mon, 25 Jul 2022 07:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBA9840CDA;
	Mon, 25 Jul 2022 07:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBA9840CDA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C57AB1BF379
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 07:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FAFB40CD6
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 07:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FAFB40CD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CgeNoGHLO2Am for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 07:34:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC4DF40CD5
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC4DF40CD5
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 07:34:01 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id m8so12726924edd.9
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 00:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6drdw6q+ukCcx+QN9i59OCwqG1BaarhHHlMX0gU/a4o=;
 b=ez+e/pUFWZYZbO6F4V9yiiC10MfxR12mI4lgxnCdIlT6sZPKjNV771RC/f4nPJ1ekQ
 SEFqfnyEAw7ZiaUd/juiN/9ly+t6RUwr1WdFWnGKhDMOZ9O8YE03/N2h+bOynG4qHto6
 3viM04kDmoB1GVpWhLsYJNmWT1eFXW0Tkuz3CTJjm3y53lEYKgHLwbB6PaPuM6vrLm1O
 eR8Yx8bzBu7qJ24+eEuTVuk00bJPz/DnXtpy31bY+uD4fuoWUdG8FuvSmT3All0GMlJh
 BnbOFAhQuejzW9tTVrda58jiDQytg2JPD3j+gDS6YFov4U4LAiT50nliVC9CUZhxQJnr
 M4QQ==
X-Gm-Message-State: AJIora+XDyxIU58jnjaONT48gXk9gc68q/gzwlOCYfG1UNTG5q1y3rbI
 73nAMwLCt2RYtJjSqdCtZ64t5x8LgRP68ey8
X-Google-Smtp-Source: AGRyM1uHWY/5SUR9Bo9Lpq53Q5IZvJEFOJlzJqZlQ4bE6ogtsQP47S/3kSvw/DKMUAkfsHlyPLMfEQ==
X-Received: by 2002:a05:6402:520a:b0:43c:4ec:e809 with SMTP id
 s10-20020a056402520a00b0043c04ece809mr3185282edd.198.1658734439753; 
 Mon, 25 Jul 2022 00:33:59 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 da24-20020a056402177800b0043bbea24595sm6631680edb.31.2022.07.25.00.33.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 00:33:59 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id c72so9860187edf.8
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 00:33:59 -0700 (PDT)
X-Received: by 2002:aa7:d943:0:b0:43b:9010:9d86 with SMTP id
 l3-20020aa7d943000000b0043b90109d86mr11801139eds.34.1658734438850; Mon, 25
 Jul 2022 00:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220725002414.704892-1-christian@paral.in>
In-Reply-To: <20220725002414.704892-1-christian@paral.in>
Date: Mon, 25 Jul 2022 00:33:47 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qq+F0oKAEHi1Oe31MiurY99cTJdOAHiCmOtyhBTotF1g@mail.gmail.com>
Message-ID: <CA+h8R2qq+F0oKAEHi1Oe31MiurY99cTJdOAHiCmOtyhBTotF1g@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6drdw6q+ukCcx+QN9i59OCwqG1BaarhHHlMX0gU/a4o=;
 b=dxc7pRDt8Ksmt6wsMnYdfa3PKMCyyYM0UbDL1LH3MLXsO5NeykG4qfJ2QLdXPlunFX
 NNYStmqb1bAuI2VYypzGTsvvDHHBRrgyOoai0Svxn9fcMaHQyxwI3exXJ5qhbhTP2RaY
 NTudU6yXdi2gJC2Kvsp2L5m0HkTQ0JE0dQGFk2fN5eoEqtGn0TgwQUeq24Ht4s6hFhsE
 /HqWtgH49dOut3r7T1d9dDdmp+uTaUZkSUb7BCLhgz+7fndMVsh7uQz+L2o1N49kMioK
 hFWBnncZo1WWbhqWbwaFtbUT4hyZyBQQxpB420+JWg+5MiVQFT7fs/6+e5MFf5R0gtyI
 xxnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=dxc7pRDt
Subject: Re: [Buildroot] [PATCH v4 1/1] package/runc: add host package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Sun, Jul 24, 2022 at 5:24 PM Christian Stewart <christian@paral.in> wrote:

Minor typo:

> +       help
> +         runC is a CLI tool for spawning and running containers
> +         according to the OCP specification.

Replace OCP w/ OCI.

Similar patch was submitted to fix it in the existing Config.in as well.

Thanks & best,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
