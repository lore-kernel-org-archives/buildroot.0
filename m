Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E052C4345F
	for <buildroot@archiver.kernel.org>; Tue, 23 Apr 2024 07:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAD42605D4;
	Tue, 23 Apr 2024 07:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yPtIvGvU-1ut; Tue, 23 Apr 2024 07:41:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCB1860630
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCB1860630;
	Tue, 23 Apr 2024 07:41:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 198BF1BF360
 for <buildroot@lists.busybox.net>; Tue, 23 Apr 2024 07:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05C2440098
 for <buildroot@lists.busybox.net>; Tue, 23 Apr 2024 07:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbljZRzjI_th for <buildroot@lists.busybox.net>;
 Tue, 23 Apr 2024 07:40:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 79C6F40087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79C6F40087
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79C6F40087
 for <buildroot@buildroot.org>; Tue, 23 Apr 2024 07:40:58 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-51ae2e37a87so3971580e87.2
 for <buildroot@buildroot.org>; Tue, 23 Apr 2024 00:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713858056; x=1714462856;
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TMoZajXrOdD7lhCrE6ejg0fOtjXJM/Ta70oTOjCQEak=;
 b=fY20c6uJO82pA+OU247dvoOUrEFmi06OKOB6oee1auB1kEIg7QbOdgPvk+UJR9bboj
 iEADL7tpvCcTMeWovvSUNGuMUm6I+QIcByB1PAvQNMx0R5Gs29c0+78o0pdSY3MqxQT7
 N7hzVebHYJsESzYBXi0/kH+obojrHgffUMn0UzQ4sh5jOByUm+UPeh6inefCGzOP+Nt6
 HCnAYTmoX7Uq8PpM4zZLzogTvStADaSD5EN4MgV43eNoGFv6mzRRfhzrzlKJThD+5iE7
 61XUdfAfP0N174pJKAxi7EyyWlTOy+C2WHJANgeJRoZqVOeTNJCxQMWpN8bSDyKUDZoQ
 Xhdw==
X-Gm-Message-State: AOJu0YzKqJUkGLcKjIjD8ehtcndtImKysY2utv4JrN0prmsEVYJA6FyR
 PUF5fMOMqfNisuNExj/NF2UmF4eF8uVVnCQniebToj/jPmpkREH2LajnFlI7Ueagvc7YchXeEW2
 E3qFojGZf/TN42eMIQ40Aw4xbRuSDsTuIFvB8hPTE5/ncmqtu
X-Google-Smtp-Source: AGHT+IGI15qrIiYMLFEDt/y1mtfdEhTPYnUJ1aibcuVuhMU3AMmDuHuE5+e95j/310Jzd+kWdkXWwg==
X-Received: by 2002:a05:6512:b88:b0:51b:b070:a55c with SMTP id
 b8-20020a0565120b8800b0051bb070a55cmr395479lfv.57.1713858056001; 
 Tue, 23 Apr 2024 00:40:56 -0700 (PDT)
Received: from theia ([2a02:8109:8abb:b200:c1b:e970:931c:13])
 by smtp.gmail.com with ESMTPSA id
 gr13-20020a170906e2cd00b00a4e696e613esm1506612ejb.153.2024.04.23.00.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 00:40:55 -0700 (PDT)
Date: Tue, 23 Apr 2024 09:40:54 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240423074054.GA527510@theia>
Mail-Followup-To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240415124616.3817152-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20240415124616.3817152-1-dario.binacchi@amarulasolutions.com>
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1713858056; x=1714462856; darn=buildroot.org; 
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TMoZajXrOdD7lhCrE6ejg0fOtjXJM/Ta70oTOjCQEak=;
 b=igKl+ClULO28FRWP77hU9HMuOhXpsmPIwaPwa+Uudh48q2zRiCJ4KeZcR6qRpl1B5k
 8b6kWWzFVGTlzg3S/5Bde+VG2yt2sVexbOxCutGOpOdfofd+Av1l/YnpP07tBv5u75Jl
 7fwMlMMHaiBKouj7oHPT7gQu3t1mdVLDtvfPcAHPy9Z9XNHv4Ml/0r6+pwAc5A6aRVcw
 5+Tws+97zyLwDI2tIk0ADNfq7lTj2Y/uZXD5JsY7FaeDLRM+SO8CXM+SVqSsHjrlIq0V
 wdVP1Zp/zQGKHYicw3iT8sB/6aNoUIwIM00dE8a6GUmFlObQ2ULWFk7+jfzYRcerCJcs
 ymSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=igKl+ClU
Subject: Re: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk_defconfig: reorder
 defconfig
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
From: =?utf-8?q?Gero_Schw=C3=A4ricke_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmV2aWV3ZWQtYnk6IEdlcm8gU2Nod8Okcmlja2UgPGdlcm8uc2Nod2Flcmlja2VAZ3JhbmRjZW50
cml4Lm5ldD4KCi0tIAoKCgrigJPigJPigJMKCgpncmFuZGNlbnRyaXggR21iSCB8IEEgVm9kYWZv
bmUgQ29tcGFuecKgwrfCoEhvbHptYXJrdCAxwqDCt8KgNTA2NzYgCipDb2xvZ25lKsKgfMKgUGhv
ZW5peHNlZXN0cmFzc2UgMTjCoMK3wqA0NDI2MyAqRG9ydG11bmQqwqDCt8KgR2VybWFueQp8wqBp
biAKPGh0dHBzOi8vd3d3LmxpbmtlZGluLmNvbS9jb21wYW55L2dyYW5kY2VudHJpeD4gfCBwaG9u
ZTogKzQ5LTIyMS02NzctODYwLTAgCnzCoGVtYWlsOiBoZWxsb0BncmFuZGNlbnRyaXgubmV0IDxt
YWlsdG86aGVsbG9AZ3JhbmRjZW50cml4Lm5ldD4KCgpncmFuZGNlbnRyaXggY2FyZXMgYWJvdXTC
oHByaXZhY3kgCjxodHRwczovL2dyYW5kY2VudHJpeC5uZXQvZGUvcGFnZXMvcHJpdmFjeW1haWwv
PgoKQW10c2dlcmljaHQgS8O2bG4gfCBIUkIgwqAKNzAxMTkgfCBHZXNjaMOkZnRzZsO8aHJlcjog
TS4gS3LDtm1lcizCoCBSLiBIw6RuZWwgfCBVU3QuLUlkTnIuOiBERTI2NjMzMzk2OQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
