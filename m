Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7F1C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 01:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6835B60E62;
	Tue,  4 Oct 2022 01:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6835B60E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jOhVZIpun_7; Tue,  4 Oct 2022 01:11:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9C0460C06;
	Tue,  4 Oct 2022 01:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9C0460C06
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 738D11BF372
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 01:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BBF2830C0
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 01:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BBF2830C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IFcPS0zwZM1Q for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 01:11:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E0C4830E3
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E0C4830E3
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 01:11:33 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id a3so6793930wrt.0
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 18:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YTgZQbDE09TrStC2E/CPhxk0yXuWU8JKSbrriUhajPg=;
 b=1T5E62I0RhyOyYtFf0jAF4iad9xHenDIaiAfQNiWSkyKznhyDfCS9u1gfX4JjOyEJq
 wMAM3enNS04hbGEH9XgRzPxpxKOUA4bQusMukmreNSYtSoPFoPqJbjOzdIVr/skaEfvj
 l6iJMZEphiMWrfmBx1gWqZsNgpD09Vhhm01rJaf7m4jqcN8CGNR3AOdNpbbM+wYOpp3s
 G2VZ9uCeRCGsgPE7rj/qevhjGah2p9W/iI3ZMvLLMO7tZS8sFX4OYHTORwPcKZxmKIX7
 xcunX6yMH8/hrIaPSNhGYvYL1FppZha0Qyv2Og5sk5rfD84BgoTjS490UeMekc8JmRqt
 7A1g==
X-Gm-Message-State: ACrzQf2xY+ILSMa407Gh3MOUS1GRJWaI0kZbuIkyvGuXAQmyJX2Cvtwe
 ApUYDofZUzCmESgPzlx9f89bZMAbTQedRw==
X-Google-Smtp-Source: AMsMyM4HL4Rp3/IhPSxGoP7QjaPKhNCHUtZpzMLV2q7svno/5UbLv+obKUHDgf5m16m4XTdGmwkpxw==
X-Received: by 2002:a5d:6f0d:0:b0:229:a479:989e with SMTP id
 ay13-20020a5d6f0d000000b00229a479989emr13901943wrb.158.1664845891803; 
 Mon, 03 Oct 2022 18:11:31 -0700 (PDT)
Received: from localhost ([207.188.148.24]) by smtp.gmail.com with ESMTPSA id
 x6-20020adfdcc6000000b0022add371ed2sm11118253wrm.55.2022.10.03.18.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 18:11:31 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 03:10:36 +0200
Message-Id: <20221004011034.1283650-2-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004011034.1283650-1-salvador.joseluis@gmail.com>
References: <20221004011034.1283650-1-salvador.joseluis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YTgZQbDE09TrStC2E/CPhxk0yXuWU8JKSbrriUhajPg=;
 b=YHVIDgM5CLLEhH4xc0ddR1nTpHVC7Jxqn5TXU0Tskn6jrGD5sJmfQj5ZYFpRtpmCOR
 GtODvP2UQScFuH7+O1s/HWwQQFIoeb/5OFQpTcGR5pwNhXp9+JamDRTC87EJRN9nqarE
 sMK7VBMGvM7kV9vQ3ZAdxxs93tL4OP/j/LjkUeBuvwtA+jO3ieSW4sZIK84dqVbWgizY
 LpjRWVJzAl9hQK37tBxmxnoxnR9LbB70yY1kKVJGSwr9mxoABmfS73VTrki9e6rgr6OZ
 Cz2HPiNaJPQerv8cW5RjgIQnul7EE+q4tH28jcpg6FBgF0zFVZ5JgtMtcKeBvAxiEaow
 PuBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YHVIDgM5
Subject: [Buildroot] [PATCH 2/2] package/zfs: increase timeout for the ZFS
 tests
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
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TmV3ZXN0IHZlcnNpb25zIHJlcXVpcmVzIGEgYml0IG1vcmUgdGltZSB0byBmaW5pc2guCgpTaWdu
ZWQtb2ZmLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdt
YWlsLmNvbT4KLS0tCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weSB8
IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkgYi9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weQppbmRleCA2ODhiNjBkN2M0
Li4xZjAxZGRkNzY4IDEwMDY0NAotLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X3pmcy5weQorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5w
eQpAQCAtNCw2ICs0LDcgQEAgaW1wb3J0IGluZnJhLmJhc2V0ZXN0CiAKIAogY2xhc3MgVGVzdFpm
c0Jhc2UoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKKyAgICB0aW1lb3V0ID0gNjAgKiAzCiAgICAg
Y29uZmlnID0gXAogICAgICAgICAiIiIKICAgICAgICAgQlIyX3g4Nl82ND15CkBAIC01Nyw3ICs1
OCw3IEBAIGNsYXNzIFRlc3RaZnNCYXNlKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6CiAgICAgICAg
ICAgICAiYXJjX3N1bW1hcnkiLAogICAgICAgICBdCiAgICAgICAgIGZvciBjbWQgaW4gY21kczoK
LSAgICAgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soY21kKQorICAgICAgICAgICAgc2VsZi5hc3Nl
cnRSdW5PayhjbWQsIHRpbWVvdXQ9c2VsZi50aW1lb3V0KQogCiAKIGNsYXNzIFRlc3RaZnNHbGli
YyhUZXN0WmZzQmFzZSk6Ci0tIAoyLjM3LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
