Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7817CCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 16:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83FCF61355;
	Wed,  5 Nov 2025 16:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5nd5NuzvrD2T; Wed,  5 Nov 2025 16:00:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2A886108B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2A886108B;
	Wed,  5 Nov 2025 16:00:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D88C44C6
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 16:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE6826133F;
 Wed,  5 Nov 2025 16:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSuxMMYYjSby; Wed,  5 Nov 2025 16:00:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4FCAA6108B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FCAA6108B
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FCAA6108B
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 16:00:04 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so3593440f8f.3
 for <buildroot@buildroot.org>; Wed, 05 Nov 2025 08:00:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762358402; x=1762963202;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qFx3cXuO3ZYgjWnEKlsuS8IZxTeChQN/7pB24AEdnt8=;
 b=VFW3as+DiEzftuwGlSjajPITCLK7NlqEFzVoQ5c/h9PIlE7ttLq1PpRCb8j7kNhimb
 GbADaEU+bBwPLdT05l07nJkScG7RC0+CYV4Tz33Jdz3/bXK9sW/3a7IECYV5SbsvlCey
 FsDR77Z0KxMtWvQqKFeYz9Xc3WPvTiqkALnh273rodYuxH5FeCCIJVx/zzAEcK5fkgQB
 klAXOSHkFy/dIVuQpsnSNf0J8YnTMR8R/gv5glGv8nchSojf4ey8YbVRTc9iQ+4yTZWI
 UB3Q8B24GpPdCe9/LJ4C+aAskeqCFgmPgm9AQV5ztV7qjmoIyxCP0dhRPZKeCTKjOw9l
 Mimw==
X-Gm-Message-State: AOJu0Yxu0kRI5pGiFKyEmQE1BgCq3Og6eSnUUtnY3MxoTJaESim4Gvq+
 bw1DMS2i78Er1jKt2NnU448MOOjOORqPKGBGUCsN2RjTxjmROd0s1VZl
X-Gm-Gg: ASbGncuPWTpimYsmb/8TDGwx5gDmpSJygeeRehImHQ1fl6CsGZJ9yzvZiEluBiwIk4Y
 JtuvS6jaFG6Tnt2fYBpb8DZyLEGGq0inCOgUH7sivBptT0qaylPjzcXxFK3yLrEFaIbAkwEGfAv
 J3MaI9CA0ve17NTURo8jTeOYtOJn3etV0j108bD17whDC+PDqZYtx++vne0ryeZyuhiuTAC5M3W
 keyPiXRZhJgsDfvLGMpdbUbO5zsKzCVKsa9lLnaEMmoaNiAmuXBfvZNg2WAuzMsaY6qNqzPtHb8
 8b/QH33vI2tD2DW2kY0FC2k2XTmRhEZbN2PsvdWDVV68+0vrkOlsfeMLOCBkmCydQSTmcghYtCT
 xvX9AUA+HJJgC25SXhLwvklnqXlryRhmjPtIMVagu28n3FM0ILGEXu/rBjAdiA2zMxjGfd6tME0
 6bYu8icWI4weBU6wP2huM0CyJ6CMyU+Mct
X-Google-Smtp-Source: AGHT+IF0PakP9m5dg9IHaVimOfL86xofQ8vFs5dY5grTZoiiYOHfaIoz4c541sdv/FFLvbL7kdX7gA==
X-Received: by 2002:a5d:5f46:0:b0:429:8b01:c08d with SMTP id
 ffacd0b85a97d-429e33055f0mr2953333f8f.41.1762358401976; 
 Wed, 05 Nov 2025 08:00:01 -0800 (PST)
Received: from ymorin.is-a-geek.org ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc2007afsm11545733f8f.44.2025.11.05.08.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 08:00:01 -0800 (PST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 05 Nov 2025 16:59:59 +0100
Date: Wed, 5 Nov 2025 16:59:59 +0100
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <aQt0f_BMYDizxBgT@landeda>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
 <34f309044544536e35eb8632020e9ddff0a53553.1756717276.git.yann.morin.1998@free.fr>
 <d59ae35b-71fe-49a5-b63e-9d690b05a0dd@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d59ae35b-71fe-49a5-b63e-9d690b05a0dd@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762358402; x=1762963202; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qFx3cXuO3ZYgjWnEKlsuS8IZxTeChQN/7pB24AEdnt8=;
 b=B8o1M6YveifZWeounAsWRqC+jWFlAtbX2B0OfP4Eki9vF8k8gWlb+bnINtmsGC25CB
 YMzEenPxKCsTxNaTTiQdVJOzTSRdFr+gFDGZqdelEccZ7liMEEZYoIyci7oeNmGr9rG2
 SaTeqjF9m7/5hanhdc9U8QxAlyGtq4scN1wI97jIvn5LPbw1GAKwQObVXcjz3jxdHUMT
 RpB7AFDZVFuQwYbsQkK0xx8vKTbqSaRZB+Ki5xvNGhI3JuT0PNgUjToAWNVhYXaILhIj
 Zp7iQ414vMBnj3Ly52e8BPhU+AdmlfsEs841Fjhb9nP4ONczuSSZ4gUuURDS5SVX0VOq
 FW0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B8o1M6Yv
Subject: Re: [Buildroot] [PATCH 07/18 v3] support/scripts: move merged-usr
 errors message into check-merged-usr.sh
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBBbGwsCgpPbiAyMDI1LTExLTA1IDExOjUyICswMTAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IExlIDAxLzA5LzIwMjUgw6AgMTE6MDEsIFlhbm4gRS4gTU9SSU4gdmlhIGJ1
aWxkcm9vdCBhIMOpY3JpdMKgOgpbLS1TTklQLS1dCj4gPiArCUAkKGNhbGwgTUVTU0FHRSwiU2Fu
aXR5IGNoZWNrIGluIG92ZXJsYXlzICQoY2FsbCBxc3RyaXAsJChCUjJfUk9PVEZTX09WRVJMQVkp
KSIpCj4gPiArCXN1cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJnZWQtdXNyLnNoIFwKPiA+ICsJCS0t
dHlwZSBvdmVybGF5IFwKPiA+ICsJCSQoY2FsbCBxc3RyaXAsJChCUjJfUk9PVEZTX09WRVJMQVkp
KQo+IEJSMl9ST09URlNfT1ZFUkxBWSBjYW4gaGF2ZSBhIGxpc3Qgb2Ygb3ZlcmxheSBkaXJlY3Rv
cnkuCj4gV2UgaGFkIGEgZm9yZWFjaCBsb29wIHRvIGNoZWNrIGFsbCBvZiB0aGVtLgoKRXhhY3Rs
eS4gTm93IHRoZXkgYXJlIHBhc3NlZCBhcyBhcmd1bWVudHMgdG8gdGhlIGNoZWNrLW1lcmdlZC11
c3Iuc2gKc2NyaXB0LCBzbyB0aGF0Li4uCgpbLS1TTklQLS1dCj4gPiArZm9yIHJvb3Q7IGRvCj4g
SSdtIG5vdCBzdXJlIHRvIGZvbGxvdyBoZXJlLgo+IFdoZXJlIHJvb3QgaXMgZGVmaW5lZD8KCi4u
LiB0aGV5IG5vdyBpdGVyYXRlZCBvdmVyIGJ5IHRoaXMgZm9yLWxvb3AuCgpXaGVuIHRoZXJlIGlz
IG5vICdpbicgcGFydCB0byBhIGZvciBsb29wLCBpdCBpdGVyYXRlcyBvdmVyIHRoZQpwb3NpdGlv
bmFsIHBhcmFtZXRlcnM6CgogICAgJCBjYXQgZm9vCiAgICAjIS9iaW4vc2gKICAgIGZvciBpOyBk
byBwcmludGYgJ2k9JXNcbicgIiR7aX0iOyBkb25lCgogICAgIyAuL2ZvbyBhIGIgYyBkCiAgICBp
PWEKICAgIGk9YgogICAgaT1jCiAgICBpPWQKClNvLCB0aG9zZSB0d28gbGluZXMgYXJlIGVxdWl2
YWxlbnQ6CgogICAgZm9yIGk7IGRvCiAgICBmb3IgaSBpbiAiJHtAfSI7IGRvCgpTZWUgc2VjdGlv
biAyLjkuNC4yIG9mIHRoZSBPcGVuIEdyb3VwIEJhc2UgU3BlY2lmaWNhdGlvbnMgSXNzdWUgODoK
ICAgIGh0dHBzOi8vcHVicy5vcGVuZ3JvdXAub3JnL29ubGluZXB1YnMvOTc5OTkxOTc5OS91dGls
aXRpZXMvVjNfY2hhcDAyLmh0bWwjdGFnXzE5XzA5XzA0CgpSZWdhcmRzLApZYW5uIEUuIE1PUklO
LgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cnwg
KzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8
ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0t
LS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3lt
b3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNv
bnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
