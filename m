Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32B7C3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 13:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 703DB83C5E;
	Fri,  2 May 2025 13:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkZgrUw9nfGJ; Fri,  2 May 2025 13:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3E0F839E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3E0F839E7;
	Fri,  2 May 2025 13:29:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3FFA229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 13:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAC2240BC7
 for <buildroot@buildroot.org>; Fri,  2 May 2025 13:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7hmE22WJ73b for <buildroot@buildroot.org>;
 Fri,  2 May 2025 13:29:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B239E40E9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B239E40E9A
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B239E40E9A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 13:29:45 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-30bfca745c7so17530571fa.0
 for <buildroot@buildroot.org>; Fri, 02 May 2025 06:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746192583; x=1746797383;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UBnxWs/eIUBaa1z4o4JmIjXuhm5XGQxMY0ZhNMtbf0E=;
 b=vQGOp0CglbtIhcFvVU1RAPUAShUu+ldc1cYU9PNp4dfnB7bafV8FjDze+E8wRdCp6r
 eVYvyM+8Kukv+5UnnSCVpLho29AO3UQC64eXy1UXoYcS93w4/+yF2nchlsZMO/Xx4Bwe
 faw75x+PHMditfeMyAFNy6TXLnx8Qz8N1rV91zZFDwVw+FrVYLegngdJ0/bLtvb6WQkQ
 79oMd60G8x2ejcDu/Iop03zCu857RRwa3Ws8w1Ffts+wYvBNjYqeuO3mbHk0MI7SyCB6
 ueZpeuxOO+WF5DGvHTGQpXuciWgQ3mjHn47Br3tpd2Hd4enrZEwK9UwduvuMXfNFhZpG
 8vPg==
X-Gm-Message-State: AOJu0YzhVVCR46VZdZpDpqBRKoSdgSj6b2XO5d0ScTnqflcu7KFtYjNA
 mRHhVDavLZHrsrjntImanI+bncdCjTuJ3sCBulUhbMm4NvhbLqEsVQl4I5wI
X-Gm-Gg: ASbGncuWqQP0xZKoD9EmRcSRzUv24DuL4ApIwOz1+qcW+HC7V51JPSuZOuWUDXvJQL2
 CqZ1xpD9VEaQb/HeTScQ6vUdRtEOJ9oi8Kg5IbDvV9LQwDtOtaFJobf70ZCjuiLQzp/2JpCs87J
 /V5WL1a5m2LovQNgx19Lyy33sO46VvOopymVUlXrogvGJyDp1U4n/cGuPrpWLVb00ItR3vYae0l
 BaV54l+51lfekh1waCTl/olvj4QtqJhB7r9QDcOqqmdr8TTKvN5zft6EZs8yWpVhjVUBtBkCnYk
 vMaxpwLuC+FAJAIn7D2laKA6kx7uqAnvV/rkqsJOCcMVvTJ9lWSe+Oo9Dfe7Y5TYclO3tfSBNHu
 ZVv6GRuU=
X-Google-Smtp-Source: AGHT+IFBHhADmRgJufMJwDiRnon4k2pj7FdfQB3OxYeiEM8zddwxkUXkchSmrtpThpGm0iwQutXoFg==
X-Received: by 2002:a05:651c:1993:b0:308:e803:1180 with SMTP id
 38308e7fff4ca-320c5803391mr7398771fa.31.1746192582397; 
 Fri, 02 May 2025 06:29:42 -0700 (PDT)
Received: from tollan.addiva.ad (b106.broadband9.quicknet.se.
 [194.132.233.106]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202ad8c3fcsm3370691fa.88.2025.05.02.06.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 06:29:41 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Fri,  2 May 2025 15:29:24 +0200
Message-ID: <20250502132924.3775738-5-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502132924.3775738-1-lazzer@gmail.com>
References: <20250502132924.3775738-1-lazzer@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746192583; x=1746797383; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UBnxWs/eIUBaa1z4o4JmIjXuhm5XGQxMY0ZhNMtbf0E=;
 b=ciTNAqqkFvc9oEQcwmhsvFNNianBcT9fOzFZrP4vH9vyfdpftDaE4w23VDdeaEMbAx
 gYqf4nKgKW7h0zPcnM5hiQAIAsFRZAAHGy68eRTaGmMAHl0MM7EEdxJkfTrQtbE7/nK6
 I87PgmPp9ZXhtFkmFptxaRSCOFi30ThINPPSOQWYtszjP2TPq0oT9nRbuleHcQtRyt3O
 dJQQT9y2gZV4eU/f6CxVtnilLL2aSlIFSi/Ll3i/NDqgQicLxmgoNoqnatnZBJ77C8ni
 LxuQwuKu4ukcm/BjERqrarTBPQ54LGumFQZthyUnP5mVG4RvRILHCb0ily4djxq6MzAW
 guMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ciTNAqqk
Subject: [Buildroot] [PATCH 4/4] package/netopeer2: bump to version 2.4.1
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

Q2hhbmdlbG9nOgogaW50ZXJuYWwgc3VwcG9ydCBvZiBpZXRmLXN5c3RlbS1jYXBhYmlsaXRpZXMg
YW5kIGlldGYtbm90aWZpY2F0aW9uLWNhcGFiaWxpdGllcyAoQGplcmVtaWU2d2luZCkKIG1pbm9y
IGJ1Z2ZpeGVzIGFuZCBpbXByb3ZlbWVudHMKCkRlcGVuZHMgb246CiAtIGxpYnlhbmcgdjMuMTIu
MiBodHRwczovL2dpdGh1Yi5jb20vQ0VTTkVUL2xpYnlhbmcvcmVsZWFzZXMvdGFnL3YzLjEyLjIK
IC0gbGlibmV0Y29uZjIgdjMuNy4xIGh0dHBzOi8vZ2l0aHViLmNvbS9DRVNORVQvbGlibmV0Y29u
ZjIvcmVsZWFzZXMvdGFnL3YzLjcuMQogLSBzeXNyZXBvIHYzLjYuMTEgaHR0cHM6Ly9naXRodWIu
Y29tL3N5c3JlcG8vc3lzcmVwby9yZWxlYXNlcy90YWcvdjMuNi4xMQoKU2lnbmVkLW9mZi1ieTog
TWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9uZXRvcGVl
cjIvbmV0b3BlZXIyLmhhc2ggfCAyICstCiBwYWNrYWdlL25ldG9wZWVyMi9uZXRvcGVlcjIubWsg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmV0b3BlZXIyL25ldG9wZWVyMi5oYXNoIGIvcGFja2Fn
ZS9uZXRvcGVlcjIvbmV0b3BlZXIyLmhhc2gKaW5kZXggNmEyNzhmYmJhZi4uM2E3MGIxNTUzOSAx
MDA2NDQKLS0tIGEvcGFja2FnZS9uZXRvcGVlcjIvbmV0b3BlZXIyLmhhc2gKKysrIGIvcGFja2Fn
ZS9uZXRvcGVlcjIvbmV0b3BlZXIyLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2Fs
Y3VsYXRlZAotc2hhMjU2ICAyYjFkYWFjMDM3ZjE4YzMwM2UwYzBkYzMzMThiYTMwMTk2NDU5NDcy
ZTRjNTlmMmY4NTQ3ZWU3NGQ0Y2RmMzFkICBuZXRvcGVlcjItMi4xLjQ5LnRhci5negorc2hhMjU2
ICA4NmQ3N2VmY2I2NWYwYmIyYzNiYzBmMjEyOGEzMjAxMTNjZTcxMjVmMzk4ODJmZTdkODMzNGMx
NjhlZDk1NjdkICBuZXRvcGVlcjItMi40LjEudGFyLmd6CiBzaGEyNTYgIGI0NmYxNjFmYmRjZjEy
N2QzZWYyMjYwMmUxNTk1OGMzMDkyZmUzMjk0ZjcxYTJkYzhjZGY4ZjY2ODljYmE5NWIgIExJQ0VO
U0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmV0b3BlZXIyL25ldG9wZWVyMi5tayBiL3BhY2thZ2Uv
bmV0b3BlZXIyL25ldG9wZWVyMi5tawppbmRleCA0ODUzZTVkMTc2Li43MWYyYzUwNjQwIDEwMDY0
NAotLS0gYS9wYWNrYWdlL25ldG9wZWVyMi9uZXRvcGVlcjIubWsKKysrIGIvcGFja2FnZS9uZXRv
cGVlcjIvbmV0b3BlZXIyLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKIAotTkVUT1BFRVIyX1ZFUlNJT04gPSAyLjEuNDkKK05FVE9QRUVSMl9WRVJTSU9OID0g
Mi40LjEKIE5FVE9QRUVSMl9TSVRFID0gJChjYWxsIGdpdGh1YixDRVNORVQsTmV0b3BlZXIyLHYk
KE5FVE9QRUVSMl9WRVJTSU9OKSkKIE5FVE9QRUVSMl9ETF9TVUJESVIgPSBuZXRvcGVlcjIKIE5F
VE9QRUVSMl9MSUNFTlNFID0gQlNELTMtQ2xhdXNlCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
