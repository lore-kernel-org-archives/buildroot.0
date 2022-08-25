Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6EAECAAA0
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 20:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1743183774;
	Thu, 25 Aug 2022 20:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1743183774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rL-Td-4I7vQP; Thu, 25 Aug 2022 20:18:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EE3483443;
	Thu, 25 Aug 2022 20:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EE3483443
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79D1E1BF2FA
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 20:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 557AD40A9F
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 20:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 557AD40A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id etXogOl5PF9P for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 20:18:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81704400AC
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81704400AC
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 20:18:12 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id bq11so19388730wrb.12
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 13:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc;
 bh=jMoPc2AhhR7yRVq8R0iboZE4HR4iI8msmVAvz0gpXy0=;
 b=vCy71p9yPRcspArFDBKu+SZfM4HP05kNaKsZG6I0NvsmISHbdTuCzMsfRW+nX0yR36
 KViK/Zefy2jYO0idAHY26CkqNlOcpySG3M/ljQzdHOB4JO4flEuSXrGYabLmoSz54gO2
 RfANHwbUtcv6Ra9DJf2QUd3xhCprtGSh4mU7eV/HCA3EQVy+si/dTn95kubyRBX1mKZp
 Zofr8ekaDbXpHRJfKhgRCkKHKMjUq1EIVtXO1kZBMgfuYJa0MH5cmlKIte1Pz1+a9m9f
 1xiwa0c/wUgcjBRhD/cRKodarprBPWIBS/+Wlwlu2HOYoUmQG7i/TvoQfbb918lLACNo
 4+Gw==
X-Gm-Message-State: ACgBeo3292Xxd1mm5iuRuhS3WW+eAn/rRt3ylngmUiRuYiu8Cb3AyVFA
 V3CoGYYnTtQBjtLsI2zP8aD6lXuoTGM=
X-Google-Smtp-Source: AA6agR6Ll5SCQvYBspzhNr92x6hn2vVcTenP1dUylnYpzm8Qe8ROODybtmRR0TFAU7GVauKpxOaYVg==
X-Received: by 2002:a05:6000:144d:b0:21f:a4a0:dbfa with SMTP id
 v13-20020a056000144d00b0021fa4a0dbfamr3218910wrx.701.1661458690642; 
 Thu, 25 Aug 2022 13:18:10 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:85d1:e2d5:4fa1:5f52])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a5d48cf000000b0022537d826f3sm160298wrs.23.2022.08.25.13.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 13:18:10 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 25 Aug 2022 22:18:09 +0200
Message-Id: <20220825201809.129034-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc;
 bh=jMoPc2AhhR7yRVq8R0iboZE4HR4iI8msmVAvz0gpXy0=;
 b=piOi1LViLRzlZzoBVpNSAGs7P645Z4tjqtCKeqlewdOU3XpNqKrNidbinXVLBmk+C7
 WWPCgP7UP0jTDmgSgZyXfWVtOdKVIZtkNgRgyBisnGKrwGF3F4OAXMx3+M9X2qhr06Ui
 DWHSAlH12n8mjqT2nf1kTUMS6uHefhsqpobN1YEYT+T3O5FFM/cFxN4GMAkRg7BNBVjk
 IxK/YEvZZkztSoOBOiNwfunPLF2tkj9bQrib+NRIQrDSge4xt0kV2jFaKFEqm6nszJrx
 jYQVVvhVYj4WbEvJwjssIqFp6pyFXKNbCcek8CoqBJaZW8B1uLebiZoCz6pCBBkFxoJj
 TbyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=piOi1LVi
Subject: [Buildroot] [PATCH v2] package/python3: ensure pyc embed rooted
 paths
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To report usable tracebacks, pyc files embed the path of the original py
files, so that users can more easily try and debug the reported issue.

We generate the pyc files by calling the python3-supplied compileall
script, to scan the directory where python modules are installed. Since
this is done on the build machine, we tell compileall.py to strip away
the TARGET_DIR prefix, as that has no meaning at runtime.

However, compileall.py forgets [0] to keep a leading / in the front of
the paths, thus generating non-rooted paths., e.g.:
     /path/buildroot.ouput/targt/usr/lib/python3.10/argparse.py
gets embedded as:
     usr/lib/python3.10/argparse.py

This is a bit confusing but, as far as we could see, should be mostly be
used for display purposes in tracebacks, and does not seem to impact
actual functionality.

We fix that by instructing compileall.py that the embedded paths should
be rooted to / which generates proper paths in tracebacks.

And alternate solution would be to swith gears, and tell compileall.py
exactly the resulting runtime "base" directory, which replaces the
stripping and prefixing; i.e. it's either:
    -s $(TARGET_DIR) -p /
or
    -d /usr/lib/python$(PYTHON3_MAJOR_VERSION)

We choose to keep the first solution, because that is semantically what
we really want to do: to strip the leading build-time path, rather than
to force anything.

Note: the python test-suite was executed with both solutions (in a
pyc-only setup), and the results were exactly the same; so in practice,
-d or -s+-p yield the same results.

Many thanks go to Vincent for reporting the issue and suggesting the
solutions.

[0] Not sure whether this is a bug or a feature...

Reported-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - fix some typoes
  - add the [0] ref
---
 package/python3/python3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 9af384712a..a9821d9a33 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -255,6 +255,7 @@ define PYTHON3_CREATE_PYC_FILES
 		$(if $(VERBOSE),,-q) \
 		$(if $(BR2_PACKAGE_PYTHON3_PYC_ONLY),-b) \
 		-s $(TARGET_DIR) \
+		-p / \
 		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
