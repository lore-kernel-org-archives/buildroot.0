Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6073DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:27:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC926610E5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC926610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C5C260B0F;
	Tue, 19 Oct 2021 17:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sbkF_IL8DwrM; Tue, 19 Oct 2021 17:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D239760A49;
	Tue, 19 Oct 2021 17:27:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0A741BF4D8
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B09C1838AF
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aPpf33GnaHRB for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 17:27:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9D72835A3
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 17:26:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 z77-20020a1c7e50000000b0030db7b70b6bso4228965wmc.1
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 10:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VmY44Vus9nqjAsG/eTj+FSRKiXlO2PwS3seBr/HNFWw=;
 b=bU9KFf/5A/yTIaM7GchUKr0L+70Kymsu5ah1fhAFOMUfhHdfwAvaQiPUFOMv4b/Dq2
 1vGMi7inS99dR+OhbaYqrQ11W0zY+rSZqu6sZyqZa7qyKXkE7gTiNmg7xs0ZIn4bELrL
 ocTgVZYgrCAmUYnwhOuKuS6tOijqaENnBHdKLxxxfgf9kUxLJsyC6g5mT5mdp5prfnQM
 oWm1kIAb7x9QtYdGHJpPo4KnhhOn4bX/OVsZoBMhutKZDO/9hQ0hUwpaFk1xyqYNK/dj
 3Dv0G0j8sNRExJ7O2/s3jXQmmj93N5nA1+dCZQkqLJYJyhlS0MQpWh/oey0H9HqDUWAU
 vFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VmY44Vus9nqjAsG/eTj+FSRKiXlO2PwS3seBr/HNFWw=;
 b=cG34eEeOxvtNVUpgGYi4d9RlK1ngZ4h+lrCmJv/u855M3frt97Xiri4CWtvJh5iW2o
 Jd7uCnAguBC0/BXCLN9vWg3Aq5Q/81nW1ry/y0u/mqvO/iVW6Y3iafGtGIXv2vR+kZ39
 hJc/FLlKHxjeTZ9E171RjdfBKEwSBzLU7Rw3TLvmIgK+KypdBfQ+TYA9lBQKAmn4mFjX
 05+TmkjEwywhi6U0QHMlRFbk422P0d2SHgL3FHtIR2NHwitGreB9AYzpRXoTP9/ozGrB
 XkRRDaMNszMIPYRWojcd4qmpn0e6Y9+m4oH4mG0hRfWJpPwK8rBD3n8G34Cp9aQAEOc3
 POBg==
X-Gm-Message-State: AOAM5312tj3JH7MJ/w2rpApxlMV11mbDHYFcXT/GJnZDKbawi4dlW0el
 YWzP+3Wo2EtaiKUjXCg0j8TABmwnWY0=
X-Google-Smtp-Source: ABdhPJzYcLDODfXKz0frS8i+9ckcKpqsL98lq7vol49LZ53Cj/4SR8zH/CzvXkRIn2NUUaBNEQIdKw==
X-Received: by 2002:a1c:2282:: with SMTP id i124mr7247761wmi.164.1634664417846; 
 Tue, 19 Oct 2021 10:26:57 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id f184sm2749076wmf.22.2021.10.19.10.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 10:26:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Oct 2021 19:25:30 +0200
Message-Id: <20211019172532.3431240-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/e2fsprogs: don't install compile_et
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Don't install compile_et as it raises the following build failure with
samba4 since, at least, bump to version 4.14.7 in commit
630e85f8f5ed64933b45599fc4332d9609177c5c:

source4/heimdal/lib/asn1/asn1_err.c:47:23: error: 'link' redeclared as different kind of symbol
   47 | static struct et_list link = { 0, 0 };
      |                       ^~~~
In file included from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/include/bits/sigstksz.h:24,
                 from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/include/signal.h:328,
                 from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/include/sys/param.h:28,
                 from ../../lib/replace/../replace/replace.h:659,
                 from ../../source4/heimdal_build/config.h:10,
                 from source4/heimdal/lib/asn1/asn1_err.c:1:
/home/giuliobenetti/autobuild/run/instance-1/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/include/unistd.h:819:12: note: previous declaration of 'link' was here
  819 | extern int link (const char *__from, const char *__to)
      |            ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/d6de6ed59c553f6f413d280f3c65184945bb3850

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/e2fsprogs/e2fsprogs.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index ca891066a2..76215e8c34 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -90,5 +90,11 @@ define HOST_E2FSPROGS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) install install-libs
 endef
 
+# Remove compile_et which raises a build failure with samba4
+define HOST_E2FSPROGS_REMOVE_COMPILE_ET
+	$(RM) $(HOST_DIR)/bin/compile_et
+endef
+HOST_E2FSPROGS_POST_INSTALL_HOOKS += HOST_E2FSPROGS_REMOVE_COMPILE_ET
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
