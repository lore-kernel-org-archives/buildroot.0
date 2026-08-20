Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DB8C5DF87
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 10:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE0CE80CBA;
	Thu, 20 Aug 2026 10:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ipx2R35lHldO; Thu, 20 Aug 2026 10:57:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787223442;
	bh=TVGr3rfKa5Iben0QlEr1JrNZSaAHVco4KQ6MytadHkI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DWjAXmcZJHA9wg69rmybIpGKSV3IAFcGbQD9l6T3Ew9JLiLJ0Thmo7VFzgyeXa6E4
	 gXft+s0oeevyk4iKCE5dKI/P9Q+w2JNuO/LE+uxy2TDsu6rodpFdJM0Q2PbUkKlurr
	 RaK5gjjn6SyGozlu0Sc6Pi/ucoouaPBdv8DhhW1lYIejXI7wlBdVXcL3ioZahkbqrg
	 T9RBW3aPI65CsHv1aXZl9AgiaOcwoJiOnV4wt7lrxjTyB1Hz7VoAXREgvK3H4XB8S3
	 pzEO8P43SOaEn3DUGNB8tOd8aRBA18RhxWDCQhyPg8D+deindjNs6KnWr4Mn2Er40d
	 Lbr3fg/EhLddw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACC6B80C98;
	Thu, 20 Aug 2026 10:57:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C6881460
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 10:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 827E8405A9
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 10:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSc6XaNJ6afo for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 10:57:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95BAB405A7
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 10:57:19 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-69f7fa1c548so3658558a12.2
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 03:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787223437; x=1787828237;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=N7iT+SFch103Q1o4gMMQenWbBanA26dtfV+vw6mTjeg=;
 b=B0J+wofs2SxaEge1eAGqLfb2lcMvF2GvfTIdUKobje/KZP4lrXmdRVMVv1TUjPTMqn
 GhhUzGL5Lzys9xaH+W15hdFjuTPbBHSwktxcEnGiZ5wBEQVrR28RMdJ1FZSGwnIDjXxm
 KyD+hF8YMXtQfDFj0rq+1bC8oXOqMXGsr3LjeCa+QArbwfGjVYLe0JdCGC/QIhDS3SmF
 Kl5FqG06O3+hNuuf21cb1bO+ktFUEUEI7SvPtLDst0wHN0+gLD6r7UvvIQi9/NUs1SJg
 8JNxJn1x7fXKufm4jtDFQsT+eqU4CFk5NSdvlFiHMnrq+zcevcAGvOIFmab25BgYdU8B
 5FAw==
X-Gm-Message-State: AOJu0YxejfLPvzcBK2KUOeMe0NWhSXga338DjzDugJ+R3h2Tv5TrBx1v
 +SD50mhg//LLxPLiPWhAdiB9lWL1lQQPqsnVQGBIZc92/dI+oBd4yn9iamC/g3XtbdpmVrQ/6uS
 ZkU3OSqg=
X-Gm-Gg: AR+sD10O9m048jG2ZlwZwKgk2N9oxjmTnsaNJYn23zSrETwWIf6kuUpzgOQixS/CROp
 KlnO4VXTDt+nkucbXJvgO21Ad2h48K1Ne789RiivOQ28Of1DEONazPeypHLkz76Et/raQoONCJe
 2E9khQ46CCgClhxj02qswuY8RO3KTKVbTwLFdhixCfW4n+EpVR4rBOmros8n2jvmkQ7Ug+q8Exm
 z9/+vXYgGMbD4yV2CAG3P4DHsaSfVlU+EBxoDa8odiM7tysxauAJ2mFB8UgQZ9nmTE6EiOgcqD1
 4+4SHd5dWr5vfSAWOncTZ/pSt/xYwOcDoEhahEeXf16i+pLLpPZA69xASCbj+4wQd3HcZnDEX2I
 8al0V9/AiAnHY87VcH5KE5eJKcrXgNrsTwXqcXZykKpoU8vgrNJoA0GWnrOnyusx2rBfRQqX2JP
 Q0XEdPZ+khNPvVlhzn3WrYbNlRyzIVir2GNk5OTpRNNZTFoQnDUMW0ajsednbn83j2978uIYqx6
 bbhVPr4mJoMnQRBrw5alEbA0iL4j0s=
X-Received: by 2002:a17:907:3c84:b0:c20:899:b8bc with SMTP id
 a640c23a62f3a-c23f9354356mr835907566b.6.1787223437165; 
 Thu, 20 Aug 2026 03:57:17 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24591e0397sm52884866b.53.2026.08.20.03.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 03:57:16 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu, 20 Aug 2026 12:57:01 +0200
Message-ID: <20260820105705.1502630-3-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260820105705.1502630-1-raphael.melotte@mind.be>
References: <20260820105705.1502630-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/wmenu: update hash following
 Codeberg changes
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

Q29kZWJlcmcgaGFzIGNoYW5nZWQgdGhlIHdheSBpdCBnZW5lcmF0ZSBoYXNoZXMgZm9yIGF0IGxl
YXN0IHNvbWUgb2YKdGhlIGdlbmVyYXRlZCB0YXJiYWxscyAoc2VlIFsxXSkuCgpTaW5jZSBpdCBv
bmx5IGFmZmVjdHMgYSBzbWFsbCBudW1iZXIgb2YgcGFja2FnZXMgZm9yIHVzICgzIG9uIG1hc3Rl
cikKYW5kIHRoZSB1cHN0cmVhbSBkaXNjdXNzaW9uIHNlZW1zIHRvIGNvbnNpZGVyIGl0IGEgIm9u
ZSB0aW1lIGNoYW5nZSIsCmp1c3QgdXBkYXRlIHRoZSBoYXNoIHRvIG1hdGNoIHRoZSBuZXcgb25l
LgoKWzFdOiBodHRwczovL2NvZGViZXJnLm9yZy9Db2RlYmVyZy9Db21tdW5pdHkvaXNzdWVzLzI4
NjEKClNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWlu
ZC5iZT4KLS0tCiBwYWNrYWdlL3dtZW51L3dtZW51Lmhhc2ggfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3dt
ZW51L3dtZW51Lmhhc2ggYi9wYWNrYWdlL3dtZW51L3dtZW51Lmhhc2gKaW5kZXggYzQ5NDEwMDFm
NC4uNzFiMmZmOWQzNyAxMDA2NDQKLS0tIGEvcGFja2FnZS93bWVudS93bWVudS5oYXNoCisrKyBi
L3BhY2thZ2Uvd21lbnUvd21lbnUuaGFzaApAQCAtMSwzICsxLDMgQEAKICMgTG9jYWxseSBjb21w
dXRlZAotc2hhMjU2ICA0ZTZhZWEzZjg5NzVmZWM3MjBmNmViODdhYWQ2MjBkNTI5N2E4YTVhMTM3
NjE1ZTRjZjA0N2U5NWQyYjlkMzA4ICAwLjIuMC50YXIuZ3oKK3NoYTI1NiAgYjFiNTkzYTgwMzEw
MDg1YTkwYmQzNDlkNDU4ZmZiY2ZhY2Y4NzVkNzQ0NjhhZTQ0MjhiZGY1NjkyYTY3MWVmOSAgMC4y
LjAudGFyLmd6CiBzaGEyNTYgIDUwMGYwYTIyMWIyZjM2Njc2NzZmNmEwODRmYjRlOTJiYTRmNzRk
MDlmNDViYzQ5MmU1NWFlYzRkZDI5NmJmZjIgIExJQ0VOU0UKLS0gCjIuNTQuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
