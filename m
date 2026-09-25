Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7F5C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31A3260650;
	Fri, 25 Sep 2026 14:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rE-gVRlvHzSI; Fri, 25 Sep 2026 14:47:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5242A60E74
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347636;
	b=e70/bLf0FycCM1fnz/2EcnaY28q0Syu5NUBVxLBC8woBLXjxNOpRw7UW+mMY4BXIPuCl
	 hwTb1G2Lp9V9fxM9FKql84No1FkKI3Tldevel5jQdZo/dIAdtkTZ54d+sZgtMDG7DxR2t
	 niix+ZJwPO+qlBKEnIAsRhzfGfTrfInM2GyNVcKUqE8OdIxTmlKkqi9tqIQ0qdI+iF8Av
	 fZC1Tek9HeoU3+QcTBDd4HhanplLr2HDskWgaDlKXzRgPmmGmEGM3SRPdwyo21+Zfj9Gk
	 X7+Av0vskhkeVN3Azs4ZouDgje6275FBfwejwrJQ7kNYA3IAG/Qs6hTdYCaSTdwi4Gg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347636;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5gZdqzDkQbEadRa5iw9GreOOLc1Vx2uWHb193McC/vI=;
	b=fWtN94e2iHcl5R6G0VFaFHXLxGbB5zjocMBjOjpZY5gJVmtE2c5vREJiqiENs0sAfyZj
	 6sb9B5Xezg+w0hrqQlwZ7uGdPF/QjbOmWpTSkRr5XlXMRBNkIvVY27WLD+3UfjlPntVQ/
	 aqY2Nn6QfJHktMmXMv0TdS2M4+DzXNWKbOferaNaKgCr9pRrsltT3s4vCFEsZBhMl8bGr
	 tmSJlOzNLSwgWolhyt17bSX+GCRdR+lHvPMjfDchy8YL01DTwi/6aCZEogU1NIB/XvIzx
	 sVqkyUQ5PvqstSNd1kPFvLds5yTUjwhA4vf7y8iS+C7TjLZRk0TofnWey8S6JXk87BQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347636;
	bh=5gZdqzDkQbEadRa5iw9GreOOLc1Vx2uWHb193McC/vI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CVZLaaKg/Zn4ymvT551X5iyLkDgGn8FrPkVidsId9tfciyrZhg6H5pr9jNXlW4fYS
	 lcN0XZ0K3kAlmUjUjhtiCwr8Umu4OwaB908cuS6zOT4WMy9yfP040jNNae+t0lvrvI
	 DueaU3NK3Sq13HWa+6B/nMK8G8ZVbq9bar/uBInRuwkA7WnKXCc8SIbEXFjR5Qg/W0
	 p9lvmPUpbcLh/9br031ww960PlIjBCWBn9JwcyDkqgOM3Ubv0UzJR5AIU08nEijxjs
	 xsbEvvI/bFxk1IcobrlqzSo5VVlUydKK76D3FfMw2dFBZBnhtyBXGw6qnd0HhQ/3rS
	 7/cV9Cj+ThIGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5242A60E74;
	Fri, 25 Sep 2026 14:47:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39F1B332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BD6240181
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70duhWesAl_f for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:47:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2AFF04016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347632;
 b=fKsS+SPePQ/y+bEag9WkvEBmOvnr1R3cnbrkdthdAPkz/8XPQgWDY2zx1MmdmjpvQbUK
 3satjeiOGDP56evgMaZBC4yV36uQ3LFHBGcIFobeM7FMBdmNVnMRaVVGYz2mFR9aeVqTg
 bKO6u9zaCZEq3FWafBL25QE1AqqyPGMwj/IdTFyTE1SCNDVxnwgMPgoaJNByuuFxkHTcL
 yA127r48cN2ahb/RZAuLkgE8BwD+7hj9Gi1pqTFuvdqayJmQzul5/JpfNpTonhvcXXB18
 3YlpQ+mhvWyaTbAmpDJIxndvZ2WyBpgD4rViUtoxzSMLp6/VKAJeQKBHU4x1V0P60UQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347632;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=LbusucfAhCodwd/ifUZy+DiL8/+EIsnFWzo1qJVYMm8=;
 b=ivnhZdENfrQYG10AMNZOQY62CnKVt/E86p1/qieVluO0cO1yx7FtLu68OpNl65TqsYj4
 mvZCD2Q5cp91/kxqljfQ4pMp7CB76hX/Imh3+wAqu1IAh5c6tBB0oGNvFIIUAnVFDFyFk
 ZOrB8j6qIVeQTeHAIf+1Q7PmdKfrKE7qRe3ONMsYltjaxu0SEQhrTAmZC85G8R4ERwX4o
 OubC2p2GJ8D6civ/IwB1n1DDIwLJ14OSh/l4HHzPj4+9kHvwFwSuXbc5a/hidY5JcduQj
 eofM7OXb+9Akg49uMi6KkCaT2/NSkGkO/DcCAAJUc7jYTmROAyZSbTh+3xr6mg3+1SQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bJ+R7upr; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AFF04016B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:47:12 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e69b9e16aso10659485e9.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347630; x=1790952430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LbusucfAhCodwd/ifUZy+DiL8/+EIsnFWzo1qJVYMm8=;
 b=QqIYujBPSQqEQZG0dYbXX2F+kkD39mNamvnyF4PoZbMQOeKVTrM/uqT9Ukl5jDz6Vk
 HBgrr+61z04eviucDzTrr6lKTEV0xS7IY+QqLCdCCEuYKbWrkAGqOexNNoZeUxXOXgFF
 XPJ26kBZdZ6ZuyxBR30ld2KxtLf8MxEqXRGPLwacxsaWacGaTeAEPjR1nuUIo/5dlfSi
 dKdeAHoOgnaVWSuymWte+EIiFuPfo9ln+UEe5CRNRVdw8Dzg1ynJp2nrdZJD8HwEzMKY
 3imgzObuOdqVtmHR+FahGfZ9ktd2q/e+MEmA93LXtd+z6SClJsB1Pj2s2iF4o3K+uC1z
 xMRA==
X-Gm-Message-State: AFuF++kmjCI7dFMU+h2Ts6mrqMQR/xo4FioRnyHwKfsgH5rNZMTKMEB1
 C/2JGtUf7N7NfNCM1UFqOwtO7MB1sVg4Cu2218r5HDt3xm4J/rqwGflZd4YKbY+n9/y3Lkafej/
 O7UpyXch1Hw==
X-Gm-Gg: AYBFou0M3DjienseRLI3N1zmX6VLg+Pf0Tu8jEmU3t98aav8R4Tx9mqd1HCqMYXPpy1
 L2a5ZUdYf7izv+67C3uzk3QGGyI/crdJSXnCDugGDrWdDgjPqHJtYvv8PmN65Ack087MgX8I9mH
 IdjyMTs3vII950M1XwhTRmvVR+4CJBtvfhe0lK/ZLGNx+SnoYXV1RT3DOelEbnARHhgHjTAnYAj
 SoBEAnEeBQwA8HN2+7NiHWhoAgwXAXd5CpPwnbA0kWRjzSCKO40GI40ILCC/SubgySs+cgvTxDm
 17BVC4eRcURdoTk1HkcBvc9N64If8jT+QhQ0eHTguqusIiDh5sM8f8Cllf0p4DcBWr6mojo8Cov
 QFWX7j+3NadPgCt2DW9S//Py1La9Fu4qVO2jkl2bjuuGDImCSebB/203QYDw74P3Jzmx/oOg75l
 r6oUYYaabH5hSRDPeyP4vOjUJCXJl7FF8QZDWy1gF1zGn2MxP7fKk1fcHwwSPCIHcwDk+eM+FPe
 8PYDhNpkrpxt6vHPR5rgbNvCn0oLuB7bd5AOxFHhlTsEtnNO1vU
X-Received: by 2002:a05:600c:1da8:b0:49f:d377:ac24 with SMTP id
 5b1f17b1804b1-49fe7b53066mr95697125e9.3.1790347630365; 
 Fri, 25 Sep 2026 07:47:10 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a30c43asm8256305f8f.3.2026.09.25.07.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:47:10 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:47:05 +0200
Message-ID: <20260925144708.4100669-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260918132135.146448-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/screen: install screenrc without
 executable rights
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
> There is no reason to install a configuration file in /etc with
> executable rights.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/work_items/174
> Fixes: 98873717c2654e27ce069c44e9b5dbe3383c0f97 ("screen: enable terminfo and install screenrc")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/screen/screen.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/screen/screen.mk b/package/screen/screen.mk
> index c279fed8bc..ed225d1983 100644
> --- a/package/screen/screen.mk
> +++ b/package/screen/screen.mk
> @@ -28,7 +28,7 @@ SCREEN_CONF_OPTS += --disable-pam
>  endif
>  
>  define SCREEN_INSTALL_SCREENRC
> -	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
> +	$(INSTALL) -m 0644 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
>  endef
>  SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
