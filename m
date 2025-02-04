Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E95C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 12:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40E0A81F4B;
	Tue,  4 Feb 2025 12:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQWrwI1X4Lu0; Tue,  4 Feb 2025 12:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F01D81F33
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F01D81F33;
	Tue,  4 Feb 2025 12:36:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 556BA185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 12:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3958C81F24
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 12:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhXoWTQGWzHO for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 12:36:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.52;
 helo=mail-lf1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6589481EF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6589481EF7
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6589481EF7
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 12:36:29 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so5469394e87.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 04:36:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738672587; x=1739277387;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mt2tS+stfmfPMi5abvGWnHtU+sXeNQV0tz8PTi0iVSM=;
 b=H6hHqWwpyjjsSajAEuoqaOT1ffjyrE+pSXgmyKAqY7Zv2e3cZs0UJPPlq9HiV5S9J3
 2aE5dFn/qZliIBm80QqA59we4CHKlLgitAVuaZ20Xjui1XmmobZEeCKGJ6Kd3ntTZeZt
 B6+Oq20AnF65xoeBd9aOgF34lRDuu12enRoVIluLQAQ3Xp+lLP1B0BCPUkELaF8eWBkI
 TfU9MpQ7CMR1HeWSGlhODq8gj3XGr7SuUNFB8kJxlCuRI90Eb9R5RlE6NkMkKhxgQ382
 xjZ/bLPffP9Qdd+eeJ+tdjJmgibOC5DROSNcop3Qe7Yg4D8gVnLmLNCJ+R4xJFpGHXeS
 flVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRp8xv1d6hDrnsgvfGi1sz8fvk44EI0FPwMpm6vEnJBqs35XLDrVHzzwiJmYbCA2RKIJ9tB6CAQQ8=@buildroot.org
X-Gm-Message-State: AOJu0YwIoSBm68y/jkNTXfuSuvLMUNzT9O8wcVY16Efd5bnErdZxUFaY
 J3GKB71u7Wv7/bMDVyNzs5EFlKbLTCpyISOx5gbhmegPlrReCymOWNJYEMjn
X-Gm-Gg: ASbGncsNmQD2hjjPT0wjkmxZ0FpMTgTGG8VYLMIARJarOylstjSGQ6JmmpkMuH24xAt
 NikFHj6+wXHnBGRChyEgaFg+lg4DHh4aLL4SBuRYniVn8FPf7qRuO0eg4CX6WAmIywYt7VkUJMt
 zBUg3oMrr3jqw8zd7fO0+GIwTk+L7PAVyl4LrdjR9U8JvpJmcdkzg0K5/+HEZkI7z3wkCO3J94x
 n0aCcYXlZT6EOMbt1AXrlxw7AUgzqRT74yOFmx/lNYEgHRIgf+Eyoc6kLbCEB9GAAtk/q/XI+xC
 1xq8yrZL689lvSZW7lXFeC2NVXjSmk7MpwqaJ3FKR/I9LL6vCJjbuWBH
X-Google-Smtp-Source: AGHT+IEzi71i54t6dOw+VdS1bcuLnsopTjf8ZpOE195sQ5pYMj263+VnyczFR1I/2Q9Dd04FtPCwAg==
X-Received: by 2002:a05:6512:2344:b0:542:1b63:141b with SMTP id
 2adb3069b0e04-543e4c2b0b4mr9440677e87.32.1738672586524; 
 Tue, 04 Feb 2025 04:36:26 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebeb7c13sm1571586e87.172.2025.02.04.04.36.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 04:36:26 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-307b8e4fc25so27019781fa.1
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 04:36:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU5ztBbJvcNlnuu83mkRSS8EkNl37oNuKjqjA1X9IaZL3NdBYPcP3Ga3ERYPdyoLwSKd87WYF6Lz38=@buildroot.org
X-Received: by 2002:a05:651c:12c9:b0:302:1861:6df8 with SMTP id
 38308e7fff4ca-30796961845mr86526191fa.33.1738672585942; Tue, 04 Feb 2025
 04:36:25 -0800 (PST)
MIME-Version: 1.0
References: <20240920062014.132862-1-thomas@devoogdt.com>
 <20240920062014.132862-2-thomas@devoogdt.com>
 <20241026164305.34881a98@windsurf>
 <CACXRmJgoySzrYAu0KCNSfnXAxrFwameDABJR-AXoAiYxSX+2iQ@mail.gmail.com>
 <20241029170639.52600e61@windsurf>
In-Reply-To: <20241029170639.52600e61@windsurf>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 4 Feb 2025 13:36:14 +0100
X-Gmail-Original-Message-ID: <CACXRmJhA1ADNLrhYu7gbmCGaJtHVg6ZruBA-oXO+Bempgf8xOQ@mail.gmail.com>
X-Gm-Features: AWEUYZmrepRjV5UdCkDH4r9VER-2XEJ9HupEMs7s3N_mw5OjuunawdTeuMo-QRQ
Message-ID: <CACXRmJhA1ADNLrhYu7gbmCGaJtHVg6ZruBA-oXO+Bempgf8xOQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org, 
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Bart Van Severen <bart.vanseveren@barco.com>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v1 2/2] package/libwebsockets: fix
 LWS_MAX_SMP when BR2_TOOLCHAIN_HAS_THREADS is set
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, all,


This thread has been a bit abandoned for some time now, any concerns
still to be addressed?
Would be nice to have it for the upcoming 2025.02 release.


Kind regards,

Thomas Devoogdt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
