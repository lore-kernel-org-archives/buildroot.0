Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819DAC001DC
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 01:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0CAB409A2;
	Mon, 24 Jul 2023 01:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0CAB409A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kjwYuhJCmK1z; Mon, 24 Jul 2023 01:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDB40409A7;
	Mon, 24 Jul 2023 01:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDB40409A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BDA91BF4DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 01:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F30D24047C
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 01:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F30D24047C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N381PgGF5Nw8 for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 01:04:56 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 008C0401F3
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 01:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 008C0401F3
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51d95aed33aso5377471a12.3
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 18:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690160694; x=1690765494;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G1YVcgl5wdtX+WMYpBu6kk4vvMwOQh5ixzpC2bGr6t8=;
 b=g05zqh+Amg8Xp4iaLOyFYWBAbCb0SND503vt9gvzjfmNslfMQBzR6DVIWkGww1u5J/
 QIvh9GG+FwWe+bHhhcFkQu7M6wF1ZiEecNy7f2Dc3Z4LA6df7do5kUViEdF40A2x0oMz
 J4e8Sk8G0FRSL3QYGir9Mh2uAD4UYxOqKuzf43V2XPe99Y2sjsKE9STJoQ+fj8xud1bV
 MMJHGMpCOOah4mFSOtI46tVXjpxP+COn/00Np/utuugL5ILQVSIKUukdo4mwmeSPwjJK
 4c/mJDnm0zX4bV0VzqYeJ4MEA6ZlVEK+OPOldA38qNuimtweSnYrLv79PM02eOr849hv
 Frqg==
X-Gm-Message-State: ABy/qLZ55FcRTM3fpEn5Xosc7IJwqYxnMPkNsFQ+AlVLCrsOzbo6hDnD
 0/cKhhszIajylmtELG0ohOiHIFcV6uT4SBd6KIoCrA==
X-Google-Smtp-Source: APBJJlEIhhcqmhBgatXyt6XVFWD50TaRZynjikvg34AblI/fgMGcxcIEudAZvgE5wUEhQLR6Hj1LrA==
X-Received: by 2002:a17:906:cc16:b0:992:d013:1132 with SMTP id
 ml22-20020a170906cc1600b00992d0131132mr7777460ejb.1.1690160693644; 
 Sun, 23 Jul 2023 18:04:53 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42]) by smtp.gmail.com with ESMTPSA id
 z20-20020a170906241400b00992d8aa60b0sm5918423eja.63.2023.07.23.18.04.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 18:04:52 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-99454855de1so567295666b.2
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 18:04:52 -0700 (PDT)
X-Received: by 2002:a17:907:761a:b0:99b:5ba6:f2cf with SMTP id
 jx26-20020a170907761a00b0099b5ba6f2cfmr8432168ejc.26.1690160691833; Sun, 23
 Jul 2023 18:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230721213121.178783-1-romain.naour@gmail.com>
 <20230722232630.1c759813@windsurf>
In-Reply-To: <20230722232630.1c759813@windsurf>
Date: Sun, 23 Jul 2023 18:04:40 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qhnFzK8WQOVQNi=etMhKyg=hFhyBcRHPu7NYg5S=kjWA@mail.gmail.com>
Message-ID: <CA+h8R2qhnFzK8WQOVQNi=etMhKyg=hFhyBcRHPu7NYg5S=kjWA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690160694; x=1690765494;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G1YVcgl5wdtX+WMYpBu6kk4vvMwOQh5ixzpC2bGr6t8=;
 b=gi3HlDwWmeBIROR4bD2rTYsxCkpD8Ku/JqLadICI8GXGcobI39It/0HSXdWcsz4G8x
 MotNKhzjru+Gfpq6UpZaZZAnPJidV55ayfXOrqhJKQLsrwneSqHmOfIvScrAsr4UTFff
 5OHIpef/x+iv31lVgBFxOt5zC8TkIaoa+NXvAc+77g3TQ+GI2jUNdEl5chojAW82zY1D
 oz5M8ZYIHtmyBcMTLXk/2odPsLtfNY648TcDjW1mkwNYnVh/M73+l1Kw7ueQhnAIxu6h
 K2jcBmZBDGx6Gr6UYRX9of8EVn7ZzN7fXf49uLrKtgD9opgxpcvRKMGAJIDlY/2qsZRx
 S+Zw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=gi3HlDwW
Subject: Re: [Buildroot] [PATCH] package/util-linux: bump version to 2.39.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBSb21haW4sCgoKT24gU2F0LCBKdWwgMjIsIDIwMjMgYXQgMjoyNuKAr1BNIFRob21h
cyBQZXRhenpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gUmV2
ZXJ0aW5nIDQ5MDg4MmFkYTk0Y2Y5OGRhMTQ1ZmViNGU3ZTQ3MzAyYWEzMTEwNGYgYWxsb3dzIHRv
IHBhc3MgVGVzdERvY2tlckNvbXBvc2UuCj4KPiBDaHJpc3RpYW4sIGNvdWxkIHlvdSBoYXZlIGEg
bG9vayBhdCB0aGlzIGlzc3VlPwo+Cj4gSW4gdGhlIG1lYW4gdGltZSwgSSBoYXZlIGFwcGxpZWQg
Um9tYWluJ3MgcGF0Y2gsIHdoaWNoIGlzIG5lZWRlZCAoYnV0Cj4gbm90IHN1ZmZpY2llbnQpIHRv
IGZpeCBUZXN0RG9ja2VyQ29tcG9zZS4KClRoZSBUZXN0RG9ja2VyQ29tcG9zZSB0ZXN0IG5vdyBj
b21wbGV0ZXMgc3VjY2Vzc2Z1bGx5IGZvbGxvd2luZyB0aGUKbWVyZ2Ugb2YgR28gMS4yMC54CgpU
aGFua3MsCkNocmlzdGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
