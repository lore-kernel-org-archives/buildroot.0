Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10F1EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 09:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DF4981947;
	Mon, 17 Jul 2023 09:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DF4981947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9kc5xQdbJcM; Mon, 17 Jul 2023 09:46:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99F72815CA;
	Mon, 17 Jul 2023 09:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99F72815CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA9201BF363
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 09:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1DB240962
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 09:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1DB240962
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9aH8fvbmLPT for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 09:46:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5002401AE
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5002401AE
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 09:46:40 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2b701e41cd3so64278261fa.3
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 02:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689587198; x=1692179198;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zFWkDuJtRUGNRcaIM15OyHS839ZCQW6PKgOzaCMXEow=;
 b=io2mmZpIldJ5qEYTZ6UYaKsj79veZHq5jnvEiFc5y/GP1WiNtqfOkBZTmqmaUDjUCM
 JwNgJ6GsM6i5rONpsHj2lhoUGCBpLVHriE5vGBH1oVbkun+yKKm+QaZYqEjyFi0G/odE
 CaSlOQpYlUpeYb+QEIK1zxcimDuJhe3npjJh/kAC1Frpl5Rsti32RYNhPbzLa4Dcfp1N
 B3dJIlOkhQW7kSuyEp48Ma5Iu8i+0uZb7oKBjMFROcPDnZppVfdnRYVTZEtAaOqWNwgZ
 6OpTr6EmumT3SWsUzC5h1XpV8psfwxqk56ipdrXy/hwRTtBg3+ANKxSB/ur5nULJ/8Xg
 iWVA==
X-Gm-Message-State: ABy/qLaSdgkmZO6CMG26nMZNa+TKLgRFz0C53d4xVfLsRFggF32k3y1J
 8Y5SVZ5nUFy6SfqHg5k9qNubi6Ath6h/Yg==
X-Google-Smtp-Source: APBJJlFFRKrmAjocEU2hxgI0k8/LmMw6XyEYiO742f8D74u9h20EI3na+XKGRGH29QrFNpCZaVKjsA==
X-Received: by 2002:a2e:9d0f:0:b0:2b6:f21c:2c46 with SMTP id
 t15-20020a2e9d0f000000b002b6f21c2c46mr7063387lji.53.1689587198182; 
 Mon, 17 Jul 2023 02:46:38 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 o11-20020a2e90cb000000b002b71c128ea0sm3555965ljg.117.2023.07.17.02.46.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 02:46:37 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2b93fba1f62so11949041fa.1
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 02:46:37 -0700 (PDT)
X-Received: by 2002:a2e:84d7:0:b0:2b4:75f0:b9e9 with SMTP id
 q23-20020a2e84d7000000b002b475f0b9e9mr8007401ljh.10.1689587197558; Mon, 17
 Jul 2023 02:46:37 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 17 Jul 2023 11:46:26 +0200
X-Gmail-Original-Message-ID: <CACXRmJh0DfDtW71xY_p25s3pRMd78+ZA=_ZZy9h5-P3-SGhTTw@mail.gmail.com>
Message-ID: <CACXRmJh0DfDtW71xY_p25s3pRMd78+ZA=_ZZy9h5-P3-SGhTTw@mail.gmail.com>
To: bernd@kuhls.net
Subject: Re: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump
 version to 2.40.3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd Kuhls,

I saw your security bump for Webkitgtk:
https://patchwork.ozlabs.org/project/buildroot/patch/20230716121914.3896405-1-bernd@kuhls.net/.
I think that the git message "security bump" is somewhat wrong. This
is a new major release.
E.g. have a look at Adrian's last git message:
https://git.buildroot.net/buildroot/commit/?id=ce4b87be82d13d3a042b4e78fe5835f3c8ddc29d.

@Adrian Perez de Castro, what about
https://git.sr.ht/~aperezdc/buildroot/commit/c927b964a18b64263cd53e0f4eb988f0435516f4?

Kind regards,

Thomas Devoogdt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
