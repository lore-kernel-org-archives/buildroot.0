Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04D5C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 21:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D7CB8223E;
	Thu,  9 Mar 2023 21:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D7CB8223E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3c0T2n_2egYn; Thu,  9 Mar 2023 21:19:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8410282240;
	Thu,  9 Mar 2023 21:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8410282240
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 713291BF366
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A94D405CE
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A94D405CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LhlPOML705IY for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 21:19:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 242AC404F8
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 242AC404F8
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 21:19:30 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id ay14so12445160edb.11
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 13:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678396769;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3rFVeouzWrqUWnNFjAsM6sC/6YnO327wIDLBSq6tpOU=;
 b=G9SFgQ5MwPZrQxKJnUeEYZ+ab4LyQFo8ve3oCEobPgqwBcKaO1eRPgpI4IQZDcJmg8
 1gBEWP6Hu9K4gPK+Eg8veFyKp7axmYjCQtziDlf606okWcMH9qHaE3MBUL4HZt3Io02M
 dheuNEuBNQsewmHeYLJDtK1Kq9zLyVFVx8yXO1lUN7bc+0JyZqm1PvNZcXSImW7gIWO/
 JsERkidV0q3Av9gYfmKIqC0vvQfek+N25yORq+ZG1IJzSZxMjtEe7pP5Vd8CRyyg3kmt
 lEenOHHVkmFdTf3RpZM52AGJ3nHwFzyPBhKHBNzNq2Lqd871Y1acOQXDa9J/i93tyUVQ
 RFWA==
X-Gm-Message-State: AO0yUKXduA5Pe7BuqOS9kl4AVWxzleU32P9Skl+eVuEx+h9IPNtzW2HJ
 sgudSbKjqGpdDa0fQTRU2ZT6LbDui7iPJ0IdLs4=
X-Google-Smtp-Source: AK7set9P9RJWWDqg84/Cgfr7yb+FGguZe5PjGXd/iWpmjj70eMOtgfO6VbF+HvogUdgbzY54TZW7eA==
X-Received: by 2002:a17:906:fcb9:b0:8b2:7564:dfd7 with SMTP id
 qw25-20020a170906fcb900b008b27564dfd7mr22653577ejb.61.1678396768970; 
 Thu, 09 Mar 2023 13:19:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a1709060d9400b008c607dd7cefsm29700eji.79.2023.03.09.13.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 13:19:28 -0800 (PST)
Message-ID: <a7af8cfb-2211-de0c-03da-8d52efc7b36c@mind.be>
Date: Thu, 9 Mar 2023 22:19:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB04934E635705A3395768AC0A9FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <b4b828db-5892-d4be-c80a-0c00d7c52d61@mind.be>
In-Reply-To: <b4b828db-5892-d4be-c80a-0c00d7c52d61@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678396769;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3rFVeouzWrqUWnNFjAsM6sC/6YnO327wIDLBSq6tpOU=;
 b=VIRFPZ6wiTvJmLnkOOwGyiSWXyRjvefSm+pgoczne1QVpS+juA84xQ+1EavizXWebs
 GNeOu/5dULYCB8xhHJ6+Dg6z28e/cINZTqZMn5p688f8kCi3Gu3VzH7tloZk8lrt6D69
 g3DtaFSKYoq1dBDeOj05ENsR6PesmWu3izep+emAPRQY6iz1b2MQe0KadcGYi76ItBsI
 r99EZWrjskYNhXCE4e6Xq6Nf92GiTlhubLk1yWiLEdOnd1rcDSgfCFrXW9yWnZMIB502
 +onOcqh/8QpI+cWqmonfsDvt6CHMWGKO62Jr1HgBSAU2Id0gcQhgCr3phWWVKGxllaa9
 pY5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VIRFPZ6w
Subject: Re: [Buildroot] [PATCH 3/6] package/atkmm2_28: new package
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
Cc: "james.knight@collins.com" <james.knight@collins.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA5LzAzLzIwMjMgMjE6NTgsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAyNC8wMi8yMDIzIDA5OjQyLCBMYW5nIERhbmllbCB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiB8
KyBUaGlzIGlzIHRoZSBsYXN0IHZlcnNpb24gYmVmb3JlIHRoZSBBUEkgYW5kIEFCSSBjaGFuZ2Ug
KyBpbnRyb2R1Y2VkIGluIAo+PiAyLjM2LjAgd2hpY2ggcmVxdWlyZXMgQysrMTcufAo+Cj4gwqBU
aGlzIHNvdW5kcyBsaWtlIHdlIGNvdWxkIHVzZSAyLjM0LjAgaW5zdGVhZCBvZiAyLjI4LjAuIFdo
eSBkaWQgeW91IGNob29zZSAKPiAyLjI4LjA/CgogwqBBIHRpbnkgYml0IG9mIHJlc2VhcmNoIHNo
b3dzIHRoYXQgdGhlcmUgbmV2ZXIgd2FzIGEgMi4zMCwgMi4zMiBvciAyLjM0IHNlcmllcy4gCkkg
ZG9uJ3Qga25vdyB3aGF0IGtpbmQgb2YgdmVyc2lvbmluZyBzY2hlbWUgdGhlc2UgcGVvcGxlIGFy
ZSB1c2luZy4uLgoKCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
