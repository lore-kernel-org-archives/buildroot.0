Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28E2C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:51:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 731B861078
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 731B861078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2803460842;
	Fri,  6 Aug 2021 20:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 77LrBzc6wOjv; Fri,  6 Aug 2021 20:51:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65BC6607DD;
	Fri,  6 Aug 2021 20:51:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 593941BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 463174010C
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6eZx8-9VZ0Ju for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 20:51:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBB42400BF
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 20:51:42 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id oz16so937218ejc.7
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 13:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=uytwwFUAf2RyZGX11Atpi6hNnLv4caCh/BgzA/Fgdts=;
 b=h3nYsajBsF2awwQ8G2jrYROEDOKl4npZrNfU+hRXShQQ0NNFakZ9hBA+SnH2vP2JGx
 TIEpllfwAx03ZoMNxI+JmbZYhnZY/p/F9sEo8wfFmDUD/02JgJPBX2YCqLf3x5YQP8qZ
 XTB0pGBrGMWIb+KibDQa0YJx/TS5Sq/gHex2/4VI1qaTfDsYt1dsKK25KXS01GrD/sI1
 Tt3TZFAPa0kAnuWH3jd+WxrsEdvsdUf/2riwBpy/gbfNVVwR41bQZNOWhQ+zk4Kxi8hm
 7WiyR6fqwdta2se/Ko2TNtt+X91LbtXyPa0IVaRwdcATAmDY5IVt4bjHXjifF960k55n
 Xn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=uytwwFUAf2RyZGX11Atpi6hNnLv4caCh/BgzA/Fgdts=;
 b=i2fQ8sPeg3QnqFA9BLS9thKvOke4Wmk1ObZMhfKdhTldyl7R8xkVaXmuyjPt6lovK/
 EqXgEKhbutL80knZitiEFgIGMhviYBxoPArDerRVcYe3Zx79pZw48F5FP478800w79We
 xjUfm3hmoAGcLRBBA9hZhRGtTiEFSjwgkL0N/dhYfsI+e5x4DVl9npTFYpRY1GK2Gy4D
 Vl2dYS8ik9+VC5EZgtjBZSYHgEg3p7EDKsfuhSgHnHU1yINeDNCeDAPg9YoBwP1wQ1iA
 oAJXUrylxZOf7Tw61pJ9ynSubG+LX+bnjeYWDwmq7QuGvgM/+SMMFegRrieLlUstSJI9
 VVGQ==
X-Gm-Message-State: AOAM533BbTOpFN//rMqIraFFlmzk1H3cOdupI8jNEZ3fr5oer5HJh/oP
 qlfpAt0afXqworBIt1hlsEc=
X-Google-Smtp-Source: ABdhPJwUNzY8hvQuOuXpFhoNb4HBdcFlJwupcSq0FnDrGpcu3WQ3jDNaaJTdsg5oeQl8+QssVaKubQ==
X-Received: by 2002:a17:906:4751:: with SMTP id
 j17mr11760688ejs.39.1628283101163; 
 Fri, 06 Aug 2021 13:51:41 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id n17sm4308674edr.84.2021.08.06.13.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 13:51:40 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mC6oe-0002dl-0N; Fri, 06 Aug 2021 22:51:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@paral.in>
References: <20210729224949.394669-1-christian@paral.in>
Date: Fri, 06 Aug 2021 22:51:39 +0200
In-Reply-To: <20210729224949.394669-1-christian@paral.in> (Christian Stewart's
 message of "Thu, 29 Jul 2021 15:49:49 -0700")
Message-ID: <87im0iguuc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump version to
 1.16.6
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Pj4+Pj4gIkNocmlzdGlhbiIgPT0gQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBwYXJhbC5p
bj4gd3JpdGVzOgoKID4gVGhlc2UgbWlub3IgcmVsZWFzZXMgaW5jbHVkZSBhIHNlY3VyaXR5IGZp
eCBhY2NvcmRpbmcgdG8gdGhlIG5ldyBzZWN1cml0eSBwb2xpY3kgKCM0NDkxOCkuCiA+IGNyeXB0
by90bHMgY2xpZW50cyBjYW4gcGFuaWMgd2hlbiBwcm92aWRlZCBhIGNlcnRpZmljYXRlIG9mIHRo
ZSB3cm9uZwogPiB0eXBlIGZvciB0aGUgbmVnb3RpYXRlZCBwYXJhbWV0ZXJzLgogPiBuZXQvaHR0
cCBjbGllbnRzIHBlcmZvcm1pbmcgSFRUUFMgcmVxdWVzdHMgYXJlIGFsc28gYWZmZWN0ZWQuIFRo
ZQogPiBwYW5pYyBjYW4gYmUgdHJpZ2dlcmVkIGJ5IGFuIGF0dGFja2VyCiA+IGluIGEgcHJpdmls
ZWdlZCBuZXR3b3JrIHBvc2l0aW9uIHdpdGhvdXQgYWNjZXNzIHRvIHRoZSBzZXJ2ZXIKID4gY2Vy
dGlmaWNhdGUncyBwcml2YXRlIGtleSwgYXMgbG9uZyBhcyBhIHRydXN0ZWQKID4gRUNEU0Egb3Ig
RWQyNTUxOSBjZXJ0aWZpY2F0ZSBmb3IgdGhlIHNlcnZlciBleGlzdHMgKG9yIGNhbiBiZSBpc3N1
ZWQpLAogPiBvciB0aGUgY2xpZW50IGlzIGNvbmZpZ3VyZWQgd2l0aAogPiBDb25maWcuSW5zZWN1
cmVTa2lwVmVyaWZ5LiBDbGllbnRzIHRoYXQgZGlzYWJsZSBhbGwgVExTX1JTQSBjaXBoZXIKID4g
c3VpdGVzICh0aGF0IGlzLCBUTFMgMS4w4oCTMS4yIGNpcGhlcgogPiBzdWl0ZXMgd2l0aG91dCBF
Q0RIRSksIGFzIHdlbGwgYXMgVExTIDEuMy1vbmx5IGNsaWVudHMsIGFyZSB1bmFmZmVjdGVkLgoK
ID4gVGhpcyBpcyBDVkUtMjAyMS0zNDU1OC4KCiA+IFZpZXcgdGhlIHJlbGVhc2Ugbm90ZXMgZm9y
IG1vcmUgaW5mb3JtYXRpb246CgogPiBodHRwczovL2dvbGFuZy5vcmcvZG9jL2RldmVsL3JlbGVh
c2UuaHRtbCNnbzEuMTYubWlub3IKCiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGV3YXJ0
IDxjaHJpc3RpYW5AcGFyYWwuaW4+CgpDb21taXR0ZWQgdG8gMjAyMS4wNS54LCB0aGFua3MuIEZv
ciAyMDIxLjAyLnggSSB3aWxsIGluc3RlYWQgYnVtcCB0bwoxLjUuMTUsIHdoaWNoIGNvbnRhaW5z
IHRoZSBzYW1lIGZpeGVzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
