Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC74CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38F6741D8D;
	Fri, 15 May 2026 17:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SyDM18F-YBH6; Fri, 15 May 2026 17:46:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 430A041DAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867209;
	bh=/yUL6pqkCpWMCJHqGCKIVPsWOdTtDkG+XqPkSHTLt6I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LDbluhXKtIAhe4sz60VQQlN890OkV5Y1PR/qxfqAaMx5l7lZjwRka3+vWWci0fPIB
	 pCYU/yohmNiYEd4r6fapPZXJSDsqi05G8y3r0LSUsLGqxqEQZVnP+PxOFq209/w9kT
	 qsyGgwGQmHlpV/ebi2FGSvYRFqyfw3Kt1Lry+USsyXScoxuZJeS3bVPRzGjWUXXfmn
	 LkFgAzCAf060AfRSjF+hG5loR4S/xsLWW1CpD0jgCepq9HYvFE7qqvLAs/Dm6pSIUF
	 Rx5K8Ab30EyEk8QjfwRx706fpFFaa0m6FDlJAiJM2yDXI/qrYNhwH6Mke8i+jjjhL1
	 /d0SpMo22musQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 430A041DAF;
	Fri, 15 May 2026 17:46:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF33723F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6A5684655
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xu_bwA5BxvTY for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BE248464E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BE248464E
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BE248464E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:40 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so756325e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867198; x=1779471998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qnaNSXSN6Wdxqzyipw07w3AwjmnABrW3miok1iXTq20=;
 b=pPHSfnW+3mDlchraTJRYIex9NZMGqHCCxnfPZEILzZe4sZ17BT8tHzoO7ZMU+RP2rH
 wlsWAAin63DizTlkTwGye/tNblJE15xBwkJKAukQshMm85D1GX3EffHzTLOfLRtZgUNX
 EzIUP5N4gD0T6DSglNt8iQMHoWP4qK2O9Ve64/+gi2m9pe/AaU1L/fQ8e9l+Ckq0osPg
 OYGMBe1toGwkCXutOd2ZcHF/PHl2LV4HvLLaf/Bak/aRRXIrj2hXFw1ORVWh3istcT/L
 I6a+BpdyaqqKLgxoKmD7Nmpgu4zFrTW+sChIP/h+dhQtmzlg5PkVYalb86JfqkCNaPnZ
 qr9A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+rExuJMFc5Lv+aGXsjOT8/wDEALWUux1nfv+Z1KXFcqYVFboRZXC+MhOSAQDWBAn2n4SfRRuguMyA=@buildroot.org
X-Gm-Message-State: AOJu0YyUyRIJ49rbMScE6C3oiQepybYgfhNAlwAeb3VRKgnV5RwMCd1C
 iSXyDb+tA2CDIa78X0DgePVCaABJ5ULr47hWdCXLUbp3mbcqr2qMn8xGNl7PuJaa5d4=
X-Gm-Gg: Acq92OFY/yY9AMHGcpjqtjMSL0syyQeJ2V9ZUOqOyt+vGs3s6rdv0B46u57LpAWYeft
 r21jxH6v4XXKXU1+scZpASWPSSlzgjiLGtteyCykSEPXkTLz/1twBqpUt4z6FtNE2PiUIIgqP9X
 rvCi+OHjWbA4XxUTtPC4yNG3u0P/8lXEbmhUiwBvjdDShEP3PCz1obaeTv8fPv9gQ5tvJ6ZEf+/
 MObwDJsJZLTydu5vU+alhcv5/CoH2FqMGN3wkh2ri8H0YK1P4n3/jCdWxNAwgy3CC3twdaqw6FC
 xtsOEGP/VVPIqedlJenlThBF/QUO5hubs5mX3dD6Gci78dbdm5SH99vM2CJ37pE4fObwC5vJmyU
 3vzUPaDUI76hB1gxxdplp2aJPwhMsY9DhlrFtwBaINSaffgqJ41sKv3M7mIsLiEA8GTWStE3/Zx
 BLaZCpd+rTlRevOBgBqSO01rk5mJXqMThAO0D6t9dvtnEn
X-Received: by 2002:a05:600c:848c:b0:488:9ed3:1492 with SMTP id
 5b1f17b1804b1-48fe60ecc19mr74753605e9.10.1778867198470; 
 Fri, 15 May 2026 10:46:38 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48feaf0fb46sm20220355e9.11.2026.05.15.10.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:38 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:37 +0200
Message-ID: <20260515174637.530255-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501002320.1761716-2-fiona.klute@gmx.de>
References: <20260501002320.1761716-2-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867198; x=1779471998; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qnaNSXSN6Wdxqzyipw07w3AwjmnABrW3miok1iXTq20=;
 b=C1KwIoX2wRUBDyZXV3UfYeXkL47DiXu4xhkJ21Lq1waVymmYdBl/O2Fvvo22t8GgFF
 aZQI3amRj4wM3XspA5eQQ9QScSLUXX+b5Wcqsi/oR+0WuznVK15Htr4PHJ3A6upnkwsZ
 XETECxLaUsXPNn3YmawlkwwnHBGObCmd4TgoOd1B3voMpR0c3kVKlUpljz2Evl7uo3YD
 WOsQjMbW3ocHEsHamBpJzUf7cv9eJg/VcpRGG/wKtYUVv1Km9o/AJMUVAcLsD2jBQ2K6
 PqqwrHK5NrJHnGh/8xadeSV3MO2V8RdomuJURR3W26d35kKOZGjQq6bCDvFRljL0xYGw
 8+jw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C1KwIoX2
Subject: Re: [Buildroot] [PATCH 2/3] package/watchdogd/S01watchdogd:
 immediately return if sending stop fails
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
> If sending the stop signal fails but the PID file exists the following
> shutdown wait turns into an endless loop. Avoid that and return the
> error immediately.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/watchdogd/S01watchdogd | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/watchdogd/S01watchdogd b/package/watchdogd/S01watchdogd
> index 8f811ac0fc..316787c2ff 100644
> --- a/package/watchdogd/S01watchdogd
> +++ b/package/watchdogd/S01watchdogd
> @@ -29,6 +29,7 @@ stop() {
>  		echo "OK"
>  	else
>  		echo "FAIL"
> +		return "$status"
>  	fi
>  	# watchdogd deletes its PID file on exit, wait for it to be gone
>  	while [ -f "$PIDFILE" ]; do
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
