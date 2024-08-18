Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB511C5320E
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 16:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 610AD4023C;
	Sun, 18 Aug 2024 16:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M7_1CO_y3vRi; Sun, 18 Aug 2024 16:57:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18FAF4023D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18FAF4023D;
	Sun, 18 Aug 2024 16:57:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3E281BF23C
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 16:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE1BF40275
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 16:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ubv2rW6yNJGU for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 16:57:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7747540254
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7747540254
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7747540254
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 16:57:24 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f3ce5bc6adso10050561fa.1
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 09:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724000242; x=1724605042;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NsvVSWr4EECmAMWnvEuo4bIhuL2v/cVcarx4+fgjkaw=;
 b=kr34fLNLZ0PvGdlqYfb7gAZ+rkw8mbx0lwUF0j8Ig//NkHS/6uM3Xpbe2AuTXyjRXL
 fmSlecoKyB+8dkIow34ZWfWbvMclsrPUDiJ35RZBgE6If/hs+QVUry/+dUkGculErlOP
 CbvVYSm7D2GngtHhPBBUydJzxQ3aiYjz0ta/5d/PRzfEZldIJT9+UcqWNHIv/zGFKSKh
 doC652rAxu8j645GpeAM62ce0pbz3ADIohnemS3huuYIlVx6Owog5gTEimmv5N6dWTUu
 EErxwiqYLcNMZSZo/3sSF2p5ySTJ2G+cqb6vUr8eoj9FYGjxwF6nknusYkiWIgBBwNcI
 kYKQ==
X-Gm-Message-State: AOJu0Yw5iztCfypF5Bi3XHoMBcecaeS3p9oj8q2Zuzmztp+m3ex/g7S7
 r6VBDxO0GJSKf6/GlAVlj3b1hovS/Jr+ad3fKMM6aXpxxPsUGavOZ8LbAAuV
X-Google-Smtp-Source: AGHT+IECqB5OmKA3e5jr8sHqPSb0NXQ4hkwD2VqeUKwrPk1Bt7r5MsnVonyqiAd0paYuhyB6GzdQVA==
X-Received: by 2002:a05:651c:50b:b0:2ef:29d4:3d97 with SMTP id
 38308e7fff4ca-2f3be576773mr68390151fa.5.1724000240881; 
 Sun, 18 Aug 2024 09:57:20 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bee0b0c4f0sm1799845a12.27.2024.08.18.09.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 09:57:20 -0700 (PDT)
Date: Sun, 18 Aug 2024 18:57:18 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240818165718.GA719477@pevik>
References: <Zr6t0edkFUlZULGn@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zr6t0edkFUlZULGn@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724000242; x=1724605042; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NsvVSWr4EECmAMWnvEuo4bIhuL2v/cVcarx4+fgjkaw=;
 b=c/wSpH4DI2/sifPjx/DoiRULXP+5bYkFf96eo18MjxG0GWk1X+M9PdGdXOHJqLQpum
 fk7mZpy04WJcELYKw5fqsBek8/ssLIJPvVAvM5s4EN/IuyntrFbLPahTntl9RuaZFSQX
 LQKDBe3dyX9ahcxd2wwf9eVxxA3Vv/q5Y7sahpQlxJ7KY5i+7j71v3bCSENO7Cc5R/VZ
 6QubjBO9F/WR2XMqcsuYYcUEIEwgi4bit6wRl4Le12+465p/skGLqphCuHY+xKTB6sVm
 /t2suCK5RLk7xTgmri+7zQldKLCXVTSlW3bPR+WqpJsMQp1Yf4Z1crTYVo6CfIV/7GUJ
 58IA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=c/wSpH4D
Subject: Re: [Buildroot] [PATCH next v3] package/bind: update to 9.18.28
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

Hi Waldemar,

thanks for the update, LGTM!
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

BTW (not related to this change), startup script produces some warnings, it'd be
nice to fix them (as a separate effort:

$ ./utils/check-package package/bind/*
package/bind/S81named:4: Do not include path in DAEMON (https://nightly.buildroot.org/#adding-packages-start-script)
package/bind/S81named:11: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/bind/S81named:12: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/bind/S81named:13: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/bind/S81named:14: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
package/bind/S81named:0: run 'shellcheck' and fix the warnings

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
