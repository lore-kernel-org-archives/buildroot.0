Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A2BC48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 21:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03399418BC;
	Fri, 16 Feb 2024 21:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdHn9AbF-DIL; Fri, 16 Feb 2024 21:15:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0FFA418CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0FFA418CB;
	Fri, 16 Feb 2024 21:15:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 489BE1BF287
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3594C8322A
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9mCx38AtcJly for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 21:15:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4B238322E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4B238322E
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4B238322E
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 21:15:18 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41242d2f73cso7313615e9.0
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 13:15:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708118116; x=1708722916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GmS7YmtbjSJWtmJqLzA6LmceU4Wm5iN1bf2llhuip60=;
 b=XQ2dl5jA7Att6VPbffqmqjGAiyVmZ2KWLII0iXd+JSsdtBzUhzfVk77WjLE2WYwaYx
 UtWXEHnnwNlbpRFjuz7BwW2LwyMxWyqhAqDX9Lp8QDeoUZ2xit3DuLUfU9ixdyHF+o4H
 oWCrSZNuU3KQmORz/dgVpvU1Cb9ZKw8saamQ3uLalLua0A/6HgrkpL7OJNjonY0w6Xvg
 hkx/fu1kaTXuZTw0U3rhPy3emDs31TlCCeDlyoR5aFNodROpJfMNTwIQBavWkSK14U9p
 VCNulh5RrZy1/LNGdRMnHYaO1P/TsforQxpZBzOuaV4P87gEJL7sTZvyWLqaCN7fM2Zi
 YLtw==
X-Gm-Message-State: AOJu0YwKrnCIeScxQQTi5nJXBPBS3ec1/hpPqP7Mluj/JeQz2u8BDrse
 eY2LSz6u6BmejTdknH4vj8p7wHzY0gUYO7FwIagxLf5GmejcjVHyCDH189SlJBiACxUZQFITFwk
 rx/c=
X-Google-Smtp-Source: AGHT+IGgBV0MLB79NOK7hbW7XHiAVrGjo+WMjOxjKg/174U/7MJ1mVSwO4kEvJ3FxgGRG1X9Q0hF4Q==
X-Received: by 2002:a05:600c:4f0f:b0:410:e830:24 with SMTP id
 l15-20020a05600c4f0f00b00410e8300024mr5064351wmq.7.1708118115782; 
 Fri, 16 Feb 2024 13:15:15 -0800 (PST)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b00410d7e55e5asm3451234wmn.3.2024.02.16.13.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 13:15:15 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 22:13:38 +0100
Message-Id: <20240216211344.1807353-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1708118116; x=1708722916; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GmS7YmtbjSJWtmJqLzA6LmceU4Wm5iN1bf2llhuip60=;
 b=SX+2/fGkVt5JFIdes0s+XK4vNmuJpjCpKORBnEtLolozdkEp0Ob9muU1O2xiD7O1rV
 kIryAcgbZU1E6gK6kzW4WnWz4W4yN6vXLpwqSrgvrIoPqH/7sD7+IGJJ2d5okMsHOFbh
 d/kbhizZc+4NhLmYxdI7RzGUTwbwzTjhtmfa5kolnYbSzGrl8o9ag9x8a6Q2QK9QB7t6
 AOHefqpIADMnFqeDYc04Qn960UcRZBM76IIm2pqgBsaEfAz4jifhbxZVogXdtza4GxC/
 wosSJlfLfyRLzOilhO6fGvjtYjYMZlhd85j1DiHM2IfC1JtATIr/BZvBzK7j14C/2Nwd
 WYzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SX+2/fGk
Subject: [Buildroot] [PATCH 0/5] package/python-pymupdf: bump to version
 1.23.22
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: james.hilliard1@gmail.com,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpUaGlzIHNlcmllcyBidWlsZHMgb24gdGhlIGZvbGxvd2luZyBzZXJpZXMgZnJvbSBK
YW1lcyB0byB1cGRhdGUgcHl0aG9uLXB5bXVwZGY6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5v
cmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8/c2VyaWVzPTM4OTc1MSZzdGF0ZT0qCgpOb3RlIHRo
YXQgcGF0Y2ggMSBmaXhlcyBhbiBpc3N1ZSB0aGF0IHdhcyBwcmVzZW50IGJlZm9yZSB0aGUgdmVy
c2lvbgpidW1wcywgc28gaXQgY291bGQgYmUgYXBwbGllZCBzZXBhcmF0ZWx5IG9yIGJhY2twb3J0
ZWQuCgpQYXRjaCAzIGNvdWxkIHBvdGVudGlhbGx5IGJlIGJhY2twb3J0ZWQgYXMgd2VsbCwgYnV0
IEkgZGlkIG5vdCB0ZXN0IGl0CndpdGggYW55IG90aGVyIG11cGRmIG9yIHB5dGhvbi1weW11cGRm
IHZlcnNpb24uCgpLaW5kIHJlZ2FyZHMsCgpSYXBoYcOrbAoKSmFtZXMgSGlsbGlhcmQgKDIpOgog
IHBhY2thZ2UvbXVwZGY6IGJ1bXAgdG8gdmVyc2lvbiAxLjIzLjkKICBwYWNrYWdlL3B5dGhvbi1w
eW11cGRmOiBidW1wIHRvIHZlcnNpb24gMS4yMy4yMgoKUmFwaGHDq2wgTcOpbG90dGUgKDMpOgog
IHBhY2thZ2U6IHB5dGhvbi1weW11cGRmOiBhZGQgbWlzc2luZyBweXRob24temxpYiBkZXBlbmRl
bmN5CiAgc3VwcG9ydC90ZXN0aW5nOiBhZGQgbmV3IHRlc3QgZm9yIHB5dGhvbi1weW11cGRmCiAg
cGFja2FnZS9tdXBkZjogZml4IGJ1aWxkaW5nIHNoYXJlZCBsaWJyYXJpZXMKCiBERVZFTE9QRVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogLi4uaXNzaW5nLWxp
bWl0cy5oLWluY2x1ZGUtZm9yLVVJTlRfTUFYLnBhdGNoIHwgIDcwIC0tLS0tLS0tLS0KIHBhY2th
Z2UvbXVwZGYvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArCiBwYWNrYWdl
L211cGRmL211cGRmLmhhc2ggICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIHBhY2thZ2Uv
bXVwZGYvbXVwZGYubWsgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOSArLQogLi4udy1wcm92
aWRpbmctcHl0aG9uLWNvbmZpZy1leHRlcm5hbGx5LnBhdGNoIHwgMTI1ICsrKysrKysrKysrKysr
KysrKwogcGFja2FnZS9weXRob24tcHltdXBkZi9Db25maWcuaW4gICAgICAgICAgICAgIHwgICAz
ICstCiBwYWNrYWdlL3B5dGhvbi1weW11cGRmL3B5dGhvbi1weW11cGRmLmhhc2ggICAgfCAgIDQg
Ky0KIHBhY2thZ2UvcHl0aG9uLXB5bXVwZGYvcHl0aG9uLXB5bXVwZGYubWsgICAgICB8ICAzMSAr
Ky0tLQogLi4uL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9weW11cGRmLnB5ICAgIHwgIDE3
ICsrKwogLi4uL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fcHltdXBkZi5weSAgICAgIHwgIDI2
ICsrKysKIDExIGZpbGVzIGNoYW5nZWQsIDIwMyBpbnNlcnRpb25zKCspLCA5MiBkZWxldGlvbnMo
LSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL211cGRmLzAwMDEtQWRkLW1pc3NpbmctbGlt
aXRzLmgtaW5jbHVkZS1mb3ItVUlOVF9NQVgucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3B5dGhvbi1weW11cGRmLzAwMDEtcGlwY2wucHktYWxsb3ctcHJvdmlkaW5nLXB5dGhvbi1j
b25maWctZXh0ZXJuYWxseS5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fcHltdXBkZi5weQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3B5bXVwZGYucHkK
Ci0tIAoyLjM3LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
