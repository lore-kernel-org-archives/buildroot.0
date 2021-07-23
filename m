Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69FCC4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 12:48:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C41E60E8C
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 12:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C41E60E8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB68D606C4;
	Fri, 23 Jul 2021 12:48:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vc4z-0aorOUj; Fri, 23 Jul 2021 12:48:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1823D60644;
	Fri, 23 Jul 2021 12:48:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3CB91BF31F
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 12:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C309C83A57
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 12:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mn5Sl0ms_Wrw for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 12:48:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9390183A53
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 12:48:03 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id h9so1535377ljq.8
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 05:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fS3aW1+9Z4+nbczeXk3EPWTvLXUhQ0Txggf7JlBsBBk=;
 b=IPZPJiRDbJ3ILcF3YW3ZnwZ5f8VQbakGYAULJUDqOcr98gaBiVCGYMKmXkxrchuLO1
 4EbY3N278ERL3LpqbWhi1+CuUxaSb6PZi8F9Qwm8yLsWs+4q/WaAgDjLviag2kJHWsYR
 CUCt+YPVtAHu7dfiANo2Hy8MxzqTSY34HGQKFk78WQrBr2/BOrMseByszA5lKz2LFOSQ
 i6GGY+HDZSCyZ2Lq5lRFGU4mOIVnMHcJBU3huN5tz9zF8+JLiKS+GSNYiRE0vloFulbn
 k+OU6efnWRNW8LelJIqikgUM7UJNa7Sm2iZCrJ7NlDndf6HYwyQD7qII9IKf2NyvxDSh
 3ZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fS3aW1+9Z4+nbczeXk3EPWTvLXUhQ0Txggf7JlBsBBk=;
 b=tFaJtrHXktE0kwQ8YvBGOCav2LhhaJmCvsDYKo6qCNuaiQ0apqaGNmZwOEzpUVEFr+
 7lDV6jdfAkqSIAZVa9A2B/hzWwnJCISMFsufdLMvRlQu2ukt1e5y9G1diZATfNvCrnCC
 5V5uMGiOl3qvb3RYPfdjrk0cj4kIevFB+/IrSBysZ2DdQKLQckvyWw/H0eTKV6i/63m8
 EDktPsvgO1owU/yNjzh3kGaVmauRfHRLFn1zegMEOOumb0O2hyfsVhtFnnkz/S3t+3y3
 y0z6UXgOqyNLUMdv+nRmSKiDD+7NLMv2cV8odsCro4jsW4TMlGbjbv/eZNQSNgdowzhM
 6vvw==
X-Gm-Message-State: AOAM532n5r47/OWTdmeTwfFzLwE1M6htYG0oE6VRAGtWbWZ9SYbX6grK
 wJizNDxEFPxDqFb9Ce22aJgJQ+vY76xnxjUO
X-Google-Smtp-Source: ABdhPJyuziMISvL/nVPy7KmCxrB5D82boGEatRR7TqTVhQI4JlOz9KJ1WgicaqNfYe3I6tk4elWlcg==
X-Received: by 2002:a2e:b556:: with SMTP id a22mr3288412ljn.142.1627044481174; 
 Fri, 23 Jul 2021 05:48:01 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (dd707cygx2c-5zp601y5t-3.rev.dnainternet.fi.
 [2001:14ba:1efd:b100:b3b0:bf9a:335e:a833])
 by smtp.googlemail.com with ESMTPSA id g5sm42602ljj.27.2021.07.23.05.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 05:48:00 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@busybox.net
Date: Fri, 23 Jul 2021 15:47:54 +0300
Message-Id: <20210723124754.46568-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Fix restorecond startup for sysvinit builds
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Q3VycmVudGx5IHJlc3RvcmVjb25kIGluaXQgc2NyaXB0IHNvdXJjZXMgdGhlCmZpbGUgL2V0Yy9y
Yy5kL2luaXQuZC9mdW5jdGlvbnMsIHRoYXQgaW4gc29tZQppbml0IHN5c3RlbXMsIGxpa2Ugc3lz
dmluaXQsIG1heSBub3QgYmUgYXZhaWxhYmxlLApob3dldmVyLCBpdCBkb2Vzbid0IGFjdHVhbGx5
IHVzZXMgYW55IGZ1bmN0aW9uCmZyb20gaXQuCgpBbHNvLCB0aGUgaW5pdCBzY3JpcHQgdXNlcyBk
YWVtb24sIHRoYXQgaXMgbm90Cm1hcmtlZCBhcyBhIGRlcGVuZGVuY3kuIFNvIHRoaXMgcGF0Y2hl
cyBhZGRzIGl0cwpkZXBlbmRlbmN5IHRvIGd1YXJhbnRlZSBpdCdzIHByZXNlbnQgaW4gdGhlIGJ1
aWxkLgoKU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVu
aWtpZS5jb20+Ci0tLQogcGFja2FnZS9yZXN0b3JlY29uZC9Db25maWcuaW4gICAgICB8ICAyICsK
IHBhY2thZ2UvcmVzdG9yZWNvbmQvUzIwcmVzdG9yZWNvbmQgfCA4NiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIHBhY2thZ2UvcmVzdG9yZWNvbmQvcmVzdG9yZWNvbmQubWsgfCAgNCAr
LQogMyBmaWxlcyBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcmVzdG9yZWNvbmQvUzIwcmVzdG9yZWNvbmQKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL3Jlc3RvcmVjb25kL0NvbmZpZy5pbiBiL3BhY2thZ2UvcmVzdG9yZWNv
bmQvQ29uZmlnLmluCmluZGV4IDMxZjg1ZjI4ODIuLmMyZTc3M2VhY2UgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvcmVzdG9yZWNvbmQvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvcmVzdG9yZWNvbmQvQ29u
ZmlnLmluCkBAIC00LDExICs0LDEzIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9SRVNUT1JFQ09ORAog
CWRlcGVuZHMgb24gQlIyX1VTRV9XQ0hBUiAjIGxpYmdsaWIyCiAJZGVwZW5kcyBvbiBCUjJfVE9P
TENIQUlOX0hBU19USFJFQURTICMgbGliZ2xpYjIKIAlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJ
QlMgIyBsaWJzZWxpbnV4CisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9EQUVNT04gIyBkYWVtb24K
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfREJVUwogCXNlbGVjdCBCUjJfUEFDS0FHRV9EQlVTX0dMSUIK
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCR0xJQjIKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCU0VM
SU5VWAogCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJTRVBPTAorCXNlbGVjdCBCUjJfUEFDS0FHRV9E
QUVNT04KIAloZWxwCiAJICByZXN0b3JlY29uZCBpcyBhIGRhZW1vbiB0aGF0IHdhdGNoZXMgZm9y
IGZpbGUgY3JlYXRpb24gYW5kCiAJICB0aGVuIHNldHMgdGhlIGRlZmF1bHQgU0VMaW51eCBmaWxl
IGNvbnRleHQgZm9yIHRoYXQgZmlsZS4KZGlmZiAtLWdpdCBhL3BhY2thZ2UvcmVzdG9yZWNvbmQv
UzIwcmVzdG9yZWNvbmQgYi9wYWNrYWdlL3Jlc3RvcmVjb25kL1MyMHJlc3RvcmVjb25kCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmRmNmY1M2ZlM2YKLS0tIC9kZXYvbnVs
bAorKysgYi9wYWNrYWdlL3Jlc3RvcmVjb25kL1MyMHJlc3RvcmVjb25kCkBAIC0wLDAgKzEsODYg
QEAKKyMhL2Jpbi9zaAorIworIyByZXN0b3JlY29uZDoJCURhZW1vbiB1c2VkIHRvIG1haW50YWlu
IHBhdGggZmlsZSBjb250ZXh0CisjCisjIGNoa2NvbmZpZzoJLSAxMiA4NworIyBkZXNjcmlwdGlv
bjoJcmVzdG9yZWNvbmQgdXNlcyBpbm90aWZ5IHRvIGxvb2sgZm9yIGNyZWF0aW9uIG9mIG5ldyBm
aWxlcyBcCisjIGxpc3RlZCBpbiB0aGUgL2V0Yy9zZWxpbnV4L3Jlc3RvcmVjb25kLmNvbmYgZmls
ZSwgYW5kIHJlc3RvcmVzIHRoZSBcCisjIGNvcnJlY3Qgc2VjdXJpdHkgY29udGV4dC4KKyMKKyMg
cHJvY2Vzc25hbWU6IC91c3Ivc2Jpbi9yZXN0b3JlY29uZAorIyBjb25maWc6IC9ldGMvc2VsaW51
eC9yZXN0b3JlY29uZC5jb25mCisjIHBpZGZpbGU6IC9ydW4vcmVzdG9yZWNvbmQucGlkCisjCisj
IFJldHVybiB2YWx1ZXMgYWNjb3JkaW5nIHRvIExTQiBmb3IgYWxsIGNvbW1hbmRzIGJ1dCBzdGF0
dXM6CisjIDAgLSBzdWNjZXNzCisjIDEgLSBnZW5lcmljIG9yIHVuc3BlY2lmaWVkIGVycm9yCisj
IDIgLSBpbnZhbGlkIG9yIGV4Y2VzcyBhcmd1bWVudChzKQorIyAzIC0gdW5pbXBsZW1lbnRlZCBm
ZWF0dXJlIChlLmcuICJyZWxvYWQiKQorIyA0IC0gaW5zdWZmaWNpZW50IHByaXZpbGVnZQorIyA1
IC0gcHJvZ3JhbSBpcyBub3QgaW5zdGFsbGVkCisjIDYgLSBwcm9ncmFtIGlzIG5vdCBjb25maWd1
cmVkCisjIDcgLSBwcm9ncmFtIGlzIG5vdCBydW5uaW5nCisKK1BBVEg9L3NiaW46L2JpbjovdXNy
L2JpbjovdXNyL3NiaW4KKworWyAteCAvdXNyL3NiaW4vc2VsaW51eGVuYWJsZWQgXSAmJiAvdXNy
L3NiaW4vc2VsaW51eGVuYWJsZWQgfHwgZXhpdCA3CisKKyMgQ2hlY2sgdGhhdCB3ZSBhcmUgcm9v
dCAuLi4gc28gbm9uLXJvb3QgdXNlcnMgc3RvcCBoZXJlCit0ZXN0ICRFVUlEID0gMCAgfHwgZXhp
dCA0CisKK3Rlc3QgLXggL3Vzci9zYmluL3Jlc3RvcmVjb25kICB8fCBleGl0IDUKK3Rlc3QgLWYg
L2V0Yy9zZWxpbnV4L3Jlc3RvcmVjb25kLmNvbmYgIHx8IGV4aXQgNgorCitSRVRWQUw9MAorCitz
dGFydCgpCit7CisgICAgICAgIGVjaG8gLW4gJCJTdGFydGluZyByZXN0b3JlY29uZDogIgorCXVu
c2V0IEhPTUUgTUFJTCBVU0VSIFVTRVJOQU1FCisgICAgICAgIGRhZW1vbiAvdXNyL3NiaW4vcmVz
dG9yZWNvbmQKKwlSRVRWQUw9JD8KKwl0b3VjaCAvdmFyL2xvY2svc3Vic3lzL3Jlc3RvcmVjb25k
CisgICAgICAgIGVjaG8KKwlyZXR1cm4gJFJFVFZBTAorfQorCitzdG9wKCkKK3sKKyAgICAgICAg
ZWNobyAtbiAkIlNodXR0aW5nIGRvd24gcmVzdG9yZWNvbmQ6ICIKKwlraWxscHJvYyByZXN0b3Jl
Y29uZAorCVJFVFZBTD0kPworCXJtIC1mICAvdmFyL2xvY2svc3Vic3lzL3Jlc3RvcmVjb25kCisg
ICAgICAgIGVjaG8KKwlyZXR1cm4gJFJFVFZBTAorfQorCityZXN0YXJ0KCkKK3sKKyAgICBzdG9w
CisgICAgc3RhcnQKK30KKworIyBTZWUgaG93IHdlIHdlcmUgY2FsbGVkLgorY2FzZSAiJDEiIGlu
CisgIHN0YXJ0KQorCXN0YXJ0CisgICAgICAgIDs7CisgIHN0b3ApCisJc3RvcAorICAgICAgICA7
OworICBzdGF0dXMpCisJc3RhdHVzIHJlc3RvcmVjb25kCisJUkVUVkFMPSQ/CisJOzsKKyAgZm9y
Y2UtcmVsb2FkfHJlc3RhcnR8cmVsb2FkKQorCXJlc3RhcnQKKwk7OworICBjb25kcmVzdGFydCkK
KwlbIC1lIC92YXIvbG9jay9zdWJzeXMvcmVzdG9yZWNvbmQgXSAmJiByZXN0YXJ0IHx8IDoKKwk7
OworICAqKQorICAgICAgICBlY2hvICQiVXNhZ2U6ICQwIHtzdGFydHxzdG9wfHJlc3RhcnR8Zm9y
Y2UtcmVsb2FkfHN0YXR1c3xjb25kcmVzdGFydH0iCisgICAgICAgIFJFVFZBTD0zCitlc2FjCisK
K2V4aXQgJFJFVFZBTApkaWZmIC0tZ2l0IGEvcGFja2FnZS9yZXN0b3JlY29uZC9yZXN0b3JlY29u
ZC5tayBiL3BhY2thZ2UvcmVzdG9yZWNvbmQvcmVzdG9yZWNvbmQubWsKaW5kZXggN2FiN2U5Nzhk
ZC4uMTU0NjY2MWJhZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9yZXN0b3JlY29uZC9yZXN0b3JlY29u
ZC5taworKysgYi9wYWNrYWdlL3Jlc3RvcmVjb25kL3Jlc3RvcmVjb25kLm1rCkBAIC05LDcgKzks
NyBAQCBSRVNUT1JFQ09ORF9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL1NFTGludXhQcm9qZWN0
L3NlbGludXgvcmVsZWFzZXMvZG93bmxvYWQvMgogUkVTVE9SRUNPTkRfTElDRU5TRSA9IEdQTC0y
LjAKIFJFU1RPUkVDT05EX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCiAKLVJFU1RPUkVDT05EX0RF
UEVOREVOQ0lFUyA9IGxpYmdsaWIyIGxpYnNlcG9sIGxpYnNlbGludXggZGJ1cy1nbGliCitSRVNU
T1JFQ09ORF9ERVBFTkRFTkNJRVMgPSBsaWJnbGliMiBsaWJzZXBvbCBsaWJzZWxpbnV4IGRidXMt
Z2xpYiBkYWVtb24KIAogIyBVbmRlZmluaW5nIF9GSUxFX09GRlNFVF9CSVRTIGhlcmUgYmVjYXVz
ZSBvZiBhICJidWciIHdpdGggZ2xpYmMgZnRzLmgKICMgbGFyZ2UgZmlsZSBzdXBwb3J0LgpAQCAt
MjcsNyArMjcsNyBAQCBkZWZpbmUgUkVTVE9SRUNPTkRfQlVJTERfQ01EUwogZW5kZWYKIAogZGVm
aW5lIFJFU1RPUkVDT05EX0lOU1RBTExfSU5JVF9TWVNWCi0JJChJTlNUQUxMKSAtbSAwNzU1IC1E
ICQoQEQpL3Jlc3RvcmVjb25kLmluaXQgXAorCSQoSU5TVEFMTCkgLW0gMDc1NSAtRCBwYWNrYWdl
L3Jlc3RvcmVjb25kL1MyMHJlc3RvcmVjb25kIFwKIAkJJChUQVJHRVRfRElSKS9ldGMvaW5pdC5k
L1MyMHJlc3RvcmVjb25kCiBlbmRlZgogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
