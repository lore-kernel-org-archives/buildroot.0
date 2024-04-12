Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE72CC4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 20:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 815E3404AE;
	Fri, 12 Apr 2024 20:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mhlLNoaMLE4; Fri, 12 Apr 2024 20:00:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95580404B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95580404B4;
	Fri, 12 Apr 2024 20:00:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8CCE1BF4E2
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 20:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4D10414F8
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 20:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gb3FWiNEgdA7 for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 20:00:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9BA2241498
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BA2241498
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BA2241498
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 20:00:51 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-58962bf3f89so253745a12.0
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 13:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712952051; x=1713556851;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NT2d1vRqU0CYKMHtNpTiFpx3mW9LF503CEjtHkCLrj8=;
 b=k7LWDUL+K2kxepWeR4GQAwdz3o/bwdXS/4UDcOlCWHo4Nqffce/WVo3Iz9d9vxSnhH
 BHZ3WR9WGq/iKFy1GTjUtuAMBJ5BGuMySJ1JM2VhkRtNC6MXRnrOhnfV/lSENjgY0Q6b
 E7W9cKAhgAek4VFLhTjjwvBvNGDDEpGnyugl0j2I+AQV4Efxgnmu5fV5k7D3YseT6o0D
 8QB3Yy5eyPlDVudymmls231QcB9hlcddtisaTmpw0/cED+u+p7gIG0Gw5XXD6sDApD4U
 1ZPtxcUzf9BlYWz6Sy3d1r3Sj7gDQn9T/R5PjNxxe7nHT7VcivNjbESODbfrb8PP+y4c
 RThw==
X-Gm-Message-State: AOJu0YyjAc7l8tK+6izY0FBpPxhUfd6EceJXjeA3rFXIaEgOcdwcA3II
 hLEeUU6SIEoMYWy9h5eTf06m+YndGXk3D6NYP73IJLYPhF368JOL1TgG537IMaLTnjeWkz1pGZG
 otj6beKhvAK85RcrrQh08XqB+UD/gQA==
X-Google-Smtp-Source: AGHT+IGD2SVQbG+oGjwwawvxhz756NJeyB+0WU9lgjoFOGQdiHXp4eZu+0avd1db279vEpfywZJtH/n6a0rpUl6ABA8=
X-Received: by 2002:a17:90b:a48:b0:2a2:6757:1de0 with SMTP id
 gw8-20020a17090b0a4800b002a267571de0mr3571908pjb.4.1712952050718; Fri, 12 Apr
 2024 13:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240412195346.1563030-1-ju.o@free.fr>
In-Reply-To: <20240412195346.1563030-1-ju.o@free.fr>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 12 Apr 2024 17:00:38 -0300
Message-ID: <CAOMZO5BrL+67sDsVvPx-XKaOLiMXJHodhtBgo5mqZ1WuZTS4hw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712952051; x=1713556851; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NT2d1vRqU0CYKMHtNpTiFpx3mW9LF503CEjtHkCLrj8=;
 b=Bi8vIcxptyjA4N4YOixxEoJMpoDBI7ZuFOKg909EONXFhbnV0VmgBIyRiappEelxel
 JMnO/tmPt5A0eaJT5qI6IDoPazpv69f9m5TSeD6sQ+CedK0cvcAs6K+1mOaQFhDnkg/s
 +q5KKoICbeGsuo64VRNHIOL4tO+gSVtqeZGM07VO8BtLPgBMvmfAkDCJOyQVimJmT73Q
 jYNB0KjDWbpkoxhNNAKT4wGHmcI/l4O6SSKGjLu2pfRfj/EKzanTJII3fSTMzIcuzdHp
 Kzl2ZjXYB5J2vLDozuZvVsQcCHaTZpNX1NvF2Zs1jlA7khbfbXZj40qvPhFjgAdT9+Df
 7OSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Bi8vIcxp
Subject: Re: [Buildroot] [PATCH 1/1] configs/wandboard: uboot needs openssl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKT24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgNDo1M+KAr1BNIEp1bGllbiBPbGl2
YWluIDxqdS5vQGZyZWUuZnI+IHdyb3RlOgo+Cj4gRml4ZXM6Cj4gaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy82NjA5NDY2NjQxCgpUaGFua3MgZm9yIHRo
ZSBmaXg6CgpSZXZpZXdlZC1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
