Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ABBFF885A
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 10:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE67C81300;
	Tue,  5 May 2026 10:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vu91AUrD442u; Tue,  5 May 2026 10:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E1F7812C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777975571;
	bh=OXGK7o8y03IxBuvS4sj/BA64wjJgEbMosnkZufk8vZk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JT6iS3YS5NCjpROywvA+DOpLFDfBTPuiafWVRdePNAaGgCwvO2QbXMCfP+4ltxIE0
	 lkaDBp2N7DAK0yg+cBM/VI8rNkK5Op6JzKSoNHDC8vxBX+nkjmcISV9w4e8AulS+t5
	 D+jiRHvGcNlnq0bjFZtrqP9L1f2nDZBEmDZAbGZflYjA23HQoj+HoGrChQCEtX+fGP
	 hX6qyaaoBJwF5cDxkbX7Mq6GljPsmLUMbg/ABMP1bVgr4Jw2tEP2rYHKF9KfMVrvTa
	 i/3Sfu0ogQHCVa3znzSSCGNjCwdfFI+ArcAuf/dwy7ZB4a5skeH1NZsRKgsdX49KEw
	 1pYSzFkd4LLCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E1F7812C0;
	Tue,  5 May 2026 10:06:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A15A12DF
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93566812C0
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6JPW6MyXaIJW for <buildroot@buildroot.org>;
 Tue,  5 May 2026 10:06:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28F83812BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28F83812BE
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28F83812BE
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:06:08 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48374014a77so59665295e9.3
 for <buildroot@buildroot.org>; Tue, 05 May 2026 03:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777975566; x=1778580366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0pqpzlETYc27N1MlXFJdhVo500wP0XgcVQRDv7vnec4=;
 b=ZqqE1Jka7kam+G9ts2ZQYccrX93zfrbBxsqDfJuEbSpfi4LXYYTZthEzVs3gMeHenq
 ctU5e3sD4b3EVJzvhpv7e9aHbAfREG+JsZ8B388/Hf4M0vXi0qZPS6BASPkbkFLqq02e
 xEg5PZCHoljpgWrARr/j8tkqN3Znj3lCJH1TbrNXfL8Jjx+X/zIBvxHeCZI62IuwIqSP
 8wxT6MA2kYBRQ+2nsOXzoF4bX5ACbulL26tuSRjNDMuSFwslPRqXU1cdg4uUPPeyEzN8
 /laKxI41xbnCdgK5cYUkctvuzQ++jmlwtBS1+SZdTsgXycuhQW0re67fPMcHSnPsBkR5
 ViMg==
X-Gm-Message-State: AOJu0Yx05GyHfQbR3d9nLNL4DQWZ7LSWg2V6IOSAVeAxS9SYCVIUbr8U
 k5h+6orPuveI3ThHAiavURfSNEEjDhPIS9yqzo8u5UOawoLs8e/ur9WaCMrS8bl+wX808b2qo3b
 S/bzHywI=
X-Gm-Gg: AeBDiesVzdcDnlLsXioTMUIVGKjo4FbjioLO+K0cHVLDHuALCBE7pS5zczHlZLfJlGe
 8YJ6JWyJILNJ/Jp9FmCODS9vqf6yt+pB5/D+6QfzrWXOR+K0XYXHUP/b2pM4GIF3PgjWn2qQFsB
 lafT49h358M96HAgA/8QO9w/zlkF8z3zHtOICP9vhKIHUj0fplnYbO2OZn2AAIv95IfUVbxInkB
 J+NRj64se/HTxMeYXPOaq1U/AAf3zQHHjWTPlXXn7XBmeEXiwgfioM3QuQdX2DhHC/cqLxFUECv
 KN4avdJYjuXmZWdinUjfcFs9kyg3SCwKS33ClHBvEhVm7U7BQwdEl1bZ/vIfrWIUTHMMK+vrzEe
 +5Yb5U8ocA4hIVAOYLPsDKDvPnC219ceseDMwnsrUikad3pV0YOGedfDFu1mAkjZBdWUoQtUjw8
 q92RB8hM9u5xeKb+CaMPwoTSUQaTx48IKWXEOzwnLhZbunYDdECmjl+LBQ5RBCgOq+MDu2vRLNG
 TqMTuQzJgmn5YgxitoO0qWbEm0EJX8=
X-Received: by 2002:a05:600c:8b04:b0:485:40db:d40c with SMTP id
 5b1f17b1804b1-48a9852f332mr212594255e9.3.1777975566011; 
 Tue, 05 May 2026 03:06:06 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4505285e765sm3259221f8f.10.2026.05.05.03.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 03:06:05 -0700 (PDT)
To: buildroot@buildroot.org
Cc: ju.o@free.fr
Date: Tue,  5 May 2026 12:05:52 +0200
Message-ID: <20260505100553.4100688-2-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505100553.4100688-1-dowan.gullient@smile.fr>
References: <20260505100553.4100688-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1777975566; x=1778580366; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0pqpzlETYc27N1MlXFJdhVo500wP0XgcVQRDv7vnec4=;
 b=ebfm+mLoklNRsirMDfXSKMa8wyIK8LLW0Hx6WmsRxeTACEVChEuQTdOb7SBUIGJeP4
 ZJvc1tEvFI1LT3Sfv4l4Lhw5+KUjMq1AH59pv5g2OfTU9TkmZ0EZg9HIZmUOzxWU/PiN
 HkvSKDiRFhDmv9niTQ0+WDBIt8o4Afhl70n3g=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ebfm+mLo
Subject: [Buildroot] [PATCH v2 1/2] package/libabseil-cpp: add patch to fix
 build with gcc <= 12
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Julien Olivain <ju.o@free.fr>

libabseil-cpp headers can break some packages build, like protobuf,
when compiled with gcc 12. See [1] [2]. The issue has been reported
in protobuf upstream, in [3].

The issue is due to gcc <= 12 not supporting the mix of standard
C++ attributes with GNU attributes. See [4].

Gcc 12 has been removed from Buildroot internal toolchains in
commit [5], but gcc 12 can still be present in external toolchains
or on the host. This is currently the case of the Buildroot Docker
reference image, based on Debian 12 (Bookworm).

This commit fixes the issue by adding a package patch.

Fixes:
- [1] [2] and many more.

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/13904066346
[2] https://autobuild.buildroot.org/results/33f6cfd37cb48c15a53b3e7123d5ce8388a0f2ab
[3] https://github.com/protocolbuffers/protobuf/issues/26383
[4] https://gcc.gnu.org/PR69585
[5] https://gitlab.com/buildroot.org/buildroot/-/commit/58cf7c51da3ae4804332f68ee934e153d695d047
[6] https://github.com/abseil/abseil-cpp/pull/2044

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...SL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch

diff --git a/package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch b/package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch
new file mode 100644
index 0000000000..8f5e255795
--- /dev/null
+++ b/package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch
@@ -0,0 +1,55 @@
+From 77326826119439c06e341c9d090633ecd9b520d6 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Mon, 27 Apr 2026 19:38:19 +0200
+Subject: [PATCH] base: fix ABSL_ATTRIBUTE_WARN_UNUSED with gcc <= 12
+
+Gcc <= 12 does not support mixing standard C++ attributes with
+GNU attributes. See [1].
+
+This can lead to build failures such as [2] [3] and [4]. In those
+situations, the compilation fails with error such as:
+
+    /usr/include/absl/base/attributes.h:1076:36: error: expected identifier before '[' token
+
+Gcc maintainers mentioned in [1] comment 9 that this bugfix will
+not be backported in Gcc 12. Gcc 12 is still used in LTS
+distributions. For example, it is included in Debian 12 (Bookworm),
+which is still supported until 2028. See [5].
+
+This commit adds a workaround for gcc <= 12 which uses
+__attribute__ in that case, which fixes the compilation failure.
+
+[1] https://gcc.gnu.org/PR69585
+[2] https://github.com/protocolbuffers/protobuf/issues/26383
+[3] https://autobuild.buildroot.org/results/33f6cfd37cb48c15a53b3e7123d5ce8388a0f2ab/build-end.log
+[4] https://gitlab.com/buildroot.org/buildroot/-/jobs/13904066346
+[5] https://www.debian.org/releases/bookworm/
+
+Upstream: https://github.com/abseil/abseil-cpp/pull/2044
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ absl/base/attributes.h | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/absl/base/attributes.h b/absl/base/attributes.h
+index 5887fcaf..a26143e1 100644
+--- a/absl/base/attributes.h
++++ b/absl/base/attributes.h
+@@ -1092,7 +1092,14 @@ struct AbslInternal_YouForgotToExplicitlyInitializeAField {
+ // See https://clang.llvm.org/docs/AttributeReference.html#warn-unused and
+ // https://gcc.gnu.org/onlinedocs/gcc/C_002b_002b-Attributes.html#index-warn_005funused-type-attribute
+ #if ABSL_HAVE_CPP_ATTRIBUTE(gnu::warn_unused)
++// Only GCC >= 13 allows mixing standard and gnu attributes.
++// In case of gcc < 13, fallback on using __attribute__.
++// https://gcc.gnu.org/PR69585
++#if defined(__GNUC__) && !defined(__clang__) && __GNUC__ < 13
++#define ABSL_ATTRIBUTE_WARN_UNUSED __attribute__((warn_unused))
++#else
+ #define ABSL_ATTRIBUTE_WARN_UNUSED [[gnu::warn_unused]]
++#endif
+ #else
+ #define ABSL_ATTRIBUTE_WARN_UNUSED
+ #endif
+-- 
+2.54.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
