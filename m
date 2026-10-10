Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D64CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA7FE60DD2;
	Sat, 10 Oct 2026 09:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3mdcbVjmLhs; Sat, 10 Oct 2026 09:24:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CA70C60A46
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624288;
	b=STuTsh/DNsEXK+5dCB+Kh3gBC12HQcXN2p0oEH62mZKqLmP8gXHlrhyntTRB38FSX4y+
	 xVHW9j2JV23pkyeyljATPZwPi/HZ2zEP2JXntIdXhTu23OLWDzJ1osmwEyIaTwKNBT21v
	 Q7slho/NrB4W4qJvvii9uOeM25qBOeMp7jy2O+9/XwTK4+3wiPpuqDM6nHnXmSLJKTeLU
	 eS58DiIY05Qx0kBMKFjZzD+s4AZ2tpbUGpjHR2u+c+/fJydB3PPiRerV+7mrGPirdnL8v
	 ItmAvkU9speAKZaqAzE0kKh4Vee+J9s16XHcL7txmVg2vxLF/z52VqdzJLf8s76NXxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624288;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K4wI8l+zi0W3ssRT5qZH7DVW/+fOLC2LsKzko2ZuGkk=;
	b=Y9JZTPrcwm2fN0Lw6shzinHqZdL+AMvEeH8wY5n8dHzDrmxrf2hffVABTBAlofGd8wcL
	 ul5/uc2+h7FQawpMukirEeqVMoYhwz0O1fglWtlWBadSFn8jXwjdY6d5kkhEBeZsODmP6
	 reEwi1YEJKDjWA3S2+8p9PD4oPbyFKJ7qLEbbPLvDeHcUDD85EfpzRZylJZqyVI9nlE7q
	 Y8ewY56SbT66nweIU7WXDI5UDOwFncrQBPUQOVdtoJzPdIMWn5GVhqceoBi3sUhylECIo
	 UEIbnqhU0kgUFO4kK4tPOvljo5wSQ8puhQJ1F60OHRopC6kE4F6b5e+RTfMuXTCXc9g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624288;
	bh=K4wI8l+zi0W3ssRT5qZH7DVW/+fOLC2LsKzko2ZuGkk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d9t1pCK4+aqomtplxjHwMkm7yWF5TFcPPp4nK3Kyy1kH1aJNRCeYH5NbiCy6bv+hx
	 BqTUraYg35b3E3ZlHhdZNhxdeGUP/Qskb+CmO1oCcjHvfgKP4ggW0pTCtPEXqjJbwD
	 DOfxOdZpOE/QYv0dMbKwJ2fNKxjwyySo5jrDg1sloM1OhaUv92NW2pcMbdaJ9Wo1pV
	 mvCdLH+9bzTchb+7jafHd+AAncwI7NykIj+AQS39VGqVcTXHHyzf6ui+HBP1tM737c
	 98wi11r3qvSGfHZ2zxXqaGDrBc97jRc5WEgLmuX6nncm9axRPy2FxbHA92wSBaXfoN
	 R9AXX8KvCEM4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA70C60A46;
	Sat, 10 Oct 2026 09:24:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B12575
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7255400CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqNz9g49vU4g for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:24:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 95A38400AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624284;
 b=BjYRkvS6wnafEwSvUbUXYDLjhLUvwBBqqcRHLliv8xY6P6cXpvaxayFee79536rJId9N
 oasCL7lgYQdXdLgMPlfuWHp64rtfGucO2cInvsGV34txTPx5ioaGw7mNr17nr5100xNCG
 +xXuRmcuYEXct3GC4q5/eURttRI9lVUadfWUzZso3AUaThwLEDjdrQM0/E4g81TSQEO9q
 8zVTebhm64Gq9UW6cDBlm2VrBJvmGSQrkcjEcfU/q7J+EV/lYmUM4fJE3pug48PgH276A
 9lHXGo7hXANsgMpVoYJmPBimyruILw5HnRvsMQAFiNL3vSviYJBl9mwUCSUdmYlMRYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624284;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=bwwAWgiNBBQH0uTFPQl77cUYLLKp/j8OLga6nPFE7eY=;
 b=Ob0UxjEfZRQ15SRoHTmwHGDLlH7/ATbUcjSnYDhFuGdSMJi2pEsHUtNPg89JooPzz33+
 E5MXAGcpgJLOK2Dg8L2/If6MOQ7n/n8Z16+9bPmGqYR1APz0DVr2RuHlhj8zzOJ+jXgxN
 AnEQ8suarpZ3yeLSVzUcPOMOeAf8V1+oHGCXQeWMOsoZsgIkgE/ceJS3iFRqgB+M8cdNP
 gYBdOCQ01g8Usfl8waJk4WPL2ceBVgHaLH6LuKmXHgpvOWAwIn0XhCbruT8uNApoCkP8L
 OZ7thOdzzq+38aIYVM/W1qDW/RUohAleI0sR/t6MnSQdmW+eqQ2F6Ovfg5U0KFQ9qZg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RJyvbMe2; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95A38400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:43 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a168355946so844305e9.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624281; x=1792229081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bwwAWgiNBBQH0uTFPQl77cUYLLKp/j8OLga6nPFE7eY=;
 b=lWp3sX1hjU5w5Jv5XVIX6kYn0zBwoWN84zZ22LKJz5zZQXvhKU3jDr5gxPRhKQfBuO
 hK6E3ooQ78n1D3mnuwDzEHCQ8JxVCYiqgmdueSulULKDElk9S0Rtbf6EiGKrNmkZKrq0
 iFB1/tqM23LO4UE5SiaA/a9kPYHa5Dv7ctni0srTxv/Sm3NGAiKgBNPybu8M/EVib4sD
 PwgVpUusktcavFH7qzZ3g6vyjS2qmBt4zjS0/rOie5rcdnL/cTR6v7YIels2gH5kD42I
 dWKan8+JfBx9YTwnf6cLcdSIXvXvBJSNi7eQFaCEJQpC/zgaRrziX7GyouicQG0Tqfvq
 w20Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxXfgu+72g6Ov/MZHtJHCwoW1R5BgAiQaJc5K/vGwz5MXeLIjqI9l5OLcEtgaHWG89Z+AA0UufLBJ8=@buildroot.org
X-Gm-Message-State: AFq9FYKMAiheLzq/IInL4fWczH2SePg8zuOsy5LMzMUeOmyv4DntJueQ
 z6l3j6ws/Fgcw8vZv1l2xe8WgUdg2Qq0+sw46Z6nKaopPWh/PhCedRttoThfsVRT+lQ=
X-Gm-Gg: AYBFou0GWGu6NcCwJxIKhXSM71B/aGZnNqvZ+5kACmCE6rY2mo0LQQltfwacR6UP7rn
 ie9QTwYa94CaBRWGIlufty9MOuleXCIrYohnji2Dndbk0UwGu1n2PptFJDbl4hMzrgpCYB3y3W7
 jvofhOI1E99uW7uS/nlJKuBzp3al/MQtfQvSXnLZyMQvMITqiaSnhr0U1gm16gu/atjgcRUFsjH
 Ab/ksc++qF0ZZg9+etBPY0zHYtvu1mh9a0TUpjZoAwRZVpB6qdpt1ay7q4YbqS2Sr1MtbA2+I/O
 5Iab0i30Hoz2vnCu5G+9GPr1BX2O/ltEiBLgnXudWyDCfyqjwgqCBC3CWYYon6C/oNudNNJ0M8p
 qV1OgjI9TeGgTV16oeI6jfuxhawo/9jWTGGpmno8yzIlOwhUc9xVmlO7/n0KCo/mhUBjJHbtvpf
 2GAwseun366soM/grOkSwO21ROOS6L3ei6f3tb78dhC81VQ1eWSIxbOAagDZ5UnuQMf12GKu55F
 rfNebEPttB/ENn7KKlwl0AOcLzHApPMisoSK/X2kg38p1QjHYaNLauL
X-Received: by 2002:a05:600c:8b04:b0:4a0:1e37:ae41 with SMTP id
 5b1f17b1804b1-4a18e4d67edmr80386835e9.24.1791624281343; 
 Sat, 10 Oct 2026 02:24:41 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abd57fsm7828330f8f.37.2026.10.10.02.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:24:41 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:24:36 +0200
Message-ID: <20261010092436.140326-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003070128.1295458-96-bernd@kuhls.net>
References: <20261003070128.1295458-96-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 096/114] package/python-twisted: security
 bump version to 26.4.0
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
> https://github.com/twisted/twisted/blob/twisted-26.4.0/NEWS.rst
> 
> Fixes CVE-2026-42304.
> 
> Updated license hash due to copyright year bump:
> https://github.com/twisted/twisted/commit/ac504cc8088734e0bcb8c9b372d52534bf9252e9
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/python-twisted/python-twisted.hash | 6 +++---
>  package/python-twisted/python-twisted.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
> index f3cf53bcaa..beb1c7f3b5 100644
> --- a/package/python-twisted/python-twisted.hash
> +++ b/package/python-twisted/python-twisted.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/twisted/json
> -md5  845d6782c2236ef764f3849948f4bfad  twisted-25.5.0.tar.gz
> -sha256  1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316  twisted-25.5.0.tar.gz
> +md5  931ac3e39a52c490f85d36bcb4c77369  twisted-26.4.0.tar.gz
> +sha256  dbfd0fe1ee409d0243fdd7a6a6ff14f4948cec1fd78e0376291f805e1501fae9  twisted-26.4.0.tar.gz
>  # Locally computed sha256 checksums
> -sha256  16b7f6825ee8aaed193e7fcfaee67ab493087302c700483f8991f22b70c539e1  LICENSE
> +sha256  d7a2f74fe5c2b3f610052b75b5a131728c49823b28088893dacacf8d58849a4d  LICENSE
> diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
> index 8db5d3750c..09198d2afc 100644
> --- a/package/python-twisted/python-twisted.mk
> +++ b/package/python-twisted/python-twisted.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_TWISTED_VERSION = 25.5.0
> +PYTHON_TWISTED_VERSION = 26.4.0
>  PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
> -PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/13/0f/82716ed849bf7ea4984c21385597c949944f0f9b428b5710f79d0afc084d
> +PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/db/97/6e9beb1e78247ae6dc34114f27d538cf2cb183c4afcd3609dfdf2b0439c8
>  PYTHON_TWISTED_SETUP_TYPE = hatch
>  PYTHON_TWISTED_LICENSE = MIT
>  PYTHON_TWISTED_LICENSE_FILES = LICENSE
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
