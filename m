Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098C4C433FE
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 19:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B64660B9C;
	Tue, 26 Apr 2022 19:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VGNZ4zKBjf9Y; Tue, 26 Apr 2022 19:54:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3EFF60B1B;
	Tue, 26 Apr 2022 19:54:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 084701BF425
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 19:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E995740A5C
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 19:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ur0iD2wFx0rV for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 19:54:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45C8240275
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 19:54:24 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id a1so18008095edt.3
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 12:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=99/iLYhrp9gTW3xwuNYs05UBFYtt1qR8Mi2N6/EiniY=;
 b=Ed661y88b4tt0ErkyzqxHfhPEfq5HK8YpNqaI4rpLceE1JoJRDpkxHa+tfNo1JjcA2
 tvF3gOqDX5k/qou6YylzbArzmQolnkYXQkMj2USj4Q8ey8VjaowgY04xx8EFXrwzoUsD
 62zMbwZFALm937QmPd/1Sa8Mz45aiMytimW7PLNx6VWomcB/QorZ7hDA9GsGiYtP8Huf
 sT4RhlFkojYZS6FqL2F4qpiC1dniANXKlcqByNys9ozNlXnesQmyZIE+utXY4vbgGy/Q
 Mmikr0IruBX0LEP+oLGjAnLC02v7VRlOBdOWP1MEauFK5akbJPintGfHpAtjF/k+POko
 cF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=99/iLYhrp9gTW3xwuNYs05UBFYtt1qR8Mi2N6/EiniY=;
 b=TRUbZJ8Jx2ADIWKcJumKZyS8mhzZ4GS2vn+7lNnbyQl5GcLEkmPdXcmdmykoHQP7It
 EmUPlU+2FMmG7uVfoqgL+zHYjqzdz/XcduLY/fOFFTnZaF77+Q6V+Ep98J4QVgBTpYOu
 f27DweoeRSCd2gdag11JV00ScoQnlIlW83A+yp8Rmlt6PHNPA2RL72Pip/NzyNJgVyJX
 SRdLZEUPhemXCiA4rZJHv+lr1qO/XiVtbrNO7yHsaFjfLL+QjDsZXJtD1W9qbFttJ7Ja
 ZJ9VAN9vcHfkOi+rKjAp1GjYZpfvCrn2SkC5qTV0CpVNTfO8AHbIZEr33aJne6xFcJNR
 KxTw==
X-Gm-Message-State: AOAM53220xb6wj/+dqDn4d4OzHUSarpl5jNzoVeb/NMwA/XJB5+Vd33q
 SkxXwYUPfGjdM5R0fUzabRQ4jccv//k=
X-Google-Smtp-Source: ABdhPJzlYpEFTX6n/qPwWbBFxiVnLhrqIUDf3L42DrBMNAxQ+pM0y+1WAEQ+tRe9oFf02gOkJxlYsQ==
X-Received: by 2002:a05:6402:2945:b0:41d:aad:c824 with SMTP id
 ed5-20020a056402294500b0041d0aadc824mr26338074edb.364.1651002862222; 
 Tue, 26 Apr 2022 12:54:22 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 o24-20020aa7dd58000000b00420ca195de9sm6724013edw.25.2022.04.26.12.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 12:54:21 -0700 (PDT)
Date: Tue, 26 Apr 2022 21:54:19 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <YmhN69D287Xmk9T/@pevik>
References: <20220426172129.3189250-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220426172129.3189250-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix static build
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Thanks for backporting your fix!

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
