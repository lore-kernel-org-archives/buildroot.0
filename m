Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4807C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 13:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AAE981328;
	Tue, 26 Apr 2022 13:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIKSgN2r84m9; Tue, 26 Apr 2022 13:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7169E8127F;
	Tue, 26 Apr 2022 13:29:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B75571BF5B4
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 13:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3CEE409D9
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 13:29:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3FRzW1TgQC8 for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 13:29:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFD854018D
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 13:29:12 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id w4so25433983wrg.12
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t9a6C30KBkLqCCI88qePGd8LMWAmAF/3JyuVS2GgHtY=;
 b=n6vB+eCXlnyAOkKLq72cg9SbMpkQuzdTw+F1bSFUviis5eYyBT+jfx026u3oMqa9Xe
 +iZv03Fl0v6K91F3MPIOM+3Tvgl0Os/Wiav41A28sX+pikHMSdL3cw8XASwDPcjRcwe4
 9GFDJKmCIUzFVg8cwJJeOefbxVmiKGJcoFB1wsf+OodlYGlPNoFvXyyJMlXti4kyqDez
 +sJNAWs1YaBFwSUdbiAoBQUfFf6Fa2IeQMdaXbnVK32R1ohk1LA4a5/i/I0HVL8y2/UD
 gaoXknVTsY3UgzS8PzRCDb/gzm805/8XNpL6ISP6ntURhcyQeuHWWK9hkcDUTtZFNWBD
 0vDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t9a6C30KBkLqCCI88qePGd8LMWAmAF/3JyuVS2GgHtY=;
 b=SHBl2EUhJDv209aO7FHWaP70lOKdsiTVgA4C4xx7ulXihuCe6p3QnQmf33xjrt0/VF
 mcm0TkkP/FBSOSbY0GY/HO07idvMVxZtQyKp5oZ1A/OHBmQWRhjfTBXwmg5nTQVRImIy
 +8pGef96cC11uovt3WoxrDLO0L729tRxnqpCLttZ4o7npPirIu0UMxM/A8MUgryoQCFO
 V8FmgzLzO5d4NrCmqt5Q0C9B24MeOtBNdWcjX9A3v0DcYKpCEdeVnuEWM/ZISCnQmgMZ
 KSnqcDjSuf+Rf/2RdgPXfOAKlaZ3TD/fF2hoRqFHXmb4GfwHX+YiFmC+qkjYAISM/mqH
 lhZw==
X-Gm-Message-State: AOAM532JEObMQSiCVSYqkr0LVRDzM/fVijyxOg3MNCotsPCxI8ty6ewE
 fRRH6ZYJClZ75QXJ4uy16MIgFgfw0l8=
X-Google-Smtp-Source: ABdhPJzcwf7r2OnGZkEE58sZFKenZFNEfc5oGrjLC0yUewuizq34NdiL1UlDymu2G98DVpjPmHnopg==
X-Received: by 2002:a05:6000:1681:b0:20a:7e5d:f866 with SMTP id
 y1-20020a056000168100b0020a7e5df866mr18250350wrd.58.1650979750900; 
 Tue, 26 Apr 2022 06:29:10 -0700 (PDT)
Received: from localhost ([207.188.150.225]) by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c3b8500b00393fb9923basm1158293wms.39.2022.04.26.06.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 06:29:10 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Tue, 26 Apr 2022 15:28:34 +0200
Message-Id: <20220426132833.1579873-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] docs/manual/prerequisite.txt: add diffutils
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

UGF0Y2ggdGl0bGU6IGRvY3MvbWFudWFsL3ByZXJlcXVpc2l0ZS50eHQ6IGFkZCBkaWZmdXRpbHMK
ClRoZSBjb21tYW5kIGBjbXBgIGlzIHVzZWQgYnkgYHBhY2thZ2UvcGtnLWdlbmVyaWMubWtgIGF0
IGNvbW1pdAo4NjIzY2M1ZGViNS4gVGhpcyBjb21tYW5kIGlzIHByb3ZpZGVkIGJ5IGBkaWZmdXRp
bHNgLgoKU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5q
b3NlbHVpc0BnbWFpbC5jb20+Ci0tLQogZG9jcy9tYW51YWwvcHJlcmVxdWlzaXRlLnR4dCB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZG9jcy9tYW51
YWwvcHJlcmVxdWlzaXRlLnR4dCBiL2RvY3MvbWFudWFsL3ByZXJlcXVpc2l0ZS50eHQKaW5kZXgg
NDAwNzE0OTFmOC4uNzYzZmU3OTA0MSAxMDA2NDQKLS0tIGEvZG9jcy9tYW51YWwvcHJlcmVxdWlz
aXRlLnR4dAorKysgYi9kb2NzL21hbnVhbC9wcmVyZXF1aXNpdGUudHh0CkBAIC0yMyw2ICsyMyw3
IEBAIGJldHdlZW4gZGlzdHJpYnV0aW9ucykuCiAqKiArbWFrZSsgKHZlcnNpb24gMy44MSBvciBh
bnkgbGF0ZXIpCiAqKiArYmludXRpbHMrCiAqKiArYnVpbGQtZXNzZW50aWFsKyAob25seSBmb3Ig
RGViaWFuIGJhc2VkIHN5c3RlbXMpCisqKiArZGlmZnV0aWxzKwogKiogK2djYysgKHZlcnNpb24g
NC44IG9yIGFueSBsYXRlcikKICoqIGBnKytgICh2ZXJzaW9uIDQuOCBvciBhbnkgbGF0ZXIpCiAq
KiArYmFzaCsKLS0gCjIuMzYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
