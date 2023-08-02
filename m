Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26686C04A6A
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 06:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B09F940462;
	Wed,  2 Aug 2023 06:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B09F940462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxICY887_zi9; Wed,  2 Aug 2023 06:23:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE15C40395;
	Wed,  2 Aug 2023 06:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE15C40395
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 200551BF86B
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 06:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F36E040445
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 06:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F36E040445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wndLKsNI2nuQ for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 06:23:30 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06043401A4
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 06:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06043401A4
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fe24b794e5so22336845e9.1
 for <buildroot@buildroot.org>; Tue, 01 Aug 2023 23:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690957408; x=1691562208;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ngrcL+MeY7Jp6PdTQWYGOES80RjXWzK70XhyxG/xTWw=;
 b=dS0TeXd6TPbtXaXxDEhiSLLywRGF2qJMr1wvRxKi8XALH6LiD9gxJToTDHMFnO0afo
 15qww8BRjqBtOJGNSyKs5hVBpH2JZFnNUZ2xp8gUhwpESrIeJ0rIIlf/BSMlajIZKdX/
 gbQvNfaa4EucMT9Vq8+cNH0Yf4p2TyMbzFtLvjchpzkJcQiSaXaUjwitBX1yiKecBEmh
 Kw4qjIhtTjGx3bC0uCZTdhfH2L8n46HtB7XdQmgRE4VUdHXPiVKL8QMNZ0JzUk8uFhgX
 +xbY81+GowlYtBgb4W8CDicc2nNARMukyj9W7/y0a4KVKJh4o7Avd+uxHlOAyAoTa0a8
 oIhw==
X-Gm-Message-State: ABy/qLbp7SfWMlRY8Bv4SwvTIWSQKV03oZUq4WNaf7/ux+k725fXa/KW
 +YGQFOjS1qcW+Cy+YNLognlGax6ntBk=
X-Google-Smtp-Source: APBJJlEJ4zL/j6zcxHUsTp7iFRDGclLFZNZeAEGnojDq1IRnl0UPq09yTS+/O+q6GOZqRrCZu8GCjQ==
X-Received: by 2002:a05:600c:2253:b0:3fd:3049:9496 with SMTP id
 a19-20020a05600c225300b003fd30499496mr4009253wmm.33.1690957407555; 
 Tue, 01 Aug 2023 23:23:27 -0700 (PDT)
Received: from ncarrier.orolia.com ([2a02:8428:7321:aa01:1304:3364:4203:42ea])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a1cf206000000b003fbb1a9586esm802810wmc.15.2023.08.01.23.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 23:23:26 -0700 (PDT)
From: carrier.nicolas0@gmail.com
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 08:22:39 +0200
Message-Id: <20230802062239.2152501-1-carrier.nicolas0@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690957408; x=1691562208;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ngrcL+MeY7Jp6PdTQWYGOES80RjXWzK70XhyxG/xTWw=;
 b=sKY4jKnkOk1901BEKX98NCYG5Cn2BgyzxyToUzcwVqMHFSkRgTPZEFzNkyP+Mw5KFa
 vC5XUnfdrDwfhfLhMh31rvORqJQ3cgxYV7HVtaguNq3Ll6inHxXUZpmElfmKTGJd9yMo
 qInwdx+pmgFkx/bpgN14u/AklbqJlK6neFOpQml2sZ5q/FZQiEN8rWdDWjHIzmjHb6Ch
 xGcIGMscYU+0yMyH/F3Gj2bsyZMbsZ9Vx/YAXoj2GmVXPKKAOMirqvOcoeALwDWSyK//
 2WiINQnXQSnU2ZBEnr1cy3ZGTNoNjPYkA3/fErkW5cgNFIqRKHPOw0kyKwrizmeyQH5F
 rmfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=sKY4jKnk
Subject: [Buildroot] [PATCH v2] less: install the lessecho command
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
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>

it is required by, for example the s command, internal to less, which
allows to write the less input to a file

Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>

---

Changes v1 -> v2:
  - add missing Signed-off-by
  - install all of less by defaulting to its 'install' make target
  - attempt to clarify the commit message
---
 package/less/less.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/less/less.mk b/package/less/less.mk
index 91ce08f4f0..f7211ef112 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -11,8 +11,4 @@ LESS_LICENSE_FILES = COPYING
 LESS_CPE_ID_VENDOR = gnu
 LESS_DEPENDENCIES = ncurses
 
-define LESS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 $(@D)/less $(TARGET_DIR)/usr/bin/less
-endef
-
 $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
