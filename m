Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5953FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 06:41:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4140E61175
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 06:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4140E61175
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D175E60662;
	Mon,  4 Oct 2021 06:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B7IlyvWVyG9n; Mon,  4 Oct 2021 06:41:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF0C061AFE;
	Mon,  4 Oct 2021 06:41:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 163421BF3BD
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 06:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBDEC84A64
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 06:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ACgND9eWtQBb for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 06:41:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE84184A63
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 06:41:47 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id m3so66709591lfu.2
 for <buildroot@buildroot.org>; Sun, 03 Oct 2021 23:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xVLuSqxIuM3AmqnqMAY6dW6GfzY9mLPu1x0r0RpDbow=;
 b=JczDzQrELdeyCr4JJh2tWMMNHCVC1n0ILxYKI0JNoaptxLEGDnERi1QLW0rZPsV5fE
 UtXuAwyNFKlaT10xG1WXsyqC+AM9AqbWdSickN2lbohQjOpZKab3HhEe9+IlWKqkWeSA
 /LFbPilP57B6FKnLIZst+ZU4lloZ9nscDyt9D0wUFd0IkjOCmsMkXYetd3qe8iY6m49X
 d0VHtV9O1Bq3e0wHdcXvo0nLQwmkd+LhpNSIk8aLJ92+O9DtXedp4kXX9q2dEzbsqd1v
 46qT58/jCo116mqndCf83RvZcVcu8Ki8HuN5dBc/7BHitTiurmNGER9nhAG+cURNLf/r
 fB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xVLuSqxIuM3AmqnqMAY6dW6GfzY9mLPu1x0r0RpDbow=;
 b=PvuFpmlRdO0fC6GYfkum3w6OZczP7PtvdfeLzy80NeCNnXv915qf6GYbAyqZVAZYRe
 TuXT3Y41eH8RMeMHF2MvBEDi9KKxFkuuRSvtW7hs6M+ruUoHpGfehjz22yOwt8puEgJX
 UA3kks85CfasC6+FVaZIF9pgBLAC/76uDp8215UOq2+xt/Dbmx7D0ofbzUHmxtb+45rm
 QiE56LX2PwP1zsmdUHOULx4qgLNyZYfeNhhdZxDRem/agfj0n/pqsUU0DYVHHcmX6UsG
 PQc1nafRWb91K3nYKIShEnK2ClgV/xxLeZeq1/XP8kQVkvHk6BdcHgqNa7Ga6a/PLXDT
 2d5A==
X-Gm-Message-State: AOAM531cJF+vrxJQdh/o97I8wO3GlhKtYEw+KiIusEfsMzy1HEQ196Wg
 F89acfOYxeyLs2961e94wSpK/V2wG+Pi+FVr
X-Google-Smtp-Source: ABdhPJxOaJxvF35fcUq7+G/7D3M6WwOshBUV5J/FO52YABZlS405zb1woSPA/aMad/CD+79nWNCw9Q==
X-Received: by 2002:a05:6512:1294:: with SMTP id
 u20mr12233325lfs.1.1633329705496; 
 Sun, 03 Oct 2021 23:41:45 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id t12sm1512365lfc.55.2021.10.03.23.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 23:41:45 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Mon,  4 Oct 2021 09:41:43 +0300
Message-Id: <20211004064143.6281-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] system: add optional rsync with preserved
 permissions
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGZvbGxvd2luZyBwYXRjaCBhZGRzIGEgY29uZmlnIGZsYWcgdG8gbGV0IHRoZSB1c2VyCnJl
bHkgaW4gcnN5bmMgdG8gcHJlc3N1bWUgYWN0dWFsIGZpbGUgcGVybWlzc2lvbnMgYW5kCmxldCBp
dCBwb3B1bGF0ZSBkZXN0aW5hdGlvbiBmaWxlcyB3aXRoIGNsb3NlciByZXN1bHRzCnRvIHdoYXQg
dGhlIG9yaWdpbmFsIG92ZXJsYXkgaGF2ZS4KClNpZ25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmlu
ZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgotLS0KIE1ha2VmaWxlICAgICAgICAgfCA2
ICsrKysrKwogc3lzdGVtL0NvbmZpZy5pbiB8IDcgKysrKysrKwogc3lzdGVtL3N5c3RlbS5tayB8
IDggKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggMjU5NzA2NzE5YS4uMzc0NmYyNzZlYyAxMDA2
NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAgLTgxNCw5ICs4MTQsMTUgQEAgaWZl
cSAoJChCUjJfUk9PVEZTX01FUkdFRF9VU1IpLHkpCiAKIGVuZGlmICMgbWVyZ2VkIC91c3IKIAor
aWZlcSAoJChCUjJfUk9PVEZTX09WRVJMQVlfUFJFU0VSVkVEX1BFUk1JU1NJT04pLHkpKQorCSQo
Zm9yZWFjaCBkLCAkKGNhbGwgcXN0cmlwLCQoQlIyX1JPT1RGU19PVkVSTEFZKSksIFwKKwkJQCQo
Y2FsbCBNRVNTQUdFLCJDb3B5aW5nIG92ZXJsYXkgJChkKSIpJChzZXApIFwKKwkJJChRKSQoY2Fs
bCBTWVNURU1fT1ZFUkxBWV9SU1lOQywkKGQpLCQoVEFSR0VUX0RJUikpJChzZXApKQorZWxzZQog
CSQoZm9yZWFjaCBkLCAkKGNhbGwgcXN0cmlwLCQoQlIyX1JPT1RGU19PVkVSTEFZKSksIFwKIAkJ
QCQoY2FsbCBNRVNTQUdFLCJDb3B5aW5nIG92ZXJsYXkgJChkKSIpJChzZXApIFwKIAkJJChRKSQo
Y2FsbCBTWVNURU1fUlNZTkMsJChkKSwkKFRBUkdFVF9ESVIpKSQoc2VwKSkKK2VuZGlmCiAKIAkk
KFEpJChpZiAkKFRBUkdFVF9ESVJfRklMRVNfTElTVFMpLCBcCiAJCWNhdCAkKFRBUkdFVF9ESVJf
RklMRVNfTElTVFMpKSA+ICQoQlVJTERfRElSKS9wYWNrYWdlcy1maWxlLWxpc3QudHh0CmRpZmYg
LS1naXQgYS9zeXN0ZW0vQ29uZmlnLmluIGIvc3lzdGVtL0NvbmZpZy5pbgppbmRleCBiM2FiZWRk
ZDY4Li5hOWIyN2Y4OGI1IDEwMDY0NAotLS0gYS9zeXN0ZW0vQ29uZmlnLmluCisrKyBiL3N5c3Rl
bS9Db25maWcuaW4KQEAgLTUzMyw2ICs1MzMsMTMgQEAgY29uZmlnIEJSMl9ST09URlNfT1ZFUkxB
WQogCSAgVGhleSBhcmUgY29waWVkIGFzLWlzIGludG8gdGhlIHJvb3RmcywgZXhjbHVkaW5nIGZp
bGVzIGVuZGluZwogCSAgd2l0aCB+IGFuZCAuZ2l0LCAuc3ZuIGFuZCAuaGcgZGlyZWN0b3JpZXMu
CiAKK2NvbmZpZyBCUjJfUk9PVEZTX09WRVJMQVlfUFJFU0VSVkVEX1BFUk1JU1NJT04KKwlzdHJp
bmcgIlByZXNlcnZlIHBlcm1pc3Npb25zIG9mIG92ZXJsYXkgZGlyZWN0b3JpZXMiCisJZGVwZW5k
cyBvbiBCUjJfUk9PVEZTX09WRVJMQVkKKwlkZWZhdWx0ICJuIgorCWhlbHAKKwkgIFByZXNlcnZl
IGZpbGUgcGVybWlzc2lvbnMgb2Ygc3BlY2lmaWVkIG92ZXJsYXkuCisKIGNvbmZpZyBCUjJfUk9P
VEZTX1BPU1RfQlVJTERfU0NSSVBUCiAJc3RyaW5nICJDdXN0b20gc2NyaXB0cyB0byBydW4gYmVm
b3JlIGNyZWF0aW5nIGZpbGVzeXN0ZW0gaW1hZ2VzIgogCWRlZmF1bHQgIiIKZGlmZiAtLWdpdCBh
L3N5c3RlbS9zeXN0ZW0ubWsgYi9zeXN0ZW0vc3lzdGVtLm1rCmluZGV4IDhmZTJjMTM4YjAuLjYx
YjZlMWMzNGUgMTAwNjQ0Ci0tLSBhL3N5c3RlbS9zeXN0ZW0ubWsKKysrIGIvc3lzdGVtL3N5c3Rl
bS5tawpAQCAtNTUsNiArNTUsMTQgQEAgZGVmaW5lIFNZU1RFTV9SU1lOQwogCQkkKDEpLyAkKDIp
LwogZW5kZWYKIAorIyBUaGlzIGZ1bmN0aW9uIHJzeW5jcyB0aGUgb3ZlcmxheSBkaXJlY3Rvcnkg
aW4gJCgxKSB0byB0aGUgZGVzdGluYXRpb24KKyMgaW4gJCgyKSwgd2hpY2ggc2hvdWxkIGJlIGVp
dGhlciAkKFRBUlRHRVRfRElSKSBvciAkKFNUQUdJTkdfRElSKQorZGVmaW5lIFNZU1RFTV9PVkVS
TEFZX1JTWU5DCisJcnN5bmMgLWEgLS1pZ25vcmUtdGltZXMgJChSU1lOQ19WQ1NfRVhDTFVTSU9O
UykgXAorCQktLWV4Y2x1ZGUgLmVtcHR5IC0tZXhjbHVkZSAnKn4nIFwKKwkJJCgxKS8gJCgyKS8K
K2VuZGVmCisKICMgTWFrZSBhIHN5bWxpbmsgbGliMzItPmxpYiBvciBsaWI2NC0+bGliIGFzIGFw
cHJvcHJpYXRlLgogIyBNSVBTNjQvbjMyIHJlcXVpcmVzIGxpYjMyIGV2ZW4gdGhvdWdoIGl0J3Mg
YSA2NC1iaXQgYXJjaC4gSG93ZXZlciwgc2luY2UgZ2NjCiAjIDUuMS4wIGludGVybmFsIGNvbXBp
bGVyIHBhdGhzIGluIHN5c3Jvb3QgYXJlIHJlbGF0aXZlIHRvIGxpYjY0LCBzbyB3ZSBtdXN0Ci0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
