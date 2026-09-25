Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637FBC9830E
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 13:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26C7960D78;
	Fri, 25 Sep 2026 13:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nc9kT1cwlx1c; Fri, 25 Sep 2026 13:23:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 530F560BED
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790342598;
	b=gDXb8AmWaNrJucB0TH0tOqJ0olbKPK97q29d6/qOolu7C6KARyLSzIEOlIQnfhe59eMc
	 LOG181dYJCbv+DUCuH9mZ6L1581xtZPsjsAGVEf8MAXrTw18BRjX11SG4zi7ExAu+aTjJ
	 fkFC1DkYjSHdghDU+vsubvh2KSw+hQO0vkfD6CYhktZaVTMikaZoBoiMaVytCelzmI9JE
	 jSpCHnpABWuQwyqDpnAa9gQbaaRd1z0uBYAjSUMQGGoaoMk3B1xGeuRBhfhhIsih+hUt6
	 7UUjwkWvBfUhWH5yTV7QBOXvVYLB82B/ihYjRQFbA5U/exiuoR/JUVfBIjNMx6R2fkg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790342598;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DbUjvcjfcerD+KyTMOg7zCltOu/eCELobZtQ3OzgiRM=;
	b=hLCHs/H8GIVwWju6M6GOF53leVI3Ad5uDLcZv4iKdvEvdIVQ/6jqMUQ2Rjy7c8jtsbeY
	 bqTsbmToBuAwxaJD2ifjN0rPWDIiD2NLNACCWA65cBZYZNB2Nf9jmCIMwWoKgVLBhBEKT
	 srJVyilrVb0XHsTixI3Kkr6x3BLzYw17jpum9ems5TWSVG34fQlIM0FN6N92dqicqxAPH
	 orrt6e5aqif2nsGGGZZLjmvJs2u+987uQj2JJuLrg9M97mipdiNfECHkmr6jdDsBbkpso
	 HeyyBxemFAasLRK0OpYCgMaQ6vW9epJ+t0Z319xei/mBiAZzfMta1pGXuq+yhl9RABg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790342598;
	bh=DbUjvcjfcerD+KyTMOg7zCltOu/eCELobZtQ3OzgiRM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PlUbTZGaW0x04WvH64jyCa96tpz2p8sgRz+PYD6Q5OnBRLKMQsK742L+DSfQ4/6Nr
	 fXrg7xFCtdN1K19vsZnN0VwG1DQnIyw42XS+hB4JT0X6782x2ODj6xMkFQa9+sYs+3
	 TdSmm/qVv07+vCy/RocnqbZubvkz4ZmxB+Lnwf8+SQ84EkTejlDDQ1lCZOQQDA0mJH
	 Z2BrczwDQHb3fnEmaXUP+5LVoJ2SQaKj/gBLtJoCWeZt2vQfy1IEwSLhN43EJxf/gU
	 prU8alK89KErpwpZLRUJTWVom3McRbtlYDYfCxntBDO1Mt9Eb/PEOPhljJwLoxBF4v
	 0W1pMqOSmXSWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 530F560BED;
	Fri, 25 Sep 2026 13:23:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4757232F
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 13:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3921540098
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 13:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veVfPUYsf-9l for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 13:23:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5C8D340042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790342595;
 b=Ae43ZWKvyjRDuj8URIt4/f3cH8PhBiyAi2eyUqJAO1SHS/mZH1oOA2TcrJa9qsVv9ABm
 hn8LweVLsqhfBquYjci9o2jMr7rNUq66wSlR+9zdG8pTxMuTgLidPsSjNLigH2X2l/7WP
 Jy54CMsRvTfBVi2YYLuYXN4l0Tu+v4R0IXVhvl6aClqJvo6nP35h/A0FYd8mzQR9kZShE
 Dhko6e4BO0a/09T5R43qtCIMOalPlhFgdf2M2bVXuR0VQ8t9nZvnfkedezakQV0ZzITlp
 dlrSM3BWM7mQAVlQ19Xv3fpo8fnO83cyq8275XUVBJhNA7InTr6FjdgXq+xKGFaFEnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790342595;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=wLjsBhgMRw/zWhcmsHufZCWl2gpg12Gy5k9BKzuwQ10=;
 b=W29b9tUJXAzJSnIpDQEPWxzo0VVvAOMlzrmO4Tr4KXuG+wTZZjtro1dxUPuITWjGwRY0
 f/QtG/RoJ9MwZXxRldbz39xGrd4ofvU4D5DUVpzN7u2MdioamfLJRPgBbO7dWjswM+dVR
 gMw3K4sX5ENb53aOp9B7P8JLlsmJqavdi4TH76XpHPvMNT9uvwzVTWyyZ8N4OgO9Zh5+R
 gqPNpV3cgm7u2ECj7M7alilKnjtn4Q9A8geEno6Oqo5emoML+a3DafzTbjCeY+eRnMeDX
 nBifh+92DUPVDCwiGq/eHdpJYK4u9vNVxJXwBTuxUvFgWZY69/EMcR1UxPqMVPhpwpA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=K4qcn7tZ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C8D340042
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 13:23:12 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48870973bddso347028f8f.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790342590; x=1790947390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wLjsBhgMRw/zWhcmsHufZCWl2gpg12Gy5k9BKzuwQ10=;
 b=iIo8uEOlDTjmKjMqFrtYrRS4JkhNL4Gx2QvdmpyY10vRrgW+PRhZdi4OmDiCmDqgO9
 hQAQo1ZB+6P1ygnqeNYY75WIWqUFIQPpTGuPTciMHAoJOV5qu/K9kcmgpgOFuJL+oTQQ
 44/dvE6nIW3HHLk3tvcOVzuV5cGlKTN38P9a8EyPrAa8gRPf5qE1xcqU2/Km5mDF3kRT
 KLSQKmW5+LGyV1Y/1BnThLkyKGW1PNuWJLSig/1Ha2WNFX2h5/sYpuMu7wqc8ZYUYo6f
 T2Mp4QX8SwZNxsjAa+84eKRK+7GX0KGgivkOPasoLCSL76DaQKKxmCBRQweFDw06GrnW
 6nCA==
X-Gm-Message-State: AFuF++krhBOn63PR/0xN1Cm7u8a6/sU/YgmyfkR/O5vfbOGsRV3WOh63
 hjdrC4skCIxR/xUZ8wn7wNmXsvNJplIocY/mv4DCd3NqUJgCfOfvc0iJ4JHRjr7KotH9RqKRK3u
 NcrbOPLKnTg==
X-Gm-Gg: AYBFou1Z9lwho2IZcAnqQMMXslgst70fhcuccCwUfe/SwaBPbqPkrAmJnu0L/pz+SJG
 PFrjyCPiHOehsBBE2ZQJKCIB7vSM6DdiiXMX9BeNIBpC4sXV2/zyy192QHL2HZ6yR0I5F3ZLads
 SGKjBytHLmdrGFwUblekWv/ZDnDx5W1vkwnltR3bGGtL8C6g1fSb2YMP9mK96eGzLMGtXhvXYqh
 QKexaP6mCXyoPJTgtxPSJw8FrrKLJgRoytdUtGium9xz9Y4PWh7qDOno7z9ITEA4NXDa9oaQM8h
 fz1Po64o2llCb+Gh+9YBVnq10jc9Ip2tqORgceFuQpdBXfcs6x6YkbBWT4fHr/JQUkNjyHW1Goz
 24PHRVTYUViHdWtBdyr4LTV1DqLCuBnnBDlQUSq+XtMaBYkmAZfafOyDQe9B9Wat1c9h5aYzWVE
 kFmVIn8Ycoy3LW71MCblVlR9d9bFwgyNZHiZjVt+RV0kXv46twPFZ8wLjS1TDvzk1ziyR67pg2f
 5GW2qEf+glARNxVF4YYNsheHkOO4JU5qKl/4mcoEFw9BnA6uWqT
X-Received: by 2002:a05:6000:4b0d:b0:487:3c8:9675 with SMTP id
 ffacd0b85a97d-488716aef48mr11425400f8f.8.1790342590305; 
 Fri, 25 Sep 2026 06:23:10 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a6450a3sm6494040f8f.25.2026.09.25.06.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 06:23:08 -0700 (PDT)
To: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 15:22:47 +0200
Message-ID: <20260925132249.4002368-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260104220221.39077-1-giulio.benetti@benettiengineering.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: fix build
 failure with powerpc
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
> Not all Linux defconfigs have CONFIG_INET enabled and this results in:
>   LD [M]  88XXau.o
>   MODPOST Module.symvers
> ERROR: modpost: "register_inetaddr_notifier" [88XXau.ko] undefined!
> ERROR: modpost: "unregister_inetaddr_notifier" [88XXau.ko] undefined!
> 
> So let's add CONFIG_INET to LINUX_CONFIG_FIXUPS.
> 
> Fixes:
> https://autobuild.buildroot.org/results/6b4f17518e049a91a36be74c78cb8cde89b73bb3/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> index 1308508e00..7981a382b1 100644
> --- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> +++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> @@ -25,6 +25,7 @@ RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
>  
>  define RTL8812AU_AIRCRACK_NG_LINUX_CONFIG_FIXUPS
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
