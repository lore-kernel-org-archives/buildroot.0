Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E51C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 10:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 424D040B53;
	Wed, 21 Dec 2022 10:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 424D040B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IDfFafLkhKGM; Wed, 21 Dec 2022 10:52:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BFBC40B6E;
	Wed, 21 Dec 2022 10:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BFBC40B6E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE9DC1BF5E0
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 10:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9D3B40B5C
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 10:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9D3B40B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XNPFXJ34gX1F for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 10:52:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56CAA40B53
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56CAA40B53
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 10:52:25 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id h16so14462454wrz.12
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 02:52:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0ZPka6TQzJj2kyqEEOw3+YSfRbavLAxchjfNW0w+Vj8=;
 b=O5i/XsllZlEI40VGsSZ7jNOZ7HXijTQlGINXAhsQ1YFoFV4zjCvaka+Rr7bDJYySNe
 hocAs6afQKMJ+o23/T9zILVyr1JZo9i7rnrCu4PMRR1jG8un8GAeVYVnDZPuH3SJLiBT
 +NK4UVV24HSqJuY3k2VZuWpnx17y3JqQq0twtKdKEAI35JpJl6ArOJbEgOj19caC4ZFy
 ECiljxMMU6GzgBEgDKAF8E5gfteEbnhqL3A6dW29RXraN+JLTDa3Qz2yDMJBUl5wa/b3
 eCJXuXbOk/Nw0+V5bhii+mSqSZgkDoAeDGu1thwZfda2JdRMpF0ItL5AOuGBJGcGKCq3
 yV8A==
X-Gm-Message-State: AFqh2koE9PTv/TK6dlk+jL339gfUUOhh3D308Du5X3WPEqqsLD56E3ZF
 KluWQrqLtHFROau3Ni0+KfvoOtVf7Pd0Eqx8
X-Google-Smtp-Source: AMrXdXtQC3AfKWENh3fhVb5ifjKYiF+HTN/9PtYFC3kH6VR4J+6BKPfzcbArbS2D8gtVWAw/CVMhDQ==
X-Received: by 2002:a5d:67cf:0:b0:242:4f56:6b0d with SMTP id
 n15-20020a5d67cf000000b002424f566b0dmr836811wrw.48.1671619944241; 
 Wed, 21 Dec 2022 02:52:24 -0800 (PST)
Received: from P-NTS-Evian.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ck5-20020a5d5e85000000b00257795ffcc8sm15085208wrb.73.2022.12.21.02.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 02:52:23 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 11:51:53 +0100
Message-Id: <20221221105153.12418-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0ZPka6TQzJj2kyqEEOw3+YSfRbavLAxchjfNW0w+Vj8=;
 b=56RNpbheehyfEhNSzCyu+cXYHsfHhxtdnIGtYQAbxq2vWXzV32rY2qPJ2bmeRjc7iO
 otUAAWG38TmBe6mIWix6+6us7pK1SJImG2Vn8qRu6r1fVm28mJHAR2rr0V8tXQtblH0y
 U/+SMB5nhLgrSCuBEQJgVVoE5uDGkGd41QjSAg4xzk64R1E1uxbxEqcIFCNI2qnQ+++x
 jGe3me6gGUHTjJq7WucNEn9p5/2xyzgnNscw2ExxttkOwU+9n6c4A+zCqKtWInxWraSZ
 lffr1NyZcY1jrVtZy7oaHviFxGYO2CYGxKD3qXfcciafsLoyENOSjloG4aRzrJsXzq1c
 Infg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=56RNpbhe
Subject: [Buildroot] [PATCH] package/aubio: switch to external waf script
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the python 3.11 version bump [1], the waf script
bundled in aubio 0.4.9 can't be executed anymore due
to a waf bug [2].

Use the waf script provided by the Buildroot waf package
infrastructure after removing the old waf script and its
libraries.

Fixes:
http://autobuild.buildroot.org/results/e2b/e2be18415ca794c68e708f2fdfd0a1a1ff5be714

[1] 738500c296c8b1206f20e94ca3e7c5932a6a0486
[2] https://gitlab.com/ita1024/waf/-/commit/68997828c850ce7fb30b73b4adfde35053e539d1

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/aubio/aubio.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index b2eb2b5e6d..c995fdfac7 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -16,6 +16,17 @@ AUBIO_CONF_OPTS = \
 	--disable-docs \
 	--disable-atlas
 
+# The waf script bundled in aubio 0.4.9 is too old for python3.11
+# Similar issue with Jack:
+# https://github.com/jackaudio/jack2/issues/898
+AUBIO_NEEDS_EXTERNAL_WAF = YES
+
+# The old waf script bundled in aubio 0.4.9 need to be removed first.
+define AUBIO_REMOVE_OLD_WAF
+	$(RM) -fr $(@D)/waf $(@D)/waflib
+endef
+AUBIO_POST_EXTRACT_HOOKS = AUBIO_REMOVE_OLD_WAF
+
 # Add --notests for each build step to avoid running unit tests on the
 # build machine.
 AUBIO_WAF_OPTS = --notests
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
