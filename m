Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8E1C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 20:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C02140911;
	Fri, 13 May 2022 20:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgqcxkIPfW_g; Fri, 13 May 2022 20:23:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6BB940494;
	Fri, 13 May 2022 20:23:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1ADB01BF3CD
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2E0460774
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6G2CRZcKJLI9 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 20:23:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7516D6076C
 for <buildroot@buildroot.org>; Fri, 13 May 2022 20:23:23 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id ba17so11245465edb.5
 for <buildroot@buildroot.org>; Fri, 13 May 2022 13:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uaNmwegxOwrZ36vR/zdpwiDlYuBFGfERux+rhpbOYu4=;
 b=fu9Gjm/HCBnIFhlxBw7EhPlpKfxdFPwC7wfUS47K2NaDfqtFD2hgcO4oYoOW4Bqsy+
 7vC9LAJQISOozPlnIzznbkM7D+Xg3f+HXL74PP7xzqKrt4FZs+scQEwK+x9EZZCIgiyB
 sm+yE3oku+Q9CHvgvYcS16KOG0MJB+1q4Nd8/ZGbODzBmZ4GmxFOYNiH0X36djwW8Pjt
 gO2dIoA+N/+UqpL8uKg4qz3BAKBsh8Foa/gyTiD6NjBQw8IEVx1OHPevQ6QAWxEoPKeI
 UNMZy58FQZODuXLgId9M7l3pVVpfggLSRiJe8z2HZTxWrC1/aQn97P1sqvaY4ABaA+FN
 oX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uaNmwegxOwrZ36vR/zdpwiDlYuBFGfERux+rhpbOYu4=;
 b=IgOuDkWJyNETK40RIcWrWlIeV0ldG3KPF8oSLUpA9iXq5c7qXT8YtdQ5RnTFgPnnt9
 Du9AFAsIc9OCAerUmWTb6lgBqT7Hf6W7iCXPjJpfT+abou63h7zEBujC5E/wxmWN9LOs
 T7vNZT02/dQqv0JoJ+cAkYS73eF0Zkyr1AFnJdT78baRfforQL7F/rR9PoH4EgSgk6Bw
 CzH40ERzql3s9NWVtUJ8kd7v59gQaYIzph9fdGNlXYczR621UyqP5kK6DlCu+bUUQcS6
 0A8dkjVHvwGmyiz3OAB0REuWWw5IJUXTxwbAX843g6hgVkUGBbTxZW9/c7qjcFFJhK7s
 DocQ==
X-Gm-Message-State: AOAM530btlpbsXDjUQZRbfDwVrUkR8OmkBghuS3DQKDuCIruQWWp9eJI
 lhU6JyDpsLuAGzNxqOtfoaYAaVjqdI9M0Q==
X-Google-Smtp-Source: ABdhPJxigjrS1DwwqP5IICw7OxJPV6P6LaeGUaEsnYJu0iq+c7gLToDHD9rjpHjcNNCyRpVH3ERPYw==
X-Received: by 2002:aa7:d454:0:b0:428:8fe8:b8cf with SMTP id
 q20-20020aa7d454000000b004288fe8b8cfmr432029edr.328.1652473401681; 
 Fri, 13 May 2022 13:23:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 j5-20020aa7c0c5000000b0042617ba63c7sm1292010edp.81.2022.05.13.13.23.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 13:23:21 -0700 (PDT)
Message-ID: <e5e36111-62dc-37bc-7123-206092a1d5dc@mind.be>
Date: Fri, 13 May 2022 22:23:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
References: <8c2fc8d9-5bc7-1982-35ed-1fc31e1bb470@mind.be>
 <7ce0c64f-bdf2-9712-836d-c2f8cee3b08f@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <7ce0c64f-bdf2-9712-836d-c2f8cee3b08f@smile.fr>
Subject: Re: [Buildroot] Article for the German Linux magazine
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
Cc: Jens-Christoph Brendel <jens-christoph.brendel@computec.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMy8wNS8yMDIyIDExOjAyLCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGVsbG8gQXJub3V0
LAo+IAo+IExlIDEzLzA1LzIwMjIgw6AgMTA6NDUsIEFybm91dCBWYW5kZWNhcHBlbGxlIGEgw6lj
cml0wqA6Cgpbc25pcF0KPj4gVGhlcmUgYXJlIHNvbWUgcHJvamVjdHMgdGhhdCB1c2UgYnVpbGRy
b290IHRvIGJ1aWxkIGEgbW9yZSBtYW5hZ2VkIChhbmQgdGh1cwo+PiBsZXNzIGZsZXhpYmxlKSAi
ZGlzdHJvIjogU2tpZmZPUywgZGFobGlhT1MsIEJhdG9jZXJhIExpbnV4LCBIb21lIEFzc2lzdGFu
dAo+PiBPcGVyYXRpbmcgU3lzdGVtLgo+IAo+IEl0IHdvdWxkIGJlIG5pY2UgaWYgd2UgY2FuIGFk
ZCByZWNhbGJveCBwcm9qZWN0IGluIHRoaXMgbGlzdCA6KQo+IAo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9yZWNhbGJveC9yZWNhbGJveC1vcwoKICBBaCwgSSB0aG91Z2h0IHRoYXQgdGhhdCBvbmUgd2Fz
IHN1cGVyc2VkZWQgYnkgYmF0b2NlcmEsIGJ1dCBhcHBhcmVudGx5IGJvdGggCmFyZSBzdGlsbCBh
Y3RpdmUuIEknbGwgYWRkIGl0LgoKICBSZWdhcmRzLAogIEFybm91dAoKW3NuaXBdCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
