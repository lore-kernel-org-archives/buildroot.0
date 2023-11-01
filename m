Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C7BC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 15:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C44784C6A;
	Wed,  1 Nov 2023 15:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C44784C6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YlvSre_hRpV1; Wed,  1 Nov 2023 15:44:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D3AB84C64;
	Wed,  1 Nov 2023 15:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D3AB84C64
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDF201BF35B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 15:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2CD2431A4
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 15:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2CD2431A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lGSdD5BbFgnj for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 15:44:03 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB6DA4319E
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 15:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB6DA4319E
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32dbbf3c782so601601f8f.1
 for <buildroot@buildroot.org>; Wed, 01 Nov 2023 08:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698853440; x=1699458240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8EYThRWGL1XmjPvreesOL9fweWqhRhBXEkc5SSqUPi8=;
 b=CquxeDNk3omNQ4m4DQ6b2VfgUxw9MpWQD7l2URGenYnmazC6ia1ljkEaYizjdoJdvi
 LakxkuTxZN8f1gDTagbkqO4p1Am7VpR5t5GfbJoulOKbEb0eZixpmD5X6RSvERo1TII4
 W7/05M8T0JPdz+TSq+xNsoMD2YIXLEV+y4ZqfOeZazEyUZJADtEt+8sPOefkfv0TI9GS
 22fraZg50u1WTFoLFNLfGkrqsOdyQbU1uVxqHEYLLaAqiNKhCYZa1ZScEjabW+T/wHPT
 aJ1Pa3Z2iFVzovG/Hop1837+2/Nl4/mv0rAEXGSiZmAAaQVBznI4zPjnF4OHKqJ3r8XJ
 ZSkg==
X-Gm-Message-State: AOJu0Yz+B971VpU4nhPLWB/nj4kSlW3oI8Dez+HnFrsKEHmSk6LQA08m
 e7Q5dDrOxLBSN7kkOW0tz1tzCNg1NsI=
X-Google-Smtp-Source: AGHT+IG0qDmyF01t72C5LD+/Bn6K4djrog354evRIJtXRCGrEGmOUrJ2CLM7P+vP0aa7ixgpqrtzgw==
X-Received: by 2002:a5d:684e:0:b0:32f:8b1c:106d with SMTP id
 o14-20020a5d684e000000b0032f8b1c106dmr3268049wrw.10.1698853440318; 
 Wed, 01 Nov 2023 08:44:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m1-20020a05600c4f4100b0040684abb623sm150958wmq.24.2023.11.01.08.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 08:43:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Nov 2023 16:43:49 +0100
Message-ID: <20231101154350.541223-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698853440; x=1699458240; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8EYThRWGL1XmjPvreesOL9fweWqhRhBXEkc5SSqUPi8=;
 b=HHLfcViT+PzdLBgUXPqv2VQGnC4ZfQz/9VN6MFJLF1PPM7164zWZoaLSO48iVwpGZA
 5EisbJO50rc1G8gHVlMHbDVVg9+C6ZXdpD50b0mOidvNtQxdzS23yejZtK2S8kZxfYKn
 TEJNZjbqld1rYSLnzLNKEeshiKdkZSY+qcPHRDksiMTidq6Gi8jHPRsB+yawx234I5ck
 U3A4FclWuIPBfRDlQ9T/0TTcy04223ON/SH02ED/pocirIWVqBft1z5YgyVlXgslEnCt
 YLQMW3lLoBN0LuCUR8ab52NZJ09fYU2gwBY/mOdLzEcoi6dSYZFQrPWXiIBT/CWqqrlw
 /nng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HHLfcViT
Subject: [Buildroot] [PATCH 1/1] package/conmon: seccomp needs headers >= 5.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

conmon unconditionally uses seccomp_notif_sizes which is only available
since kernel 5.0 and
https://github.com/torvalds/linux/commit/6a21cc50f0c7f87dae5259f6cfefe024412313f6
resulting in the following build failure since the addition of the
package in commit 06f50ff1bf066feb6cf6ed512113773f87c884fb:

In file included from src/seccomp_notify.h:4,
                 from src/seccomp_notify.c:26:
src/seccomp_notify_plugin.h:33:78: warning: 'struct seccomp_notif_sizes' declared inside parameter list will not be visible outside of this definition or declaration
   33 | typedef int (*run_oci_seccomp_notify_handle_request_cb)(void *opaque, struct seccomp_notif_sizes *sizes, struct seccomp_notif *sreq,
      |                                                                              ^~~~~~~~~~~~~~~~~~~
src/seccomp_notify.c:47:36: error: field 'sizes' has incomplete type
   47 |         struct seccomp_notif_sizes sizes;
      |                                    ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/cbfa2f3a585b7feecd902137bc589a1ec15cbefe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/conmon/conmon.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
index 50807f8c6a..214cb460a5 100644
--- a/package/conmon/conmon.mk
+++ b/package/conmon/conmon.mk
@@ -11,7 +11,7 @@ CONMON_LICENSE_FILES = LICENSE
 
 CONMON_DEPENDENCIES = host-pkgconf libglib2
 
-ifeq ($(BR2_PACKAGE_LIBSECCOMP):$(BR2_STATIC_LIBS),y:)
+ifeq ($(BR2_PACKAGE_LIBSECCOMP)$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0):$(BR2_STATIC_LIBS),yy:)
 CONMON_DISABLE_SECCOMP = 0
 CONMON_DEPENDENCIES += libseccomp
 else
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
