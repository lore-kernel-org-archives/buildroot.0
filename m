Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0E9CD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 09:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7937422B6;
	Fri, 29 May 2026 09:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PsGCP2jXp1DI; Fri, 29 May 2026 09:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD840421A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780047927;
	bh=ZWUJntzyYS49CrhmmQv5q4xlwcXcmkR1jjNRfm4VHOE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=sNJ7tYzyvSeC7dnkQO3VgVMyif6H5irqFYOouU81AQbtQ4z5/8M/a8aWXMKsbukv+
	 5TYCLGD2fbY0p714kCL/FrHySNwQyzwenAOxnZbP37kFj2vR6SrqLR9bIuMnAjWz3q
	 9rnBXpvgYl31oBsQa5GzbQbNKs2Gp4kPPp8vfR0CWQbevlnH+CQn3LB04o8hv4X7Ai
	 amiHFPon/lFctvN1+/kMAEIQtgiAqaGXrQG1at0/FaXBKN9uILmk1uc6J0WySSEvfX
	 u1UqfQVCefuUfMZPyA4s0jLh1b2zA5Wu31OAK8PUNwd2xuLW1HBeeqprxHy1a9Z3D6
	 j0TK927hWYCDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD840421A0;
	Fri, 29 May 2026 09:45:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4F25F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C188961398
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYvzQgHnFK9p for <buildroot@buildroot.org>;
 Fri, 29 May 2026 09:45:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE8E861392
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE8E861392
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE8E861392
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:45:19 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4893940bb5eso74005775e9.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 02:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780047917; x=1780652717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2Th1u4ZuOjH+5k9uorADMUZNHstpseGpYo8KlwP7z7Q=;
 b=ku3D5xdiBKQAXLIhXazbO6Mgs305l+IRgFoQQ4+BqfJh6oaDyndnZFUTHWLEoHyM56
 wA4qo8m3zJ6BEBLAEa2DU54eLhkYDpSNuBHCu6uK+qIu2ls7ocQwXyC2lfFMCgbOQt0m
 1kRjH82qd30LI9vlHQijmGM9zd2sNsjA/xKh58sGFcrCLoQSYQKBwliKR9JZhEA17KHM
 IIJngXRY0TV4tlSM/h0unwAZagQRN8PAT4dsmBj/amrXBpe9iru/qKVKKuvTP7Qo3LGW
 EHHQlEQLURdc4JyLipXdTifiXOEzjO+1l36Sj/uriKtLFgOnpTgMgRVQTFBsUWfEkYcK
 MeQg==
X-Gm-Message-State: AOJu0YwS8mKfuQuaILLTN6RuvcJOHcqwzB5H+/rJBHQF4hLoB7HrcuJb
 RxFRyA4W6iPdqaSFJwMUBsnKr2Jw9zFSPx28ZYQNoRchp6tMzcKskmOFX1MCipRcD8bi71ZWjrW
 fCpOK
X-Gm-Gg: Acq92OGRXjphjs3Xc7Hsvt1jdQFM+1KIqONApz91HhN7d3IR9wB332Dkl5HXiNmQKhW
 battrDGkVQ6VgOaWKHuzXU9lUR26UJni5I/lXHyeiTYniLsFoC4eQBPOzdntT8jgWCdTsKusiSf
 2nzWaItQ0DKWkq0QHPhs843GpUA4ztS/ngfIPjJuZM9XoWX0EUTOuwR7yGxpZkpU7tJpEJhbhjq
 6IFPowk5QM4OBpRvf9QyxIQHAaNTQP13tBGgLTTLvkpIaEAAMQELzOkwz91a8Bk2t+kqEJTn27w
 x/q9x1pZKKm4b4ByX8GgpuJBSH8t1zVXmPV6vnCmowQJK5p44eVqcvKModBB4Z+49HDZ5vEAe5Q
 kvqWvljYTr3aXCtUpHXLR0inN53LuEWbZC9LlAh9htnF/MeuKE/F5hutHrySwpXDdQ5EKBFWc28
 j3boUZu7RBwKgkoejqJrCbfjVkaGzUs3z2Xv7wlXp9K8hX2qRs3sjAlR9yKQ==
X-Received: by 2002:a05:600c:643:b0:490:53d3:4767 with SMTP id
 5b1f17b1804b1-4909c0787b1mr25450035e9.7.1780047917619; 
 Fri, 29 May 2026 02:45:17 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c1035ebsm14349985e9.5.2026.05.29.02.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 02:45:17 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 11:45:12 +0200
Message-ID: <20260529094514.178266-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529094514.178266-1-thomas.perale@mind.be>
References: <20260529094514.178266-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780047917; x=1780652717; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Th1u4ZuOjH+5k9uorADMUZNHstpseGpYo8KlwP7z7Q=;
 b=UdZdN3FHL/WOxYVFthFOXpThE9MP+uSHWJeKzyv8E46TeoOVQuAnXWOCOFDX38u7j5
 gug4e0TWazfMfWwP6SZTo/KO8Vi0+aCd9507vaMndj/ZVcg+NtI+Uz6UoG2F3dhNER9K
 qt6UkdQBaPVCHyQahjf3O8L3aYVEXrtRQnbzQwcTPsBBGW0KuEtw9NHesS3TtUXPcj6z
 DBW4p6Le6uXNeDxLPb2nM0IzXzjrxUY9o2pUlas0uA+zxrCPUqdLuk5qz974lcVKIUny
 cm/aO7ZLH9KD8fEH5L9mWS2M7mopflaOSXnrYIWjuVPzGUpCq052j5gYe2zWl3eUy5q+
 I5Rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UdZdN3FH
Subject: [Buildroot] [PATCH] package/icu: update CPE vendor
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Daniel Price <daniel.price@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE "cpe:2.3:a:unicode:international_components_for_unicode:*:*:*:*:*:*:*:*"
is valid for this package.

Also remove the no longer needed "ICU_CPE_ID_VERSION" subst since [1].

The previous CPE hasn't been used since 2020. While the new one got two
CVE assigned since 2020.

[1] 5bf0db998b package/icu: bump version to 78.1
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-5222
[3] https://nvd.nist.gov/vuln/detail/CVE-2020-21913

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/icu/icu.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 3030e0c71c..ee1ede6f2c 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -13,9 +13,8 @@ ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
 ICU_LICENSE = ICU License
 ICU_LICENSE_FILES = LICENSE
-ICU_CPE_ID_VENDOR = icu-project
+ICU_CPE_ID_VENDOR = unicode
 ICU_CPE_ID_PRODUCT = international_components_for_unicode
-ICU_CPE_ID_VERSION = $(subst -,.,$(ICU_VERSION))
 
 ICU_DEPENDENCIES = host-icu
 ICU_INSTALL_STAGING = YES
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
