Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7B5C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 15:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D8064190F;
	Wed, 11 Jan 2023 15:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D8064190F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oDOu_5-24CZm; Wed, 11 Jan 2023 15:31:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E79C418FD;
	Wed, 11 Jan 2023 15:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E79C418FD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E8CB01BF3C0
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 15:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFFD760B92
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 15:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFFD760B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOHcCogVjV2H for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 15:31:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0BB160A89
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0BB160A89
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 15:30:59 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id k8so926147wrc.9
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 07:30:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A+zwgQ5JCoLzG3sr7CDDfpTEaocU1WSqCqU80kXymUE=;
 b=xdChOLI5FXmVI38YuPfvDh6W2v5NOQm9jdEJEE3ugvoStkmUfhIMcco67hpZCdn5LQ
 WL/Uufroq/P2VaSVFOylcbEH3zQaj6cRorag4pwgKCE+lUhfo/O4ujoiiO4GV5KQGfrq
 LjB9RJn6qglFuKI9WinTQIsmOoTudE9qDYHqdHqob2YvHHW3qmMlOwEeLW2hboXPhkSH
 EGOhDhOz2A4aFQZ5YSKYdMqSyAckRMQFFY6eNy7OJf1Ra7oE14PCtWZWdsj5rZRfOayV
 yK3rYVJS0fkCiUTUs7NuDpWHQVX0MkaYN4b1pSQHXTqJV8Pdfmlix1V60RGJHWhjpVTq
 Z9Ow==
X-Gm-Message-State: AFqh2kpEpTDEJK3vtHHcYdvhRg/lipAXS0F1pY2M3l9h7XSH8P5LKdfD
 H914cUBb1+z4ZQKNinaIfk2x+ni+QUBYfs2N
X-Google-Smtp-Source: AMrXdXtRfeL7QWLjjVYWEwrCW9DVsBWPDU3tAMjNLPjDkzjF89CHoN9VI0uwFqG+baQ7FHvtpcf5kA==
X-Received: by 2002:adf:d1c5:0:b0:297:1238:668d with SMTP id
 b5-20020adfd1c5000000b002971238668dmr33413759wrd.69.1673451057932; 
 Wed, 11 Jan 2023 07:30:57 -0800 (PST)
Received: from [10.5.3.94]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a5d5390000000b00281b594c725sm13903533wrv.38.2023.01.11.07.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 07:30:57 -0800 (PST)
Message-ID: <d23235cc-ab94-f5dc-f3c9-a22604b9d750@smile.fr>
Date: Wed, 11 Jan 2023 16:30:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220728014402.142320-1-james.hilliard1@gmail.com>
 <20220728014402.142320-2-james.hilliard1@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220728014402.142320-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A+zwgQ5JCoLzG3sr7CDDfpTEaocU1WSqCqU80kXymUE=;
 b=L3VImPKzC5pDsauPxoe7zbYFYnKGI36Vv5Mfnffy/EsIoZwM/2F1uIDg/POMhuAD5c
 dGglOZGmUofrgAmoo8RXvEfcDRq/JanfnSA4hjDl1rrgMbCV6J5oGdRM++04zWjk8X7F
 ofxDG7sp6vJcZZgMZ9uoSZspu5o96CgdeuTAuT5jOXOB1hc9GIFRiKxw26p7qq/pWcpW
 yPeN54MTE0rNopmZIybHcd1znPPI9aYANhmPNoBarxsubAt/Ddr6UfCKFSsjbhc6zfdW
 y+XpXQq77nX09B5A54EgmXL5ob/nc+qf4hCNZjrl8HR5VkGdbiP8nrc/QgUq7DLOT+9V
 w2lQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=L3VImPKz
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-meson: generate relocatable
 pkgconfigs
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpMZSAyOC8wNy8yMDIyIMOgIDAzOjQ0LCBKYW1lcyBIaWxsaWFyZCBhIMOpY3Jp
dMKgOgo+IFRoaXMgZm9ybWF0IHByZXZlbnRzIHBrZ2NvbmZpZyBwYXRoIGlzc3VlcyB3aGVuIHVz
aW5nIG1lc29uJ3MKPiBidWlsdC1pbiBpbnN0YWxsIGZ1bmN0aW9uYWxpdHkuCgpJcyBhbnkgcGFj
a2FnZSBjdXJyZW50bHkgYWZmZWN0ZWQgYnkgdGhpcyBpc3N1ZT8KCkkgd291bGQgYWRkIGEgcmVm
ZXJlbmNlIGxpbms6Cmh0dHBzOi8vbWVzb25idWlsZC5jb20vUGtnY29uZmlnLW1vZHVsZS5odG1s
I3JlbG9jYXRhYmxlLXBrZ2NvbmZpZy1maWxlcwoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IFNp
Z25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+
IC0tLQo+ICBwYWNrYWdlL3BrZy1tZXNvbi5tayB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1tZXNvbi5tayBiL3Bh
Y2thZ2UvcGtnLW1lc29uLm1rCj4gaW5kZXggMTU2YjAwNWZkZC4uMTgzMGM3YjEwYyAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL3BrZy1tZXNvbi5tawo+ICsrKyBiL3BhY2thZ2UvcGtnLW1lc29uLm1r
Cj4gQEAgLTEzNCw2ICsxMzQsNyBAQCBkZWZpbmUgJCgyKV9DT05GSUdVUkVfQ01EUwo+ICAJQ1hY
X0ZPUl9CVUlMRD0iJCQoSE9TVENYWCkiIFwKPiAgCSQkKCQkKFBLRylfQ09ORl9FTlYpIFwKPiAg
CSQkKE1FU09OKSBcCj4gKwkJLS1wa2djb25maWcucmVsb2NhdGFibGUgXAo+ICAJCS0tcHJlZml4
PS91c3IgXAo+ICAJCS0tbGliZGlyPWxpYiBcCj4gIAkJLS1kZWZhdWx0LWxpYnJhcnk9JChpZiAk
KEJSMl9TVEFUSUNfTElCUyksc3RhdGljLHNoYXJlZCkgXAo+IEBAIC0xNTQsNiArMTU1LDcgQEAg
ZGVmaW5lICQoMilfQ09ORklHVVJFX0NNRFMKPiAgCW1rZGlyIC1wICQkKCQkKFBLRylfU1JDRElS
KS9idWlsZAo+ICAJJCQoSE9TVF9DT05GSUdVUkVfT1BUUykgXAo+ICAJJCQoJCQoUEtHKV9DT05G
X0VOVikgJCQoTUVTT04pIFwKPiArCQktLXBrZ2NvbmZpZy5yZWxvY2F0YWJsZSBcCj4gIAkJLS1w
cmVmaXg9JCQoSE9TVF9ESVIpIFwKPiAgCQktLWxpYmRpcj1saWIgXAo+ICAJCS0tc3lzY29uZmRp
cj0kJChIT1NUX0RJUikvZXRjIFwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
