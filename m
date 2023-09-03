Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C22C71153
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 16:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7B84810CD;
	Sun,  3 Sep 2023 16:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7B84810CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mep_ZUOkusRZ; Sun,  3 Sep 2023 16:13:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CB2180E60;
	Sun,  3 Sep 2023 16:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CB2180E60
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BD2E1BF2EF
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 16:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05504608A5
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 16:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05504608A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZs1PQ_6fzna for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 16:13:31 +0000 (UTC)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DE4360739
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 16:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DE4360739
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3a88ff732aeso903286b6e.0
 for <buildroot@buildroot.org>; Sun, 03 Sep 2023 09:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693757610; x=1694362410;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xntbHuNpnFldN1pHmdxPJ6cf3uvpQCnmsVEbx7O/8M4=;
 b=XGQJT+TtsJwY1qvBnlhhBA/1zhkfbrodlPI7esK/dy96TLGho5gFqfN870ZfibHcmq
 BnuhcPWf3NQWYmkeKGvliM79rx75FdLe5V873GZiMUlRhec20rqkXL3K3Xw7pFLaj2Rj
 V2RsaSAwBn5wsoJbJz6iN8uvurgIvXYgmqJfZzIQwl3aDvbmCqdMqsPZ6/kOKYwUjQND
 z71Y3M2oKX82gT1EmljPgxiYdaKIgp6FKJqvx1XMWlf4m0S/pR38FEm3gUfIoIhplOho
 XenG0cF6kDb3cbK3zc1+yl2BDmADF/iQApykgNHy0V1mJuDGqTHW4iW3EF3WyzeCdhDf
 qP9w==
X-Gm-Message-State: AOJu0YwqTjKuZPZCf7RWRJyx1p4cuxm+bk6EVDR7YKN320Qo4wMd/UMO
 sAYZXVBph36FV/bwkwQSb5Gd6O0DLyo=
X-Google-Smtp-Source: AGHT+IHKdt5rI0jPFU/dYhB+jzgagpGZrLIfg4gWm4qjHSOWqLPjNKOf3YzESADwUC5GxQ1rVpWbdw==
X-Received: by 2002:a05:6808:18a2:b0:3a3:1f72:3cda with SMTP id
 bi34-20020a05680818a200b003a31f723cdamr4527884oib.24.1693757610233; 
 Sun, 03 Sep 2023 09:13:30 -0700 (PDT)
Received: from gmail.com ([2804:14c:7980:8b6b:3897:d6c:e635:bd4e])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a056808005000b003a77e3c4b75sm4057491oic.47.2023.09.03.09.13.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Sep 2023 09:13:29 -0700 (PDT)
Date: Sun, 03 Sep 2023 13:13:28 -0300
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: james.d.knight@live.com
Message-ID: <64f4b0a8f236_809f62afed041072c192cd@xultri.mail>
References: <SN4P221MB06823B0F7326D27ECD5E0FAEA0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_64f4b0a68183e_809f62afed041072c19160";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693757610; x=1694362410; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xntbHuNpnFldN1pHmdxPJ6cf3uvpQCnmsVEbx7O/8M4=;
 b=OxhBJyvd59hUc/3aREF80xJxENm42YthL6Zg7lM9ffvnkzzGqp6GHoYuG8+7GnCbxK
 vRZPaGcbT8bKWA4N1ymSdhXSGBOVm9f3oLlhkU9700C1XZZUPpjMYvEwkYtuqmOSu4hN
 4rNozuBTm97kpvyK8RdzV5bn7cc905HC/CBBspSgY4AVxAibtNorKYV6sLSJ4Tsb+OOf
 BKVp/cydmAcSfxWGu89t7iQ43Sg1NT9YCcDyaRqydbpYNJsRaV7nYz5tLn6G1pRE7vCt
 BFn4oNKxio/WkBUSFiF/z7dlNnUs0cswod9C2YnotXnlx0T0DnDwg4BjLFZ+eW2oE5Uy
 gHbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=OxhBJyvd
Subject: Re: [Buildroot] [PATCH 3/4] utils/check-package: support
 ignore-indent flag for configurations
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
Cc: ricardo.martincoski@datacom.com.br, buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


----==_mimepart_64f4b0a68183e_809f62afed041072c19160
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

Sorry the long delay.

On Sat, Apr 29, 2023 at 03:12 PM, James Knight wrote:

> from: James Knight <james.d.knight@live.com>
> date: Sat, Apr 29 02:12 PM -04:00 2023
> to: buildroot@buildroot.org
> cc: James Knight <james.d.knight@live.com>, Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> subject: [Buildroot] [PATCH 3/4] utils/check-package: support ignore-indent flag for configurations
>
> This commit provides the ability for configuration scripts to hint at
> ignoring linter checks for expected indentations. By adding the line to
> a configuration file:
>
>     # noqa: ignore-indent

There is already support for comments in the form
    # check-package Indent
to not run a CheckFunction named Indent for the next source code line

It seems to me that using 'check-package' in the special comment does
make sense because someone reading the source file, for instance a
Config.in file, can immediately know it is something related to the
check-package script, while a 'noqa' would need to be documented in the
manual.
Also, using 'check-package' in the comment would keep consistency with
code that already exists.
Finally, it seems to me more future-proof to keep the naming space of all
flags/options inside each CheckFunction, so I would suggest a comment in
the form:

    # check-package Indent_ignore-menu-indent-below

that sets the flag named 'ignore-menu-indent-below' for the
CheckFunction named 'Indent' in the library that parses the type of file
that has the special comment, in the case of Config.in, lib_config.py.

Regards,
Ricardo
----==_mimepart_64f4b0a68183e_809f62afed041072c19160
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_64f4b0a68183e_809f62afed041072c19160--
