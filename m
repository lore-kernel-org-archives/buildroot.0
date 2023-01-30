Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879E9C54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 23:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 214D2833A8;
	Mon, 30 Jan 2023 23:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 214D2833A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VBalSzUP7dH0; Mon, 30 Jan 2023 23:19:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DD9883337;
	Mon, 30 Jan 2023 23:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DD9883337
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DB531BF3F3
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 23:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F25D83337
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 23:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F25D83337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pq5wE8sfaiZU for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 23:19:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F04A831C1
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F04A831C1
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 23:19:43 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id qw12so20783991ejc.2
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 15:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OgNAvpGfLkS2qZBovYiamg7p/EtHTIUuMJMEHQEj9Zo=;
 b=U00ItPnfRYjWdyU+3IALQHFCshfuTG1I1VWqLXTsgg+j+NVn7xUuKLVVAc+/zOdOcX
 IW9jrBNULiYXZVx+rAfU6yMw1w1zcjaE2bGEYxVINtdoner49o0fkw3VVI088UUHQXwH
 Q8O7lKjTjWO7Wr9KpKVTT3lYQV7JJzTH/1mhAtZNaYSprzsttZ92xM/7RhlnpnV4UR17
 OEKMqMsleXJMSRohd4np/dp1u0pg75Q+J67aboqzFTQwENlmM2gjzxpgWnxQUZPPWWA4
 RVOASHZPsDalaNQ3K7G896wCBkela1hvmu2w83ZzAlRwq3swzM1f+KN/QW4BNJFl1hzP
 tB+Q==
X-Gm-Message-State: AFqh2kpyj96/4jjYWy8fLAFeXzRswqyexohtcR7h3xow4A5CP/Clwmpt
 YoblUV9WagjrsBPY/zK0r8Kq9ZRcfjyoSdCttzw=
X-Google-Smtp-Source: AMrXdXsyLP2RrZ4OOBMimdzv3MQt9hL8t3kS6WBgZOJHgWSbF3ejno+XUp0G12sQSAjYhGoqrRfRjQ==
X-Received: by 2002:a17:906:1c51:b0:864:8ffe:135b with SMTP id
 l17-20020a1709061c5100b008648ffe135bmr49585091ejg.22.1675120781190; 
 Mon, 30 Jan 2023 15:19:41 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com.
 [209.85.218.41]) by smtp.gmail.com with ESMTPSA id
 si11-20020a170906cecb00b00880dbd4b6d7sm4995624ejb.170.2023.01.30.15.19.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:19:40 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id hx15so17147882ejc.11
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 15:19:40 -0800 (PST)
X-Received: by 2002:a17:906:1796:b0:873:2ca1:9118 with SMTP id
 t22-20020a170906179600b008732ca19118mr8425344eje.0.1675120780515; Mon, 30 Jan
 2023 15:19:40 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 30 Jan 2023 15:19:29 -0800
X-Gmail-Original-Message-ID: <CA+h8R2q7bVZ7vFQGi_p54AcR4S9BPxxO7haRrdCi1BJRNXdhhA@mail.gmail.com>
Message-ID: <CA+h8R2q7bVZ7vFQGi_p54AcR4S9BPxxO7haRrdCi1BJRNXdhhA@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OgNAvpGfLkS2qZBovYiamg7p/EtHTIUuMJMEHQEj9Zo=;
 b=dbCEm+htMUmWlAXKd19JWWaelEeKljP+8KxM2yz7bBrnwYU5ToFgvSg4I6DML/6/9F
 6OUDRq19u7jq1axjZv8Wz1A5hMcfZwQOH7XZFAAkUryAgtHAJtdInsWDyymwZLY3qTt9
 vL03LZVfve5J5H5A6TDxqd+3KF5tX82cMy3Alptgih/7H7LAK1TTsVE8SBDtTSJr6dAA
 SL8G+A6FLHXRieT6tSgh53m9RTDxnyG/No0Ho7kygLoK66Uy6A9YIbSxzqSx00+KQ8xS
 5iHW+UBKdaSIrbyLL4fnuLb3ol5AhXK2sC6v0dZNCSwl81qlgisXbSS3aZmqHXRec8XX
 GeHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=dbCEm+ht
Subject: [Buildroot] Multiple BR2_BACKUP_SITE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Would it be possible to adjust Buildroot so that multiple
BR2_BACKUP_SITE can be specified in a list? This way there could be
multiple mirrors with some mirrors having some things that others do
not.

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
