Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FEEC4338F
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 05:56:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D091560F35
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 05:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D091560F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D57E82A7F;
	Mon,  9 Aug 2021 05:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPAalfrkRZeV; Mon,  9 Aug 2021 05:56:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C146482A4E;
	Mon,  9 Aug 2021 05:56:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 842C11BF39A
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 05:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73FD9606A6
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 05:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LA1agnwgDYsR for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 05:56:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E2306068B
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 05:56:01 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id x27so8883310lfu.5
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 22:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eo74NSEjhcEz4XnjSqZGtpC9YOaBJG5luYZGeXmHlMc=;
 b=vaKS/TkJ5Ts3KSgYr6uK0RLVrj62bX2+XKqlqzvJpKmIDfeZk1u0fVxBC5/Mr6FkQN
 zusaP057OmaPEgi/zFyU0htrWAb4U4wFihdxaFvqUflytlTHFL1w0mXQjGW4oOxV4eC5
 VCubtcX0pQB7N5Mujz5xEZsHKlyGrCu4VXZYeuQDs8lpYiTHozKq38GQlSQocPI5mG/4
 qMuDjoPRFJMjWvLAFKobpoddRJToFhOViOlJXQC1YmsBt2Kvk6W9LjmdbdDjSZXduyj/
 ASs3updRVWFHgDGBdPLIVaCBtS0t++Xj8eMmlBtmOhw1ZC3y2iE9eEnAnRVqNlv0zaYT
 ZBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eo74NSEjhcEz4XnjSqZGtpC9YOaBJG5luYZGeXmHlMc=;
 b=mVqwOTwSEbtzWUvHoO7lBdFjoRbjUmPw+Pe/i+M7RdzUbG26pcZPg6p/Egq2SRJiRh
 pxnWNPYkZ9Z/VzIbiUkuy4fLJ8EkQ7H67qvmAUd5xLU6rSZJl6Bx4/Y2NoesutqGxPag
 Thmxb43EgyoNzA+339LB06Xg+wh4pQeSMvlPvqaRds8FeXNVoE64UQ5UIDPDKiyI4QG4
 wHOCL2lLFHI0GjzyXc8TjUP+mBEugejckYOPKCVsldjb6/yAZzvDZR9Jx0dz1baAG6ul
 PJVsvdGKLOvUhcWcfGsfWyqLFIBdCicFjlMMntIkPYxQmCJVn+Y0lzKgIQckeIJueRN0
 WAKg==
X-Gm-Message-State: AOAM530v7gb3MlWdYQ+dSUDs9OeEdtPY19elmYrBwVfYQdakOtNLHTt+
 QKl0Jdc155f6lOv+LdJY7DDDfuN+biqqz5bh
X-Google-Smtp-Source: ABdhPJyAxNwoif5vksJexAoQQLzUqHm36iw3LHGpEuxgbvhKnL+T+TUXrsGd/MQkqmx50eYNLQOHsw==
X-Received: by 2002:a19:c350:: with SMTP id t77mr15836397lff.142.1628488559283; 
 Sun, 08 Aug 2021 22:55:59 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id n12sm1481484ljq.35.2021.08.08.22.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 22:55:58 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Mon,  9 Aug 2021 08:55:57 +0300
Message-Id: <20210809055557.8698-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/restorecond: Add new init script
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

VGhlIGN1cnJlbnQgcmVzdG9yZWNvbmQgdXBzdHJlYW0gaW5pdCBzY3JpcHQgaXMgbm8KZ29vZCBm
aXQgZm9yIHRoZSB1c2VyIHNwYWNlIGdlbmVyYXRlZCBieSBidWlsZHJvb3QsCnRoaXMgc2NyaXB0
IGlzIGFuIGV4dGVuc2lvbiBvZiB0aGUgb3JpZ2luYWwsIHRoYXQKYnJpbmdzIHNvbWUgY2hhbmdl
cyBmcm9tIHRoZSBkZWJpYW4gaW5pdCBzY3JpcHQgdG8KdXNlIHN0YXJ0LXN0b3AtZGFlbW9uIGlu
c3RlYWQgb2YgZGFlbW9uLCB3aGlsZQpyZW1vdmluZyBkZXBlbmRlbmNpZXMgb24gL2V0Yy9yYy5k
L2luaXQuZC9mdW5jdGlvbnMKYW5kIC9saWIvbHNiL2luaXQtZnVuY3Rpb25zLgoKU2lnbmVkLW9m
Zi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Ci0tLQog
cGFja2FnZS9yZXN0b3JlY29uZC9TMDJyZXN0b3JlY29uZCB8IDExMyArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogcGFja2FnZS9yZXN0b3JlY29uZC9yZXN0b3JlY29uZC5tayB8ICAgNCAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAxMTUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Jlc3RvcmVjb25kL1MwMnJlc3RvcmVjb25kCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9yZXN0b3JlY29uZC9TMDJyZXN0b3JlY29uZCBiL3BhY2thZ2UvcmVz
dG9yZWNvbmQvUzAycmVzdG9yZWNvbmQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMC4uMjRlZTMwODUzZgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcmVzdG9yZWNvbmQv
UzAycmVzdG9yZWNvbmQKQEAgLTAsMCArMSwxMTMgQEAKKyMhL2Jpbi9zaAorIworIyByZXN0b3Jl
Y29uZDoJCURhZW1vbiB1c2VkIHRvIG1haW50YWluIHBhdGggZmlsZSBjb250ZXh0CisjCisjIGNo
a2NvbmZpZzoJLSAxMiA4NworIyBkZXNjcmlwdGlvbjoJcmVzdG9yZWNvbmQgdXNlcyBpbm90aWZ5
IHRvIGxvb2sgZm9yIGNyZWF0aW9uIG9mIG5ldyBmaWxlcyBcCisjIGxpc3RlZCBpbiB0aGUgL2V0
Yy9zZWxpbnV4L3Jlc3RvcmVjb25kLmNvbmYgZmlsZSwgYW5kIHJlc3RvcmVzIHRoZSBcCisjIGNv
cnJlY3Qgc2VjdXJpdHkgY29udGV4dC4KKyMKKyMgcHJvY2Vzc25hbWU6IC91c3Ivc2Jpbi9yZXN0
b3JlY29uZAorIyBjb25maWc6IC9ldGMvc2VsaW51eC9yZXN0b3JlY29uZC5jb25mCisjIHBpZGZp
bGU6IC9ydW4vcmVzdG9yZWNvbmQucGlkCisjCisjIFJldHVybiB2YWx1ZXMgYWNjb3JkaW5nIHRv
IExTQiBmb3IgYWxsIGNvbW1hbmRzIGJ1dCBzdGF0dXM6CisjIDAgLSBzdWNjZXNzCisjIDEgLSBn
ZW5lcmljIG9yIHVuc3BlY2lmaWVkIGVycm9yCisjIDIgLSBpbnZhbGlkIG9yIGV4Y2VzcyBhcmd1
bWVudChzKQorIyAzIC0gdW5pbXBsZW1lbnRlZCBmZWF0dXJlIChlLmcuICJyZWxvYWQiKQorIyA0
IC0gaW5zdWZmaWNpZW50IHByaXZpbGVnZQorIyA1IC0gcHJvZ3JhbSBpcyBub3QgaW5zdGFsbGVk
CisjIDYgLSBwcm9ncmFtIGlzIG5vdCBjb25maWd1cmVkCisjIDcgLSBwcm9ncmFtIGlzIG5vdCBy
dW5uaW5nCisKK1BBVEg9L3NiaW46L2JpbjovdXNyL2JpbjovdXNyL3NiaW4KK0RFU0M9IlNFTGlu
dXggZmlsZSBjb250ZXh0IG1haW50YWluaW5nIGRhZW1vbiIKK05BTUU9cmVzdG9yZWNvbmQKK0RB
RU1PTj0vdXNyL3NiaW4vJE5BTUUKK0RBRU1PTl9BUkdTPSIiCitQSURGSUxFPS92YXIvcnVuLyRO
QU1FLnBpZAorTE9DS0ZJTEU9L3Zhci9ydW4vJE5BTUUucGlkCitTQ1JJUFROQU1FPS9ldGMvaW5p
dC5kLyROQU1FCisKK1sgLXggL3Vzci9zYmluL3NlbGludXhlbmFibGVkIF0gJiYgL3Vzci9zYmlu
L3NlbGludXhlbmFibGVkIHx8IGV4aXQgNworCisjIENoZWNrIHRoYXQgd2UgYXJlIHJvb3QgLi4u
IHNvIG5vbi1yb290IHVzZXJzIHN0b3AgaGVyZQordGVzdCAkRVVJRCA9IDAgIHx8IGV4aXQgNAor
Cit0ZXN0IC14IC91c3Ivc2Jpbi9yZXN0b3JlY29uZCAgfHwgZXhpdCA1Cit0ZXN0IC1mIC9ldGMv
c2VsaW51eC9yZXN0b3JlY29uZC5jb25mICB8fCBleGl0IDYKKworUkVUVkFMPTAKKworc3RhcnQo
KQoreworCSMgUmV0dXJuCisJIyAgIDAgaWYgZGFlbW9uIGhhcyBiZWVuIHN0YXJ0ZWQKKwkjICAg
MSBpZiBkYWVtb24gd2FzIGFscmVhZHkgcnVubmluZworCSMgICAyIGlmIGRhZW1vbiBjb3VsZCBu
b3QgYmUgc3RhcnRlZAorCXN0YXJ0LXN0b3AtZGFlbW9uIC0tc3RhcnQgLS1xdWlldCAtLXBpZGZp
bGUgJFBJREZJTEUgLS1leGVjICREQUVNT04gLS10ZXN0ID4gL2Rldi9udWxsIFwKKwkJfHwgcmV0
dXJuIDEKKwlzdGFydC1zdG9wLWRhZW1vbiAtLXN0YXJ0IC0tcXVpZXQgLS1waWRmaWxlICRQSURG
SUxFIC0tZXhlYyAkREFFTU9OIC0tIFwKKwkJJERBRU1PTl9BUkdTIFwKKwkJfHwgcmV0dXJuIDIK
Kwl0b3VjaCAkTE9DS0ZJTEUKKwlyZXR1cm4gIiRSRVRWQUwiCit9CisKK3N0b3AoKQoreworCSMg
UmV0dXJuCisJIyAgIDAgaWYgZGFlbW9uIGhhcyBiZWVuIHN0b3BwZWQKKwkjICAgMSBpZiBkYWVt
b24gd2FzIGFscmVhZHkgc3RvcHBlZAorCSMgICAyIGlmIGRhZW1vbiBjb3VsZCBub3QgYmUgc3Rv
cHBlZAorCSMgICBvdGhlciBpZiBhIGZhaWx1cmUgb2NjdXJyZWQKKwlzdGFydC1zdG9wLWRhZW1v
biAtLXN0b3AgLS1xdWlldCAtLXJldHJ5PVRFUk0vMzAvS0lMTC81IC0tcGlkZmlsZSAkUElERklM
RSAtLW5hbWUgJE5BTUUKKwlSRVRWQUw9IiQ/IgorCVsgIiRSRVRWQUwiID0gMiBdICYmIHJldHVy
biAyCisKKwlybSAtZiAkUElERklMRQorCXJtIC1mICRMT0NLRklMRQorCXJldHVybiAiJFJFVFZB
TCIKK30KKworcmVzdGFydCgpCit7CisgICAgc3RvcAorICAgIHN0YXJ0Cit9CisKKyMgU2VlIGhv
dyB3ZSB3ZXJlIGNhbGxlZC4KK2Nhc2UgIiQxIiBpbgorICBzdGFydCkKKwllY2hvIC1uICQiU3Rh
cnRpbmcgcmVzdG9yZWNvbmQ6ICIKKwlzdGFydAorICAgIGNhc2UgIiQ/IiBpbgorICAgICAgICAw
fDEpIGVjaG8gIk9rISIgOzsKKyAgICAgICAgMikgZWNobyAiRmFpbGVkIiA7OworICAgIGVzYWMK
Kwk7OworICBzdG9wKQorCWVjaG8gLW4gJCJTaHV0dGluZyBkb3duIHJlc3RvcmVjb25kOiAiCisJ
c3RvcAorICAgIGNhc2UgIiQ/IiBpbgorICAgICAgICAwfDEpIGVjaG8gIk9rISIgOzsKKyAgICAg
ICAgMikgZWNobyAiRmFpbGVkIiA7OworICAgIGVzYWMKKwk7OworICBzdGF0dXMpCisJc3RhdHVz
IHJlc3RvcmVjb25kCisJUkVUVkFMPSQ/CisJOzsKKyAgZm9yY2UtcmVsb2FkfHJlc3RhcnR8cmVs
b2FkKQorCXJlc3RhcnQKKwk7OworICBjb25kcmVzdGFydCkKKwlbIC1lIC92YXIvbG9jay9zdWJz
eXMvcmVzdG9yZWNvbmQgXSAmJiByZXN0YXJ0IHx8IDoKKwk7OworICAqKQorICAgICAgICBlY2hv
ICQiVXNhZ2U6ICQwIHtzdGFydHxzdG9wfHJlc3RhcnR8Zm9yY2UtcmVsb2FkfHN0YXR1c3xjb25k
cmVzdGFydH0iCisgICAgICAgIFJFVFZBTD0zCitlc2FjCisKK2V4aXQgJFJFVFZBTApkaWZmIC0t
Z2l0IGEvcGFja2FnZS9yZXN0b3JlY29uZC9yZXN0b3JlY29uZC5tayBiL3BhY2thZ2UvcmVzdG9y
ZWNvbmQvcmVzdG9yZWNvbmQubWsKaW5kZXggN2FiN2U5NzhkZC4uM2M2ZmI1N2VhNiAxMDA2NDQK
LS0tIGEvcGFja2FnZS9yZXN0b3JlY29uZC9yZXN0b3JlY29uZC5taworKysgYi9wYWNrYWdlL3Jl
c3RvcmVjb25kL3Jlc3RvcmVjb25kLm1rCkBAIC0yNyw4ICsyNyw4IEBAIGRlZmluZSBSRVNUT1JF
Q09ORF9CVUlMRF9DTURTCiBlbmRlZgogCiBkZWZpbmUgUkVTVE9SRUNPTkRfSU5TVEFMTF9JTklU
X1NZU1YKLQkkKElOU1RBTEwpIC1tIDA3NTUgLUQgJChARCkvcmVzdG9yZWNvbmQuaW5pdCBcCi0J
CSQoVEFSR0VUX0RJUikvZXRjL2luaXQuZC9TMjByZXN0b3JlY29uZAorCSQoSU5TVEFMTCkgLW0g
MDc1NSAtRCBwYWNrYWdlL3Jlc3RvcmVjb25kL1MwMnJlc3RvcmVjb25kIFwKKwkJJChUQVJHRVRf
RElSKS9ldGMvaW5pdC5kL1MwMnJlc3RvcmVjb25kCiBlbmRlZgogCiBkZWZpbmUgUkVTVE9SRUNP
TkRfSU5TVEFMTF9JTklUX1NZU1RFTUQKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
