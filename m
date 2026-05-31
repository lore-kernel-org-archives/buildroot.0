Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70227CD6E5D
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 15:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43A8C844E8;
	Sun, 31 May 2026 15:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8eNTIa6XJ41U; Sun, 31 May 2026 15:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C4BD85070
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780241794;
	bh=WkuHvZY4NDdr5h+TYR1NuV1jJFiI1MeK1JSuCu/WBP8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=oS0g5vKwVhsIsgY3eY+mMO766HyNIrOBEro+Y/FbByzEfoOpFFpRmbJYxgSrtgSU/
	 1vPhP9gsNiS/HCgZ+pqT8E1S+NQe4UZNF8Kjo2wN5SfwiuSV91jhKZRSS+bmy+C3Ki
	 778tZmgScfo561lGDH1/2bO8ae96IcZVPD33LcaWFl7aa8pmdblnADWk/86xcpPUYj
	 xobY8TZ/5ge9RTJKG3nNUW/lg1jMrlUWcoO8xa5c5dytxmQVkHL+cJ4uYaF2VMpnwb
	 4NJmOktUzG5O2TZNhzVddLj3SwQYcQTXpk7LRc6/PWlKTcCtK5fy03gPZsSgZ6KThm
	 9yh/YcqccbcSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C4BD85070;
	Sun, 31 May 2026 15:36:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B30A5389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9672E40788
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1W4MfPcwYK2 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 15:36:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC89E4077F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC89E4077F
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC89E4077F
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:36:28 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-49042aeeb75so111903695e9.1
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780241787; x=1780846587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g6ZDOxh0G5c0vAaAIJbs3Bwcj29gtJRTG1vcHtbQZ4A=;
 b=fESzramzyOOdliCyX6ZhjZRLvhSG32voR4E7LspMjgcMEPFuBKpgiW+2u0Ezy3U6qw
 K8JQdvylI8CeKmJWbVnzE4YBdzytGXC9cule13f8s16kZEjhe75WK28djtnaN8TOIn0K
 O8cV8ntf91zF//nU6x1LSbkwE9OwUd3QJCVXh3xw1azZJQLKC8tcVZUkdB+7RPyaMYOf
 Y0FednZZlvRibf0b2QVis3ps0XFzCSFIOI+YD8Kc74WycLlI8TbF+91OG6K9CI8PqgcB
 mxw9jklYKUW9ulGt3DfoM+fmxMRLdVPsdjhvF0FWD/YFcocEAUXVFgUVoGMQwfGoOcsP
 6f7A==
X-Gm-Message-State: AOJu0YxFCMYDc0y6YefJgt5zCjeN34ZU6Aj17V2SxesEgaN92djXfzkn
 dkX36hMF3mRjdH7wjOXbbi+vJKVV2I5/+sSovKa7s25usIiAXJQN4PpP9yNVLiLx4yIBDSA/alY
 qvikENdc=
X-Gm-Gg: Acq92OFqpHg2V8B2VsDWwefuC93DdbbHT901lzMxLzULizc0uUL8Jt3crOp9UEfOJws
 nemgK5APGAPRHeq9Yo0uPAMgcNT1f8NoXCNLlUaDLcUPNsfcVg+19tDIbqY3hm7FrCQzSPq+F8f
 Llufzp/HW9ALiMFcGH/GTAvIwIR9IqFEH2kwmX5o7SE91eALJHXUkb1QAe3/uJqDNGCnz9YjKEo
 8+oSdEI49EYStKIl9OncSjuQM27/z/x7/AUHEfc472E66yG9p9TA15N+SWTXbplpRqnSTJ8oMLK
 1R8M4g5s31oeF+rR3JbxxC6AquPwEJOjrZxhJZWYRNO1d2XFopttjks9ofn/YUM+d9Uyh/oWYU/
 x4EaXjbSIwqAkTF7TJZ1tf7zwUqQUdZtWca6Bt3C+Fhpp68c8evVm0vvnkg4KlhTQnYsLG8I89l
 JCDaCMJ8t8Mi9Zr+Fu7/OuRpow4LypflfxAPW554WAvcr1qtCwOGHRhqN0tvWZL8ih2lAZM/Xdf
 d+RflxtjQRKLoKhneYjKNPhbA35cT87
X-Received: by 2002:a05:600c:450b:b0:490:3fa2:1b93 with SMTP id
 5b1f17b1804b1-490a291fa5bmr148808505e9.13.1780241786911; 
 Sun, 31 May 2026 08:36:26 -0700 (PDT)
Received: from dragon.localdomain
 (lputeaux-658-1-173-117.w92-154.abo.wanadoo.fr. [92.154.108.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca6575csm278098585e9.4.2026.05.31.08.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 08:36:26 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 17:35:53 +0200
Message-ID: <20260531153557.2375580-10-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531153557.2375580-1-titouan.christophe@mind.be>
References: <20260531153557.2375580-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780241787; x=1780846587; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g6ZDOxh0G5c0vAaAIJbs3Bwcj29gtJRTG1vcHtbQZ4A=;
 b=KwORswUMk7h/cyFHwQrLXauNMD3QhB2+vLqZEDD9pG7t2SS9S0woZbNr8BA9Mktybi
 iqTcUP8YYvMJOZne6fHtAbty2Lozy+lE9mUuFdkDCrZ+7ltoO5qxd+Yc+xh/hl1o7fYa
 MuL4MiSyACIYu14qrM5fSrcb48uU23WI1RM/yHWRzhYpCwCRHbyw3aw9DspVw9b+gaFj
 yAL2jK13xbzTbQwi7C7FhPLboKt+3UKpZRRdnoGP41tJ7i5yaSGatrRBubSol9/cmNxK
 1bxJcN11QyIk1AEz3FKlGisnCTUc8xQWvq+FmNhjLDPMyMWa6GJ4jO2no1Rt6YveyYJF
 fv0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KwORswUM
Subject: [Buildroot] [PATCH v4 9/9] Makefile: add new target "yellowconfig"
 based on kconfiglib
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: yann.morin@orange.com, ps.report@gmx.net, thomas.petazzoni@bootlin.com,
 petr.vorel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As informally proposed during the 2026 Buildroot dev meeting,
this introduces a new kconfig user interface based on Zephyr's kconfiglib.
The name "yellowconfig" is inspired by the yellow-themed curses interface,
as opposed to the classical blue "menuconfig".
Read more about kconfiglib: https://github.com/zephyrproject-rtos/Kconfiglib

To run that target, one has to install kconfiglib beforehand,
for example by issuing the following command:
> pip install kconfiglib

In terms of user interface differences, Zephyr's kconfig brings:
- searching symbols as you type, and more symbols are visible in a single
  page of search results [1]
- symbols that aren't selectable (because of unmet dependencies) can be
  viewed (toggling them on or off with the key "A") [2]
- symbols y/n dependencies are displayed more clearly, each one on a newline.
  This is especially appreciable when there are many of them, whereas in the
  classical menuconfig one has to scroll left/right to view them [3]

Having this as a new make target allow for Buildroot users to try it out
and forge their opinion on this different interface without breaking
habits and usual workflows. However, in the longer run, this could possibly
allow to replace the custom-patched kconfig programs we ship in Buildroot
with an unmodified upstream supported codebase.

Moreover, as unselectable symbols can be displayed in the interface, this
would remove the need for comments in the like "<pkg> needs <condition>",
where we need to invert and maintain conditional dependencies.

As a final nice addition, having a Python based kconfiglib allows for
programmatic access to kconfig symbols and settings in scripts, which
could be useful in testing scenarios.

[1] https://gitlab.com/-/project/2648174/uploads/8ae29a772927e7e555f85f6d31876bb4/2026-02-04-105501_958x1015_scrot.png
[2] https://gitlab.com/-/project/2648174/uploads/8d27510cf738cab9fd95ffdd81f75bc9/2026-02-04-105514_958x1015_scrot.png
[3] https://gitlab.com/-/project/2648174/uploads/6d51a4b608fce076ac8c0c84623531f2/2026-02-04-105522_958x1015_scrot.png

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Makefile                    | 3 +++
 docs/manual/quickstart.adoc | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/Makefile b/Makefile
index 0a245c937c..d647792fc9 100644
--- a/Makefile
+++ b/Makefile
@@ -1017,6 +1017,9 @@ gconfig: $(BUILD_DIR)/buildroot-config/gconf outputmakefile
 menuconfig: $(BUILD_DIR)/buildroot-config/mconf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
+yellowconfig: outputmakefile
+	@$(COMMON_CONFIG_ENV) CONFIG_= python -m menuconfig $(CONFIG_CONFIG_IN)
+
 nconfig: $(BUILD_DIR)/buildroot-config/nconf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
diff --git a/docs/manual/quickstart.adoc b/docs/manual/quickstart.adoc
index 605031037f..d8e788ca97 100644
--- a/docs/manual/quickstart.adoc
+++ b/docs/manual/quickstart.adoc
@@ -27,6 +27,13 @@ for the original curses-based configurator, or
 
 for the new curses-based configurator, or
 
+----
+ $ make yellowconfig
+----
+
+for the https://pypi.org/project/kconfiglib/[Python kconfiglib]
+curses-based configurator, or
+
 ----
  $ make xconfig
 ----
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
