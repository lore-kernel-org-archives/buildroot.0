Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8299C54798
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 20:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83F0282C3E;
	Thu,  7 Mar 2024 20:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2lnM86BRX1Z; Thu,  7 Mar 2024 20:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFDC582C5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFDC582C5E;
	Thu,  7 Mar 2024 20:38:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 566521BF4E5
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 20:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5077F82C5E
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 20:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w94HbMMuyqH1 for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 20:38:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7FCA182C3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FCA182C3E
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FCA182C3E
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 20:38:20 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-58962bf3f89so374495a12.0
 for <buildroot@buildroot.org>; Thu, 07 Mar 2024 12:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709843899; x=1710448699;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4BGvayl5YE4omms+Y1PNGGzt4DpITvYnGxWK67q0a7c=;
 b=nO2yQSq3RmI01lU9JrHPT8R8ZDMoC8BkQ+0IsI3EPb00xdXH4uvqYD4pOY9UtGAvHQ
 9Ps+mlA9JHNOgqe8o7RvmYbuY9Uuy9E4kAM2vZuKw1NvLYp7kGZjFVUIYU/32eTL/BqA
 5q5Qv0qiYYrLwXTZaMCnRm/GL2z6ruDJY43BjQzgiSlEFPfpJetQYBZtBB8BnkfDxQAg
 D6WAs0ZSzFtCu40iRUeg2NMl8ZzzFA8SIMQEfKjToyMd/cZYaHgnxExIRgvvCYKIEKZO
 FAEjVybKc+KFmrboInFTB91T34wimvopRtn9zJPdkuW6omuChEpcUEsQk1oX/J/neytJ
 tifA==
X-Gm-Message-State: AOJu0Yzv7Lz6TqVmuucD7p+RfR6rWWYPkaQrt6jECJGrZ3JiOiP7a6tK
 7Xo8B5fIXz5ezROnSdHIbf6dtmPZju8U5WY4ldA4AZIJi3bLFrIajX93P35LJJ8JwQrXchbKjUj
 V9x/uTxK3wvrp9e1B77HwEin03tQ=
X-Google-Smtp-Source: AGHT+IFLom1hqTxE8WID+faPVcMrO8KcZ40I2BNFbKKgLk6AcI/PBGVSWf0FHNQqA7CqwjtTJ4Wq3fRm6a4yM3Nx84E=
X-Received: by 2002:a17:90b:4ac3:b0:29b:af63:71aa with SMTP id
 mh3-20020a17090b4ac300b0029baf6371aamr47995pjb.2.1709843899483; Thu, 07 Mar
 2024 12:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20240307171610.47962-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240307171610.47962-1-fontaine.fabrice@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 7 Mar 2024 17:38:07 -0300
Message-ID: <CAOMZO5D5HzcW3zREX9+yhOUnDQWT+B0pf1JUD1Aq6xzNf1hP=Q@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709843899; x=1710448699; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4BGvayl5YE4omms+Y1PNGGzt4DpITvYnGxWK67q0a7c=;
 b=fylq3Bdat/lXjsSFuRz8vmthQkYF29/dXhp1IVlpcCuQCNjdLJP3KPH0KDlLOVUUAj
 Jyt/FmV+uCkF+pjo1kWv5NVTL3F6Rz24+FQ9j1SLF6e3TFVCzxF2TDi9iqTNGxo/P+ib
 ntVcihUSPAW0Z6buST0xE9edKDbAjjRnbd9g5LNkZUlqdlhzQL+TmXf4JTlbvHvwhAW3
 Vb4GcI4M0C62g6dUfvb198ePnjv2tsFlSeDG3+TnlJKNheaRiqQ2Al8avE9qvhL03/R9
 254Fjy4wv80hBnla2tNq+OwXsP9U/E7Pt/oUImwtD3HF4/LnEVi2XhoEAsmlgFLmE3uN
 A7MA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fylq3Bda
Subject: Re: [Buildroot] [PATCH 1/1] package/crucible: fix license
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBNYXIgNywgMjAyNCBhdCAyOjE24oCvUE0gRmFicmljZSBGb250YWluZQo8Zm9udGFp
bmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gY3J1Y2libGUgaXMgbGljZW5zZWQgdW5k
ZXIgQlNELTMtQ2xhdXNlIHNpbmNlIGJ1bXAgdG8gdmVyc2lvbiAyMDIzLjExLjAyCj4gaW4gY29t
bWl0IGJlM2Y5NWVkMTQ1NTlmOGE5NzM5YTEyY2ZmNjA0YWRkNjIyYjA0MTYgYW5kCj4gaHR0cHM6
Ly9naXRodWIuY29tL3VzYmFybW9yeS9jcnVjaWJsZS9jb21taXQvN2ZlMGJiOTZkYTY1NWI0ZTgz
MDMxYTk5MTE1ZDM3Zjg4YTE3MWU5Zgo+Cj4gRml4ZXM6IGJlM2Y5NWVkMTQ1NTlmOGE5NzM5YTEy
Y2ZmNjA0YWRkNjIyYjA0MTYKPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVz
dWx0cy82MTgzYjExZjE1NjRiYzA3YWRmZmYyYjAyY2IwNjA3ZDBiMWRlNTRlCj4KPiBTaWduZWQt
b2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KClJl
dmlld2VkLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
