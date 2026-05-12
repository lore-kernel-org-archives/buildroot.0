Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15926CD4F21
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 21:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C171B41097;
	Tue, 12 May 2026 21:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAuHlH547Ojg; Tue, 12 May 2026 21:35:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECD2D4109A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778621725;
	bh=HB6CryXcJqZ8gwNOUbXTlfB3jGujOjyugrXmTOacq9k=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=MdfHi7l6paZLCIIcSRccmVeDUlHgbsGONtrNUcDpVwEjVowTvUWnn/LI51sJfCqI2
	 iCAQ/gMpNzuz5gr20Endk2y54CMY6qRX4RwFzbyrQVGyPb7zeDiA+CfXE8UmrA1WGg
	 DrN8xcWJxksj1K61vi7fQ2dvktbTMIR8n8Fgt6/llrCb4iuKpVD/J/LgnFVaFs5cNj
	 60OteuEZPsiTR1yzsP/YcCVbVPQyi9p5XJe8my8OaU+tcaIpzjY6osBxA3lHz/wuRA
	 pWxCyYkexDw6SG5xPaTek7L+OwcFQD9bulJwi8so1B/1Po9FhCHaGajEyeNKbnkL7V
	 a364RnJPa4JBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECD2D4109A;
	Tue, 12 May 2026 21:35:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B4D7223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 21:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7052F4109A
 for <buildroot@buildroot.org>; Tue, 12 May 2026 21:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRWTKeIl6g3b for <buildroot@buildroot.org>;
 Tue, 12 May 2026 21:35:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B5F6341097
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5F6341097
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5F6341097
 for <buildroot@buildroot.org>; Tue, 12 May 2026 21:35:22 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-44e1860558fso3899846f8f.0
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778621720; x=1779226520;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vXwmGdgxBELmveQB+B1c1bC//+S5THZFCqVM58mcYYM=;
 b=qHDLKuiWhnSLTGREGLpz/BXBh5+J6z1l81LI9XbM/ayEx9hs1Vwfy9s/b99f1+CR7m
 SNXu7PSyPa/yEsI8uSyNLrzgFA0qizD8ApxEYkZowIjVPePTCQT8lxsBVbvR4VLhImzz
 wGRggVjxUniTpU0jZ9je8GAwpFxJ+mIyjWN0e4mOxsoRzBO07DbvFRYq6LU75dXYzvQ9
 7A4GxoBtro2ITQOFBOCANxtRr27lh6UYJAfgyIQlY8hFkJuBduWkx+5x+uCE8E9AQmi/
 tmeoD8o87Zp9T8o7YfVlo8hKSF0wqMXQC+zY2BTGGF2QyfW7oFKrQUE6NyIa0mqOrnJ/
 FTjg==
X-Gm-Message-State: AOJu0YzHFqvM9sU+UqLgsNrKSQQ2jrAII/xhqXgyvNjVDVmVjwAR6f7E
 IsofzHKO+0gBbALsLVVXHPZ9Rpd1zeKFpo72miYLbiCjvpyWfBYWvgkj
X-Gm-Gg: Acq92OGIOoNg1evDszYjrqoyRibIFoxWWEfb9CU/+m8OcPk3g3cj0g58XZE5oUb/jjl
 Y1tvjBCosATmM6TImtd+K0UrUg7Y9wIg5SXis08OjS6yj+QlaB8DA3PboE2SdS2AP/nplDKYpi1
 Yvs5IC0bRcNS0buozWrA27tqd1ztak8iLhTYCzrkf2nSDNqZU0jKhURzRu6QueFDrfBLy86XG8E
 bWxIBHVW9699OO4Sd3IQl9hYtG0kOJ4NWA08Xhcftgx5Gffg2S7x01QNA58SFxAeqZ3gsHxVpvH
 IscHb9pCQwMJnbz2Evc//WjeP7GMNeaKkPj1qZKlnyobFpmYKQP66aGA0bXQJnoIzIxYCVWvBgw
 XoLBZH7NBs9k63txx0VuqhyfeJ8zaEqEN0v2KwgCp1kzq1nsuRZovBBykhQ0B7by5pSWfXNsmWG
 PWCP9dOIJVBzJWXrADooNWEq3XP/SnD3/zVzLW2KB4W1ATtgXGIRD4/S58qPGr
X-Received: by 2002:a5d:584c:0:b0:43d:613:4036 with SMTP id
 ffacd0b85a97d-45c5a782874mr587807f8f.37.1778621720484; 
 Tue, 12 May 2026 14:35:20 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491f8d4c3sm35120010f8f.34.2026.05.12.14.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 14:35:19 -0700 (PDT)
Date: Tue, 12 May 2026 23:35:17 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20260512213517.GB71206@pevik>
References: <20260204154340.766528-1-titouan.christophe@mind.be>
 <20260204154340.766528-4-titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204154340.766528-4-titouan.christophe@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778621720; x=1779226520; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vXwmGdgxBELmveQB+B1c1bC//+S5THZFCqVM58mcYYM=;
 b=sjSoAeId3OOLqoxRPxnI0Zp2kPTYNFj+VtNu+b36lUxCP5TkEDjeiVYy8o2T0ypNqe
 PusZaKgWy5cDWYwNmskdCH2VfPsrryHz92C6um4l60djVsxjyilIplrW9uDqH2mtPykf
 EheeuRfd3aTvdSkVX2R0tR5Gz3TtECuwuhFM8sePqK9wFNFCESqXdfEZB4Olt/eea2g4
 8xF18nwQ0+q/8lqBAPS+tstzZ/Y1d++GY2pBTQuVN59OMCjMoIQ0wFw58L1KDJLYXWnL
 62oSkiaiMKsEIQLQ3228Wp7QqTXfqxYKwXFukRPwWj/GuX3W7Ei5W0iIv/wVZsdB+gPf
 z5GQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=sjSoAeId
Subject: Re: [Buildroot] [PATCH v3 3/7] support/kconfig: bump to
 linux-v6.9-rc5 version
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

This got slightly outdated (now it could be 7.1-rc3), but update can be done
later. Having this finished with slightly older kernel than latest would be a
big improvement.

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
