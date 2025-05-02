Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD84C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 13:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41F25411F6;
	Fri,  2 May 2025 13:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EF2zncPzDHu0; Fri,  2 May 2025 13:29:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77F48411DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77F48411DE;
	Fri,  2 May 2025 13:29:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 043F31A4
 for <buildroot@buildroot.org>; Fri,  2 May 2025 13:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA37C83777
 for <buildroot@buildroot.org>; Fri,  2 May 2025 13:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GfA8Qm1bowyn for <buildroot@buildroot.org>;
 Fri,  2 May 2025 13:29:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 387428376E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 387428376E
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 387428376E
 for <buildroot@buildroot.org>; Fri,  2 May 2025 13:29:37 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30c091b54aaso16583501fa.3
 for <buildroot@buildroot.org>; Fri, 02 May 2025 06:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746192575; x=1746797375;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SM6jDoIU9GHAzog+mhOpVUj4nlkMaQpbN3QfTL2pLE4=;
 b=TgcJFZELs4bXD2QnkuwZxT5bT/+wePWRtYOE0+Od/F/M7TSQvVjd9jIjB7lBdQgGFo
 6nbPDMZBEIJxU89mCghcmqfStB+qs4wea0FU5PwZp41hFyKXKK/0jzEWZIkSV6YhJ+u1
 dPwBWnNKDKhWRHISIhthtiwBoK1SqwIp0zXDiOVK1ekbR0IO1OCpq2E+COiYd504vZ9C
 6csyeMfjQHi0IHqR6mA+t17aU6AHy0gqZPY9d9y7hvdfBTsmo2eIpkW+d9FjZcn7xsxO
 Zdz9EdJW2YZBekJqoCoS2I04KusIAMjZjo++nr0zda+j/woAYkMAqV45twqCaA/gX4pv
 kPSg==
X-Gm-Message-State: AOJu0Yxul2hW484952HnUzFKbqunZ3GK396CuCc5n/pmxITonbPFw0Sw
 F/08Br+ZcnL+JPcstAr2xUdPLqJDtI5mnEw2ULBpHuT4Pd2EqvQA5i8Hy5iA
X-Gm-Gg: ASbGncsSp5QbE2/wDeYzCPeptGtjZe0Nl4o9VBoGACG9dS5BU5MuGpoPuKhvekJF3Ip
 uiq5mX2/W0UDjBhUJiCTyT4qHPr1iZuxQ48Kct8E9lgipgkykm00mbmsZ4RNm/rxEclE23HRjPW
 y32RrNByO/9Mrmu56OHRlQZw3xsI/htZ/tcA7bef/qtVs+ZN4Vwpw1wdODDGqPZKpgoTgKxDSqx
 HmJBcB8UWceKKf9ZA8fw7bD10hoRhOBGrs0qvlDhn5tlMd63RzgWaGZESJ6/FL3SW86xLX8J0kd
 kcyimqAEdswj9wX9GhqUPNDN5NJdwTciU7ra+dezYQEiSLt3ZsG4v7K8gy05P3QnQknlbFd3
X-Google-Smtp-Source: AGHT+IEsEmkRVHVhkFpQi7GcKnx925YZcmOF30ywrOMQFhtwRko5favMgVny9Nhved6EpyKU/IxT6Q==
X-Received: by 2002:a2e:a54c:0:b0:30b:d656:1485 with SMTP id
 38308e7fff4ca-320c57f7baamr8861871fa.32.1746192574368; 
 Fri, 02 May 2025 06:29:34 -0700 (PDT)
Received: from tollan.addiva.ad (b106.broadband9.quicknet.se.
 [194.132.233.106]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202ad8c3fcsm3370691fa.88.2025.05.02.06.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 06:29:33 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Fri,  2 May 2025 15:29:20 +0200
Message-ID: <20250502132924.3775738-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746192575; x=1746797375; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SM6jDoIU9GHAzog+mhOpVUj4nlkMaQpbN3QfTL2pLE4=;
 b=Lf55FSwD8W0Pqg17zBnAAlgAgpqtifgDm0NnzhYa9CQ/NTbVgLeHeE2Xjbe+5eq3mK
 vYrcifekVjiBilhqmgidefYCl0SbFLTqEVQSFRfFzd2wutkv9MuOr1ANuksQVkxcV31j
 KGeC9feHy0eZIvrWCDxA/AT3k5A3mtDPINiOAwVFUzqsWLVOck1v+SHaSKXeQyyqYtDM
 SfzWdAY8pYMUS2po5+wDhcS4z2ejN7CwdC4tegzcWBIcLuK1qWOqY7Z3cjE5fIqEDTSR
 MCS81UuWvvesTepUQpdRWitGBM+FKAKq6+089lsz4grdKmWaBwTIpQNI876AQXBREo/9
 l60A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Lf55FSwD
Subject: [Buildroot] [PATCH 0/4] Bump netopeer2 and its dependencies
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

VGhpcyBzZXJpZXMgY29udGFpbnMgdGhlIG5ldG9wZWVyMiBwYWNrYWdlIHVwZGF0ZSB3aXRoIHRo
ZSBjb3JyZXNwb25kaW5nCmRlcGVuZGVuY2llczogbGlieWFuZywgbGlibmV0Y29uZjIsIHN5c3Jl
cG8uCgpFdmVuIHRob3VnaCB0aGUgY2hhbmdlbG9nIGZvciBlYWNoIHBhY2thZ2UgZG9lcyBub3Qg
c2F5IG11Y2gsIHRoZXJlIGlzIGEKbG90IG9mIG1lbW9yeSBsZWFrcyBmaXhlZC4KClRoaXMgc2Vy
aWVzIG11c3QgYmUgYXBwbGllZCB0b2dldGhlciBkdWUgdG8gdGhlIE5ldG9wZWVyMiByZWxlYXNl
IHN0YXRlczoKClRoaXMgcmVsZWFzZSBkZXBlbmRzIG9uIGxpYnlhbmcgKHYzLjEyLjIpLCBsaWJu
ZXRjb25mMiAodjMuNy4xKSBhbmQgc3lzcmVwbyAodjMuNi4xMSkuCgpNYXR0aWFzIFdhbHN0csO2
bSAoNCk6CiAgcGFja2FnZS9zeXNyZXBvOiBidW1wIHRvIHZlcnNpb24gMy42LjExCiAgcGFja2Fn
ZS9saWJ5YW5nOiBidW1wIHRvIHZlcnNpb24gMy4xMi4yCiAgcGFja2FnZS9saWJuZXRjb25mMjog
YnVtcCB0byB2ZXJzaW9uIDMuNy4xCiAgcGFja2FnZS9uZXRvcGVlcjI6IGJ1bXAgdG8gdmVyc2lv
biAyLjQuMQoKIHBhY2thZ2UvbGlibmV0Y29uZjIvbGlibmV0Y29uZjIuaGFzaCB8IDIgKy0KIHBh
Y2thZ2UvbGlibmV0Y29uZjIvbGlibmV0Y29uZjIubWsgICB8IDIgKy0KIHBhY2thZ2UvbGlieWFu
Zy9saWJ5YW5nLmhhc2ggICAgICAgICB8IDIgKy0KIHBhY2thZ2UvbGlieWFuZy9saWJ5YW5nLm1r
ICAgICAgICAgICB8IDIgKy0KIHBhY2thZ2UvbmV0b3BlZXIyL25ldG9wZWVyMi5oYXNoICAgICB8
IDIgKy0KIHBhY2thZ2UvbmV0b3BlZXIyL25ldG9wZWVyMi5tayAgICAgICB8IDIgKy0KIHBhY2th
Z2Uvc3lzcmVwby9zeXNyZXBvLmhhc2ggICAgICAgICB8IDIgKy0KIHBhY2thZ2Uvc3lzcmVwby9z
eXNyZXBvLm1rICAgICAgICAgICB8IDIgKy0KIDggZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
