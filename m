Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0FACA5FE0
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7129160B4B;
	Fri,  2 Oct 2026 10:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XmD-i4tB16CX; Fri,  2 Oct 2026 10:32:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7419060880
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937127;
	b=Fbch0etHU55GY2WTUJ6NP7kCdnfbB0mJu4ZOd8nOsrtpdsPMYOHxSYio7YalCz+PV9xZ
	 qJ6zGo5B1Tq6gm+6+wQHaa7ohaDJEFfddhIDnyghNnr7mWPltpGoyQsb9hacMAp/KR7mG
	 J201cmjXzjzEfvAiOhUwsDJ2RSlF6DrI3tEj24nbBYoV72g7021qnON3ubTLZmW7ZWTf5
	 txaKAcWF9OYsVoLzEY/CMfT/ah0964O/1Ir8ntexAmkpq/ZTTApU2hL6Slv3FXGQTRcRJ
	 xXq+vP3L8+3TxU5JTFqu/lamUxerVqLNgWi0COXb+umNm5G8ZDawj+jJPfvjQsLTIdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937127;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sEoJOoc5AAGvS6lmOuSSeL7A2UiuNoI1KpGeibkZwvU=;
	b=Xbcl+ojiFXa77OYOaNhP412B8pLGuvuFBoW95ZkoRC96RxCrY1DCG/AxElsg+KwJ5Utt
	 eCV4eYOOu2Veuo6PggR2yUBa9w1dOrKFxgHDkl7SHzoPvb8vuqPZ2UEz7+ALb0wmqQ/p/
	 TIkKVSf1CUMjb1ffzkOTIyCsR9oKNCf+kGpQRqFbcMHZmV0b6vh7/EFqnu9klxyEsgKp9
	 FrOiAChWSRGMukG5QqTLO00Qw/M2OLuqFfMYE6wLEBVOBtHllYFVXP12s0C52l8XdSNFo
	 bTI5ym/TkULqY4jp50nbpiVTB8LCpeNPOaHpQDnwfv3Z2tY91cEOp/P4xbIHjBRzweQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937127;
	bh=sEoJOoc5AAGvS6lmOuSSeL7A2UiuNoI1KpGeibkZwvU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SHB9sbSAcX51Ez/+RVEFZJmmu2bKkg/Y3UlM4CWWvl3Jp/ujdV3H96fCmRANgdOWf
	 kq3uPs0cn+I5F9C5tUuIwI+MXl8OjcCscvJ0AsBu35NBxn4q3XJhucTmlgDJoamXM1
	 h1oqpH82aYCOXFBRp/kmAwnx0R/3duzOutHjpuY4w3oM91k1yi9+YuoX7SpYu//VlL
	 4klNJvQeep9tSJPv7Hs3C6tT0+XX2dBwXw4bLCelLA31ciAkCOMgBmbMBUd3atEODF
	 Oghg0W3Qivri6wumbO5yiAuMZGnYnat/Zs6cKLU4KhPT0YkP1UNl/OGx+4/O5Y+vuj
	 SPQ1fg+kQh17g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7419060880;
	Fri,  2 Oct 2026 10:32:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45E6434D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37A4081202
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3mMa7FAzixlQ for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:32:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2899281205
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937124;
 b=b8k8vDlSU+ZvDZP3cg7srB9vgfQgntvBrYf+Y3d7Udw1i/Yp5+Vxie/9TEOxFe5883fu
 ooektUh5sqrwtMSe6YFH6JHJQXI0+rqzBGC/+1KQ/yaGBWOBjWU+4VYvj4x/U2ZbcS2vc
 5GtZNjN7kyHnI1SqdCvumA4gc+D8tJvLttllkTas99orprfdZQUM0MSM0AE2F8Htw/mpy
 qEZ5eKG82z5uvUDYUveVHfIp6eZ6EoWpWABWNUX330RH+yap39UArMJPBMavmOLH2tjHF
 n5VCBGtpxJNxx1wAPNGTFdrst51EWs3zrrhletLcPkDzMmRYslEiXswV3v7uOW6Iwbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937124;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=lsskJV2vc5Si4iDu2uCo1M9Sqy7/S0D6Nwf3YFw6gLY=;
 b=Us7r7BcuhKeQD7R5+MZZlO9u2rHHdUfrF65rSfMHfl1Ptdo0JB+XBZb6UFFhZLE7ia3s
 NUiKJpsUfGan+DaoQKX98TCcOwDYFIw3hMwoOroub04cynYLsPQHj1mRCHcvU9aYjgdRh
 AEYD1umJLDgKT24k9DAPVQQqB8oMocneicRuSZfP+WBAH5AxUiwxHAvi+dIbjhGA0VjpY
 BLpIQXsf+M7yMron5Oz5tldbTmQayMizkmdfaxgw4T8SKkxR5cr+7wSRs3LX108TSiOfG
 T/17kNGEzFKvR6AlGCRFsrww2n3aO0lsRcOw1J75oxCs591MU4ioTJGYIIqTc1fm5sw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ODhQKolq; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2899281205
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:03 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49fe8bf173aso39853665e9.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937121; x=1791541921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=lsskJV2vc5Si4iDu2uCo1M9Sqy7/S0D6Nwf3YFw6gLY=;
 b=qCGJ0ulDbz+i2qO59Gu2OpCooHa4f5C+gM6U8v9FzArzZKo8QiNTMC/uZCzQ3f5yns
 Vnu5+rvfAB0Jxnv3H5de3Fap+D/DdubB5FmabXe3vmpWAmTFMmnt5isBmKH99/PElbju
 EdodHBSwyDyuJcfv9hgDOQT39kc6N8u1umJYpRNGKMrkbHrGG+Wzw2zwEbtwJBj9+9G6
 6iVf5RDYv2HbSnOFKp8TRGeaTEH09CLVTeuLlQjsS84FsuURe2T28ZTyfjSphDP4rIg4
 7YmzImFiY0m7jSE+d2SbAwNLNiRKtLBgi5/G/qXmjm9Za+UP43KskTddMTaZ32BBv8Bd
 38Ew==
X-Gm-Message-State: AFuF++mJ1SqE1dNHbZUTyQzyZ6VYkfY60/slJ6S7yZ1ht8mxG4nuLb2X
 wXRqOLPIoyKp0AhjBbb0nL48lOT/hmSHeGMDvhPxXkJJ88tFnbucS6chLvNanK5oovhLdR2QNWH
 AA5qrros=
X-Gm-Gg: AYBFou38b2Kj+dt+tDJPO+KKbmaA+S5kJZlij5NcjWAtFRD08xttFJ3Z/KxcAqesMEl
 qvz6PhV1J+eGQovJsM4WukXaUTqOSUhGP48vMFyCXhSYQ6wPFV82EUexjVjRIG1h8QuHCEz/sze
 fj/D0BZF/KcFGX7uOuYtMkOfE1AjSO2sxX2BRfcDuSUVx6vUTb1pmb2ZESPa8aj5EwC2TCJOZsK
 q7KonpI5S7CEDnndQf9fyI9BfOrDphkFcOVhRC7t/90WjgfLntRfq4yLLBVaffJ8Hc9hdT1dEoO
 xM9ZRZ6QsPC1fbMXivtvQN/5+Np1DsOYjjBt89U1Si5K4WkAI7//J3uuYrLYAhgioelzxilXqJU
 yTkxouY/lnMHxMpPO4R9wFRBKfvyxrz1J+tkH1A1GI26VhulDUgd4MfRNJhAuqikpkP8g0jDZrm
 IKMRpFkMT5ArQd7IBc8MTK4eaksuSRG6bfMpN3OjD1BNW1siySA10w6M2swNeFA9WxlVpB11MSd
 nMZu+uwvT+WTttHlCeQcLWUbwMhA/aRT9vNsH9t/df089WLMZm1
X-Received: by 2002:a05:600c:4e93:b0:49f:cbf3:551c with SMTP id
 5b1f17b1804b1-4a02756efa5mr43588335e9.12.1790937121424; 
 Fri, 02 Oct 2026 03:32:01 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a03ff20831sm37537565e9.4.2026.10.02.03.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:32:01 -0700 (PDT)
To: buildroot@buildroot.org,
	Joachim Wiberg <troglobit@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:29:40 +0200
Message-ID: <20261002102941.75924-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260920200450.15964-2-troglobit@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/mrouted: fix invalid daemon
 path in S41mrouted
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> S41mrouted hard-coded /sbin/mrouted, but mrouted has always installed
> to /usr/sbin/mrouted. This went unnoticed with BR2_ROOTFS_MERGED_USR=y,
> but the daemon fails to start without it.
> 
> Also drop the script's executable bit to match other sysv init
> scripts that do not set it.
> 
> Introduced in c25115daf2b2761a2f0f411790c6d24b460c7999
> (package/mrouted: add sysv init script).
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/mrouted/S41mrouted | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  mode change 100755 => 100644 package/mrouted/S41mrouted
> 
> diff --git a/package/mrouted/S41mrouted b/package/mrouted/S41mrouted
> old mode 100755
> new mode 100644
> index 7dca258255..d653425719
> --- a/package/mrouted/S41mrouted
> +++ b/package/mrouted/S41mrouted
> @@ -11,7 +11,7 @@ MROUTED_ARGS="-w 30"
>  start() {
>  	printf 'Starting %s: ' "$DAEMON"
>  	# shellcheck disable=SC2086 # we need the word splitting
> -	start-stop-daemon -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
> +	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
>  		-- $MROUTED_ARGS
>  	status=$?
>  	if [ "$status" -eq 0 ]; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
