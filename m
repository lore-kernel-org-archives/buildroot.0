Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3958FEF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0232761395;
	Fri, 13 Feb 2026 19:38:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9J5nfFQXQyUk; Fri, 13 Feb 2026 19:38:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 133506158D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011487;
	bh=vr05M1cjTQ+GluaGKVeT2/eAD0w/+DqVrbavRPMEw98=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EMehYo037nlRb1SRW1g7XPiPi2QmRep1POJFfBFiV6TOl0eFc2JnHaWKCe/zjxMjb
	 nhHIZJAAXbfkKcueIKwJ0TUTrt0wZtD66fqmn4ogGL7KqyAkJj8Hdbi0dnZDPRG0BY
	 azcu4NkjQU99J40BeEua8JWXKIEpVcLz7iJp5nVMv31AQfgHQJh0Fc7TVD1K5QiRea
	 SnY2mFK9acmyvkPg+ykf12H1KsViEiK6gLkKD51/9psOvUbi5xOrOo0LitIqwqqB/u
	 IMOK+lulYDmqwYbMltGVWrNpQ4U1qfICcUG2f/ZDAlDeUyexlM7rq2gAYRTquwD6Am
	 QQETj7OE6KmHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 133506158D;
	Fri, 13 Feb 2026 19:38:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AE59EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FD0461505
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAze7pFnXHz7 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 44BE96154A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44BE96154A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44BE96154A
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-481188b7760so11442375e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011441; x=1771616241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yLaEpXR/0tGE95miKKad1detRHpN1Xe18Lb/a7Yjx8Y=;
 b=ETvN5EMYxZAAjJ907edRFIMB76rnwtJG94AheW1eBA/4Ba26qQyds57foYaBuh5DpQ
 BsPK37e+CKeNLWBI3BUBngfZ49SyPEZgetH6hIRokztPH7DzD1LfUYwZsJCyYrj4hauU
 gGxUXlkF3k0zHbPiLC0X4jAMwclZLQgct23SHNZ0INV0zJJJ0gfAKgkqEoaj0t5vf6He
 lSe/8JewCeBFkUSr9fLJR611dy4oStCsaAnxXTn2eR/xKIVJ9GLK09OFGAYB2/ejRMka
 3m13W29r5YiAQ/0TjOr1EU2fQAmnAUYCf1bUgJzL+fSWrSqUEbMxN1hciFPyzajMGP1i
 3DUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMTn6mlt8n35OEvS05f0fRbEzmz1n0IezhHPBFF5NqqXQhD/UFsko28qgYhkHZZz5QmuBab0sGbvI=@buildroot.org
X-Gm-Message-State: AOJu0YzL5LpEt6PtIt+yn3iAl9OsJSx55av7pQz4O63OX3ZaNg6AmOqD
 83wk61MG2T0OTzazeUX0VhoDTj7N1QTi4mTJSSIjWM49M65LNKpn/ipWdwqXkXzny+UFeldYQFD
 xVNYR
X-Gm-Gg: AZuq6aI8w2YTgg1/Fb1F89E/OiWkzIRanxx1y9SMLiDp1MjJGSq6SHX/JL7/kaS2Y+w
 UBQidX35eZc8vRkzFAesxydamDC0+/6BZ1AR3JJc8dbACG3ORLtenXpW3LPIeBK31lguZD3BOpy
 bXvkQ/HbFHVNxrzEJzZ8GBAlBJ7B0PJVGFOlAKWrjRYimygq0c54E8phcmDVExafDRHcsoIijTU
 38hLmtJRNFkMlAg3FC9OhgSCJkrhQgPuZy3LyIv+1Jc5emfkLagOV4vmy8XxO2MujzcDs6nagV7
 q6vYx42kL6GaGH/pc+JDexi/zWZ9z67F5cDlIo7A+3GCBWlmK7bkSd4EZZDBLEAZKfg26cnFqn6
 u+V9XIgy+1hFVgOceN3KprmL0sybELstOOe+qbMMnJrLnVLaX1xJ4q75nn3jfVDgVBv6PIuxchd
 XGDIAFUoc71Lz0OxA=
X-Received: by 2002:a05:600c:458a:b0:479:2f95:5179 with SMTP id
 5b1f17b1804b1-48373a0c663mr45052275e9.15.1771011441272; 
 Fri, 13 Feb 2026 11:37:21 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4836aa0847asm163753385e9.3.2026.02.13.11.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:21 -0800 (PST)
To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:18 +0100
Message-ID: <20260213193720.39025-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250801150722.4003476-5-raphael.melotte@mind.be>
References: <20250801150722.4003476-5-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011441; x=1771616241; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yLaEpXR/0tGE95miKKad1detRHpN1Xe18Lb/a7Yjx8Y=;
 b=fxHpOKHik1Wyhd4CTEmuw5SEIHnR8hFJ9Q1HBaT0PXNzKmn9Tx8q06PmkzMLxbjvjO
 5OF/XU66W5y87Cse6WnAF6YFIryoHcKTI+CmSwY5N2w4w6Ui1GKI6emccDOkIlVPTdoI
 m+rsyyNmliu3BIRlAi1k09HtO/rHgURVCdvq1bVyVBIi6/PxAn0mQ1hCiSIO6Opgo34N
 fqgNckXuU/41e5BB38skPNawNS5x1aHKJtMF0zxhl+5ZxLFMruQJn6qW3zPT+002N2LE
 grv6KATzwbhh55nxJBDTu9tx+zNg2j5488SDWJfhyrjv+mpguEbOpa8qBrfmIcc+CPPo
 +JYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fxHpOKHi
Subject: Re: [Buildroot] [PATCH 4/6] package/mupdf: update release hashes
 comment
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gVGhlIG9sZCBVUkwgbm93IGxlYWRzIHRvIGFuIEhUVFAgNDA0IG5vdCBm
b3VuZCBlcnJvci4KPiBVcGRhdGUgaXQgdG8gdGhlIG5ldyBvbmUgd2hpY2ggY29udGFpbnMgdGhl
IGhhc2hlcyBmb3IgdGhlIGN1cnJlbnQKPiByZWxlYXNlIGFzIHdlbGwgYXMgb2xkZXIgb25lcy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1p
bmQuYmU+CgpBcHBsaWVkIHRvIDIwMjUuMDIueCAmIDIwMjUuMTEueC4gVGhhbmtzCgo+IC0tLQo+
ICBwYWNrYWdlL211cGRmL211cGRmLmhhc2ggfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL211cGRm
L211cGRmLmhhc2ggYi9wYWNrYWdlL211cGRmL211cGRmLmhhc2gKPiBpbmRleCA1ODAyMzVlZWNh
Li44MGRlNmYzYjJjIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbXVwZGYvbXVwZGYuaGFzaAo+ICsr
KyBiL3BhY2thZ2UvbXVwZGYvbXVwZGYuaGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+IC0jIEZyb20g
aHR0cHM6Ly9tdXBkZi5jb20vZG93bmxvYWRzL2luZGV4Lmh0bWw6Cj4gKyMgRnJvbSBodHRwczov
L211cGRmLmNvbS9yZWxlYXNlczoKPiAgc2hhMSAgZDc5NjAwYmNjZDcwYWI5ZDBlOGVlMTlkYWU0
ZTI3NWYyYWY5NWNlZCAgbXVwZGYtMS4yMy45LXNvdXJjZS50YXIubHoKPiAgCj4gICMgTG9jYWxs
eSBjb21wdXRlZDoKPiAtLSAKPiAyLjM0LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
