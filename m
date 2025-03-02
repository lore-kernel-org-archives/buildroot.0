Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5984C19F32
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 19:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86A2B413DC;
	Sun,  2 Mar 2025 19:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FqGM-wBHseP9; Sun,  2 Mar 2025 19:57:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 461EF413C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 461EF413C6;
	Sun,  2 Mar 2025 19:57:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F0AD958
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 19:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E56A3400D7
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 19:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eg6gDnqEleSn for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 19:57:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.54;
 helo=mail-lf1-f54.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A53B740A96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A53B740A96
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A53B740A96
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 19:57:08 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-549490e290dso2597829e87.2
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 11:57:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740945426; x=1741550226;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OT8KDcKREzC7RhRE4npM+55OdL0U82fIYUMk/liiQ4U=;
 b=UGQ16fBEJIDHU0PlhQWdelmUy8lDgXtYmE0CqPM2yUEjzn2rP232LZ84gdYxpiqEI7
 jJ7ljEDi1E9PUGGUlXFDeEg7aD1LQc2mLZl8taDGvGQeiPmLMEh2EKyfYVI/Yi0PkF98
 7QdjM8cDg0dMwW+MmNzsX87K1D6PBB0F4PXFTaLStJJkecUMkq9Hrops4g97Gd/YR49+
 xDuilCwCbfkuQJAszOZ7MRiiTJGofMwLFR3kQf3IxLZYk6JjTQrjK7Pytypqtlfjy4Mc
 stg3j/MVebhjZzz0YRWScFXeJ/cRxn2MSxzeQvPqhUymseTmGGQwWmu5vgGb23uT8WsB
 ikYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCKCftnzrI6OiuMQ5lkumvub4a6L6BOW1F7wcmwOe/K2YlMTqPtXnK5DLH8CK72Q6I1A36JLK8hiU=@buildroot.org
X-Gm-Message-State: AOJu0YzNlZbhJLNLgdL12qb1RBXi8k9wYEbAe+bj6l2Lkq6KZuZJG1kO
 lgj1ZclQLk+IAJ2QXKLD5zW/vNpsUeDwcq3AvHTlKDOxZnNrXijmXSUvSMdA
X-Gm-Gg: ASbGncsvXZXOm6QAu10keAAhXcrauNV1//3biIml4EE1hiz53Qv8Z2mqGei1g7UhsC4
 jINtn6YMnqPqPQf2/bWapO2eC24Ia2abauxQ2nL95wX0UCMGCzuNGQHcdlgbVRSBA9V/RiI4m5Z
 nLG8749Su5bqQTi/1XEky/dYf2nlaZ67X/qY1w0O0n+Go6qbVgEQ1NgOoChx5FsbvB1ejQw9adu
 yFWqyZHyZJqU6myr5kS8V9FL3A2/2Uw0IisSVlt9s1zzlDBQoKZUyMgKcM3MMUFHO5uG0Sim5kR
 SamcBhver8z+N4uymOORw2yelTOEVaSJr7T1iCV2Za6QUB5BWP+dge8CJYMYxnQ/cR9FOOEN5+q
 y9VSpoZZScQ==
X-Google-Smtp-Source: AGHT+IEvpFXRjurW6f8uT9YT+ilGTBceTkFXR572laHjsc5+Y9ven2KtFjUEA4J411w2CtkXOSHigg==
X-Received: by 2002:a05:6512:a8b:b0:545:d70:1d0e with SMTP id
 2adb3069b0e04-5494c10c660mr5442452e87.3.1740945425663; 
 Sun, 02 Mar 2025 11:57:05 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495803fd0esm617523e87.106.2025.03.02.11.57.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Mar 2025 11:57:05 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30737db1aa9so35086521fa.1
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 11:57:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUcG5VOSLBoWVrIVN851R9VLckQ05hze5JUYQyPhD+Wr+rXn8Ric9fX4t/35NZfwzKmUkmNTYdp8c0=@buildroot.org
X-Received: by 2002:a05:6512:e8b:b0:545:a2f:22bd with SMTP id
 2adb3069b0e04-5494c354e3bmr4552674e87.48.1740945424591; Sun, 02 Mar 2025
 11:57:04 -0800 (PST)
MIME-Version: 1.0
References: <20240917203311.1241557-1-thomas@devoogdt.com>
 <20241216181719.770389-1-thomas@devoogdt.com>
 <20241216181719.770389-2-thomas@devoogdt.com>
 <CACXRmJg8bzXKbHT48Ej8iUz3yzT18u3AtXep2-WVYKpsoTFyaQ@mail.gmail.com>
 <CACXRmJgAN=rDPQOtTufT0D7uWDp9o_W1xGN5EW6B_XFuQeR77Q@mail.gmail.com>
 <CACXRmJi-K=k+bwwhtVEjAOc6wEJaS1rg_5cDFwMY2nZmR24KVQ@mail.gmail.com>
 <20241229230256.609289ea@windsurf>
 <CACXRmJi=rGj9uA6R3fQ45sKuSy_+=Vi6u_Vdn_koVd4DkWZj8w@mail.gmail.com>
 <20250106163949.5c49b568@windsurf>
In-Reply-To: <20250106163949.5c49b568@windsurf>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sun, 2 Mar 2025 20:56:53 +0100
X-Gmail-Original-Message-ID: <CACXRmJhFhN_97jrhsHZJKF1NoLHke+u1Ux3T_6em8UV4ZkbndQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqEc-mmFm85MJwOBcThG9JM3FLe8mP8qA6o6nZGKqOm44H4Y8JwCUMUbUk
Message-ID: <CACXRmJhFhN_97jrhsHZJKF1NoLHke+u1Ux3T_6em8UV4ZkbndQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 James Hilliard <james.hilliard1@gmail.com>, 
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org, 
 Adrian Perez de Castro <aperez@igalia.com>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, All,

In the meantime, Peter merged the pkgconf patch [1] [2]. No real
issues were reported since. So I expect that this webkitgtk bump can
be reconsidered. In the meantime, version 2.46.6 has been released
[3]. I can have a look to bump further. But I would like to have this
one merged first, since I've tested it. Also, beware that webkitgtk
will release 2.48 soon, and having the buildroot 2025.02 LTS still on
2.44 seems a bit odd to me.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20241218084337.3775491-1-thomas@devoogdt.com/#3468433
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/139b580ca4aea35f5c451bce4a1b42da4cec2209
[3] https://webkitgtk.org/2025/02/07/webkitgtk2.46.6-released.html

Kind regards,

Thomas Devoogdt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
