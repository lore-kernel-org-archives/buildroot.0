Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94BFD5B15F
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 18:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E6F260706;
	Sat, 13 Dec 2025 18:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOapn7KbmZz4; Sat, 13 Dec 2025 18:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66B346070C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765650980;
	bh=t7V/dL8VnE4P/eA3m3XCPSb0oH1TiUa5Dx2d+P8cJaI=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=fdJScYTjgby3Py3eDA6AKOMctXYx5uRwf3Ovb7h/IrvIEfRNlmIcENUXzG1uqrWPz
	 UKG68/CNLXevNkmz2j08Og+TKyqFEa9bSh4Hrw9I03EWaM0wSv3JQpFgnJ+z94Ij/R
	 MIdNvUnrJUDZuitZ0u8DIpW0Ktk8NmgjXx6ueMS8Ks9uLPA1f21Nf5kVWsfBvEkXZu
	 Z1nP92k8A3uoltHKO+acVVphplK6lgrvr7pE2yzgK/ZRGJDjjeyOGAfHIUnvF64bKX
	 4LS2limThDGkbMbnTt+8d8TNnLmeg+qIhZ0dWPNiqHBmH0DS3yQyY2Vqzj/t8inOlX
	 mpyoAkys5C00Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66B346070C;
	Sat, 13 Dec 2025 18:36:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9FCF117
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACB224059B
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTVsB-kbgVx5 for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 18:36:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCA5B40553
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCA5B40553
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCA5B40553
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:36:18 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so16181965e9.0
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 10:36:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765650977; x=1766255777;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kbOmTfnWhQi5HHlqh0aLyfDXGJr2lBCK2pfbhNnjW5Y=;
 b=h7JkWUVSznUKzbVXHJCdcp2zLwZ7iRWrK0TpycVm716/VMMuMlSgVmmzJlKTO7jPat
 7QF1epp4Qq78mqn6heOFTkC+8bmBMC8ooNeAQzBJLuUrlaaYro5Vya9WhsLdHEel0c0r
 y7ACm3p0BgqGxCN5sAboVg7btzpuxoo6xrn/Za8QzXUNp1gbyHUBrmGEg8+jBNjcC7Fh
 4cgBqtDt1rtFfkZwx3mAuwsJmaHEiZg9PTwuq4Fjmu6RTOlQAslINM3XR86FTMtS7vK3
 MFXXcNTmDVd8TF14z4pn2JcVkKIj8D17nWAIEuWjqMbgTqQjiRlGAr+rJaHxUFESbn4/
 mwwA==
X-Gm-Message-State: AOJu0YwgOhdBB7YWFdyjT2nurZSnlJYatxuuhuTXYi8FnQV4epXu2kV5
 RfMq0QplyA4YhZaK/s7ssvj4KHLqIhgRol4pkCtedc2H4MoE2RULVVtKEDnkVXMM
X-Gm-Gg: AY/fxX5F59pXDJN1zg5TU2yrmIrKFKyy/lKqwO5Q3vgv24oDray+G8ZEIAyA4sTnj3r
 +ybG0PFayq2ZGXYhgHCptnXBtaJcUwrFnOLSznP/F2O5BkPwV1we0S23W4gS6ARbjhDPRGZEvlU
 R6/7cBNfxiD9RsxSdAqbHKVZdeZvb/LfzAZ5SGVCCiqAL9MmP2TFOFhGdO1BxbshoUMwFeLlvg6
 QXNZWmpHeI7xNFhtoaKwcHTGm+mkSD7AesNwJKTEomO2usdM1XAC1o3hszkBO9CAS54Zfdyei6N
 HfNMoBlH0lGOVteA6HkOXhY7Izlt3N1T6kzV01YdAjdZ1ynVnU432GRdu38dWzfFkigb2slukrj
 G+THVXsjvXwan4ZWEHsCP6r1jrHJATHE+dowqltSrKV+CsmSf0xeMh3xbZAw1OhGJRh9mtsml7H
 hV9vo/8/snk6JJ+YaUug9zkJBPoiZ0c2TJQLG05LZoh1muShih
X-Google-Smtp-Source: AGHT+IF4rNqTqhYTcAqw0dM5KaIfP8OTXKyzmZRsjiFtR8rrJBrZbDIvTsezqkXj7umv+IDljFyAfw==
X-Received: by 2002:a05:600c:860b:b0:47a:814c:eea1 with SMTP id
 5b1f17b1804b1-47a8f91d91fmr68674505e9.35.1765650976527; 
 Sat, 13 Dec 2025 10:36:16 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a957de489sm64313355e9.5.2025.12.13.10.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Dec 2025 10:36:16 -0800 (PST)
Date: Sat, 13 Dec 2025 19:36:13 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20251213183613.GA183913@pevik>
References: <20251213151730.821513-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251213151730.821513-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765650977; x=1766255777; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kbOmTfnWhQi5HHlqh0aLyfDXGJr2lBCK2pfbhNnjW5Y=;
 b=Zjx1C0LpbbeyMf5cp0x9zAKmAN1biwmxuyRf2IxRapMNbt08RWBUR5d8Tagg1/nFd9
 cvbVxxKpCwYo3psIpLm794kRWa1fFBmT/I9AU65jGIfNcaE/gAQsRTDdH0ndynZf0MxL
 3YJhAhAqc/cEIhQ+edcKrBp51aNCUu5kQy3Xk+7p40WAOjpv9jAJ/vDQYQVLblstvWO7
 F07B0sawovBxqXA5os6owYvsBO+XubGMeBP7f5Gl8isbJlZwv61NJPCyDLUYOJ1Epit5
 v2/QQh8dQH1EZIg8FobMvU3ZFOqPz6vXPkgL+FJCr5aS8WZSpIZn5mcQUvX5j/U6ZwYC
 aBSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Zjx1C0Lp
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libtirpc: introduce
 BR2_PACKAGE_LIBTIRPC_DB
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

> Package libtirpc expose rpcdb so make it selectable.

LGTM.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
