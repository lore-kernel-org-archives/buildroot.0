Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C4CC43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D03060F34;
	Fri, 26 Jun 2026 14:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-o2Af9S7yPa; Fri, 26 Jun 2026 14:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 767986100B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485765;
	bh=yO0LWHqO/Iw80PLr9JVFRmVvsaMMe2To36Q1nw8oHug=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LITh1abaDXnGi1IiFrN07IXWOc0oLHcmtGcB2DfPTF0QepCcFHsVVRMHuHU+u9CxA
	 tfK9KZnlb0jX2RxTuSmKUoCm+WY/pG+t5895vVrkQGY8P+K5PBwlo0hw1mEyTpvToJ
	 BYy7+pdmr+jPLfTEQLtMtjhDhp7TW7vyvpxOqT/GHgUj5jm0ZzBTQ/rZf7q68zG3Bx
	 hMDsjECSoOIeLbATDzmoJZeTfQK2h2sTbf2DrV8V4UBAoBvOpAWGkLW0yu55Uv6UYk
	 9gQ2sckCMwttEynSq4GemVUrdFN9sNrFKRSFTSUaNdWb89dB8U9itgKKzsH8yPnMaM
	 rj3lsfLt2wGqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 767986100B;
	Fri, 26 Jun 2026 14:56:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2228E231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 082C74070B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KoP38jHMU6Ym for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 479BB40702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 479BB40702
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 479BB40702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:01 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-46def4bd5e8so963876f8f.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485759; x=1783090559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Mboz8RKu1zfm54QekJbxJcfO4cJ6I5AlLELf/s+hArU=;
 b=hMiG2crIxG+z/TTp09TpcqRggi18K7CF4Qb/lpS3XMq8LL4IoLtUY5kDdT35fBaG6V
 xaSSV8j7KVbKClANeWcrPFIheD50VDXm/uPk9YS24cN215ymFTw4REi1v8561JnGrd7M
 za9zMGcv8+6oTQFJ+zRy6OpFPSvpIiXgLVmvUw5LQWt0t0o+Ff/jMgMVFJTJO0bwGSNZ
 xCaVZByO5KyvK45DcOQ4t9aJr0MNvmsN7MTfLkwzUhV77EBVVzO5aHrRfm6AMm10A5RA
 R194g4KtvRSKQrWWbPmt0dU6LRjkGfW3GWtD3CmXCW/hZjWRIPVrZHCCO39QQZ6iE/ji
 Q2CA==
X-Forwarded-Encrypted: i=1;
 AFNElJ88P5DqeoNwiXrci6eNQ3h6OcUjpGpvtx7QwsP75jRYlzkOCA9/ATuRX9I9ooh46rUjRy1ZnWH9Kbg=@buildroot.org
X-Gm-Message-State: AOJu0Yy0IYuR1rWSiKFY+SjBwLL9Rpye08tGFU5UhpzpWbrC40+7WgSc
 RDofrH+SBz+KIWgK+LUn1me49gzbViKsGBWLgX5QGoGTX6q6iDTyU/pztCRsq/L8d+E=
X-Gm-Gg: AfdE7cn9dLRgBWjNUdVKIl0VY0BQ/CGCLtEddYgi+k8f8ESY/0H3q6iRcSo3QiSydL9
 28dWgH0MINV4x1vV5jiKqqOl+jS4gr+joT8V7LfYmOHhK3HriYM7WxO1+Mt9l2vukTG2zfYQ8EG
 VGYsM9b/YAkUjwv5FT5bfLSqDE956mX8SzicIGIjf0fUdMi5TO2wMS3bm72kp3DMd4FH+sqBCrk
 tVJavYyGXFgJOsFPJmtU5A1TBsFzKixdUvVjsDBiVZpWqSba/ffCXfcNCzh8MU9izc7idVSSipr
 X4tsjevZ6kNvRSkUx8tSaKCLIUQgFq8oQoOVsfmTap+pmx4Om2ufJf95IuXwKZKl9JK77qm+IcT
 7g4nePrmPPpRBkHvGu0zgyjTdeRoWvRumbxojRcOYGQ6a6BZi/x7ReGe3hzDZKcImjX01LpfvJR
 BwzZFS
X-Received: by 2002:a05:600c:3495:b0:490:acb8:1490 with SMTP id
 5b1f17b1804b1-4926686b45bmr99537535e9.4.1782485759155; 
 Fri, 26 Jun 2026 07:55:59 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46cf775a4f0sm19063213f8f.17.2026.06.26.07.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:55:58 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:55:58 +0200
Message-ID: <20260626145558.343426-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606182032.3803327-3-fiona.klute@gmx.de>
References: <20260606182032.3803327-3-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485759; x=1783090559; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mboz8RKu1zfm54QekJbxJcfO4cJ6I5AlLELf/s+hArU=;
 b=UlBNJfRfXDwCcDnMuIFYDAJIFaDzxK7NgzDHvILecFTm710lGAeKmxMW7rSmnSs7pW
 +sO++nP2DPbEZpPBF7opipWX+r5FLDLD0OwEMBhCeR2BXbVPlEsxWHP4b08/hboac2Ec
 4EcRaB3+A8K0qghwg1VcIEdqd0krC3S6OjgwHCCf0LM0zsVbu6YsRDpl3hU/MX6AMfAz
 vl1vQSkQrT9NZwynPbQB8VAsGWj7nnTbRRJch+taP6kR4NimBfWBBsmwq2DZLKmitRaC
 NEbdPr+7/qTSWEHBmFIDRf0sI6A/ZdmSrFLBfBs/hks9JT/Yz28GjYO2llOcEjgwyAyg
 KvrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UlBNJfRf
Subject: Re: [Buildroot] [PATCH 2/4] package/mpd/S95mpd: do not wait for
 exit if sending stop failed
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
> If sending the stop signal failed for whatever reason, waiting for an
> existing PID file to disappear is likely to block indefinitely.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/mpd/S95mpd | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mpd/S95mpd b/package/mpd/S95mpd
> index e33654a501..485747e96e 100644
> --- a/package/mpd/S95mpd
> +++ b/package/mpd/S95mpd
> @@ -31,6 +31,7 @@ stop() {
>  		echo "OK"
>  	else
>  		echo "FAIL"
> +		return "$status"
>  	fi
>  	# $DAEMON deletes its PID file on exit, wait for it to be gone
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
