Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E0EC5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACC3040FEC;
	Fri, 31 Jul 2026 12:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-FQnl_pQjL4; Fri, 31 Jul 2026 12:05:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39D7340FC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499524;
	bh=Q+lqf9Cz6vjHR6W4jYnwn+XSpClyDoK2fQZXwR0a/gg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QJoiGXHEtQC6H0eSQIrkSdxrWfIzFHVCDbZYpikbGlEK9ScxY5TTrgcTvU+S9N2U2
	 Qe7OlumRpS7JPHo9Tbvu4C/HlcNaKpZHD0ZY7Vz9pv3H7ok/lukbQqB43gnJ5IQQP5
	 p9gTBOGSMM0UxqWdY25hFZBpbyzei6E70aQGjMbwlau1JoWCE7iQb3X/CZTymAxh+5
	 F6adgJg3FgUoWRm7+KmMmCScyt4Oh5OoHWxUxwYkzZqdaYvTPpfWnrq1l9+DaVb3J7
	 QwHzAd8ILwlXZ2n7JOutPzSB5pV3qW343T57NpxuWG7Tjz1T/xwqqhpCbrG2yHArIN
	 wcuQpTOdsFwdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39D7340FC2;
	Fri, 31 Jul 2026 12:05:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B8B4C27C
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA480812D8
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjhrHTdnKBRG for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49BB6812E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49BB6812E4
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49BB6812E4
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-472326ca506so630485f8f.2
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499519; x=1786104319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=723nTWgMYhtrF2PhGuGwxBP+us9RADMnnNIHtFT6TSY=;
 b=JMcZaXPnjkTz+iahEw1s2dXdXaJircg8uksD6CJ6Ea4bIXE0T7GLPm3/NGvyditUdI
 2rMDi8btrNYsZssxWavWdFxxTq2vrGtrh8vcrG4MtaJVW1ySneRxllL3brVWJ9PadWQd
 7eSvDvGdmmp+KSP4VdjRRHL3WPccOnDiR7nmbglhEAvnr2UStmJYSDc4iRrsIKgc3xxe
 2nApe3XgEXBGaCh7ZpP+j+PJKDjMRV6Se6YKBZ7O3rvWjv1aPnzCDogAHs0CvlCWQzQ5
 U/9D0Co8yMW5IUCQwYO/Fu/O40rKWRD4vYnRdNGYfThjf2BKIQALlyekc3Uuj5HA+MSj
 uofw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqxTbdsx7EcUYCASuTEuaEpUToXb5cSdtzCC5zJcV/zhrP19xnqEUs5tAGRPOdTHJUajQol3y52KDk=@buildroot.org
X-Gm-Message-State: AOJu0YyxkAUrTTX0auTC+DUMBuzFKOyWeYcxNhoTB0kvY5ycPTaNI4dZ
 W6RUBgQGV0XdD1KiJkc+RNDXZ6LjgwLcBUnPWS+198YZogazLUQdHU0P7iym+iagK2A=
X-Gm-Gg: AR+sD11qbjtLiJ4r9mNzDhqX/c/BbABv5mQSnHz35bg3a1LaY9wAKbBCS6l0HdXZsD2
 6pPz4dJpLy/3L3oAhO2tABmFjd9sSsDBkYr3PGXMNF+WaWrtdd04DcdoG4aBgPwcxig53c0+4v5
 oiaT4gBtQcb0AHh0WTkajgqxFWhDe/mkzw9g6e6dICwUy8XJNyYlM6dlUKa+kMCpT8CJIHa9eDG
 oScggY/671n6xFyeoGMsKrqRBQKToOibbuHXbC+bTFgYVU5DBS8Wcsmx1LiMX+Uh0+ghZRy9Pjj
 5pQUr2Wq25TtSDOwa39f42itUQ6leYTxAe6ZSevvbSy9bZTICMDKhY03zSocIl7uz8b7gwKvNU5
 FEbSSnqWYnV6thLCmtIAgNtCMsnAX1g96Ln+rb3x9E6wDksLOb0DTft3V2mcufaxF+qFAaoa2eG
 jNK9uUfPeE8OMngKnMwHioDtj9ciBcA+8bOFiewkVbuNRcS3mMo43dMITW5yllnGtaOg16h7mgJ
 +mkLEBdaVWbXqKNCjq4ONaLFA==
X-Received: by 2002:a5d:5f92:0:b0:47f:9aef:5515 with SMTP id
 ffacd0b85a97d-47fd2ac7c63mr4435832f8f.13.1785499519125; 
 Fri, 31 Jul 2026 05:05:19 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd458b05fsm4181890f8f.28.2026.07.31.05.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:18 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:17 +0200
Message-ID: <20260731120518.3539-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720170437.133823-1-fiona.klute@gmx.de>
References: <20260720170437.133823-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499519; x=1786104319; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=723nTWgMYhtrF2PhGuGwxBP+us9RADMnnNIHtFT6TSY=;
 b=Rc7uBuI5alMuGvYAmMHg7xZmqRBmMdEXtjjr5uj0TH1rkqLBIEwcm4bXZtVQLoUBZa
 C6ce46mP5SaUTWbyh5Ch0n7CfVowZ0j+FgmI1VGlr91Up3Ag9NBFgZaADQSfPYrb7VVh
 XB5EJ2sZbdNWImoZ3Rq3aGzCYyv6oRHys7gfnijGVabHqEpZIwVfPBVWNsKFkv9mc37X
 UGGeDWM5Avn/3ZTpakxypC0NMZudKQa2mtoqbad+GN+BttVyWc5nxienrmbtb2iOdcpS
 RtWsXmRiYUm4BJmqcAC4lYAi+JwygEhq3NLls73gVVkOPCqmC4BnGc8BiQE2Iu7zrH4W
 3awg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Rc7uBuI5
Subject: Re: [Buildroot] [PATCH 1/4] package/python-paho-mqtt: clarify
 license information
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
> package/python-paho-mqtt is dual-licensed, so licenses should be
> connected by "or". EDL v1.0 is a BSD-3-Clause license, as confirmed by
> the ESF [1] (see listed SPDX License Identifier), also confirmed as
> intended in the pyproject.toml file [2].
> 
> [1] https://www.eclipse.org/org/documents/edl-v10/
> [2] https://github.com/eclipse-paho/paho.mqtt.python/blob/af64a4365c6ac5a7a4d339e7b00f44df91353b35/pyproject.toml#L10-L12
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/python-paho-mqtt/python-paho-mqtt.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
> index 90ed8370f7..5e1d2fe32d 100644
> --- a/package/python-paho-mqtt/python-paho-mqtt.mk
> +++ b/package/python-paho-mqtt/python-paho-mqtt.mk
> @@ -6,7 +6,8 @@
>  
>  PYTHON_PAHO_MQTT_VERSION = 2.1.0
>  PYTHON_PAHO_MQTT_SITE = $(call github,eclipse,paho.mqtt.python,v$(PYTHON_PAHO_MQTT_VERSION))
> -PYTHON_PAHO_MQTT_LICENSE = EPL-2.0, EDLv1.0
> +# LICENSE.txt, EDLv1.0 is a BSD-3-Clause license
> +PYTHON_PAHO_MQTT_LICENSE = EPL-2.0 or BSD-3-Clause
>  PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
>  PYTHON_PAHO_MQTT_SETUP_TYPE = hatch
>  
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
