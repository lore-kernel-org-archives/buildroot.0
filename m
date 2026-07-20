Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67561C44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 21:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B98460718;
	Mon, 20 Jul 2026 21:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0U07QN4eFEh7; Mon, 20 Jul 2026 21:44:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A38960704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784583847;
	bh=GB5cx0lJzp0OL3rrLuihWrSHxrcs1lfsUCfjUFKqtcA=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=Hva9mzoy5F5vygerTVB5XB/OV2gtLLO7DI0E4aamc7Qxchq81DM5svPB26udCz7cY
	 fmlerCXuOqZ/yM5eDrV4ryVfCZQKSE9gQTMw9tKbRlua+MAetBLEtqChKWoAZA8HO4
	 N8qoJVVeA8Q6u1HGAGcLt9IzdN0OnqGeioGdX1LySNs5W1CJo2N104/Z0jq5s3k8+w
	 RYsctdHx/1QHECY3mQwuyFQBeikye1v7Be33hDmYgynwMOP1TqNuYEWrzajrcBGx2H
	 DShZvZ8W8qgQzdc8jNeXcHC5uqgF6P1iiULdHV2ad06eFAI3iEEXxvM8ALuhQKNkYV
	 ENMKzH73XGx/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A38960704;
	Mon, 20 Jul 2026 21:44:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3D9096C
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 21:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99E5060704
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 21:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkhquTBybKER for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 21:44:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A9E8C605FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9E8C605FF
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9E8C605FF
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 21:44:04 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49557167508so22050185e9.1
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 14:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784583842; x=1785188642;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=utm7i2Z8bERL4Ub0sA/1OMbbsPYyN+lh1tSaU3NCRdg=;
 b=jqczZhFQxZrFrBdlvf2yETrVZVBzbpu2qxK2OqKSd8uGPvbO5J6yJlsvWyyjGk9j4d
 nho+ToGlhsfWBq7fxrSQnvvXtAGAryYAlS7Ru7f5ORVck89gHsxS+9e2nLd6ukoX81GB
 uCVweuSO3BWyMZToOd0ZsR7zzKCVNkqBeL5fXUU40R24ociTdfNZGQaAtzx+usXrt5af
 qwbAzS82aNQ+mZbRmR1iHWDCIvTlvJHojDbeWK29BoSzrTguOYYbY8yJayTMoHPmTApp
 OOQvN3cq43zgWPO4a0P9ObLkN3ImCJwlHlpBzM/j6NYtmObpTFdXp3U7xkhYSeaCUkdg
 RsWw==
X-Gm-Message-State: AOJu0YwGjxQvJ4NfcYIDJkh7m9IXNT3pEHw+INoTa+CdBVXZWins50Ie
 xCoPqiYUPdD5zNKu38Pitxqku70zeYWbHhlNMeW16HZXthVc0j7KUqUuEtIWBQ==
X-Gm-Gg: AfdE7cmnwOL2v7T2GZ8RbKQrEBje9bULAAMtyONMlzzXS4ZWiVOHpUAyONe7FzLQWnb
 CNv4Sc/cCkT4ZGRwucjICxyF9uU7gilQuI6FoxsDgbxEZB+3gYlb00UizzltBWOCr2FA2QipTh8
 lN4cjgVI5tFcVcO5TpdhwiLsGP7Y1x/JrX3jLYscyQ6Gp/Pvnwb33/6IbBYUnK3fgTIfwLrqOq2
 the1tB+mNT5ScIz5/1/70Ta7ummpgvWWYEwIPqAx/eRHhc7+VqakvOflxp6GG4fYdCT1gTloySs
 sH1rnN9Tnf8XCNRGcRWLmVdnf22nEppIkqd6MrR11jGSq80nsS+N3YNavf4WDP9jxeW+BuQbtUX
 Lm2D97FXJCpl8myGN+bpsJ9uKtwK4u9y8LktggTmmuMFDfkxphqZnT7LamabU0mGn3iXxBhxNTz
 G54WLlxtjR0p5/fxRZPSjXhco2+nrsF5anlT3esPA=
X-Received: by 2002:a05:600c:46d4:b0:493:f140:c3fb with SMTP id
 5b1f17b1804b1-4954a3d64c9mr206003025e9.7.1784583842275; 
 Mon, 20 Jul 2026 14:44:02 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563e4573bsm33040975e9.0.2026.07.20.14.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 14:44:01 -0700 (PDT)
Date: Mon, 20 Jul 2026 23:43:56 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Message-ID: <20260720214356.GA217451@pevik>
References: <20260720211748.66658-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260720211748.66658-1-petr.vorel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784583842; x=1785188642; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=utm7i2Z8bERL4Ub0sA/1OMbbsPYyN+lh1tSaU3NCRdg=;
 b=dDwpxacXkSN3sao3R0RBqR5xhALQpHn2NDVv0ZxSIDqlvvKoxYyiD8LAK+7G11AXcY
 5qHLnvcLoaf8WeD0VpiSgcmGY5plKadMTC0NkPgMBVt7vhphN5Ezdr258wn4qtVf7mW9
 p7gV9ypukiHGZQVupoQA0IvDm/Uf+yt0VSdjR1tZ2Ej672TP+f3fwIkWB7pPrMSo6wj2
 04Nf+EJkygOlcC2Wep1scYOuLqhr/FXvcjeFY9wpH1pmj51afDqYitcA4k9NO4D96KEL
 j+1SAZYG2+ff7QIZkFBXRKjY7NYHnpDLZrF+tSjkF10VaXyAPBv9a7XljuvB487AS0uR
 P6hA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=dDwpxacX
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 7.1.0
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
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> For release announce, see:
> https://lore.kernel.org/netdev/20260615160636.412a064e@phoenix.local/

Tested:

./utils/test-pkg -p iproute2

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
               bootlin-aarch64-glibc-old [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
