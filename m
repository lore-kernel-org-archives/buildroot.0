Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1EFC3ABC3
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 20:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC79608E0;
	Sat, 10 May 2025 20:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbWpG0bG_WkQ; Sat, 10 May 2025 20:31:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9256605F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9256605F7;
	Sat, 10 May 2025 20:31:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79604E0
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A6EA407A0
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZ1z3KMKr_-8 for <buildroot@buildroot.org>;
 Sat, 10 May 2025 20:31:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82F83407B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82F83407B6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82F83407B6
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:31:42 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-54ea69e9352so4127936e87.2
 for <buildroot@buildroot.org>; Sat, 10 May 2025 13:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746909100; x=1747513900;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ss1gQ4RgfwDsaxi2lz7UjUVfDahEB3W74mtcy5ojw18=;
 b=Br54tdiZpjh5NGcS0oSgC8oHb/gyd0tWBjFEV38NlANXQee8rD6w/OmWJfVn6sKtpZ
 vEfpWjLt5e+C+ihrbKMwXM6mNu01yV/D0TH+0OOLVfE1H5Afvn67kGqWQpMCxji7gU2w
 FuISu3OhznDLM0VUfBXpl5L3naLKgDQi3Hb1VEdfemN27FoBVAhpiUsDIli2BOI6iJxr
 Kf0wq3mEVa6pACqDCjGGDuFQsaY5KGzWI51ljhMEzLsJupy1ts0E30pdLv+9/7KCm0qx
 jQudC6dquLdNLO5i31lBaUaT1d0Z+0nwNfp47xcf3sD2tbl77dcswWNcc2a6Ckl1b64K
 7BXw==
X-Gm-Message-State: AOJu0Yy6FcBUC69CjsKO9dZdFncM1ODHI9scDb9AnFfobGXjxZZgKKhw
 iwencp2g/ttw9UFKe6QEu84Ie9pw2d3/shPokUrrFpjWH3w5LiBMj5HJcSDC
X-Gm-Gg: ASbGncuphnb1SBA9Relj73sgCqrgprEVYwPwyJUVOlyMVKDLKj8FehNG1eTyVElf2DX
 yPcQ9boqiqyay1RTMAvcRv0Xp3Dg1MVqWaH+fAlPqWr8M9kbZ7p9at8g/fsN29Nz3wnUbi9Au/1
 IH+W5IbDqykV6Jp2mj0xJCzQ7qxW7oAhHVdXJYqq4TwxRbk1S+PpW5M5Zo2w7z2pjagVyV2OXs2
 H0mnWYrs6xZ6CuJYAfH7/wUYpaXBpV7OapcxgzHJKJAX7bgTWOhHkbOnUm5GU//3y2Gz6LfX/VI
 Xzhnrt0EeZyZWC74AqfcuXOjjTcWjwpdTRazXGoQKQbOPzlV8RPK4YJABz2xp1e9Pg6MW+K0cOE
 =
X-Google-Smtp-Source: AGHT+IGKIMKE9HHz2JVogQjxW0Mq3/WTK6XgjyjIPVNxfMCM36dws0j8wlGKKqloJQ9yGRe/gFYwuw==
X-Received: by 2002:a05:6512:4408:b0:546:2fde:d2d9 with SMTP id
 2adb3069b0e04-54fc67c93a8mr2398747e87.28.1746909099396; 
 Sat, 10 May 2025 13:31:39 -0700 (PDT)
Received: from tollan.lan (b106.broadband9.quicknet.se. [194.132.233.106])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645cf27sm810561e87.88.2025.05.10.13.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 May 2025 13:31:38 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Sat, 10 May 2025 22:31:16 +0200
Message-ID: <20250510203122.1916485-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746909100; x=1747513900; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ss1gQ4RgfwDsaxi2lz7UjUVfDahEB3W74mtcy5ojw18=;
 b=hpvvQ7kQzhBjx3hkmFlsk6Ye6UO2V/cDTsV7Yz8NIEWxKh/grt4AsaZhVV4XsJi3bl
 UqAXaIwMBfe/y4mbqgu9OMg4aXuZXhkKmmPkcQnIb+yrEUSz9VJGv7NwzAm1DSCbao1g
 9sGtUVwAX4WuHzx3WZokHJ+PhUwHVjPxFMMkDHD0QLGYahFr/lS06PQefpNxHgDNt5Bg
 Q83LPPijr0XldApQOhAUt4Gl33jAP/X+ExJRal17J1ASJUmbBEp4E8VNhRVFXMCijoG/
 MRkOYI6D6yS1wwsZfavDHnySRMROpMJcty4YLu53DagzfVAj12kjy0etelFH4ILcWqoD
 enMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hpvvQ7kQ
Subject: [Buildroot] [PATCH v2 0/5] Bump netopeer2 and its dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

djI6CkZpeCB3cm9uZyBoYXNoIGZvciBsaWJ5YW5nLCB0aGFua3MgSGVpa28gVGhpZXJ5CkFuZCBm
aXggY29tbWVudHMgZnJvbSBUaG9tYXMgUGV0YXp6b25pIGZyb20KYSBwcmV2aW91cyBwYXRjaCBz
ZXJpZXM6IApodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3Bh
dGNoLzIwMjUwMTE0MDcyOTQ3LjI4NDk2NS0zLWhlaWtvLnRoaWVyeUBnbWFpbC5jb20vCgpNYXR0
aWFzIFdhbHN0csO2bSAoNSk6CiAgcGFja2FnZS9zeXNyZXBvOiBidW1wIHRvIHZlcnNpb24gMy42
LjExCiAgcGFja2FnZS9saWJ5YW5nOiBidW1wIHRvIHZlcnNpb24gMy4xMi4yCiAgcGFja2FnZS9s
aWJuZXRjb25mMjogYnVtcCB0byB2ZXJzaW9uIDMuNy4xCiAgcGFja2FnZS9uZXRvcGVlcjI6IGJ1
bXAgdG8gdmVyc2lvbiAyLjQuMQogIHBhY2thZ2UvbGlibmV0Y29uZjI6IFVwZGF0ZSBkZXBlbmRl
bmNpZXMKCiBwYWNrYWdlL2xpYm5ldGNvbmYyL0NvbmZpZy5pbiAgICAgICAgfCAgNyArKysrKysr
CiBwYWNrYWdlL2xpYm5ldGNvbmYyL2xpYm5ldGNvbmYyLmhhc2ggfCAgMiArLQogcGFja2FnZS9s
aWJuZXRjb25mMi9saWJuZXRjb25mMi5tayAgIHwgMTUgKysrKysrKysrKy0tLS0tCiBwYWNrYWdl
L2xpYnlhbmcvbGlieWFuZy5oYXNoICAgICAgICAgfCAgNCArKy0tCiBwYWNrYWdlL2xpYnlhbmcv
bGlieWFuZy5tayAgICAgICAgICAgfCAgMiArLQogcGFja2FnZS9uZXRvcGVlcjIvQ29uZmlnLmlu
ICAgICAgICAgIHwgIDEgLQogcGFja2FnZS9uZXRvcGVlcjIvbmV0b3BlZXIyLmhhc2ggICAgIHwg
IDIgKy0KIHBhY2thZ2UvbmV0b3BlZXIyL25ldG9wZWVyMi5tayAgICAgICB8ICAyICstCiBwYWNr
YWdlL3N5c3JlcG8vc3lzcmVwby5oYXNoICAgICAgICAgfCAgMiArLQogcGFja2FnZS9zeXNyZXBv
L3N5c3JlcG8ubWsgICAgICAgICAgIHwgIDIgKy0KIDEwIGZpbGVzIGNoYW5nZWQsIDI1IGluc2Vy
dGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
