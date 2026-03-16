Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D450F53D98
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 21:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C78E837D2;
	Mon, 16 Mar 2026 21:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YA9Akn5WFotI; Mon, 16 Mar 2026 21:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4214D835CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773694875;
	bh=n5YyUAsIdi8rbSUGI9WuX9txzMI840Lrye1JiNd0vGw=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lc+7wKUH6ELdk6UrQd8J5+ZWNKIW70L225MwesKmCHdOKm204paWS3yoFC2IPWyvm
	 /kaVop8/kyN81iSrtG8hdIY/UD75cGZ7+LlAXfi3ZcLap18kdWZvL16CpyGvBghdrX
	 tlWyuMr588H2mu3+sWs978ckir/N4h1kjDgyP89qDbmFP+Z8fxJLHQrBosVHceYEXV
	 rwHy7x5fbrFclx566wD5gTv3S92MOdMRXYwmKKTdUCkViImovvzYsN2EuUkRPtkTvj
	 +HNnP2MHSSN2xIlUhksBCbRis5xg+UFr6R5Ij7uCT5Bm5g5ztihiY9anIGj8R8pwA2
	 BcvW+7DAljUVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4214D835CF;
	Mon, 16 Mar 2026 21:01:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BAEF3C6
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D1C040949
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oppai4fFvVvy for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 21:01:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b132; helo=mail-yx1-xb132.google.com;
 envelope-from=william.sherrer1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1B7C40173
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1B7C40173
Received: from mail-yx1-xb132.google.com (mail-yx1-xb132.google.com
 [IPv6:2607:f8b0:4864:20::b132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1B7C40173
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:01:12 +0000 (UTC)
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-64ae222d978so5375260d50.1
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 14:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773694871; x=1774299671;
 h=to:date:message-id:subject:mime-version:from
 :content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w8VsX6jWOC1ZGS7TfgnPHBKfuVFuHVI8+Reo7blEIWc=;
 b=jmSWZCcB4FIz4E2WzfD8MCgHpwatE0ZeLNOkx6M9HOUONB/mjqhYG2YUQa+AsELect
 k0HwJKuFsBB5fJ/tSRhyr4qdfxkLU9fryGh8Kn2f588BI4sg4qApP8jEJMGupVGbFtBM
 0574KrTuuBne3B0caM3T1VRHojvxy3RY//6x06nu3UW9hiJ3Ucy609K5BQs4tNMaHk/V
 TMLalHiThcmMaZbw7WlKei+obfhLLbX8/HsUolYfybkjSxWFGkeE/9SvtkP+eQjv0x7c
 Wm6U7FWRjZrb/g7ROBpj4GCTLBBqHOdVde583dxXiZZdK4ChW4/D4Z8VMiWyXjaoMOC/
 IVvA==
X-Gm-Message-State: AOJu0YyVQ94NMsTcuWvzFK5uJHp/jy9VBBFFMcKxM7XyX0g7m9UaAL3p
 CW6T7tfkzjjggNw2mBmQNKm7zrlPK9K7XZ+x8elsaV1MgLB3yXEXD/h9LpuSsT/KFM8=
X-Gm-Gg: ATEYQzwc4wlyIKbrPk/sfwKTcyBBsFGmpbG4191VGJsRAPp4jSEjbJqIamlRbFvExdZ
 /jZWiyoZmsnVBKsjq3MoDhmbz+GqtrCAIsHR0CiQEqSXdgIY6/Zd07x1Q69pB3Z+hDTj09dCVYl
 OyAFuRZfEVkikgCWtMBiWwPfMvzAlAJLE60jyLygrnW1HKJymndFQxfQPHlp87tdlhoKvAlunWB
 M/XAsclbe0frGKEZ120scpn5iQjnC3zZwRDSNpvq1t/pKQgwo7pUy2wWg0VCx50HDNig4T/+i+v
 kEGK3dFwbLeUxkpz1A+ZU9SmNUY3E9KmEpvPirHDre03S/CuCJvQZfhUYW4ojZQ8WtZzutad3gQ
 HvipkDZYZYVwAc0BRTYJW3USE0ve3gw9GK+hM0YHtIjXiAFMtHS2YriN4YpzAgGtPQTjL/9g5CB
 xhviWtP3Vt6vdoqzb5rLTYrSS9wZsEsG5OzwiCmlyZV5dU+tyrufQ7
X-Received: by 2002:a05:690c:6e86:b0:79a:1b3a:e91f with SMTP id
 00721157ae682-79a1c2022bamr149721087b3.52.1773694870716; 
 Mon, 16 Mar 2026 14:01:10 -0700 (PDT)
Received: from smtpclient.apple ([45.30.162.213])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-79a3484b7f0sm37660467b3.7.2026.03.16.14.01.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 14:01:10 -0700 (PDT)
From: Will <william.sherrer1@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <E91069E1-AAC3-4CDA-8D46-ABA336BE700A@gmail.com>
Date: Mon, 16 Mar 2026 17:00:59 -0400
To: buildroot@buildroot.org
X-Mailer: iPhone Mail (23D8133)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773694871; x=1774299671; darn=buildroot.org;
 h=to:date:message-id:subject:mime-version:from
 :content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w8VsX6jWOC1ZGS7TfgnPHBKfuVFuHVI8+Reo7blEIWc=;
 b=UEyl+bXvWmMoOWHYg6UqyhBS7p6Z7A/Yu4AYbehv6D6C7nCZZDi7E2oHRCFR7a63Yt
 9eyOLZSkfftvv8ydLDnG/Frw7z/kY64/keUygxGgGBR0ohqIN/3eIpqbVCDTIZiMOdHt
 ZZqUAdEYJWYPwE7OuZVYxz3vx2FLn/epMC/sNWdp+1sH15R9M5E7eWdMEjxMcYr1SHwg
 t9oLZNtY4DOPlODsEpBtFgk58r+ozINmMaNuBI0dpBVaRr+f5BpWENcz2CLRhJSto7Y/
 aKV/T25pgXF45DwSosn0+5VUxYjD5b5FaseRXwpUYRjitDZh09er/HXsUX8eUAiBpK9w
 sfrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UEyl+bXv
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-cargo.mk: add option to
 vendor crates offline
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

77u/CkhlbGxvIEFsbCwKCj4gT24gTWFyIDEyLCAyMDI2LCBhdCAxMzozNywgV2lsbGlhbSBTaGVy
cmVyIDx3aWxsaWFtLnNoZXJyZXIxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gVGhpcyBjb21taXQgYWRk
cyB0aGUgYC0tcmVzcGVjdC1zb3VyY2UtY29uZmlnYCBmbGFnIHRvIHZlbmRvciBjb21tYW5kIGlu
Cj4gb2ZmbGluZSBidWlsZHMuIFRoaXMgZ2l2ZXMgdGhlIGRldmVsb3BlciB0aGUgb3B0aW9uIG9m
IGFkZGluZyBhIGN1c3RvbQo+IC5jYXJnby9jb25maWcudG9tbCBpbiB0aGUgYnVpbGQgZGlyZWN0
b3J5IHdoaWNoIHBvaW50cyB0byBhbiBvZmZsaW5lIGNyYXRlcwo+IG1pcnJvciBvciByZWdpc3Ry
eS4KCklzIHRoZXJlIGZlZWRiYWNrIGZvciB0aGVzZSBwcm9wb3NlZCBjaGFuZ2VzPyBJZiByZWpl
Y3RlZCwgYW55IHJlY29tbWVuZGF0aW9ucyBmb3IgdGhlIGZ1dHVyZT8KClRoYW5rIHlvdSwKV2ls
bCBTaGVycmVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
