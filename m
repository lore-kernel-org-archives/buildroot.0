Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377CFCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E55D760AEE;
	Sat, 10 Oct 2026 09:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRF6wwUnMzAf; Sat, 10 Oct 2026 09:23:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C58BC60AEF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624207;
	b=MCDe+Yl6wjDeLwkerYtq2EGRkayMnjq9EY3kpsir/vq/xCFx3TKg6tBnGBvSVXM49z/y
	 m5f+XJGaQb3nQZYLTTKvY8DXPBiMqMxKSLn+QSZPEx28u4/NJO2o8QiGSuf9sfJ64CFFO
	 9TcwFuy4I8pBISzKI9whAtAgwvexOL4/BvpA5BhuQQHZm0UmQwM3motF4JTICCBCCqQPC
	 as1RcJqk2nIx1JNI5dV3FjPpzDJimxfYxWk1j0Q4G14c8953WkBYfb2MscnhwD+mvr/8R
	 +XABN4o+C92SmcvRTUb2yb0JrqBoLqgYU05wjDtL+oz5olX8Y5T9wREwsWeZbcj0KyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624207;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xG5lwxcqErBMg2lpyPetiBcg/dnsSz31uqNq3RikfLE=;
	b=gQ4LNlhOR7aNV6a4lmWlHPB5/5mIDeoElIMuMpJemaBZvNtBxB1MDlOboQCHAaGUYXew
	 SoQK0xZdbSbOsJSOQ4gUpaUqw3EXEYD3smf61h+prMqOOBvo5WRQ5QJYX5Nb9HahhR5ju
	 lYsFxl3KK3fGdA1z/98E7ymo5We4YkWBo23tR7FySrmEY04KxBspZ2olBVfiugOtQBqu9
	 jyxzBNEZtGiiRq678V1TG2DgOzCJQjoF2FIRxN6ooItEe1dzFO9t4KHCXLt3VaQre/CJK
	 V1jkTlCy/EdLknbOuDL3vyMoNhXDj9QlGTQzBKCyitAA/JPeK3TCD/GHLOFmLW8gw+Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624206;
	bh=xG5lwxcqErBMg2lpyPetiBcg/dnsSz31uqNq3RikfLE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OM+oN1wz0TwvtqX2EVFtc+DCS00HgShYe9aIrRLact55n+zR6W842pc3IfoRYzmvc
	 C4KDTo9yGcdINRcOaO1ZeYUEU08HQKOLPdkOfWUN74ZOKwKmMs5r+xYjmlt/5homzg
	 frjBvdPNATIq88vGJZdsOOV78gQJZXwyXylfaN+l1tbfFF47zVR5a/CgMXXp1nAiW3
	 pAnAVcBs30wmMTOLZCbwIIjcSHxkCkF+XWb7JNL060jEvYfYbn0jlLVLC1h7AqyjqI
	 vaaG7sd6LqAcyI60l6k0nxFzkMnKeic4VkrI7EIgrYgL3ho1cYuGhZAQ7No9FtJfQN
	 rUhxwGwOMg7KQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C58BC60AEF;
	Sat, 10 Oct 2026 09:23:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CBA4356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A8E281257
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGf_VWf9XxPM for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:23:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E63BD811DA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624203;
 b=PSEJA7KsUfWUABhqsJmJa0AsGQAxzqaJ6OElmB1KjbFH82G3Pevea7UkGbM1u7R7zHHj
 grTs8bvtReSOvOFDW2HooBjDnllgrF3ae8RhHitOM+KbjfDOC6g00tRtBo9U7wB7NBPRz
 dfxl+RoKMbMWWJQH+ZCIy36GU7fypr0Y2w3c00IyxE01bBpzEY7vayi7tzajASrls0KqB
 1+vtSrVZ1H0+CzZAvOkv/HZ4dJ+i2vXP42BeTgKYCS1ECk+Gt7GltIY5BoB8fY/vp3t27
 /mhiwK3LpuUc0OMxgRi0RxtY2VXWJ4PkNjEo3qZts9YuV5LMW5uzugO9EDA0v3M2Bgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624203;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=QZiv5K2Rn8No2emiFEPGXkfN1U7EVPolySY6oCqFYrs=;
 b=Pr6ukg/BzTYqOpDtPSjeY4wzz7gWpF5rA2F9gJb5DoWK3AsTjHL/O0HFUz1RKVg437z/
 tYyYGyONAElzWwvrhvSaTaPhga9lR4fAHL+yLFUVPkGYi4aT631OBs/BhJH0SzAuDr70T
 ipCiv2uhUw/4LbS9Z6WlLglTUeDEmVWrfdym9D/2znurkUipsTp5LNYQreCQsXBUHLl4h
 /Zf4+8ZBCnpAZj8B5EgnNgTZkP/uCT+Pz5rekDp0kdDciFxaQ+27m+jZfEek1rlo31D20
 de2M+Qd2AISBmJ0Ig2UpbhiLnzbhb25YQUZMCFFHnCJzHH0a/ElpqR6rD8PSJCK7WMg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZqujXXKz; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E63BD811DA
 for <buildroot@busybox.net>; Sat, 10 Oct 2026 09:23:21 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso4595585e9.2
 for <buildroot@busybox.net>; Sat, 10 Oct 2026 02:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624200; x=1792229000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QZiv5K2Rn8No2emiFEPGXkfN1U7EVPolySY6oCqFYrs=;
 b=G1taOOcpnND7eSG0yqmh5m4rs6PdwTZwr8fZ6TbwQGW5LVnkFgv2srWj/8VWXJy6Pw
 8oIM/xqE405dIrkhTTB8bKukN77KT+Uz4ts/CGp4QK25/Muzj+BVNWtBpuNbQ3C0qxDR
 vhRF65pKrwe/Gs64wZvpJ5MyoD4XaOnUMgwfI/LLvWUJMyVvrQB7014M+jHMvZ9hj4yB
 RU7aHuYu+n1eA20EgZKTADoyV6mrVSIJ/+h1WF102ZbliYSuDe0B+PeviWq3CDkGCRyl
 HvVF84ge3K6nUK2GAq4nkp8nh7SSK1CCA4hC5buZ5nRNbmcI9iB1f+bADPow73bsqSDR
 5UTg==
X-Forwarded-Encrypted: i=1;
 AKwUvBygTE11teKcz9aFbXjAt9vo0YuS7CmYju7EV4Pl5OkibgSYuJDl74kWDgf7dN1b9heZOv0UsZVo+mQ=@busybox.net
X-Gm-Message-State: AFq9FYI7DptMiSeqV3JMQcXvOjj9vWrJ/YH4ALh7NX/upES5pOPUP/v2
 ky0p9fc4gAAlHM5xg6dJQ1wo8saIaWeulD3wUKzjTycfx76uaaIn+z4z2D6NZfBALYw=
X-Gm-Gg: AYBFou1ghCjrKNyQgJsKNWLqIkqzM6YT9RttguaBQVpDcrSjCcufjRHdaGHcxvSFi2m
 /mc9Z0vaVNRs9qGZTwBi4Oy2YcoxYxQIaTsqalrl13MINf7t9Xyf0ovltz3NnHl92A42SIAqAWs
 WAawPeQjnq/PF3RKknpfOfpiK5H9yabwxFBgnFsj+t1TC6v9hlIpZvs7J32mkQ21H/kibcS312h
 9hDspJSnydWo9iwwwNzldrbAqgMQKinrzwdZUNmCGyFN9+gIfjnMq4Vrc8TfFX65KNA95FrI7sk
 SMdzXAxwn3BvGhpnSZHHxB2F27KukC+6XnCV9tNdWpbNxHKsn5Oc1H0iUk/EFadr9FbNGzNSWWh
 PDdTZ4CYcpZSpyD05a57hUi5nm0iTBhlUSujOVrFGrsBIHOBA6J+llHPhNl/UqrrMIh/gJu4WES
 d35/W8DVAcn1EWhXI/jpm3MajuZCAoY2xiWT2zHA0vsXQ8VC5VG+en9/ZCc6NyRoMSOc1K7dKj4
 w1hOG/jKE/l8wvA5do2Ev6MxF44cEktPVkBUr3ZUaOjqOBt6qsB3bul
X-Received: by 2002:a05:600c:4e43:b0:4a0:1f90:594b with SMTP id
 5b1f17b1804b1-4a18e4b67e1mr70940905e9.22.1791624199415; 
 Sat, 10 Oct 2026 02:23:19 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bea0f1csm186221865e9.9.2026.10.10.02.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:18 -0700 (PDT)
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@busybox.net
Date: Sat, 10 Oct 2026 11:23:18 +0200
Message-ID: <20261010092318.139447-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928130756.24498-1-francois.perrad.86@gmail.com>
References: <20260928130756.24498-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/wireshark: fix support for lua
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
> since 4.4.0, support for Lua 5.3 and 5.4 has been added,
> and support for Lua 5.1 and 5.2 has been removed.
> see https://www.wireshark.org/docs/relnotes/wireshark-4.4.0.html
> 
> Fixes: 49fa20e6678ee32e4b26979f5cb4d149876fbedd ("package/wireshark: bump to latest upstream stable v4.4.9")
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/wireshark/wireshark.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index c500a4933..ecf9429a5 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -109,8 +109,7 @@ else
>  WIRESHARK_CONF_OPTS += -DENABLE_LIBXML2=OFF
>  endif
>  
> -# no support for lua53 yet
> -ifeq ($(BR2_PACKAGE_LUA_5_1),y)
> +ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
>  WIRESHARK_CONF_OPTS += -DENABLE_LUA=ON
>  WIRESHARK_DEPENDENCIES += lua
>  else
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
