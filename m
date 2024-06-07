Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4465C27C5F
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 16:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19D23427D8;
	Fri,  7 Jun 2024 16:32:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MziysTzXl4rl; Fri,  7 Jun 2024 16:32:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFA41427CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFA41427CB;
	Fri,  7 Jun 2024 16:32:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A7D31BF47A
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 16:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 574EF403B3
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 16:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3GWerKH8ywo for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 16:32:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3832740272
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3832740272
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3832740272
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 16:32:36 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42166eb31b2so7968285e9.0
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 09:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717777955; x=1718382755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LTRj47ZHlVOc3PVHZDry2pyQuWfEDa4Opbra9yZYbsQ=;
 b=TGB5I1Smavvje/GllQvoeTKlZeqEltiIKCwUpRmM5H5eyG5rtgyeP7wAMJUgWdY9Mb
 DHA0SJAGQzzeRA0vEGXxN2if4ENB/zT6iv1ylxHLmMuhA+pxqQj5pL7yGYH8R+ePy/CP
 M8AExBj9jE37p0kCYaTev4DT20nb8VqZ2zzLyN1kEYbQyf7GZ+0fm1t/uZe8pY4L4Nll
 W+BWR6w478eZlsNE0a90RnXROyd6Iv3X+ILNtBlo3peNfIupqGvarFFXANbzO/qbiabm
 CJCuM0U2xaMjYLk/JVge8/lS0AJqYBf7DO9coHCSnixaRVnM+9tvLEjOOH52CrpWsB8y
 gUvw==
X-Gm-Message-State: AOJu0Yyo/1GxPfbPdoEz7mOSaBVKC3k29FEc/I6N+2eCWO9VzW8eYxD1
 Aduydxdo1XXG/W3CccrIL7NEr8Qun9yyDOPHFgr8BG6v2kw/aRgktDi0KdxIvr6NAx5YBNrcmMU
 UNog=
X-Google-Smtp-Source: AGHT+IEhXipUjPD2o8fz8EC0x5bNzC/Ykh70eWL+pL6yr84ETsKAfwq6a/ylTVaK+YrMwp0IswbExQ==
X-Received: by 2002:a05:600c:3148:b0:421:6008:eae2 with SMTP id
 5b1f17b1804b1-42164a21daemr24451045e9.32.1717777954606; 
 Fri, 07 Jun 2024 09:32:34 -0700 (PDT)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2cd7e7sm55804205e9.46.2024.06.07.09.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 09:32:34 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 18:32:04 +0200
Message-Id: <20240607163208.1445715-3-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240607163208.1445715-1-raphael.melotte@mind.be>
References: <20240216211344.1807353-2-raphael.melotte@mind.be>
 <20240607163208.1445715-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717777955; x=1718382755; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LTRj47ZHlVOc3PVHZDry2pyQuWfEDa4Opbra9yZYbsQ=;
 b=E8yqZATeUqQpcJUgWNkeWRDr/d3ZDrlPavPxX+3OOKu0CnQdoQN0WtZUF9pOZpbpdH
 v2iPlvpklgqUefW00zVvC++Jc7N8v9ET35d3Ou6QLZdl9tIjK/OP+vE6ffj4Cifz41il
 NoSA36vxCHfdGWgPCvxHP2pjXOo5c98WGu2q42KzMSVDrDNYCyx9WVXstV0XmlxoxkRx
 RwVWZArJbGMYwehyCofp3Wd6cWmTm7gwWZj1LXn+wB56Y8SpAki4KQHU2X88n1nFTFEO
 Qjrsi4nJyyr0Ck7s91VB4SYwGTFi22lpbQiJoGsvbFDi2Fhi3kVppAiqJjVm/Pym2NMg
 1Zog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E8yqZATe
Subject: [Buildroot] [PATCH v2 3/5] package/mupdf: fix building shared
 libraries
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnkgZGVmYXVsdCBtdXBkZiBnZW5lcmF0ZXMgc3RhdGljIGxpYnJhcmllcywgc2hhcmVkIGxpYnJh
cmllcyBtdXN0IGJlCmVuYWJsZWQgZXhwbGljaXRlbHkuCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOr
bCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQpDaGFuZ2VzIHYxIC0+IHYy
OgogIC0gUmVtb3ZlIFNIQVJFRF9TVEFUSUNfTElCUyBkZXBlbmRzIGFuZCB1c2UgZXhwbGljaXQg
b3B0aW9ucy4KLS0tCiBwYWNrYWdlL211cGRmL211cGRmLm1rIHwgNiArKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL211cGRmL211cGRm
Lm1rIGIvcGFja2FnZS9tdXBkZi9tdXBkZi5tawppbmRleCAwODg5NGQ3OTgwLi40NjczYjg4Mjkx
IDEwMDY0NAotLS0gYS9wYWNrYWdlL211cGRmL211cGRmLm1rCisrKyBiL3BhY2thZ2UvbXVwZGYv
bXVwZGYubWsKQEAgLTUwLDYgKzUwLDEyIEBAIE1VUERGX01BS0VfT1BUUyA9IFwKIAlIQVZFX09C
SkNPUFk9bm8gXAogCXByZWZpeD0iL3VzciIKIAoraWZlcSAoJChCUjJfU1RBVElDX0xJQlMpLHkp
CitNVVBERl9NQUtFX09QVFMgKz0gc2hhcmVkPW5vCitlbHNlCitNVVBERl9NQUtFX09QVFMgKz0g
c2hhcmVkPXllcworZW5kaWYKKwogaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJGUkVFR0xVVCkseSkK
IE1VUERGX0RFUEVOREVOQ0lFUyArPSBsaWJmcmVlZ2x1dAogZWxzZQotLSAKMi4zNy4zCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
