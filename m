Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6555E10ED640
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D46561411;
	Fri, 27 Mar 2026 10:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-gGY9Rro9Dv; Fri, 27 Mar 2026 10:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0052B61396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605776;
	bh=yxfsPFqDJGJ5EZuzydk8QtYcZo5I2qxNZb97Uy0cai8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nbuwgmYm6KqBQFqpzxEatuKQiQlifJtD/rbAQVVOcXJ74d4VtALyO3G8kA0Bc1tVc
	 swFHslm9m85dGabLRpi8udpD/ERWuW9fWsdsc6eHpN3wujIcKHRsU/9CWjf0Haoni+
	 j+CQlet+mRThENMNeer+Ow14o5ixDFnd/suZ8gPQi33ZqeRXckyGJO71rf33A9Cq8k
	 O44Q4vqwOKqKBgyto2P5lNUtj9J7FEvUYTuYNsMnSvspnkwOFWq6whutDOXbG5mE66
	 pf3CDiLcZhtGoZ4huV11XzMUmbqf9MD1zAVTuDFtjHf28E3huStGRH013LUIACv3HI
	 tvgO8fmIN/yuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0052B61396;
	Fri, 27 Mar 2026 10:02:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 404C2249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25C51414E0
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URRe9Elb4Y8G for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:02:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 125DE416E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 125DE416E3
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 125DE416E3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:50 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48702d51cd0so21897015e9.2
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605768; x=1775210568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LiHt8bEplqvaQUUD5Zx2Pmoy905BwUtdJUPKybp+J+4=;
 b=fGDquGEANOLa3V6k84K29Zvn4HkIdCq1aEfTKAHbJqyT3gi4bEpCLYc2lqdYhLL/iy
 0ayBGxymPrRrFKDRaydRTPhNwYqOQq+GBeFs//u7njLjYJ1wda/iALMTS7gGZwyoOimW
 GNzv0MVGtKg+S4U6mdPqBj5q6nwKwO0uyQEvPi1IUOBFa4L5vc+hFxzVw29ZYZhZN2dX
 R0b+CP4HWHn89jTvfL/6QAehjM2KvW+7MqwBvBsnRmFZ6+CRQzMhMWda7kj5Jw90tPrJ
 e5ql+5gWNbBIXUCqELEg44hILMGTGBktj1uHmDtiD++x4RPMn2nE7tbY3Wy47Y/0MGp3
 368Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXElbiTFQpFrVulSg/qPhl6Np2uDxeVPBOVEPOyHiEtWx8O1Phu9gUIAwMUJPAdUAeDeD/o99oS54Q=@buildroot.org
X-Gm-Message-State: AOJu0Yy2JLPEIlD3Fv6aVUfCAMCY4OfTn0ZVETD9DgSoaDNLmxXq6lwM
 zcrcHFG8fhC88BY3rmpPxhCpgs3jeWjfgwtX3xdg4C8as8Q8lQP34uuKRnX3KJXwx0wlLSaU9nt
 HmhBvCYk=
X-Gm-Gg: ATEYQzygWC4iqFBzwTkUtxStxBJXtPc58Vys0SIFKH+pFGPQdyqhtN1I40RFNuOxGC7
 3vmzLu1IuBlQKkz88Dk8DhDEhzv7zCH0LeoUfU6idt5mBbO0F4hAZyo4LoEgtcK+r8UTPz29SLp
 huk0eDEABNKICfYmrkYyEiPjQJ9Tq7c3B5Z643wZtin39EPXISr4f9mE9xsat9vDJoUhNP0NFbf
 Ki3XIJ4kTru6GEbc0OdBWMmb/C3jrHDKsGn+TkxIrVsF7NlPQKbjN1i3/lv6pzkvqf3uhYwERDw
 6CAJv81sNganso0aPLHuxqHmd6rgKKjaZ1Noj6O47HH3enav13zXsLVpufu26ShfJjkkuY3ja/e
 vTN8jwgPd+k31OnVMjjxXoZ/ToaG+08K9+ohv8AP+ehMWkoGsPqscz/s0lJcWCG2hIJvUet32l5
 60yy82TPSrz9crIwe02hpVjmF2Y60=
X-Received: by 2002:a05:600c:4f53:b0:485:481c:e7bb with SMTP id
 5b1f17b1804b1-48727ee9b89mr29216825e9.20.1774605768115; 
 Fri, 27 Mar 2026 03:02:48 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48725d9e85fsm22342385e9.1.2026.03.27.03.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:02:46 -0700 (PDT)
To: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:02:45 +0100
Message-ID: <20260327100245.46486-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318105338.1000762-1-manuel.diener@oss.othermo.de>
References: <20260318105338.1000762-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605768; x=1775210568; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LiHt8bEplqvaQUUD5Zx2Pmoy905BwUtdJUPKybp+J+4=;
 b=dqci+AKCo8bOEg0U3kJSp91wFKgJoEiPaKilaQE7NfbyYe/JNxePEP8IQ7sAgplhBe
 Xam+7KYyd2rmAJHZ0b/mk6PdvRGp3BRh6NnlC5N1mvE7L1n635rRpgEG8C6ak0u/Ayg2
 pEvDIDplBGby1fkcrZjVoWG/+kp43/pKMtcE/6fuiRq5RoFZRKS45FT2tD8S4qTsqLUX
 +DPOsMr+HLCL5D829UucTx2K0Yag6q0/9UdFGxmOT8PjQDB/WGYQmlGobUPQUMkqX+lW
 Ij1vERBzzZSAyqT9L5nQ7jg22Tmuw11XDPEpBYcXQbBoxDuF5Z7c2l+X+BLXDDAOo61r
 UJUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dqci+AKC
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Manuel Diener to several
 packages
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Add myself to packages recently orphaned which I am going to continue.
> 
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>

Applied to 2026.02.x & 2025.02.x. Thanks

> ---
>  DEVELOPERS | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index b722b5fd51..8c9b89c249 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2210,6 +2210,29 @@ F:	package/ffmpeg/
>  F:	package/mpv/
>  F:	package/rpi-firmware/
>  
> +N:	Manuel Diener <manuel.diener@oss.othermo.de>
> +F:	package/pico-sdk/
> +F:	package/picotool/
> +F:	package/python-annotated-doc/
> +F:	package/python-apscheduler/
> +F:	package/python-crc/
> +F:	package/python-diskcache/
> +F:	package/python-django/
> +F:	package/python-gpiod/
> +F:	package/python-immutabledict/
> +F:	package/python-jc/
> +F:	package/python-log-rate-limit/
> +F:	package/python-pydantic/
> +F:	package/python-pydantic-core/
> +F:	package/python-pydantic-settings/
> +F:	package/python-typing-inspection/
> +F:	package/python-tzlocal/
> +F:	package/python-sdbus-modemmanager/
> +F:	package/python-sdbus-systemd/
> +F:	package/python-varlink/
> +F:	package/python-waitress/
> +F:	package/python-whitenoise/
> +
>  N:	Marcin Bis <marcin@bis.org.pl>
>  F:	package/bluez5_utils/
>  F:	package/cc-tool/
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
