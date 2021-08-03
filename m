Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81139C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 09:19:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36B9A603E7
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 09:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36B9A603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 040B860717;
	Tue,  3 Aug 2021 09:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id euDDYXOS_1ZW; Tue,  3 Aug 2021 09:19:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E8DD6063E;
	Tue,  3 Aug 2021 09:19:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7091BF2B0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 09:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AF17401BA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 09:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Brq3a4eXpdDm for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 09:19:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11733401B6
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 09:19:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso1691622wmp.1
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 02:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fU/d0Fmz/dLMeoreZNWTQHyFznrGOzAjtHeYolFI0Mo=;
 b=gyZLFtHJSiC1Z4CK8izwG/619mYU5LGDBjuxV4f7anyD1YrHTQJs4BM6zoC4IBhp4l
 QEhEQq3Ku+dxqT5DkZgC/h/SZYyAqB4I3atYcw26EXB4EmcHqB9swEHmLCxekmiZ7a1M
 kErhdDSFBSXNpx06FILbAN7WIgcc6U4REQRRiuetxMAI7ujJKiJjHY/FXnh/wNpHR5uw
 WFWtnnTQq9vYm174Mzoqk6ZPMsHnexmTBqa/47oECTInoC6zOyQbUbNA4aKM8f2m0qYK
 huyGpjp1hXBRkGg09cr5IS2SEhs24EqYWxqW8cNn4tcZebMLRhCrTUJQubufKnLMbyxz
 re7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fU/d0Fmz/dLMeoreZNWTQHyFznrGOzAjtHeYolFI0Mo=;
 b=V0f0omKMgmsC23R5k51/T18/df7riq1u4yDd5G69Pc4lpk7qW5j/RdLpc056Ln80Xe
 o7LtZb/rRJsWmAepNycrZ6itpnQpQM+oLGO/yz62guWZx4yEBR6sLOrxTAzPU7P2uu4u
 2iIuATQbRfKVXLHF+D8vi92suIN9duSPs57zI91fL2dY1vdL3P2LhNVhKLS1r7PsCJzg
 JvDWqLJ6vhT1uBODqPBTRV43P6rtzmBSOYxOFzUBbGTiQha0ZgrCK5dJOH+sIDHblJ5a
 qKZY0jpa8E6Oqil4tuAIAjBugNm3wTTwXSB9cpIRi6M2zUWMdNXcpBoAuv4X7QCbbTgC
 +wJw==
X-Gm-Message-State: AOAM532hEqrHc2FvrO9G0Wg5tKyYe3tD8zYd52NsMj8hFOmI25DGNw/e
 ZP3XoY9Eu68j1ZGxa+UWQhxY+psMg7ODpA==
X-Google-Smtp-Source: ABdhPJyPsUKcxtYo1EITrl9DxdVd7nVYP1oywjRDXpCEoTUnoDon6Ws9uc7ANk7GIpLgukLok14eMQ==
X-Received: by 2002:a7b:c94c:: with SMTP id i12mr3250939wml.148.1627982366866; 
 Tue, 03 Aug 2021 02:19:26 -0700 (PDT)
Received: from kali.home (pop.92-184-116-144.mobile.abo.orange.fr.
 [92.184.116.144])
 by smtp.gmail.com with ESMTPSA id j19sm2717970wmi.3.2021.08.03.02.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 02:19:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 11:19:18 +0200
Message-Id: <20210803091918.2777403-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gpsd: fix workaround for gcc bug
 68485
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

V29ya2Fyb3VuZCBmb3IgZ2NjIGJ1ZyA2ODQ4NSBkb2Vzbid0IHdvcmsgYW55bW9yZSBzaW5jZSBi
dW1wIHRvIHZlcnNpb24KMy4yMSBpbiBjb21taXQgNWIzZTcyMTM5OTUyZTBjOTUzYzg2NDljY2E1
NTU3MWNlYzVmMzgzNiBiZWNhdXNlIC1PMCBpcwptb3ZlZCBiZWZvcmUgLU9zIChwcm9iYWJseSBi
eSBzb21lIG9ic2N1cmUgc2NvbnMgZnVuY3Rpb24pOgoKL3RtcC9pbnN0YW5jZS03L291dHB1dC0x
L2hvc3QvYmluL21pY3JvYmxhemVlbC1saW51eC1nY2MgLW8gcnRjbTJfanNvbi5vcyAtYyAtLXN5
c3Jvb3Q9L3RtcC9pbnN0YW5jZS03L291dHB1dC0xL2hvc3QvbWljcm9ibGF6ZWVsLWJ1aWxkcm9v
dC1saW51eC11Y2xpYmMvc3lzcm9vdCAtcHRocmVhZCAtV2FsbCAtV2Nhc3QtYWxpZ24gLVdleHRy
YSAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoIC1XbWlzc2luZy1kZWNsYXJhdGlvbnMgLVdtaXNzaW5n
LXByb3RvdHlwZXMgLVduby1taXNzaW5nLWZpZWxkLWluaXRpYWxpemVycyAtV25vLXVuaW5pdGlh
bGl6ZWQgLVdwb2ludGVyLWFyaXRoIC1XcmV0dXJuLXR5cGUgLVdzdHJpY3QtcHJvdG90eXBlcyAt
V3ZsYSAtTzAgLU9zIC1nMCAtcHRocmVhZCAtZlBJQyAtRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xB
UkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1JL3RtcC9pbnN0YW5jZS03
L291dHB1dC0xL2hvc3QvbWljcm9ibGF6ZWVsLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvc3lzcm9v
dC91c3IvaW5jbHVkZS9kYnVzLTEuMCAtSS90bXAvaW5zdGFuY2UtNy9vdXRwdXQtMS9ob3N0L21p
Y3JvYmxhemVlbC1idWlsZHJvb3QtbGludXgtdWNsaWJjL3N5c3Jvb3QvdXNyL2xpYi9kYnVzLTEu
MC9pbmNsdWRlIHJ0Y20yX2pzb24uYwpkdXJpbmcgUlRMIHBhc3M6IHJlbG9hZApydGNtMl9qc29u
LmM6IEluIGZ1bmN0aW9uIOKAmGpzb25fcnRjbTJfcmVhZOKAmToKcnRjbTJfanNvbi5jOjI2Nzox
OiBpbnRlcm5hbCBjb21waWxlciBlcnJvcjogaW4gZ2VuX3JlZ19ydHgsIGF0IGVtaXQtcnRsLmM6
MTE1NQogIDI2NyB8IH0KICAgICAgfCBeCgpGaXhlczoKIC0gaHR0cDovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnL3Jlc3VsdHMvZmFiMzNmMjViMDhmYTIxOGFmOTE2NDBmZGJkOGMwZGNmMWQwNzIy
OAoKU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+Ci0tLQogcGFja2FnZS9ncHNkL2dwc2QubWsgfCA5ICsrKysrKy0tLQogMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL2dwc2QvZ3BzZC5tayBiL3BhY2thZ2UvZ3BzZC9ncHNkLm1rCmluZGV4IDBmYmI1ZGZhMWQu
LmRmMWYyNzNjZTUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZ3BzZC9ncHNkLm1rCisrKyBiL3BhY2th
Z2UvZ3BzZC9ncHNkLm1rCkBAIC0xNSw5ICsxNSw2IEBAIEdQU0RfSU5TVEFMTF9TVEFHSU5HID0g
WUVTCiBHUFNEX0RFUEVOREVOQ0lFUyA9IGhvc3QtcHl0aG9uMyBob3N0LXNjb25zIGhvc3QtcGtn
Y29uZgogCiBHUFNEX0xERkxBR1MgPSAkKFRBUkdFVF9MREZMQUdTKQotR1BTRF9DRkxBR1MgPSAk
KFRBUkdFVF9DRkxBR1MpCi0KLUdQU0RfU0NPTlNfRU5WID0gJChUQVJHRVRfQ09ORklHVVJFX09Q
VFMpCiAKIEdQU0RfU0NPTlNfT1BUUyA9IFwKIAlhcmNoPSQoQVJDSCkgXApAQCAtNDUsNyArNDIs
MTMgQEAgR1BTRF9TQ09OU19PUFRTICs9IGxpYmdwc21tPW5vCiBlbmRpZgogCiBpZmVxICgkKEJS
Ml9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfNjg0ODUpLHkpCisjIEZpbHRlciBvdXQgYW55IG9wdGlt
aXNhdGlvbiBmbGFncyB0byBiZSBzdXJlIHRoYXQgLU8wIHdpbGwgYmUgdXNlZAorR1BTRF9TQ09O
U19FTlYgKz0gJChmaWx0ZXItb3V0IC1PJSwkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykpCitHUFNE
X0NGTEFHUyArPSAkKGZpbHRlci1vdXQgLU8lLCQoVEFSR0VUX0NGTEFHUykpCiBHUFNEX0NGTEFH
UyArPSAtTzAKK2Vsc2UKK0dQU0RfU0NPTlNfRU5WICs9ICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRT
KQorR1BTRF9DRkxBR1MgKz0gJChUQVJHRVRfQ0ZMQUdTKQogZW5kaWYKIAogIyBJZiBsaWJ1c2Ig
aXMgYXZhaWxhYmxlIGJ1aWxkIGl0IGJlZm9yZSBzbyB0aGUgcGFja2FnZSBjYW4gdXNlIGl0Ci0t
IAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0
cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
