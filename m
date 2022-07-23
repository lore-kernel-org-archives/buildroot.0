Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9924BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 338534242B;
	Sat, 23 Jul 2022 16:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 338534242B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dvRJtRxeZ429; Sat, 23 Jul 2022 16:57:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BADAE42427;
	Sat, 23 Jul 2022 16:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BADAE42427
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4332B1BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CC1984BED
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CC1984BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z858tbJtq41d for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:57:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4996084BDB
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4996084BDB
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:57:02 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 w8-20020a05600c014800b003a32e89bc4eso4040388wmm.5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 09:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8EfwwBR6FnYUlD35WO5bS0jRlJTFC2WY9nVtHu0PeZo=;
 b=GASX765ZeXS/w/vMscOgChXJf/Rk6bmjBtKazPdkdvXHXWjYh1Rgvulwsdrlap6s7j
 5voIxfj8SvKzXy3/OEhZBXiGIhSMEp3dYFi/TfyedH2OsOJpsohDaIVHEt9WGveY7d9u
 dmAZl+3E/41j7LkYrmwTeZyQPE9siEeRtZI0PlEZwG2sZeTzHMCiSQgHdlNUidfo++KR
 Q8Q1TDftkw+dY5fQ817WGBdhgRKlJyvA48enAQ/zQgddoY+6KdRrn4BJJO2dm6AaSQ4B
 1jZxv7quAw5rGHHPKY7E3lqRM5z73yv6OzKKR2kyvVgsIy87BnyJY95ZkYo+pT5SeCEz
 eJtw==
X-Gm-Message-State: AJIora8fa/EjoJzpem2avA+gawr/OSTZaj43emLNnaUsABN1CYfNNN4q
 KizwkqG/lvkIpUdNc5qxsGOXaw==
X-Google-Smtp-Source: AGRyM1sAT/18/c31OpXd0ArgwTcaQmGHosVdVIWRZ4kMDKspV2cud8+nAhjfa9Lz4Y3k9nGOnR0gnQ==
X-Received: by 2002:a05:600c:19cc:b0:3a3:10bd:9211 with SMTP id
 u12-20020a05600c19cc00b003a310bd9211mr3374131wmq.106.1658595420410; 
 Sat, 23 Jul 2022 09:57:00 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 z4-20020adfd0c4000000b0021d7b41255esm7317077wrh.98.2022.07.23.09.56.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 09:57:00 -0700 (PDT)
Message-ID: <713caf65-1c3c-f1e0-90c5-a2ee598d5f53@mind.be>
Date: Sat, 23 Jul 2022 18:56:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
References: <20220615171218.1032413-1-raphael.melotte@mind.be>
 <20220615171218.1032413-2-raphael.melotte@mind.be>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220615171218.1032413-2-raphael.melotte@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8EfwwBR6FnYUlD35WO5bS0jRlJTFC2WY9nVtHu0PeZo=;
 b=PbXFuuz8246lq4RwL/nEcnrBywsD35VVYpyGyHSp0wsFqHW2iykl+Mszf6bl5/RDUK
 yasQiSJo/EPWpZR30ZPsBMMX+mXI36UOdtUaEJWnKsKQhMTxOIpJjbudkjO4Fh44En5E
 LeiuppjfgWMPAxj25sO+nqNadb8rgwjqyJCYK3uYkutlH0mA9VKlJFj6ZiFfHquEEYYT
 kfmehxIBdjFjT8KTesAjXlxOqG7zrEJdRazPqVt6u0iRSv3luxkdhmpw5CafUvxMoSi0
 rjKMqqsyoYw91nmeOHuJGNec//O5/mossIlHldPvFpPUMug933/hHjmGriJNMt9WdEDr
 jx/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PbXFuuz8
Subject: Re: [Buildroot] [PATCH 2/2] package/python-botocore: bump to
 version 1.27.8
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNS8wNi8yMDIyIDE5OjEyLCBSYXBoYcOrbCBNw6lsb3R0ZSB3cm90ZToKPiBTaWduZWQt
b2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CgogIEFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAg
cGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9jb3JlLmhhc2ggfCAyICstCj4gICBw
YWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRob24tYm90b2NvcmUubWsgICB8IDQgKystLQo+ICAg
MiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5oYXNoIGIv
cGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9jb3JlLmhhc2gKPiBpbmRleCA5ZDVm
NzA2ZmVmLi5iYjgwNmZlMjUxIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWJvdG9jb3Jl
L3B5dGhvbi1ib3RvY29yZS5oYXNoCj4gKysrIGIvcGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0
aG9uLWJvdG9jb3JlLmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAgICMgc2hhMjU2IGZyb20gaHR0
cHM6Ly9weXBpLm9yZy9weXBpL2JvdG9jb3JlL2pzb24KPiAtc2hhMjU2ICAwMTEzNjBlNzlhNGI4
NDNhYTY1OTE1NzNjZmE2MWU4ZWRkYzk5YjkxYWRhYjFkZmRiOWEyYjdmMmM4NTExMTkzICBib3Rv
Y29yZS0xLjIyLjIudGFyLmd6Cj4gK3NoYTI1NiAgZGI2NjY3YjhkZmQxNzVkMTYxODc2NTM5NDJj
ZDkxZGQxZjBjZjM2YWRjMGVhOWQ3YTA4MDViYTRkMmEzMzIxZiAgYm90b2NvcmUtMS4yNy44LnRh
ci5nego+ICAgIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiAgIHNoYTI1NiAg
MGQ1NDJlMGM4ODA0ZTM5YWE3ZjM3ZWIwMGRhNWE3NjIxNDlkYzY4MmQ3ODI5NDUxMjg3ZTExYjkz
OGU5NDU5NCAgTElDRU5TRS50eHQKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYm90b2Nv
cmUvcHl0aG9uLWJvdG9jb3JlLm1rIGIvcGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJv
dG9jb3JlLm1rCj4gaW5kZXggMTYyOGUwNTU2Mi4uNDU5ZWVmZWFiMSAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRob24tYm90b2NvcmUubWsKPiArKysgYi9wYWNrYWdl
L3B5dGhvbi1ib3RvY29yZS9weXRob24tYm90b2NvcmUubWsKPiBAQCAtNCw5ICs0LDkgQEAKPiAg
ICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtUFlUSE9OX0JPVE9DT1JFX1ZF
UlNJT04gPSAxLjIyLjIKPiArUFlUSE9OX0JPVE9DT1JFX1ZFUlNJT04gPSAxLjI3LjgKPiAgIFBZ
VEhPTl9CT1RPQ09SRV9TT1VSQ0UgPSBib3RvY29yZS0kKFBZVEhPTl9CT1RPQ09SRV9WRVJTSU9O
KS50YXIuZ3oKPiAtUFlUSE9OX0JPVE9DT1JFX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhv
c3RlZC5vcmcvcGFja2FnZXMvMGQvOTUvZjJlNzRlNGE5MTk5NGQ5ZWJlNDU3NDZmNzVhOGM1Y2Fm
ZDcyM2E4ODI3MGE5NzcyZDhkNjZlMWE4YmExCj4gK1BZVEhPTl9CT1RPQ09SRV9TSVRFID0gaHR0
cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2QxL2IwL2VhOTI3MDNiYmJmODIz
NTNkNTcxNjM2ZmU2Njk3YjE2MmMzODgxNTc2OTg2ZDY0NzQxMTlkMDNmY2U1Mwo+ICAgUFlUSE9O
X0JPVE9DT1JFX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4gICBQWVRIT05fQk9UT0NPUkVfTElD
RU5TRSA9IEFwYWNoZS0yLjAKPiAgIFBZVEhPTl9CT1RPQ09SRV9MSUNFTlNFX0ZJTEVTID0gTElD
RU5TRS50eHQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
