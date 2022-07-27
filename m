Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9717C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A8B44055E;
	Wed, 27 Jul 2022 13:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A8B44055E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9BpCAW8nPMe9; Wed, 27 Jul 2022 13:23:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 998444052F;
	Wed, 27 Jul 2022 13:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 998444052F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2190B1BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F03AE4052F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F03AE4052F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jL06oY7FtHXx for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:23:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11FEB4052B
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11FEB4052B
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:23:01 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 8-20020a05600c024800b003a2fe343db1so1005100wmj.1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EUmIzYhm2NSvD+XIguysu8jyH12Io8ishesAh09t9GQ=;
 b=Fb8/jQ5rqllRvNjv6csLlZQnpsdA2/TD9QHf9xc7cfF3eS4+XTg8VaqonL/fgMm37j
 9I0Hlb8c50eTXGVaeq/V5QguWfq4LkSvpgh9VQGuzuoiahL1zb8zw+yaBvFp0Y0Tx/Gc
 0hUwlReGtE2jGwNVDkmFn5aadMPkrtlscsaNsinTnFkHx0hhQKojSrz2x6XkDBx9K+N0
 b+lJlEbX28pDGD0Rmzb7wNw69kV4N6+9euYbbNA/k1eRIdtU2DOmuMOvstPssaudDGhK
 8zsKrAvH1iVVWOJuEjMZR5DlX5yURk4k+goo4j8FDQFVpwYkeE/7x/LzU13WbHa63cOB
 724w==
X-Gm-Message-State: AJIora/Aj0DcvQJQHza0NnBOdVdU7B2l+QET1TKStuKu7GdXJOelCZx0
 tCSWm2GLRJrl75/Hx18GwvF6Og==
X-Google-Smtp-Source: AGRyM1t0ZyGmv6LKSgIp7rMVbl4geAkK5ksWFQkGc04UbXOwSFIQjME9PTEYLS3vkMQ7AlgsM5tjiQ==
X-Received: by 2002:a05:600c:17d5:b0:3a3:576:21ba with SMTP id
 y21-20020a05600c17d500b003a3057621bamr3017858wmo.176.1658928180223; 
 Wed, 27 Jul 2022 06:23:00 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c191100b003a342933727sm3027225wmq.3.2022.07.27.06.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 06:22:59 -0700 (PDT)
Message-ID: <ba33b6d8-53e0-e3e0-4b37-de13643bc9a1@smile.fr>
Date: Wed, 27 Jul 2022 15:22:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
 <20220724054912.2354219-9-ricardo.martincoski@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220724054912.2354219-9-ricardo.martincoski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EUmIzYhm2NSvD+XIguysu8jyH12Io8ishesAh09t9GQ=;
 b=r4ocgnYS5ECDX2B9PyKQbP4gc7+uSWbJFMd/uaDELy0QVe3Nu+vifDUmA7Xd1R2g4V
 r3rw/TR31bwSMBPqGBmwRItz53+NYHWHDlx+dIxudz7omnAg2k1aqLFucL2MF9KVixSe
 Qk1ICkc8X9XiN43HMYphvPWQVnSaTGyLTkl6UFgQz9I0qCH099tm3Ss5fNOKEXAIlwdG
 roxaS6XE16Kn5GTEhII0zh/Zsc7ag9pk6vUYUUo5WYdap9wE5fRWPY6o9zPLlW2MrpHw
 c+CnBb8Nxq7XaSI8w6GUASlBqXY5FiHWGNL4AehyssR/j/lccC5g1k5vLY0WuF8ThYQP
 AqOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=r4ocgnYS
Subject: Re: [Buildroot] [PATCH 08/16] docs/manual: check-package before
 submitting patch
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmljYXJkbywKCkxlIDI0LzA3LzIwMjIgw6AgMDc6NDksIFJpY2FyZG8gTWFydGluY29z
a2kgYSDDqWNyaXTCoDoKPiBBZGQgJ21ha2UgY2hlY2stcGFja2FnZScgdG8gdGhlIGRlZmF1bHQg
d29ya2Zsb3cgb2Ygc3VibWl0dGluZyBwYXRjaGVzLAo+IGp1c3QgYWZ0ZXIgdGhlIHJlYmFzZSBh
bmQgYmVmb3JlIHVzaW5nIGZvcm1hdC1wYXRjaC4KPiAKPiBDYzogVGhvbWFzIERlIFNjaGFtcGhl
bGVpcmUgPHRob21hcy5kZV9zY2hhbXBoZWxlaXJlQG5va2lhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBSaWNhcmRvIE1hcnRpbmNvc2tpIDxyaWNhcmRvLm1hcnRpbmNvc2tpQGdtYWlsLmNvbT4KPiAt
LS0KPiAgZG9jcy9tYW51YWwvY29udHJpYnV0ZS50eHQgfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWFudWFsL2NvbnRy
aWJ1dGUudHh0IGIvZG9jcy9tYW51YWwvY29udHJpYnV0ZS50eHQKPiBpbmRleCBlNTg4YzY5YmU2
Li5jNTY1MmFmN2EwIDEwMDY0NAo+IC0tLSBhL2RvY3MvbWFudWFsL2NvbnRyaWJ1dGUudHh0Cj4g
KysrIGIvZG9jcy9tYW51YWwvY29udHJpYnV0ZS50eHQKPiBAQCAtMjk0LDYgKzI5NCwxMiBAQCAk
IGdpdCBmZXRjaCAtLWFsbCAtLXRhZ3MKPiAgJCBnaXQgcmViYXNlIG9yaWdpbi9tYXN0ZXIKPiAg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIAo+ICtOb3cgcnVuIHNvbWUgYmFzaWMgY2hlY2tzIGZv
ciB0aGUgY2hhbmdlcyB5b3UgY29tbWl0dGVkOgoKInNvbWUgYmFzaWMgY2hlY2tzIiBtYXkgYmUg
bm90IHJlYWxseSBtZWFuaW5nZnVsIGZvciBuZXdjb21lcnMuCgpJIHdvdWxkIGFkZCBhIHNtYWxs
IGRlc2NyaXB0aW9uIG9mIHdoYXQgY2hlY2stcGFja2FnZSByZWFsbHkgZG9lcy4KCkJlc3QgcmVn
YXJkcywKUm9tYWluCgoKPiArCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICskIG1ha2UgY2hl
Y2stcGFja2FnZQo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiArCj4gIE5vdywgeW91IGFyZSBy
ZWFkeSB0byBnZW5lcmF0ZSB0aGVuIHN1Ym1pdCB5b3VyIHBhdGNoIHNldC4KPiAgCj4gIFRvIGdl
bmVyYXRlIGl0LCBydW46CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
