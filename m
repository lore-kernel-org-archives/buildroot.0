Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC149E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 21:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93B9F60721;
	Mon, 16 Dec 2024 21:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jgkxzzy61pum; Mon, 16 Dec 2024 21:40:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDF256077F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDF256077F;
	Mon, 16 Dec 2024 21:40:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C74E6E3
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B53D16077F
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ma68OsK57x03 for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 21:40:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.181;
 helo=mail-lj1-f181.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D86C960721
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D86C960721
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D86C960721
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:40:39 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-3035046d4bfso16168181fa.0
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 13:40:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734385237; x=1734990037;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g72FwVUui9qcWJpy3TQqvLr3ZZkKtBsGw9ZQfykx2ME=;
 b=mThxCYs87HiorbFRrFt2UJXayz8DQjKKjSfyMBRRijqIr8Cda8zEuxtzaXbEnW+ssr
 EnpLL3reI/it6BH/XIFYRH2nzRYFabJ+YmSFkQQUEdnWT/hPPMvNitxLckOy3Llg8vGz
 OcZuSCR9jJYOuO2KUzTFSHN1dfh8hJaW5vP9lmOpKY1uIg4sBQ40XJ3YfCn0GGHEWI+k
 2sHccqXZAjrM3UvnVo34JDQ3j0pRwkt1SxfHuO8ZcR/32QZ6qDhbR6Ncj3ZRI8/UQnUV
 ivrGBOsgEY9rBnQ1fbQ7lrYBH3K3vzxKDvB3qO1cP3E0AWvR5ggIQkt0zBzE4+JE4pr2
 bbeg==
X-Gm-Message-State: AOJu0YzIZuJq+s5/cYe2L4f0oXy7/7JjALLFlvTuFhhf/OWdDA/1ZbtT
 wThwcyQd8TI78spgxxY3BZ/T5zE36pH6B0mmi02UUYwQobljkcFhRXg3Af4PM6A=
X-Gm-Gg: ASbGnctugjsut8v2HNx9AZM4uxjE7yecesmh35/Ap8vJPsPjZvRWYc/A8FzoJGKZNMp
 kyDwR9iJrV/ztxZE4R089l6lM7/FJqnfUXzUPzxn2r1K6gs+XWJ4gMUI8VWSCo5RfhdAWJEazMw
 yu94tXG9ahQVi5MLO9/FcxH1IAzmkNtZYxaQvqyeBzsQ8Ow6BL+Rfj3FwnTQo4kevhqj/3TlymD
 kVGChC9m+cJHij8iDrW0BFkhnoJTVTgb4LxS2gVFVHQiMDZKEg4TkmNs1Ax4NeVXbA/KFRCNhzJ
 PAKu9lCbiSebzIVB0Q==
X-Google-Smtp-Source: AGHT+IFeTSVWp/QLXEglhSEEWeUINs/X0GK/qXDZcZIUfBQer8FNIFEfuKFPP+nwAppXXpml2f7rjA==
X-Received: by 2002:a05:6512:3a8f:b0:540:2257:22ab with SMTP id
 2adb3069b0e04-5409055de6amr3681983e87.27.1734385237267; 
 Mon, 16 Dec 2024 13:40:37 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120b9f3dbsm968128e87.45.2024.12.16.13.40.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 13:40:37 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso5368869e87.3
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 13:40:37 -0800 (PST)
X-Received: by 2002:a05:6512:138b:b0:540:3579:e179 with SMTP id
 2adb3069b0e04-5408ad7f880mr4216674e87.1.1734385236977; Mon, 16 Dec 2024
 13:40:36 -0800 (PST)
MIME-Version: 1.0
References: <20240917203311.1241557-1-thomas@devoogdt.com>
 <20241216181719.770389-1-thomas@devoogdt.com>
 <20241216181719.770389-2-thomas@devoogdt.com>
 <CACXRmJg8bzXKbHT48Ej8iUz3yzT18u3AtXep2-WVYKpsoTFyaQ@mail.gmail.com>
In-Reply-To: <CACXRmJg8bzXKbHT48Ej8iUz3yzT18u3AtXep2-WVYKpsoTFyaQ@mail.gmail.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 16 Dec 2024 22:40:25 +0100
X-Gmail-Original-Message-ID: <CACXRmJgAN=rDPQOtTufT0D7uWDp9o_W1xGN5EW6B_XFuQeR77Q@mail.gmail.com>
Message-ID: <CACXRmJgAN=rDPQOtTufT0D7uWDp9o_W1xGN5EW6B_XFuQeR77Q@mail.gmail.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v3 2/2] package/webkitgtk: bump to 2.46.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Update;

Reverting commit a3b2bc8e16d58e6009b2c628e170dc480fe00035 does fix it.
@James Hilliard, do you have any clue on this?

Kr,

Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
