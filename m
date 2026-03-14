Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1E5105F79E
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 19:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 557B6821D4;
	Sat, 14 Mar 2026 19:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvH8Ozt-8-K8; Sat, 14 Mar 2026 19:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A50982089
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773518254;
	bh=h0dlGvq4Vdw1SMODTSt+rx96igir3BpyRakFgljJ4w8=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=nnZGQNEBqY2kCrsE29yzN7lOztXVYZZX4xUxtgttB5rlrVOZNy7r6Ja2GfL9NPZyg
	 pNzDNMEO1wJgNILQcqVq30+aP+Ou85HY3mBoXnEwMlmhCr7Vb9JkhY0fkhn4hsRyu0
	 s3ogjY27QPPwmmjuWSGtY97ri1kGsiRdVZPj2vpxVcTImWvEPudhl4P1snD/cAIY+J
	 /IBKCgQoRokpRAokvHa1YEYUv5PpKReDWBwVhpQkYPFh1UDnrUC8bFjylyz9ujb97W
	 sZoRhD0H9fSApK4UHcFp3u/ZZKfXw7t9jxVQszmercyl3iDrO+sZoA6Kq15pXBVNMo
	 BxmK2yF2qP2Vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A50982089;
	Sat, 14 Mar 2026 19:57:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86735118
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 19:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7844160F4A
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 19:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xNGSHDbc2tK for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 19:57:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A7FEE607AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7FEE607AE
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7FEE607AE
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 19:57:31 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4853f2826f7so34715785e9.1
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 12:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773518249; x=1774123049;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=onID7J3V1wzPYBDlJ8o/P6Iy2p/OjwkwkqdGZZ3NTYw=;
 b=OFX6+7wMSEJ3KcZpRUGRtuVaCK6u7b0biztqzkvCW53jDXRGTOVgPoSq8sX6/17Wlj
 lQz/VNfvu3DtOqHPdYVLWxCtSUxYpiITUJstoX3dSdI7qOfza8dUV399gn9OTcxCRAHw
 96mDA4zVcihykk6xNWjb8dlYp1/D7h74Edvh4la8X2oycSth7QV/pSiPQOeOevu8L5W9
 Xh1SNb57cFNRLtsDE0Bkw9jwdNijC5KU9CEH11pCZ676lq/vcfUPlaNracqDy96PGU2I
 XfdJlDnfaxSrQlora1R18uBQ2bYUT1L6bWzDs3C/DPeXNq1peIblO4LkWIgtl7N9g0U3
 oIGw==
X-Gm-Message-State: AOJu0YzxZcIf0X8jOGMMoSxW9mQ/6o1IFicsDwrPELy1K1OV9AMZniTt
 OtTO4hNRVo9cl9ERw08BHFpbDDzX4YFMXwg1Sz8n/BiEOnk8xIeYZfEmvf7uowAh
X-Gm-Gg: ATEYQzx7kjK6cqXjRiYUS4sJJ1iSA8/IgpJKCrb3th3pt7Sy7FLNvjMsKxqL63/mQO8
 nJVPfBw2bNfmVlrwij7A//0bqKhPlcGIq/iUXQ/HLDTptbkumUiHKPEuvyX5dDsvAMygc9gI7uo
 nwxH4rOZz4OhQaA/0u1vppf2SJXz8tEkplnJy/hrTfd0DmO7dTaeK3qkyNcgd2spIUzL9MmydmC
 u8n/1+FDuuXdSbMfJ3LgS5cIRjiAIC4CzxsVvtf73EXgh3ocK2xdPHpOl//Q78wl27qdX5BPi3u
 JgwiNhHDjvvjFDFofLPk41TzK2vzTwdPk4x894xi1ok2VeUaU1ktzu0HVeDryy/jMNmgA1U5Umn
 dMRbrEIUTEfDiUEwiOPZ5G4tgsdT21EUbtrxeQuOwcbObjigeqwVxTV38ym2V8wdY7WS9Rq01sz
 okiH1jIoIfMxBweYlDNXY5f3U7wFR9L7BrfoT6dAAqMih/E44NU3o4zjLAJmh5
X-Received: by 2002:a05:600c:1c21:b0:485:5981:1423 with SMTP id
 5b1f17b1804b1-485598116femr121274115e9.3.1773518249164; 
 Sat, 14 Mar 2026 12:57:29 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b3a09e453sm5716068f8f.0.2026.03.14.12.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 12:57:28 -0700 (PDT)
Date: Sat, 14 Mar 2026 20:57:26 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <20260314195726.GA261122@pevik>
References: <20260313211015.4152659-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313211015.4152659-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773518249; x=1774123049; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=onID7J3V1wzPYBDlJ8o/P6Iy2p/OjwkwkqdGZZ3NTYw=;
 b=KiHHyVls2k2exM6Cc+PoXj3FDbSlTKjGQ67ozcqHNC4dfFuyTUikI0qtII8jcBdQeB
 7jnhaqhbSsz9+WtUi5LUZa58Naobp1rXBJXKaRZQW9LGre1KJqyVh8+KJmXARjvjenyM
 nwElKuzIcBsIHOq/pSbrPoeKQW/uFzPvpO69CufXRA7TPSqrDZqtaeyy9iBbToE0dVP4
 2TUGaTlXr8uhDqHWdU8WIF4m+fBWRyv22C1JzDpQcTzrQer1/Oc1GxEbmgCIBB9/Q0Em
 wv20GVb6QoVE5x8csEuSKll8QN6wn4iU9fR0y7Opo5yZUMtioG5x3z7ecQ5UnDV0um5Z
 Un9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KiHHyVls
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: security bump version to
 2.8.7
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

> Release announce:
> https://lore.kernel.org/linux-nfs/4d11b9d7-7b49-4a1e-8c26-29ecb2fefe2f@redhat.com/

Thanks for update!
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
