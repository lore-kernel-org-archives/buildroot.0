Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D1FC3DA7F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 02:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2945C402B0;
	Tue,  6 Aug 2024 02:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sr7MECGXUrqz; Tue,  6 Aug 2024 02:20:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8E6540304
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8E6540304;
	Tue,  6 Aug 2024 02:20:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88B3E1BF31F
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 02:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8302780B58
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 02:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ctjO-hhd_79F for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 02:20:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 99D1580AFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99D1580AFD
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99D1580AFD
 for <buildroot@busybox.net>; Tue,  6 Aug 2024 02:19:59 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2cb7344ed8cso81155a91.2
 for <buildroot@busybox.net>; Mon, 05 Aug 2024 19:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722910799; x=1723515599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U3SwBsKK/Oncr+lw5PDZOIvThWRY+iN1FqurijqujDE=;
 b=P+6+lQzhRzuG5Tps5TQ7FWydSYIRbKEvQ1LDNOQd4bUkffyqwi5GjcKL/DQjiT85DR
 IYn+Mh+0Ds5YyPYSYXexgHh1vo7St4X+Jd1gw8MjRsVzgy86Vk3g38VYoJkMOc7/V+E4
 J6SlzkLcTp/5yn7kik3pL9RXgZBOixDx5UK+fMbCbcRDOMUjFIWnMPiqn2JCSjE8mh1i
 m5hDPGvWyfjXFP4fp1ae2KP/E9Bs/uvm1Ut9Y86oPvsi7x3lvDCId2QuH6VxAljhZIsA
 oZQSsTbY7iOlBpZ/Yb52uQtTY9IcrF4ZZ/GKW8o63G65K8kc18YkKlrMuj6KXc0ZoMeq
 4A9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuKdRL4XUIC6xIpetFsZfnOGFC83IgazshVAJkan6AYmLVQ92Yj1F8KABG+kgUIaGhGmG2CTrCFcQC9HfaKbcuN0cyNWU=
X-Gm-Message-State: AOJu0YzaoYASBrmhdzF5KTMKcKKAhOVrlFJHhPGmkT5xQVeqNCwuT3xi
 7ld/skxDYRTFgYlo4MqT7RmQsZEY1PvGBSiSAIqHW1as9OEJNraY+F/H0Y/V1q88HJ6HJgCL99S
 kftPZtAJllo/8UrDVJUA8nXMeEQfMnFUdtAca92bPGEW2rOxymA==
X-Google-Smtp-Source: AGHT+IGKmH7CiMJ3AKFlDcIoeH1tvz9m4pKfOvfFsbUm8uMs0KzzaImLCufS/JyTbBQAI8DbmoDTKl9txNWUKIUvGEg=
X-Received: by 2002:a17:90a:a784:b0:2c8:4623:66cd with SMTP id
 98e67ed59e1d1-2cff93dbd7bmr9698176a91.1.1722910799307; Mon, 05 Aug 2024
 19:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAGt4E5vg3nF-T3vbbhCmu6Qd+EXjH3fOB63KaB1LpSdb9nw0cA@mail.gmail.com>
 <20240805234808.36e94ee7@windsurf>
In-Reply-To: <20240805234808.36e94ee7@windsurf>
Date: Mon, 5 Aug 2024 19:19:47 -0700
Message-ID: <CAGt4E5tRANUDpph42+GCw42xZzuTm9+_J_j+ErVFnUz=EpSsbw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722910799; x=1723515599; darn=busybox.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U3SwBsKK/Oncr+lw5PDZOIvThWRY+iN1FqurijqujDE=;
 b=KDIsneDB/bGHXibjyYbTu0M1cIGe8DGcPsgtMHGDOYGdrFdKBFiE7/2ZK2dpGhkgeL
 4Qi5QfnKuZwm9IWNPwQ+jIry9OKLYTZA/z9zF49cTf5v7pQivQzUlvQQj09G5sMZ18zF
 TLEEeIGBiydP8iYWYE5qCWamulZ+nPGCYwelw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=KDIsneDB
Subject: Re: [Buildroot] BR2_FORCE_HOST_BUILD broken
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Buildroot Mailing List <buildroot@busybox.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Markus Mayer via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 5 Aug 2024 at 14:48, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> +Fabrice in Cc.
>
> Thanks for reporting the issue. The problem is that AUTORECONF = YES
> adds host-autoconf as a dependency to host-xz... but host-autoconf
> extracts a .tar.xz tarball, which requires host-xz (when you have
> BR2_FORCE_HOST_BUILD=y).

Thanks for the explanation.

> Since the reason why we autoreconf xz is only relevant for the target
> build, I think we could use the same trick as the one I've done in the
> tar package in commit 69cbb563a124002fcb3e2725c3516b502587f9cc. I.e, we
> do the autoreconf only for the target variant, and not the host
> variant, which requires a bit of trickery.
>
> Fabrice, or Markus, do you want to have a look?

I don't mind having a look.

Regards,
-Markus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
