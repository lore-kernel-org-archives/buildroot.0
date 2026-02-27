Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6ABFEFB78
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 18:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BC9260B98;
	Fri, 27 Feb 2026 18:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Op9eUitWPs_A; Fri, 27 Feb 2026 18:33:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61BC360B96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772217229;
	bh=2hn87ToZ6GKXNutHC1QcuKJ1t9pU4jLmvO9OLd3Pcl4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CD05kBk5EoWlhnXcTmjCQ982e3wqm0gXmtpXlMSs5Sdlxv8v1NxUjVpMEOm89Thr6
	 z04Wfgix00Eiw6dLP+nkOxXgchB4W6I3Wpc6Z0yV+BFRzAYR7/UFHngYMQnxX6LNS2
	 BQlT5NzJ/VrYJRAO2+pgcgL+wiTYwa5Jv1K/OwPOcA0nqOFNmh6gh7D3OnLMavusTy
	 9jrwSq4ki7G/D+tqOir5UeIHubqiw/LZfwJMsI0Jl1iFScMIcNtIr9cnRaph2YCaUT
	 kmMvAkNtkv9v2lDS+TqwBSRzS4wyV/r6gz1wBU+fLtTJ7kc5MtNdnp/4zVBR18aXaO
	 z8rk0nyjeErfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61BC360B96;
	Fri, 27 Feb 2026 18:33:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2E23204
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9495482A4E
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWE1MQs0FaZv for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 18:33:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D440182A2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D440182A2E
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D440182A2E
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:33:46 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-676815e147dso1075118eaf.3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 10:33:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772217225; cv=none;
 d=google.com; s=arc-20240605;
 b=Ied0p2kyUK9EzakhPVd/2BtjYjU1uKl8+e+9+GUWClTlb/f2RZ4U8JOtBCTQoHmNtp
 jKoQNEzmHCdvxqDRf7TbQ8rKvlm2uxRnk+0pRRx6sG6nD1YI1D/KUMFquWbaI3yQrT+G
 Cpg9Spvc2ojVhkprBjFX+0sqr7TTPRRDN7e2E+puhxnfgB6zEjCxRJ1h/Iiq5QJJHfdp
 VF9Go6KhqFDambQ9QcfV3P14vVnjgh2orGpYq5tbADtWNvH7qceJo+J4IHYP+TXU5imQ
 SdlHQgFD4bfxPDl1ZJkf0ni+RtIsOmNNaySWr6oTf7JlvTudSQgIPr5DxGP5fRlgHG29
 IPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=y5J+VOZP/KPQoTQivZHtDvTB7MyrribjERZNXQn/9ic=;
 fh=3/M4zrKModbMy9zvPBlQh62kRqiUi9prCHp2+GQtNyM=;
 b=lP7BKe1f31oA44rXBSyGz3Fxwce0JtH3B2Ic0uS4YPrOGdlZz5PmtFRa77or9SZt2O
 +4Ddqtvj+4cQuNn9V+zOsCYUyO/bQEAFWsXUS9ZXqNI7vIJobGNAViPOg80SAbmfMhoL
 PxUVpswS6ISgw54ZWkkRplQFv7bEX0lHi3/2vG97GkgIPr7nTI7DU1yVGwDusIpcQNJf
 nwNyzQvs9B5o5sBWRsWDn75iY9wi8pQxC0TBR9vsBcutAejgZoEDlEyb9i8ahTZTjxYQ
 mxlzTP1fgF8UbXtXFADHBbhcWZg5vtVa+K0JT78fx89jb2IIRU88/OwAFxEBTCYscvYq
 RuJg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772217225; x=1772822025;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=y5J+VOZP/KPQoTQivZHtDvTB7MyrribjERZNXQn/9ic=;
 b=R0h+wl9bFUDKVLNHpvlawbXCZ1PdsxnxBtSWI4xWKgD4q63A6MQWW8mEdthdhFCzFa
 tU0hClfBzPHrbDea/IvFbo67mu2Y4WE8CnPsVzT6bXyNY3w2dQU7P365/fG3yI7FrWwA
 pflB1gSkREXZE2ULv1xLMHqhulmLWfVEME39A6b1vxMiYbooKVdXkmn1a8QNf27pjSUA
 EbYK6Vb1FfEEVNxoeuc2dBHDOW8ZCDQfrG8DhJVwb2z4lEOvzlaJXnzLsPHDtV4pdNT3
 L6ie4F7ULKGhfQQgLwZOYJ3CoEENB9qtJgWzoO9IF238qoOedT/021T1v4tuHlLjWQuy
 mQ5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXCQnvGRQke4w5e7M2eG5g8kG4/fuZ5iyvPIlRMdYLRjKdBen4WfWUoCsamBjxZLAPBKK+eDzUH1o=@buildroot.org
X-Gm-Message-State: AOJu0YxqbYuX6YFWIQCftvjsjCw7jKQ7tcLU33eoaSNdesvgAtqfigUv
 8Fp7wpI788ADjSKUm2/e7lSjU3BzpmIhC4URrUwh8nJQMVibE4xeu22yg1vzCSLkWVdSu0tHrYS
 NlYS+2DbX3tLcaNwcZLhWQVRqGpwjD3LDSADG
X-Gm-Gg: ATEYQzzafCs+TbhcnFhGgKFfYwBXMHQliHJwqinZXHjKtvg42ErWaraCUFhmdW53FzO
 CRBYilA7fjFrWTDNRhIBwwa8oYhVGdLOjeo82iMJYR1a+uf0pqKkkhICOPJFom59Mn3hCUy+mrW
 cBu6wOgI9Ox2jSWJpW2FYbdA7oirQlAkjProVv00+GiHWb8lqZ8E8eIcL0XD0pXDgdB5qp4ZgnR
 C6EYpOu+t3OnvGzQZN5RuKOkynwofMhc8wwi1nGU4IwsysGPTlE9urC8hCwCalb2S0Ec3RvK6dO
 LK3X9hGUddwfseFv
X-Received: by 2002:a05:6820:2913:b0:662:c16f:4774 with SMTP id
 006d021491bc7-679faf2ca20mr2534307eaf.51.1772217225654; Fri, 27 Feb 2026
 10:33:45 -0800 (PST)
MIME-Version: 1.0
References: <20260225-mesa3d-panfrost-v1-1-46dd7621ac79@anodize.com>
 <a63301ecb65790d5aa276ba5912c418d@free.fr>
In-Reply-To: <a63301ecb65790d5aa276ba5912c418d@free.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 27 Feb 2026 10:33:09 -0800
X-Gm-Features: AaiRm527zF-YionWnMMZ8aIL8O-MOOW0-vglq0AGvAdyH22L3MhyBnvAKZ8lAfc
Message-ID: <CAMWSM7gnGob=Ti1n5G6aqjRJ9fS_kBW9CeP+dj4UWQQxxkpevw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Joseph Kogut <joseph@anodize.com>, buildroot@buildroot.org, 
 Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772217225; x=1772822025; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y5J+VOZP/KPQoTQivZHtDvTB7MyrribjERZNXQn/9ic=;
 b=IuTnsbGUXmXYMo4G0yJrL9Cq3V1v5K0QbDf+Aes7hxmuLO1c+PcNn0qpBjy5HKjmIq
 JbzQ2ZMywOLzBkAxQrFwal+uwaVIJJRFrOyWB6A8TyFOVZHETEB6HLH8Jdt1vldMeitz
 UywQgBThenj70a4HskJftuj9r33hiwxfURHBjeEV6JPIWTf9rICu5KFG43V6sEcnuUiZ
 tqaDDQPWrWcH2sz3RFKjltToa2kaG839/24MB9GABCFZ/Ui8GTAHWHSMSc7ctexWtp2I
 IGKRRvmK0/5VNewDCTC3NNuZNtwTuhY2g1glq14bu6yK+oIT77RT9mWCORfZgJnwP3MW
 p6tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IuTnsbGU
Subject: Re: [Buildroot] [PATCH RESEND] package/mesa3d: add panfrost vulkan
 driver config
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBGZWIgMjcsIDIwMjYgYXQgMTA6MDDigK9BTSBKdWxpZW4gT2xpdmFpbiA8anUub0Bm
cmVlLmZyPiB3cm90ZToKPgo+IE9uIDI1LzAyLzIwMjYgMjE6MTYsIEpvc2VwaCBLb2d1dCB3cm90
ZToKPiA+IFNpZ25lZC1vZmYtYnk6IEpvc2VwaCBLb2d1dCA8am9zZXBoQGFub2RpemUuY29tPgo+
Cj4gQXBwbGllZCB0byBuZXh0LCB0aGFua3MuCgpUaGFua3MgZm9yIHRoZSBxdWljayByZXZpZXch
IEknbGwgZm9sbG93IHVwIGFuZCBhZGQgbXlzZWxmIGFzIGEKbWFpbnRhaW5lciB0byBtZXNhM2Qu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
