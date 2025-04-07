Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D9AC3601A
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 10:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A4F16106B;
	Mon,  7 Apr 2025 10:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5byZ63bTvEFJ; Mon,  7 Apr 2025 10:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23E7060AC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23E7060AC9;
	Mon,  7 Apr 2025 10:40:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FF601DE
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 10:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 382F86104E
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 10:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkw9RqgLee4R for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 10:40:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 705856102E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 705856102E
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 705856102E
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 10:40:17 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso45753785e9.0
 for <buildroot@buildroot.org>; Mon, 07 Apr 2025 03:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744022415; x=1744627215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2fZ816QU08vhAda6qASJa49OQoe/A+OVFppmJ2CF3k=;
 b=bpH/FDVbGxTL3O0oui+p2zmBsFd3ra1DMD/1hFI2zBImdWJRwkUR1N2ip1ha1yPD+T
 FQUHeN79nz3RUQvAVdEIMSe5XFD1YQfE7i272zo4tJaH2CF4VKL4pkIB/+YK0uNhnFMe
 g7zvGolYz/Qmy/Lf7qUSVuBy6iGuWB5C6mBH7s+CvgDqnQiDuhGIchBtfUrjQegk69/i
 reTbA7wZ5zJmThQVuviD6zq76w7Vhsl5KYV+ZCrqzWMP5s0Tf3GnMbu8V2je+RzP7/Wp
 hlBpHCzOe25n/s5Li5YXXW72P9jSU2XnO46lN0J+eW7NVN91+BI7O4Hur/9OouNbq+sQ
 oAFw==
X-Gm-Message-State: AOJu0Yw+a7rUSrf5ppYooj2JMEdtQy1F/rW0MIrBE45de3fDsVSErXL+
 MQVxcS6OMXEjcg5RJEbjPa7CSML2z3km+UKzlBWHNtakEKS79uJA0NGneli41lyu8kBuvyLjkNg
 zNOC0f6N+
X-Gm-Gg: ASbGncv6izmnFYY+E7JoFSkzhbSgWoOSl0+2vTIAeCCmJc4namoTxR6DzuPs2agBF+n
 jXSVAQM2msAMGebx7mwX4p5e6mS566CqaOVL8YN3gVk+OHGrr4iVmJ22DE7XMfCZcB6EA4CeKrp
 7t+qufyzKhuJe7QEUfZTyKNdwYxPEQq7YPBgTzDA2xZ9BzQsHI6nx9Lw117FE/NL/ki31hFWw5X
 /DeC9Owu1rRzqJB6LV27YTT9rWiGaFeIhES9C38w27EF5yN8RSouOc8vtDPAyfVbow6w5GoeF18
 l6Ho7TbePxVuSWvOsE56ZDQPZXdz9xBf+e0Y7eSlrA2d89ePvgBXo/mUfCPiEbp2VYBxzsx05pZ
 5Q7bK9Omn9hJbhiK3cut7wIF6q1AXCuU=
X-Google-Smtp-Source: AGHT+IEqnBABgFwU87mlifGdqLvPHmxH6KaYVkXOOZmigNeEU8fq2hkO+YFFKBJJ3fk4WElMYwxg8Q==
X-Received: by 2002:a05:600c:1e28:b0:43d:aed:f7d0 with SMTP id
 5b1f17b1804b1-43ed0da07b5mr93053015e9.28.1744022415310; 
 Mon, 07 Apr 2025 03:40:15 -0700 (PDT)
Received: from mind2.local.ess-mail.com (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a0a90sm11569858f8f.21.2025.04.07.03.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 03:40:15 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon,  7 Apr 2025 10:39:58 +0000
Message-Id: <20250407103959.2361659-4-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407103959.2361659-1-raphael.melotte@mind.be>
References: <20250407103959.2361659-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744022415; x=1744627215; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2fZ816QU08vhAda6qASJa49OQoe/A+OVFppmJ2CF3k=;
 b=V+oWh+avvb8wM9Htc0GSZamyKLb5QLEXKX6P6Hxo8dCUONes4mE6APolasxqpx+21B
 N9eoj1GKflgziM77dEB7hsdksRwK+ISxZks527fT2y2L9kUomnBp0ek9CsRpjzYR6XEp
 x4ByrZnLnjhSncnCwmPUTR5YAENiO1vxPLuG7LBEgLBstTCzbTmxqNHmFmlJgEeXOSj9
 f+PSxajW1O9Wjg1gYhmj8QGAfvV8ZeOJhy5tQlpqvVREDJ9pzmcHAQhffLgitCANhMqD
 0pss5BzwyjPNKMCXh4lK/ezJyW0KLJ7iL4jDKSQGNJz6JRMLayhpLu2awd8lN27BSMXt
 mtow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=V+oWh+av
Subject: [Buildroot] [PATCH 3/3] package/mupdf: skip installing docs to the
 target
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGN1cnJlbnQgJ2luc3RhbGwnIHRhcmdldCBjb21wcmlzZXMgJ2luc3RhbGwtbGlicycsICdp
bnN0YWxsLWFwcHMnCmFuZCAnaW5zdGFsbC1kb2NzJy4KCkluIG91ciBjYXNlIHdlIGRvbid0IHdh
bnQgdG8gaW5zdGFsbCBkb2N1bWVudGF0aW9uIHRvIHRoZSB0YXJnZXQsIHNvCmp1c3QgcnVuIHRo
ZSBvdGhlciB0d28uCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5t
ZWxvdHRlQG1pbmQuYmU+Ci0tLQogcGFja2FnZS9tdXBkZi9tdXBkZi5tayB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbXVwZGYvbXVwZGYubWsgYi9wYWNrYWdlL211cGRmL211cGRmLm1rCmluZGV4IDQ5M2Q0
NmY3N2EuLjYxOWYzOTQ0OTcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsKKysr
IGIvcGFja2FnZS9tdXBkZi9tdXBkZi5tawpAQCAtOTcsNyArOTcsNyBAQCBlbmRlZgogCiBkZWZp
bmUgTVVQREZfSU5TVEFMTF9UQVJHRVRfQ01EUwogCSQoTVVQREZfTUFLRV9FTlYpICQoTUFLRSkg
LUMgJChARCkgJChNVVBERl9NQUtFX09QVFMpIFwKLQkJREVTVERJUj0iJChUQVJHRVRfRElSKSIg
aW5zdGFsbAorCQlERVNURElSPSIkKFRBUkdFVF9ESVIpIiBpbnN0YWxsLWxpYnMgaW5zdGFsbC1h
cHBzCiBlbmRlZgogCiAkKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQotLSAKMi4zNC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
