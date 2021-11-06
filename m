Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB72C433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:45:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5F5E6120D
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5F5E6120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8D23402A0;
	Sat,  6 Nov 2021 15:45:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AC6BW6Oga6sc; Sat,  6 Nov 2021 15:45:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1937D40297;
	Sat,  6 Nov 2021 15:45:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5AF851BF2A1
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A30240297
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:45:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FsMoL36b707m for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 15:45:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E08D40286
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 15:45:31 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id v127so9470150wme.5
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mtafp0K9eq51R31AiLitXI6cA0NsWoPbGJ7FJ+D9jvs=;
 b=DtP1g+om7/WYLonpUREjVG3ITdXoSXDhO55sHykU9hzaij4BWctXhmRjiTnRH34j+F
 z66oCngHnI120svxujs/V09IoAvnUMEW977NthLeFu16DJh0zNouflIX9kfkZEoq8dEF
 e/p38ewBgprycVdjmehK1wpT7fVGLmS+Zfu88Lm/jm18oZFJxaqu/USZp/1APADmwRKp
 BH5N405SQ1Zw6P3lNrdZ1CnQi/3OTLjWXGDGT6pDTbq+UDDcwdDmr6/Prmfm05GU04yK
 t6YOvlHqQHw69vJWtA8VvuSPv4qrGtN9P2q5l2FVpWQ8JVuAj/iV8YEaHMysh0blFV+l
 i6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mtafp0K9eq51R31AiLitXI6cA0NsWoPbGJ7FJ+D9jvs=;
 b=TuA6S491Vaw3ITRtpPvd82kYNwIQdn08zvjx9TLGqMZNaqtG/p+JiNeTkOvaeNbfCm
 Mysw+xdZALBAzT4N8x3G9tr0xh1pYns0Fpp0N49pdN4Dsj5gotUvsKdsp4Ows88NzznY
 x+FV29kNNfsPSiWPH1D95zCVfI8aGVwDZyjoXdnY73/yWUEs455fcmoV0RtqJ0HKxHf2
 chHk+o0R97hO+ajyw83NASksTEQFW0a1RQL+xtd7SEtxPJIj9zKNX0GKPVjj5k+uiDwD
 htll2N41n2WQvr4WR9JM5cURL8Zj4fG5ugTVnfVVaW8pJGZFhI0Sqv9S6P2yzDDuhQGU
 6BJQ==
X-Gm-Message-State: AOAM530rHzH3r078dCkpWkDr1P35AkLmRhDzvap97OEQamZKZVXt5oo7
 NIW16CnbOEuX1ibiZ1G7nEjJL1ogamk7nQ==
X-Google-Smtp-Source: ABdhPJz7pfeQEFZx8FomPFoiOrl8Zf6yaamc+djr3l2DHY1xL32Wjg2TIlM+X9A5wwJTosgCPuUCRw==
X-Received: by 2002:a7b:cd03:: with SMTP id f3mr39677534wmj.89.1636213529796; 
 Sat, 06 Nov 2021 08:45:29 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:25fa:8f3c:50f:ca5])
 by smtp.gmail.com with ESMTPSA id a9sm10808338wrt.66.2021.11.06.08.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 08:45:29 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 16:45:25 +0100
Message-Id: <20211106154525.910204-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/tpm2-tss: fix build on host with setfacl
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
Cc: Yair Ben-Avraham <yairba@protonmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the bump to 3.1.0 in commit 470e2e9bc521 (package/tpm2-tss: bump
version to 3.1.0), the install is borked because it is looking for
programs at configure time, so it finds those on the host if they exist,
or do not find any at all, which can very well differ from what will be
present on the target.

But this is not totally unreasonable: there is no way, at cross-configure
time, for a package to find the tools that will be present at runtime.

All that can be done in such a case is to force the path to such tools.

However, in this case, tpm2-tss only uses setfacl if systemd-tmpfiles is
not available. If the call to setfacl fails, the install does not fail
(split on two lines for readability):

    @-$(call make_fapi_dirs) && $(call set_fapi_permissions) \
    || echo "WARNING Failed to create the FAPI directories with the correct permissions"

set_fapi_permissions is a macro that eventually expands to:

    (chown -R tss:tss "$1") && \
    (chmod -R 2775 "$1") && \
    (setfacl -m default:group:tss:rwx "$1")

So the call to setfacl will not even be ever attempted, because the
chown will fail first. Furthermore, it would look for the 'tss' username
and groupname from the host, which could differ from those on the
target.

So we can just fake the fact that setfacl is available.

As for the permissions, they are to be set on a directory that is in
${runstatedir}, i.e. /run, which is a tmpfs, so there is no way we can
prepare them at build time. We'd need a startup script or systemd unit,
or proper systemd-tmpfiles support, either of which can be done in a
followup patch by an interested party...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yair Ben-Avraham <yairba@protonmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tss/tpm2-tss.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 8e701933c4..73764141a1 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -12,10 +12,16 @@ TPM2_TSS_CPE_ID_VENDOR = tpm2_software_stack_project
 TPM2_TSS_CPE_ID_PRODUCT = tpm2_software_stack
 TPM2_TSS_INSTALL_STAGING = YES
 TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
-TPM2_TSS_CONF_OPTS = --with-crypto=ossl --disable-doxygen-doc --disable-defaultflags
+
 # 0001-configure-Only-use-CXX-when-fuzzing.patch
 TPM2_TSS_AUTORECONF = YES
 
+TPM2_TSS_CONF_OPTS = \
+	ac_cv_prog_result_setfacl=yes \
+	--with-crypto=ossl \
+	--disable-doxygen-doc \
+	--disable-defaultflags
+
 # uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
 TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
