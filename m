Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D6DC021A4
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 11:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8838B41384;
	Fri, 14 Feb 2025 11:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lq6Yni6c9MES; Fri, 14 Feb 2025 11:10:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FB4340D90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FB4340D90;
	Fri, 14 Feb 2025 11:10:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69D21C2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 599FB84837
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1Nh0ISc-ADi for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 11:10:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5368984830
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5368984830
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5368984830
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:48 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ab7d3bcf1ceso314850166b.3
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 03:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739531446; x=1740136246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pnL/KOA5Dc3msnsG4Xa/4G90NZ/Qb/Jf8Nef/wmjZRo=;
 b=DAUIhB9Vspj3YsXjneK++CdwvaWWDkh3NqXSEUKTWLA2FTtXJ5A1uT4QaCDc9w5AUP
 pxtNnyxAKlpaA/pRD5rOtn/QiO9N+sGktqwfezO2R7u/X7T35p+foyEOvQIanu5KD3Dd
 aOrstUpfwP+baka6JofMY2BPQDBEtmz/6W27AmLgkR5v475INgPySgoSm60ZGpAQjRm6
 U6q4fMIFj71cTZR0W4RNS9Bq/4RY/taEyTrZWgbtx1kHdxHaBVh7ZkpIhaQ7q99EaJ+f
 ahngefJUh5JDQ3FwL1ZZwmqrdTuT0ETX9IRxhQRfS0Ma/Na7LnEzY3eJKbuB4XS5nuT3
 oA+w==
X-Gm-Message-State: AOJu0YyPUnV2JC2MOM3ZcFpzLeZtaR4GNTLTNxA31ibxvJXlQa7ar7Vd
 DLN+UthGgfwTkwyXMVV+OsB6b00ITpVTHgUj/+f63a109MgXk+n8GQLkdBuWksE=
X-Gm-Gg: ASbGnctJuhabiwAmaNUUJisdaM2/aQPK8Y8PJFAFu1B2rdzzHUjvERVo7b5srycB9Or
 g0NSIN61hBrmlIGKFkiA236cLxMwq83k1/5ZO9Jpj31HOBx+EIE6dMAFIuEnxJWKh/q+2iAM0H9
 7UjEIjSW1U1UUsukyyHoeBe19scmDasV3OICO9x0BbeiNDkjnHrwMoIvskztNTsce6GoazQPh/C
 g1uuD4KDbxzUNJciv3CC7/vHnO/bFejE70+K1L+LUlSTywz0/fuCuQXnOnIDH3ungnCATCX4Xdm
 DBY44Zn4UnrG+7l2xQ==
X-Google-Smtp-Source: AGHT+IHF/IsKLdvliRlcQkf6kl1dOP9VZrxX4q+RtV+ZpvnT953zUkNMpMdUX+kVs+ag+ipz0kRwsA==
X-Received: by 2002:a17:906:6a0e:b0:ab7:aaf2:f7f9 with SMTP id
 a640c23a62f3a-ab7f38768b2mr1167160066b.42.1739531446097; 
 Fri, 14 Feb 2025 03:10:46 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba533bce23sm317963566b.161.2025.02.14.03.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:10:45 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BE4C6619B1;
 Fri, 14 Feb 2025 11:10:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 14 Feb 2025 11:10:38 +0000
Message-Id: <20250214111044.4096837-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250214111044.4096837-1-alex.bennee@linaro.org>
References: <20250214111044.4096837-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739531446; x=1740136246; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pnL/KOA5Dc3msnsG4Xa/4G90NZ/Qb/Jf8Nef/wmjZRo=;
 b=EwVvU23ctWD4RaM871kDSpxK5L6iKKBMzzKvnyAifELxySXm21S/yqaFe7McwgD4MH
 1G4qaepteACCgrSWe1v8T1vhvEBtmiCJ7XCaZo+7BqLIunmVNzoZBcnlCrpDf80eiq9T
 9E1LFNzcaWKFjTNOqLWoLR4+ypqmIZYA9lqEN152gQ18fODyOPo2b0EdwjRIhgrDsL7h
 ZLemvoWhM2Vqbd5O3cBtLss+KIXi0IArF7CZfVHw1074HRd6h1ANiNxsfsJmfz09+GFA
 Poep9FragPFR7T18x2Xc/uoKOvHTJ03lAN4A+Qumwk6463+KnfLGaTY+UWCDje5sd10C
 wBYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EwVvU23c
Subject: [Buildroot] [PATCH v3 2/7] testing: drop unneeded vga/vnc stanzas
 from QEMU invocation
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGFhcmNoNjQgdmlydCBwbGF0Zm9ybSBkb2Vzbid0IGhhdmUgYW55IGRlZmF1bHQgVkdBIGRl
dmljZXMgc28gd2UKZG9uJ3QgbmVlZCB0byBjb25maWd1cmUgdGhlbSBoZXJlLgoKU2lnbmVkLW9m
Zi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgotLS0KIHN1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZmx1dHRlci5weSB8IDIgLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfZmx1dHRlci5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfZmx1dHRlci5weQppbmRleCBlNDA0MGNhN2RjLi4xOTQwNmI3Y2IxIDEwMDY0NAotLS0gYS9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2ZsdXR0ZXIucHkKKysrIGIvc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9mbHV0dGVyLnB5CkBAIC00OCw4ICs0OCw2IEBA
IGNsYXNzIFRlc3RGbHV0dGVyKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCwgR3JhcGhpY3NCYXNlKToK
ICAgICAgICAgICAgICAgICAgICAgICItY3B1IiwgImNvcnRleC1hNTciLAogICAgICAgICAgICAg
ICAgICAgICAgIi1tIiwgIjUxMk0iLAogICAgICAgICAgICAgICAgICAgICAgIi1zbXAiLCAiNCIs
Ci0gICAgICAgICAgICAgICAgICAgICAiLXZnYSIsICJzdGQiLAotICAgICAgICAgICAgICAgICAg
ICAgIi12bmMiLCAibm9uZSIsCiAgICAgICAgICAgICAgICAgICAgICAiLWRyaXZlIiwgZiJmaWxl
PXtpbWd9LGlmPXZpcnRpbyxmb3JtYXQ9cmF3Il0pCiAgICAgICAgIHNlbGYuZW11bGF0b3IubG9n
aW4oKQogCi0tIAoyLjM5LjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
