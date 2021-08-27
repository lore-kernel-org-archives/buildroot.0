Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BCFC432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 09:18:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8982260EAF
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 09:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8982260EAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 534A961520;
	Fri, 27 Aug 2021 09:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UCH_rj1V-YmF; Fri, 27 Aug 2021 09:18:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 947D761523;
	Fri, 27 Aug 2021 09:17:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A945D1BF390
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 09:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4ABDF6151E
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 09:17:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W9tfbDa6jyqE for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 09:17:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EE8B6151A
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 09:17:53 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t15so3142656wrg.7
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 02:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rF1v+2w3xje85qbdsokyj83UMC/yIUdBqmv6Lm86ULw=;
 b=fBeFcxfstwDt8e22JhgsXgspi32IasUG6vne8AHf0pc9H9W+wg+3kzPU6T59mWmQ1Q
 Z5mIrudP9Iak0Va4eMpE/JD18kDB6RFdhP3KJ5AwmRGIq/CRZWy/8MZYFQbPwh0Fa8RJ
 Px10q4j9b3wAFNl7WPp7uuPWIwK72NEij0uL2hq9VH4ZIj7vlCri+mX9MXoA6Lfxenrp
 JTmXM+AYY0ZgQdmowkpWfaJi3YJeycGCoiVAd497AYDmBDfXDGupPuns9pfUnEYxUN/+
 RWLZ1cLMjn5wJcWtVLXpsRfhV1ivwRHLQxzIdb/LXh6UHwXdXMafI8ilPqex7xrxTfQ8
 KbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rF1v+2w3xje85qbdsokyj83UMC/yIUdBqmv6Lm86ULw=;
 b=aNUI3rkHWnCEeF0Pnm+IiQ9mJFhqMORkOE2Un2LgmS2wX1TzFxdDBONRFp/4CDSKcN
 wZ4uTRCIit/f4cIT/RG6EmLZB9haLOq1OmXzprXwth8yjEoxZ1H/gjIa+pYHV8Hc1Gmo
 dw8lnjfAh+gz4AApcQFzkwxenykxIQczqJASlOJzOs/8oWPoIcCJE2YhJvq3praF5tMS
 b8sxqrpjTP9CF3PTL/YzLZX1++2l3irmV7FqQvwCaFzjfz3FEvuX0jYQUEfmrzApzO1p
 GmZdkGzdt5Rmy+Cnjkv9eXm4MoDpgmtZ/+C8NdYYnUIkntPNf8ZENwBUxDpffyj/xqRN
 e2kA==
X-Gm-Message-State: AOAM5302SXfBJloK/xCnWK8h9nENHiVR8HP9sH/MWVrQ6YS9S9b5e6rI
 /v+k74+yPjgV3hxQLGfMRVFt/pfZ7lU=
X-Google-Smtp-Source: ABdhPJxbkjJ7EaxZPhmZBODHxPap7IWPo2AkwMzi+LzuhHQ4df50Ch4tMEpu8cnN9O8hoiuEQuFFRg==
X-Received: by 2002:adf:80eb:: with SMTP id 98mr1197290wrl.370.1630055871399; 
 Fri, 27 Aug 2021 02:17:51 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id s17sm10798871wmj.12.2021.08.27.02.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 02:17:50 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Aug 2021 11:17:43 +0200
Message-Id: <20210827091743.2516027-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv2] package/zfs: Fix cross-platform-compilations
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

RnJvbTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5j
b20+CgpUaGlzIHBhdGNoIGZpeGVzIHRoZSBgbWFrZWAgZXhlY3V0ZWQgZnJvbSB0aGUgYGtlcm5l
bC5tNGAgaW4KY3Jvc3MtcGxhdGZvcm0tY29tcGlsYXRpb25zIGVudmlyb25tZW50czoKaHR0cHM6
Ly9naXRodWIuY29tL29wZW56ZnMvemZzL2Jsb2IvemZzLTIuMC41L2NvbmZpZy9rZXJuZWwubTQj
TDU4OAoKRml4ZXM6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0vam9icy8x
NTIyODQ4NDgzCgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZh
ZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21h
aW4ubmFvdXJAZ21haWwuY29tPgotLS0KdjI6IGFkZCBhIHBhdGNoIHRvIHJlbW92ZSBERVNURElS
IHVzZWQgd2l0aCBJTlNUQUxMX01PRF9QQVRICiAgICBVc2UgTElOVVhfTUFLRV9GTEFHUyBmb3Ig
WkZTX01BS0VfRU5WIGFuZCBaRlNfQ09ORl9FTlYKICAgIGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5l
dC9waXBlcm1haWwvYnVpbGRyb290LzIwMjEtQXVndXN0LzYyMTM1MC5odG1sCi0tLQogLi4uaW4t
ZG9uLXQtdXNlLURFU1RESVItYW5kLUlOU1RBTExfTU9ELnBhdGNoIHwgNDQgKysrKysrKysrKysr
KysrKysrKwogcGFja2FnZS96ZnMvemZzLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDUgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3pmcy8wMDAxLW1vZHVsZS1NYWtlZmlsZS5pbi1kb24tdC11c2UtREVTVERJ
Ui1hbmQtSU5TVEFMTF9NT0QucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3pmcy8wMDAxLW1v
ZHVsZS1NYWtlZmlsZS5pbi1kb24tdC11c2UtREVTVERJUi1hbmQtSU5TVEFMTF9NT0QucGF0Y2gg
Yi9wYWNrYWdlL3pmcy8wMDAxLW1vZHVsZS1NYWtlZmlsZS5pbi1kb24tdC11c2UtREVTVERJUi1h
bmQtSU5TVEFMTF9NT0QucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MC4uZTFkMGY5MTUzMwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvemZzLzAwMDEtbW9kdWxl
LU1ha2VmaWxlLmluLWRvbi10LXVzZS1ERVNURElSLWFuZC1JTlNUQUxMX01PRC5wYXRjaApAQCAt
MCwwICsxLDQ0IEBACitGcm9tIDEyODUxYThkYmMwYWViOGU0OGYyMWYxZTBjYjdiMzEyMzAyOTU5
NGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSb21haW4gTmFvdXIgPHJvbWFpbi5u
YW91ckBnbWFpbC5jb20+CitEYXRlOiBUaHUsIDI2IEF1ZyAyMDIxIDIzOjEyOjMxICswMjAwCitT
dWJqZWN0OiBbUEFUQ0hdIG1vZHVsZS9NYWtlZmlsZS5pbjogZG9uJ3QgdXNlIERFU1RESVIgYW5k
IElOU1RBTExfTU9EX1BBVEgKKyB0b2dldGhlcgorCitERVNURElSIGFuZCBJTlNUQUxMX01PRF9Q
QVRIIGFyZSB1c3VhbGx5IHNldCB3aXRoIGFic29sdXRlIHBhdGgKK2J5IGJ1aWxkIHN5c3RlbSAo
QnVpbGRyb290KSwgc28gd2hlbiB1c2VkIHRvZ2V0aGVyIGl0IGNvbmNhdGVuYXRlcwordHdvIGFi
c29sdXRlIHBhdGguCisKK0tlZXAgSU5TVEFMTF9NT0RfUEFUSCBzaW5jZSBpdCdzIHNldCB3aGVu
IGJ1aWxkaW5nIGFuIG91dCBvZiB0cmVlCitrZXJuZWwgbW9kdWxlLgorCitTaWduZWQtb2ZmLWJ5
OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+CistLS0KKyBtb2R1bGUvTWFr
ZWZpbGUuaW4gfCA2ICsrKy0tLQorIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9tb2R1bGUvTWFrZWZpbGUuaW4gYi9tb2R1bGUv
TWFrZWZpbGUuaW4KK2luZGV4IDY5Y2FmNDg1Ny4uMDQzZjJiZGVhIDEwMDY0NAorLS0tIGEvbW9k
dWxlL01ha2VmaWxlLmluCisrKysgYi9tb2R1bGUvTWFrZWZpbGUuaW4KK0BAIC03NiwxNSArNzYs
MTUgQEAgY2xlYW46IGNsZWFuLUBhY19zeXN0ZW1ACisgbW9kdWxlc19pbnN0YWxsLUxpbnV4Ogor
IAlAIyBJbnN0YWxsIHRoZSBrZXJuZWwgbW9kdWxlcworIAkkKE1BS0UpIC1DIEBMSU5VWF9PQkpA
IE09YHB3ZGAgbW9kdWxlc19pbnN0YWxsIFwKKy0JCUlOU1RBTExfTU9EX1BBVEg9JChERVNURElS
KSQoSU5TVEFMTF9NT0RfUEFUSCkgXAorKwkJSU5TVEFMTF9NT0RfUEFUSD0kKElOU1RBTExfTU9E
X1BBVEgpIFwKKyAJCUlOU1RBTExfTU9EX0RJUj0kKElOU1RBTExfTU9EX0RJUikgXAorIAkJS0VS
TkVMUkVMRUFTRT1ATElOVVhfVkVSU0lPTkAKKyAJQCMgUmVtb3ZlIGV4dHJhbmVvdXMgYnVpbGQg
cHJvZHVjdHMgd2hlbiBwYWNrYWdpbmcKKy0Ja21vZGRpcj0kKERFU1RESVIpJChJTlNUQUxMX01P
RF9QQVRIKS9saWIvbW9kdWxlcy9ATElOVVhfVkVSU0lPTkA7IFwKKysJa21vZGRpcj0kKElOU1RB
TExfTU9EX1BBVEgpL2xpYi9tb2R1bGVzL0BMSU5VWF9WRVJTSU9OQDsgXAorIAlpZiBbIC1uICIk
KERFU1RESVIpIiBdOyB0aGVuIFwKKyAJCWZpbmQgJCRrbW9kZGlyIC1uYW1lICdtb2R1bGVzLion
IHwgeGFyZ3MgJChSTSk7IFwKKyAJZmkKKy0Jc3lzbWFwPSQoREVTVERJUikkKElOU1RBTExfTU9E
X1BBVEgpL2Jvb3QvU3lzdGVtLm1hcC1ATElOVVhfVkVSU0lPTkA7IFwKKysJc3lzbWFwPSQoSU5T
VEFMTF9NT0RfUEFUSCkvYm9vdC9TeXN0ZW0ubWFwLUBMSU5VWF9WRVJTSU9OQDsgXAorIAlpZiBb
IC1mICQkc3lzbWFwIF07IHRoZW4gXAorIAkJZGVwbW9kIC1hZSAtRiAkJHN5c21hcCBATElOVVhf
VkVSU0lPTkA7IFwKKyAJZmkKKy0tIAorMi4zMS4xCisKZGlmZiAtLWdpdCBhL3BhY2thZ2UvemZz
L3pmcy5tayBiL3BhY2thZ2UvemZzL3pmcy5tawppbmRleCAzYjFhZmI0MTlhLi41MzdkNGVjZTE1
IDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMubWsKKysrIGIvcGFja2FnZS96ZnMvemZzLm1r
CkBAIC0xMyw2ICsxMywxMSBAQCBaRlNfQ1BFX0lEX1BST0RVQ1QgPSBvcGVuemZzCiAKIFpGU19B
VVRPUkVDT05GID0gWUVTCiAKKyMgY3Jvc3MgY29tcGlsZSBlbnZpcm9ubWVudCBmb3IgbGludXgg
a2VybmVsIG1vZHVsZQorWkZTX01BS0VfRU5WID0gJChMSU5VWF9NQUtFX0ZMQUdTKQorIyBgLi9j
b25maWd1cmVgIHdpbGwgZXhlY3V0ZSBhIGBtYWtlIG1vZHVsZXNgIHRlc3QgY2FzZQorWkZTX0NP
TkZfRU5WID0gJChMSU5VWF9NQUtFX0ZMQUdTKQorCiBaRlNfREVQRU5ERU5DSUVTID0gbGliYWlv
IG9wZW5zc2wgdWRldiB1dGlsLWxpbnV4IHpsaWIKIAogIyBzeXN2aW5pdCBpbnN0YWxscyBvbmx5
IGEgY29tbWVudGVkLW91dCBtb2R1bGVzLWxvYWQuZC8gY29uZmlnIGZpbGUKLS0gCjIuMzEuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gu
bmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
