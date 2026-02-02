Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73644E7DEEE
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 401A960BCC;
	Mon,  2 Feb 2026 14:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptGPS1cR9yt0; Mon,  2 Feb 2026 14:36:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE1476073A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770042971;
	bh=n2TPEnzvDDSnuChfBtMhWAQT0WS251BpwbtXY8DV4xI=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KvR5C/6t6qJK24JtekaNhd4MmJ0CDsnt3aP0bkGEAX+UlMMMhp8zsBM1FqthEmuWV
	 U5CPa5QbXVG6NdOClrN7vlqMzU8NoXJKrU2fUcGNYGCUqoOsT6Ynmy8AEm0vcDMKMp
	 50HV7mR+i5eRhm6k0s6WrtoetX09VJ9Fyvtn5td8pwbJPovpeZpQ9Mn6x0wl2tq8Ep
	 eZyzFoLVrQS8iYlFvUjycKs4m9Mm41qMP7hz4snwnr2JBlLqjpu0ycbZR8QLyf0P8e
	 fzzv+9nWt+8IhgZOO0xry5AAabOTc+XPm0SCJqfOblNDOf8IldJyRwhK2ZWDG2jQio
	 5LPJFpPzz33jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE1476073A;
	Mon,  2 Feb 2026 14:36:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76301149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59B4881281
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYkU_v7N2-dq for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:36:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F46381E03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F46381E03
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F46381E03
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:36:09 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47ee787da37so2634515e9.2
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 06:36:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770042967; x=1770647767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IaLLRPWQM84Ld2eWOmkm5i8VP6fSCUCWSMlaCVw3pgI=;
 b=DgWk4lCK10+Ix7vtWnN9rbC6qDzEjzmV6uNYx7t07JBpf2POFILnG9i9XN+AiUO9as
 RLxK+Pgw/dTltiAQON9TWj5YYbf1Uekruz5lYNzsEt0egfzSMK8Eoy/dBQ/zpHJ1WU8l
 bc1A97jPJqM7iEVM1HYta1mcWj/oShHDKgIM9N0xUz7ZYPUExgdCQAl1/JlAeTL1oIHJ
 v29vSM2n47JdXi4ktkhQHPlYy+3eIW3DnNu23/3M5xA0DVx4bZPobypjrywM58vAy+Wh
 fEr0bYSf7/14Y1phlAWAaBqFVNHkhBmMmC5V3tGotkAMNZU8AKWC9tS88hVe8/HY3VOV
 AMQA==
X-Gm-Message-State: AOJu0YyVDe5L/wD+Wj+rNW/Lxq8ElDxWctg+xM1tJfkG5v3NdhnObL87
 nJvUrII+Qj5yZCFO+PI80GTZZ6Rw622vgDD66pboCQZjusb+xIaWu7JG
X-Gm-Gg: AZuq6aI9Vk/enO6uJm8VxppKaAyFlPoYi2fjHwMQpeC1r5OSHYZUqDfh0jPxuAqvdKp
 f+5Vz0F3VPWGTiYb/mHEuhgXq8PddTO3eEKwA03g6nUsqA6Gdm4hWXWWeL/7ubNZL2Mbv5TBx9H
 CxjSVYgF/jSsDCZM8oZAcKqlG3NIVns1CCxHKp4iZ3BAujac8rnJG8Jk5qsF0B00N33wV4kiQ5p
 G5LwZTZPK3t/bu7MR9cAd1zA+rDltvZ1EDOoEs87YvagJB5hAm3GR5Q6AJme0jQdmvR64tWeGci
 Xd7kU+Sxn1O08517VK+LY4688ffNELwh/vEfSC4bnFgLQi40sMBqbWUkSXo6hhnbW5fivIP/Gx8
 pjd1Mo9S6MD/U0aadQbtxSf6fszKaS38NqxoWQpdZJPjhXzikxXFD6qGIQgikm0TIUHPtUHPzdz
 vYMP4=
X-Received: by 2002:a05:600c:6209:b0:47d:3ffb:39ed with SMTP id
 5b1f17b1804b1-482db494870mr87679695e9.4.1770042967192; 
 Mon, 02 Feb 2026 06:36:07 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:74c4:3a65:f9a9:6c29])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066aaf235sm442487795e9.0.2026.02.02.06.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 06:36:06 -0800 (PST)
Date: Mon, 2 Feb 2026 16:36:04 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Message-ID: <20260202143604.i5lfd52f3lptxddl@skbuf>
References: <20250830173313.164981-1-olteanv@gmail.com>
 <20260202114253.283868-2-maxime@leroys.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202114253.283868-2-maxime@leroys.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770042967; x=1770647767; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IaLLRPWQM84Ld2eWOmkm5i8VP6fSCUCWSMlaCVw3pgI=;
 b=mtL5Fx8d6vARkqt+5RZN9JQdEK0BerrldsquB4XkhbfMnWWQk8S5tXKfZjbJg4jwO/
 xfV09+ixHLO81AYdrLznDfEMuzPISlZQwOA5+vLP17pQxXyV1vVRkVmo1yktQcskY6Gs
 2hjJHyZT1gHCJd9hOpA/2vhhOH7fVopMxKuFE6rCyHmutYZ5EcZkcXpjvExIKtAKr+f6
 gcJ1NvP/GOh/TYYchDpQAKvwrhp4invafQMQXu9NLGhChq0ItG1VaX1uG910QJib3fPZ
 AU/2DDJyzRB1X0OPb4u9yUEK8zwtR2XUu3F+/BloTJBlg/pV3ouURD7kJi35n/hS7M5I
 ZUkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mtL5Fx8d
Subject: Re: [Buildroot] [PATCH v5 1/3] package/qoriq-restool: add runtime
 dependencies
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

On Mon, Feb 02, 2026 at 12:42:51PM +0100, Maxime Leroy wrote:
> The scripts shipped with restool require:
> - bash: they use #!/bin/bash shebang and bash-specific
>   features (shopt, declare -A)
> 
> The ls-append-dpl script also requires:
> - dtc programs: the script uses dtc and fdtget commands
> 
> Since dtc needs dynamic libraries, add the corresponding dependency.
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
