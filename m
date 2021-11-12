Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBD8C433FE
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 11:00:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B538260F46
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 11:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B538260F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E20BC60655;
	Fri, 12 Nov 2021 11:00:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0PI9xZD_eEY; Fri, 12 Nov 2021 11:00:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36F71608B7;
	Fri, 12 Nov 2021 11:00:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 692681BF325
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 11:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58EED81BC6
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 11:00:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ylZnmY18aCQj for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 11:00:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7593781CBA
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 11:00:13 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso6437320wme.3
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 03:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kwO/J3dYS+jxwkvodUkhE7eZkdCJKMqpvuxSL3ec/vQ=;
 b=eBCOhG4wLydHKXY7EH6MH5ZQhuMFHab0oiDAK/G61GKtCgEprJNsou3CdNm+tpJ4xk
 1AmdJZTmk9hsl7eSIsarunKCUX1WdCxF9SakVKNxsPlRAJrUKscjXRDenxP/uq1tZSQL
 yJbagCS7CgIuhaoDVSG8ejJZDlm5auBoW2i392SFEAozWo9sj5EYotesf0a1fux9TjvI
 cHEgCYU+F5YnrMrIGk7m/cq3XecDUOAoxY0JJpmeJsHznj5QZ7twA/MD1lai8bImj3DD
 KbUzjz1hhp/6qhygI+xOyF2EAcOMeUDIqvjsB44bFWq9UWD4wSzEYDCwVU3j14vC4tOj
 mAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kwO/J3dYS+jxwkvodUkhE7eZkdCJKMqpvuxSL3ec/vQ=;
 b=V62obCI4KK/eXqwTW2Zn8Hp3EtxCXzBG1LZucWaP/gFQukOOC828bx0OGq28xQGnB6
 bFxGUG74zLE/+uF2BDb3SyAuk/+YLj9BJ5XzaL18FZ8Dmuh56W6/u2G5bqP3tUac57ep
 diNYYVxv6ROEiw9z23CDilsy49cnT+34Qoy8iagrFEUI6H+jCbulGM/GcPqQuJp2Q4CX
 ocdVutysTenpNlezKWWo0ecHTgSYscsr1AitmgzPo77gV2izooIP36Dg3k6H1Q4Xn9Lu
 z1OO3K//XOSMBVj0Fw/4d+qr+QMMVrvBz9Zga23s/MRtiB2h2LNbZN7abTmAFIRutcl8
 FQ6Q==
X-Gm-Message-State: AOAM531ZucNBZnqf4BmZyDnz22yeXeSrNUufMSqQZKa7sc1pqbsFYQIl
 YzG11pbYE61/DcRqBGrTGYs+29f5wcM=
X-Google-Smtp-Source: ABdhPJxo/VhfhsyU7Ute4pzoaqXB+5v5YnL3V53J95c2Tgvz+x6zBcfvTy7XobovUK0G8y1uX4kThw==
X-Received: by 2002:a1c:9a89:: with SMTP id c131mr15888754wme.80.1636714811760; 
 Fri, 12 Nov 2021 03:00:11 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 8sm3748796wmg.24.2021.11.12.03.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 03:00:11 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 12:00:02 +0100
Message-Id: <20211112110007.787836-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112110007.787836-1-romain.naour@gmail.com>
References: <20211112110007.787836-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/6] package/luvi: don't use LUAJIT_VERSION for
 the luajit installation path
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

THVhaml0IHBhY2thZ2UgaGFzIGJlZW4gcmVjZW50bHkgdXBkYXRlZCB0byB0aGUgbGF0ZXN0IGNv
bW1pdCBpbiB0aGUKbWFzdGVyIGJyYW5jaCBbMV0uIFNpbmNlIHRoZW4gTFVBSklUX1ZFUlNJT04g
ZG9lc24ndCBjb250YWluIHRoZSBsdWFqaXQKdmVyc2lvbiBhbnltb3JlIGJ1dCBhIGNvbW1pdCBo
YXNoOgoKTFVBSklUX1ZFUlNJT04gPSAwNWYxOTg0ZTFhODYyZTRiM2QzYzNiMzcwYzc3MzQ5MmUy
ZWRmODRhCgpVc2UgcGtnLWNvbmZpZyAtLXZhcmlhYmxlPXZlcnNpb24gbHVhaml0IGluIGx1dmkg
cGFja2FnZSB0byBzZXQKTFVBX1BBVEggY29ycmVjdGx5LgoKRml4ZXM6Cmx1YWppdDogdW5rbm93
biBsdWFKSVQgY29tbWFuZCBvciBqaXQuKiBtb2R1bGVzIG5vdCBpbnN0YWxsZWQKCmh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTcxMDU1MjYwNQoKWzFd
IDk0NTBiNTNjOGUwNmYxYjVhNzU4NDBiODJjMGY0NjYzYTVkNzVjNDUKClNpZ25lZC1vZmYtYnk6
IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KQ2M6IErDtnJnIEtyYXVzZSA8
am9lcmcua3JhdXNlQGVtYmVkZGVkLnJvY2tzPgpUZXN0ZWQtYnk6IErDtnJnIEtyYXVzZSA8am9l
cmcua3JhdXNlQGVtYmVkZGVkLnJvY2tzPgpBY2tlZC1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFu
Y29pcy5wZXJyYWRAZ2Fkei5vcmc+Ci0tLQpUaGUgVGVzdEx1dmkgZG9lc24ndCB3b3JrIHlldCBk
dWUgdG8gbWlzc2luZyBybmcgc3VwcG9ydCBvbiBRZW11IGFybXY3IHRhcmdldAp1c2VkIHRvIHJ1
biB0aGUgdGVzdC4gbHV2aSAtdiBpcyBzdHVjayBkdWUgdG8gZ2V0cmFuZG9tKCkuCi0tLQogcGFj
a2FnZS9sdXZpL2x1dmkubWsgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHV2aS9sdXZpLm1r
IGIvcGFja2FnZS9sdXZpL2x1dmkubWsKaW5kZXggMzg2ZGFhZmMzMS4uZWY1Nzc3Y2FjOCAxMDA2
NDQKLS0tIGEvcGFja2FnZS9sdXZpL2x1dmkubWsKKysrIGIvcGFja2FnZS9sdXZpL2x1dmkubWsK
QEAgLTksNyArOSw3IEBAIExVVklfU09VUkNFID0gbHV2aS1zcmMtdiQoTFVWSV9WRVJTSU9OKS50
YXIuZ3oKIExVVklfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9sdXZpdC9sdXZpL3JlbGVhc2Vz
L2Rvd25sb2FkL3YkKExVVklfVkVSU0lPTikKIExVVklfTElDRU5TRSA9IEFwYWNoZS0yLjAKIExV
VklfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0Ci1MVVZJX0RFUEVOREVOQ0lFUyA9IGxpYnV2
IGx1YWppdCBsdXYgaG9zdC1sdWFqaXQKK0xVVklfREVQRU5ERU5DSUVTID0gbGlidXYgbHVhaml0
IGx1diBob3N0LWx1YWppdCBob3N0LXBrZ2NvbmYKIAogIyBEaXNwYXRjaCBhbGwgYXJjaGl0ZWN0
dXJlcyBvZiBMdWFKSVQKIGlmZXEgKCQoQlIyX2kzODYpLHkpCkBAIC0zMCwxMiArMzAsMTYgQEAg
ZWxzZQogTFVWSV9UQVJHRVRfQVJDSCA9ICQoQlIyX0FSQ0gpCiBlbmRpZgogCisjIExVQUpJVF9W
RVJTSU9OIGFuZCB0aGUgbHVhaml0IGluc3RhbGxhdGlvbiBwYXRoIG1heSBub3QgdXNlIHRoZQor
IyBzYW1lIHZhbHVlLiBVc2UgdGhlIHZhbHVlIGZyb20gbHVhaml0LnBjIGZpbGUuCitMVVZJX0xV
QUpJVF9WRVJTSU9OID0gJChzaGVsbCAkKFBLR19DT05GSUdfSE9TVF9CSU5BUlkpIC0tdmFyaWFi
bGU9dmVyc2lvbiBsdWFqaXQpCisKICMgQnVuZGxlZCBsdWEgYmluZGluZ3MgaGF2ZSB0byBiZSBs
aW5rZWQgc3RhdGljYWxseSBpbnRvIHRoZSBsdXZpIGV4ZWN1dGFibGUKIExVVklfQ09ORl9PUFRT
ID0gXAogCS1EQlVJTERfU0hBUkVEX0xJQlM9T0ZGIFwKIAktRFdpdGhTaGFyZWRMaWJsdXY9T04g
XAogCS1EVEFSR0VUX0FSQ0g9JChMVVZJX1RBUkdFVF9BUkNIKSBcCi0JLURMVUFfUEFUSD0kKEhP
U1RfRElSKS9zaGFyZS9sdWFqaXQtJChMVUFKSVRfVkVSU0lPTikvPy5sdWEKKwktRExVQV9QQVRI
PSQoSE9TVF9ESVIpL3NoYXJlL2x1YWppdC0kKExVVklfTFVBSklUX1ZFUlNJT04pLz8ubHVhCiAK
ICMgQWRkICJyZXgiIG1vZHVsZSAoUENSRSB2aWEgYnVuZGxlZCBscmV4bGliKQogaWZlcSAoJChC
UjJfUEFDS0FHRV9QQ1JFKSx5KQotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
