Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49189C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:08:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD9A26056B
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD9A26056B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87E4682AB6;
	Tue,  7 Sep 2021 12:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R8O4YA5xhXKx; Tue,  7 Sep 2021 12:08:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AD0B82AB9;
	Tue,  7 Sep 2021 12:08:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 157D21BF334
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12760401EA
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6QLKiUzu6rrA for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 12:08:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B412401C6
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 12:08:31 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id e21so19142914ejz.12
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 05:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2yoUUYxpQbUxGuM4EpAGUYJFghAXRpQnvF2RRwmrP4c=;
 b=R+lovLN3ajcz+jkRdwfpBzZ/Yjlb+tTGtbCx3JNyQAGPgCjEogdiwRAKFHBR49JXr9
 oyCs7sT53cAoPyM8w5WiskLL4XWsHPgKmx56/EQt88n0Sp7uIMcp7bg3hyadxonsjDG+
 lJ7azpk0u8lnQ8EQZvNhIiNk3ZqqNKqThDuwKMI0Z9M0bGQCRiVlB/gRB5B1Ur7VrCjZ
 H+FQRsg/CwJXrdPgsjJ0u8FplUaJ7oLQp1JVHaA0OsnYUf/B1ZeOk90uYfYgFjRXoVkj
 2cjNRxdmlcX+W9aS+TxTSzzu/KMDul+ddyvQMrB/QwprzgVzwHRqZWGdidZW8pvfQu5r
 gWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2yoUUYxpQbUxGuM4EpAGUYJFghAXRpQnvF2RRwmrP4c=;
 b=QIsDYIRIxbcKiaztIJOLe895UbaqJykdGtPTcaBEQH+KrYAllXG1V6m7d652FrDOte
 IxO2VLIXzli1Zp7Lqv7rny5oiKEpL6D+3khw8HU8LqLGdzLbcjmElSdviQ1iENgtizw8
 kdbMXzEEVltWEe3bCQzvOHjOz2HR0FebmLTc1GNgPgbvT8u+7zskvGqK/ftfY2MJ6DyA
 FiMA2Jvy56q1EHYy7Y2NzsWQGOm2ZI+weF2TxOMtwcA02RBsvBSxogaBlcxH4QtvOzaq
 BpLtX/os0F3m6AUY0laFjOMZiAK/AqTYiGeBNBy2WHqB/jZQwF1r/EoYSah4FCLIjMqL
 ub+Q==
X-Gm-Message-State: AOAM530/JLqz5yS84gUx1UcugCgZnUy8XStj2lI7MqF2o9jzfICRbxyp
 cTWe731DWZLQwVVu7MOjM5FO/iAjmWvCb3gW
X-Google-Smtp-Source: ABdhPJy9Gw7J1Lcqu/nnN3nCQhWrOIHLZTIdl4dZ6qiUaYUliPNKLy63blViDFk9ZhogUuHWu+5OuA==
X-Received: by 2002:a17:906:c252:: with SMTP id
 bl18mr17759022ejb.519.1631016509845; 
 Tue, 07 Sep 2021 05:08:29 -0700 (PDT)
Received: from debian-hp-1.home (5.26-130-109.adsl-dyn.isp.belgacom.be.
 [109.130.26.5])
 by smtp.gmail.com with ESMTPSA id s3sm5507327ejm.49.2021.09.07.05.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 05:08:29 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Tue,  7 Sep 2021 14:07:48 +0200
Message-Id: <20210907120750.31432-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907120750.31432-1-raphael.melotte@mind.be>
References: <20210907120750.31432-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: fix
 building on mips with GCC10
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

UG9ydCB0aGUgZm9sbG93aW5nIHVwc3RyZWFtIGNvbW1pdDoKaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL3hvcmcveHNlcnZlci8tL21lcmdlX3JlcXVlc3RzLzU5MS9kaWZmcz9jb21taXRf
aWQ9MDE0OGExNWRhMTYxNmE4NjhkNzFhYmUxYjU2ZTNmMjhjYzc5NTMzYwoKVGhpcyBmaXhlcyB0
aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yIG9uIG1pcHMgd2l0aCBHQ0MxMDoKICBDQ0xEICAgICBs
aWJpbnQxMC5sYQpidWlsZHJvb3Qvb3V0cHV0L2hvc3QvbGliL2djYy9taXBzNjRlbC1idWlsZHJv
b3QtbGludXgtZ251LzEwLjMuMC8uLi8uLi8uLi8uLi9taXBzNjRlbC1idWlsZHJvb3QtbGludXgt
Z251L2Jpbi9sZDogLmxpYnMvaGVscGVyX21lbS5vOiguYnNzKzB4MCk6IG11bHRpcGxlIGRlZmlu
aXRpb24gb2YgYElPUG9ydEJhc2UnOyAubGlicy9oZWxwZXJfZXhlYy5vOiguYnNzKzB4MCk6IGZp
cnN0IGRlZmluZWQgaGVyZQoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhh
ZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIC4uLi1kZWZpbmUtaW5iLW91dGItYW5kLWZyaWVuZHMt
b24tbWlwcy5wYXRjaCB8IDczICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3
MyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS94MTFyNy94c2VydmVy
X3hvcmctc2VydmVyLzAwMDYtY29tcGlsZXIuaC1kb24tdC1kZWZpbmUtaW5iLW91dGItYW5kLWZy
aWVuZHMtb24tbWlwcy5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UveDExcjcveHNlcnZlcl94
b3JnLXNlcnZlci8wMDA2LWNvbXBpbGVyLmgtZG9uLXQtZGVmaW5lLWluYi1vdXRiLWFuZC1mcmll
bmRzLW9uLW1pcHMucGF0Y2ggYi9wYWNrYWdlL3gxMXI3L3hzZXJ2ZXJfeG9yZy1zZXJ2ZXIvMDAw
Ni1jb21waWxlci5oLWRvbi10LWRlZmluZS1pbmItb3V0Yi1hbmQtZnJpZW5kcy1vbi1taXBzLnBh
dGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjQ2OWNhN2UzZmMKLS0t
IC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3gxMXI3L3hzZXJ2ZXJfeG9yZy1zZXJ2ZXIvMDAwNi1j
b21waWxlci5oLWRvbi10LWRlZmluZS1pbmItb3V0Yi1hbmQtZnJpZW5kcy1vbi1taXBzLnBhdGNo
CkBAIC0wLDAgKzEsNzMgQEAKK0Zyb20gZGU1ZTI0YjUwMzZhMWE1YTg3N2Y4ZjMwMTY5ZTM0OTdk
MGUyOTZkNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IEp1bGllbiBDcmlzdGF1IDxq
Y3Jpc3RhdUBkZWJpYW4ub3JnPgorRGF0ZTogV2VkLCA2IEphbiAyMDIxIDEwOjIwOjUzICswMTAw
CitTdWJqZWN0OiBbUEFUQ0hdIGNvbXBpbGVyLmg6IGRvbid0IGRlZmluZSBpbmIvb3V0YiBhbmQg
ZnJpZW5kcyBvbiBtaXBzCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3Bs
YWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK1Ro
ZSBkZWZpbml0aW9uIHJlbGllcyBvbiBJT1BvcnRCYXNlLCB3aGljaCBpcyBvbmx5IGV2ZXIgc2V0
IGluCitody94ZnJlZTg2L29zLXN1cHBvcnQvYnNkL2FybV92aWRlby5jCisKK1RoaXMgY2F1c2Vk
IGJ1aWxkIGZhaWx1cmVzIG9uIGxpbnV4L21pcHMgd2l0aCBHQ0MgMTAsIGR1ZSB0byB0aGlzCitj
aGFuZ2UgKGZyb20gaHR0cHM6Ly9nY2MuZ251Lm9yZy9nY2MtMTAvY2hhbmdlcy5odG1sI2MpOgor
CisiR0NDIG5vdyBkZWZhdWx0cyB0byAtZm5vLWNvbW1vbi4gQXMgYSByZXN1bHQsIGdsb2JhbCB2
YXJpYWJsZSBhY2Nlc3NlcworYXJlIG1vcmUgZWZmaWNpZW50IG9uIHZhcmlvdXMgdGFyZ2V0cy4g
SW4gQywgZ2xvYmFsIHZhcmlhYmxlcyB3aXRoCittdWx0aXBsZSB0ZW50YXRpdmUgZGVmaW5pdGlv
bnMgbm93IHJlc3VsdCBpbiBsaW5rZXIgZXJyb3JzLiBXaXRoCistZmNvbW1vbiBzdWNoIGRlZmlu
aXRpb25zIGFyZSBzaWxlbnRseSBtZXJnZWQgZHVyaW5nIGxpbmtpbmcuIgorCitBcyBhIHJlc3Vs
dCBhbnl0aGluZyBpbmNsdWRpbmcgY29tcGlsZXIuaCB3b3VsZCBnZXQgaXRzIG93biBkZWZpbml0
aW9uCitvZiBJT1BvcnRCYXNlIGFuZCB0aGUgbGlua2VyIHdvdWxkIGVycm9yIG91dC4KKworU2ln
bmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgor
LS0tCisgaHcveGZyZWU4Ni9jb21tb24vY29tcGlsZXIuaCAgICAgICAgICB8IDggKystLS0tLS0K
KyBody94ZnJlZTg2L29zLXN1cHBvcnQvYnNkL2FybV92aWRlby5jIHwgMyArKysKKyAyIGZpbGVz
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBh
L2h3L3hmcmVlODYvY29tbW9uL2NvbXBpbGVyLmggYi9ody94ZnJlZTg2L2NvbW1vbi9jb21waWxl
ci5oCitpbmRleCAyYjIwMDhiM2YuLmViNzg4ZDNmZCAxMDA2NDQKKy0tLSBhL2h3L3hmcmVlODYv
Y29tbW9uL2NvbXBpbGVyLmgKKysrKyBiL2h3L3hmcmVlODYvY29tbW9uL2NvbXBpbGVyLmgKK0BA
IC01MTgsMTQgKzUxOCwxMCBAQCB4Zjg2V3JpdGVNbWlvMzJMZShfX3ZvbGF0aWxlX18gdm9pZCAq
YmFzZSwgY29uc3QgdW5zaWduZWQgbG9uZyBvZmZzZXQsCisgICAgIGJhcnJpZXIoKTsKKyB9Cisg
CistI2VsaWYgZGVmaW5lZChfX21pcHNfXykgfHwgKGRlZmluZWQoX19hcm0zMl9fKSAmJiAhZGVm
aW5lZChfX2xpbnV4X18pKQorLSNpZiBkZWZpbmVkKF9fYXJtMzJfXykgfHwgZGVmaW5lZChfX21p
cHM2NCkKKysjZWxpZiBkZWZpbmVkKF9fYXJtMzJfXykgJiYgIWRlZmluZWQoX19saW51eF9fKQor
ICNkZWZpbmUgUE9SVF9TSVpFIGxvbmcKKy0jZWxzZQorLSNkZWZpbmUgUE9SVF9TSVpFIHNob3J0
CistI2VuZGlmCisgCistX1hfRVhQT1JUIHVuc2lnbmVkIGludCBJT1BvcnRCYXNlOyAgICAgIC8q
IE1lbW9yeSBtYXBwZWQgSS9PIHBvcnQgYXJlYSAqLworK2V4dGVybiBfWF9FWFBPUlQgdW5zaWdu
ZWQgaW50IElPUG9ydEJhc2U7ICAgICAgLyogTWVtb3J5IG1hcHBlZCBJL08gcG9ydCBhcmVhICov
CisgCisgc3RhdGljIF9faW5saW5lX18gdm9pZAorIG91dGIodW5zaWduZWQgUE9SVF9TSVpFIHBv
cnQsIHVuc2lnbmVkIGNoYXIgdmFsKQorZGlmZiAtLWdpdCBhL2h3L3hmcmVlODYvb3Mtc3VwcG9y
dC9ic2QvYXJtX3ZpZGVvLmMgYi9ody94ZnJlZTg2L29zLXN1cHBvcnQvYnNkL2FybV92aWRlby5j
CitpbmRleCBkZDEwMjBlMzMuLjE4MGQ3MDU0MyAxMDA2NDQKKy0tLSBhL2h3L3hmcmVlODYvb3Mt
c3VwcG9ydC9ic2QvYXJtX3ZpZGVvLmMKKysrKyBiL2h3L3hmcmVlODYvb3Mtc3VwcG9ydC9ic2Qv
YXJtX3ZpZGVvLmMKK0BAIC02NSw2ICs2NSw3IEBACisgI2luY2x1ZGUgInhmODZQcml2LmgiCisg
I2luY2x1ZGUgInhmODZfT1NsaWIuaCIKKyAjaW5jbHVkZSAieGY4Nk9TcHJpdi5oIgorKyNpbmNs
dWRlICJjb21waWxlci5oIgorIAorICNpZiBkZWZpbmVkKF9fTmV0QlNEX18pICYmICFkZWZpbmVk
KE1BUF9GSUxFKQorICNkZWZpbmUgTUFQX0ZMQUdTIE1BUF9TSEFSRUQKK0BAIC0xNjIsNiArMTYz
LDggQEAgeGY4NkRpc2FibGVJTygpCisgCisgI2lmIGRlZmluZWQoVVNFX0FSQ19NTUFQKSB8fCBk
ZWZpbmVkKF9fYXJtMzJfXykKKyAKKyt1bnNpZ25lZCBpbnQgSU9Qb3J0QmFzZTsKKysKKyBCb29s
CisgeGY4NkVuYWJsZUlPKCkKKyB7CistLSAKKzIuMzIuMAorCi0tIAoyLjMyLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
