Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A460C77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 01:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18BF040869;
	Fri, 28 Apr 2023 01:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18BF040869
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vxu5lUuN0NV9; Fri, 28 Apr 2023 01:45:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09FB740861;
	Fri, 28 Apr 2023 01:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09FB740861
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3B391BF316
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 01:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ACA14062E
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 01:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ACA14062E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mk4CWmJfC9sZ for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 01:45:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63F5C405FA
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63F5C405FA
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 01:45:10 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5050497df77so14207070a12.1
 for <buildroot@buildroot.org>; Thu, 27 Apr 2023 18:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682646308; x=1685238308;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YO2eFW4F8X32A+Fj+SSJN8PAgiccGQUTOqY56LAxUa8=;
 b=LpXWdoIXN1ddM1HKuq4G7i7PxHGZ9ENHDDerJeXaa82WRQBZzT4LltykJqupMOX6Mn
 1hYQERoQUt+DRUU+yz6XbOYqba0uTOm6l25AS6ODA2FPn6fQvgnwtyVEga1UxCUXCAiM
 NLveauTu57OwFjR/KhfOodsRRVB/akR9BVkeZuoPyKaznRRpMxiT+yFUkXM3+bWTFzmD
 fA6xB7TzjrjraQGlsMsQfBFoniU4QigYSiPXB9ojHkPZj3UKZYlGX1dviRJLyX45Fr7p
 MyH/lEZMlvPby+i7aGJrlHWuywdRo2gzYcSERMc7AXlPzrflto9gO6euAnNqOoC8agAa
 hXNA==
X-Gm-Message-State: AC+VfDwFfaP4mESkfBG4kbXL/uTVHD5bC+gU21PpWnx1bVXkeUmgyCSD
 +wNNU5xlyiaJNAQppKBHmgoAxf0WD9XYkgR860nsAg==
X-Google-Smtp-Source: ACHHUZ4yaFtZxhdUXKJ8+Oe8BbOW2vVJEZCJVRYmnJDKSAA929YpzjrN8Di+TyeIiYRa57KLEcfFfOiYp6ICu1W8EZw=
X-Received: by 2002:aa7:d9c6:0:b0:504:a248:3741 with SMTP id
 v6-20020aa7d9c6000000b00504a2483741mr3027052eds.14.1682646308350; Thu, 27 Apr
 2023 18:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230425171454.48802-1-aduskett@gmail.com>
 <20230425171454.48802-2-aduskett@gmail.com>
 <20230425230355.1c7b2cf5@gmx.net>
In-Reply-To: <20230425230355.1c7b2cf5@gmx.net>
From: James Knight <james.d.knight@live.com>
Date: Thu, 27 Apr 2023 21:44:57 -0400
Message-ID: <CALAjcgVuEF4p=SJwcS+Jv9KCL=u56-Mr4WDAcHhrhVJQQvc5+A@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v2 01/13]
 package/libglib2/0003-disable-building-docs.patch: new patch
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGV0ZXIsIEFkYW07CgpPbiBUdWUsIEFwciAyNSwgMjAyMyBhdCA1OjAz4oCvUE0gUGV0ZXIgU2Vp
ZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PiB3cm90ZToKPiBBcyBmYXIgYXMgSSByZWFkIHRoZSBt
ZXNvbi5idWlsZCBmaWxlcyBhbGwgYWN0aW9ucyBpbiBkb2NzL3JlZmVyZW5jZQo+IGFyZSBwcm90
ZWN0ZWQgYnkgdGhlIG9wdGlvbnMgJ2d0a19kb2MnIG9yICdtYW4nLCBpcyBkaXNhYmxpbmcgdGhp
cwo+IG9uZXMgbm90IGVub3VnaD8KCkdMSUIncyBIVE1MIChndmFyaWFudCkgZG9jdW1lbnRhdGlv
biB3YXMgbm90IGJvdW5kIHRvIHRoZSBgZ3RrX2RvY2Agb3IKYG1hbmAgb3B0aW9ucy4gVGhpcyBo
YXMgbm93IGJlZW4gYWRkcmVzc2VkIHVwc3RyZWFtIFsxXS4gVXNpbmcgdGhlCmV4aXN0aW5nIHBh
dGNoIG9yIHJlcGxhY2luZyBpdCB3aXRoIHRoZSB1cHN0cmVhbSBwYXRjaCB3aWxsCmZ1bmN0aW9u
YWxseSBhY2hpZXZlIHRoZSBzYW1lIHJlc3VsdHMuCgpbMV06IGh0dHBzOi8vZ2l0bGFiLmdub21l
Lm9yZy9HTk9NRS9nbGliLy0vY29tbWl0LzBmYTE3ZWMzYzcxNTJjZjBlMWNiZjk2NWFjZjE0MjZh
YzIwM2JiMWQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
