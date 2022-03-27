Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE613C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 790584099D;
	Sun, 27 Mar 2022 15:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LcaCH0Xoqaqe; Sun, 27 Mar 2022 15:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DB08409A6;
	Sun, 27 Mar 2022 15:40:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3CE1BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C69560E2E
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IUuVrznlgJHX for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:40:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DAC360E27
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:40:45 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id p15so23995616ejc.7
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=CwfJLHuZhZbZHfyo37QqDnI8FKSPLwxHIFS4F1NNhs4=;
 b=A1G31sJRlkpgf44qwKeEFbO3EyeeDKzR9h5RmhacIfOAYwLeRfTIUIdl0oLEWg/Deo
 st8hQvn1OAQ0eJDhib2yINHWVuUCzaEaQHobAhc/XnLdwXuh+jmN0omUDI0pGCI+jZ3E
 tsUr9yCllZCjdLFn8ZFRFyeogeafTn2KzzFJboSynAPUMJA9ktnhdrckLuJ+8nMb6fmZ
 s486HM83eHUJi+4rrKnXtr+zWMxGon7P16KhXh/7BQcHPmlkzoCNxT+rORw3rP2u3M5y
 UfN8asbRt7L/e/GwfkG/aTcIrZjE52OZ357URuoCB3+v+Ay9lq3/vMJkmX7QESm5Fl+l
 v9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CwfJLHuZhZbZHfyo37QqDnI8FKSPLwxHIFS4F1NNhs4=;
 b=mVLXyhG9AnQoEJMOJ8CqDlkcIb5kwZlI6OuzK6U8R7gzlktUnRbiwUwi19YkIZRgkZ
 yMMz2QCEI9z8arAVmEoFqVlp7GvgEnpsqjeH5K/X5aurh5rtn5qVa2F1eAh1DEV2rOD2
 NrAwLoBrPchRhszoCcy9QwMqlMo3lYXvaiFt2cIAkxxz7hn7l891uAJd57mn0yAUCXDS
 w+ZB80IaHEXvbWuQZ7WcEXuJD8NCS4xt5GKcFJPA2avI6y0LamBfmIxPBq6iosHJd12w
 qg9+TTJ5DEjiroSmCEcJQx8dRbGi4cv4O0b3ugz8gg4rY8xqGtsBTMZU2EZf3xtTQbI5
 KS/w==
X-Gm-Message-State: AOAM5321yGv4SNd2gJ6twjgXTKGNi8VfFycStqwAFdtO2uyGWSEBdp3t
 FXflPk8epVxKrQkYk5AB12MLJk5nJZlZgQ==
X-Google-Smtp-Source: ABdhPJz65M7gsxFZiwEbj7f0PfpvdmQppGZzJ1w5FYqR5HlfWnzw4rFIXLmLOOuwt1QoPy6LvtRCCw==
X-Received: by 2002:a17:907:6d93:b0:6df:f1c5:9c8c with SMTP id
 sb19-20020a1709076d9300b006dff1c59c8cmr23353296ejc.224.1648395643356; 
 Sun, 27 Mar 2022 08:40:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a170906144200b006ceb8723de9sm4720071ejc.120.2022.03.27.08.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:40:42 -0700 (PDT)
Message-ID: <7a2fe806-f522-354a-30a6-0e96c4f016d9@mind.be>
Date: Sun, 27 Mar 2022 17:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
References: <20220318173427.68776-1-joerg.krause@embedded.rocks>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220318173427.68776-1-joerg.krause@embedded.rocks>
Subject: Re: [Buildroot] [PATCH 1/1] package/luvi: bump to version 2.13.0
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOC8wMy8yMDIyIDE4OjM0LCBKw7ZyZyBLcmF1c2Ugd3JvdGU6Cj4gU2lnbmVkLW9mZi1i
eTogSsO2cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9ja3M+CgogIEFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgcGFja2Fn
ZS9sdXZpL2x1dmkuaGFzaCB8IDIgKy0KPiAgIHBhY2thZ2UvbHV2aS9sdXZpLm1rICAgfCAyICst
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdXZpL2x1dmkuaGFzaCBiL3BhY2thZ2UvbHV2aS9sdXZp
Lmhhc2gKPiBpbmRleCBmY2M4MTQzMGRiLi45NjIxZWY0ZDAzIDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvbHV2aS9sdXZpLmhhc2gKPiArKysgYi9wYWNrYWdlL2x1dmkvbHV2aS5oYXNoCj4gQEAgLTEs
MyArMSwzIEBACj4gICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYgIDQxNDljODc2NDZm
NDg3ZjkwNzZjMjllOTg2MWY2NDQ2ODYzN2IxZDEzNjFiNzc3YjA5M2U2MjA0YTgzZTFlZDkgIGx1
dmktc3JjLXYyLjEyLjAudGFyLmd6Cj4gK3NoYTI1NiAgZGEyNWM3NGEzMGEzZmUyZmM3NWU5Nzk3
YTZmYTA3MTdlYmIwNWNlYjdlNmNjYjYxMzAxZjgwYzdkZDQzNmI3MyAgbHV2aS1zcmMtdjIuMTMu
MC50YXIuZ3oKPiAgIHNoYTI1NiAgY2ZjNzc0OWI5NmY2M2JkMzFjM2M0MmI1YzQ3MWJmNzU2ODE0
MDUzZTg0N2MxMGYzZWIwMDM0MTdiYzUyM2QzMCAgTElDRU5TRS50eHQKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9sdXZpL2x1dmkubWsgYi9wYWNrYWdlL2x1dmkvbHV2aS5tawo+IGluZGV4IDVkYWEz
YzE3OTMuLjUyNjYyODFmZmMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sdXZpL2x1dmkubWsKPiAr
KysgYi9wYWNrYWdlL2x1dmkvbHV2aS5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAgIwo+ICAgIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+IC1MVVZJX1ZFUlNJT04gPSAyLjEyLjAKPiArTFVW
SV9WRVJTSU9OID0gMi4xMy4wCj4gICBMVVZJX1NPVVJDRSA9IGx1dmktc3JjLXYkKExVVklfVkVS
U0lPTikudGFyLmd6Cj4gICBMVVZJX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vbHV2aXQvbHV2
aS9yZWxlYXNlcy9kb3dubG9hZC92JChMVVZJX1ZFUlNJT04pCj4gICBMVVZJX0xJQ0VOU0UgPSBB
cGFjaGUtMi4wCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
