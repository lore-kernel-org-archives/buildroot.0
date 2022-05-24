Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF66C433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 16:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF68E60804;
	Tue, 24 May 2022 16:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rk22o42VKGi1; Tue, 24 May 2022 16:06:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F154360774;
	Tue, 24 May 2022 16:06:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EE701BF3E0
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 16:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19406415D3
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 16:06:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=iki.fi
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5V3QOBLxaRR for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 16:06:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D37F3410B5
 for <buildroot@buildroot.org>; Tue, 24 May 2022 16:06:22 +0000 (UTC)
Received: from localhost (91-154-92-55.elisa-laajakaista.fi [91.154.92.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: sakkinen)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id BE62F1B0023B;
 Tue, 24 May 2022 19:06:12 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1653408372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=U+czGg7T9l+5l1LrP8FMXYzjQ9rjt+giFDd88R1Nm5k=;
 b=KKCEqp+8LTcWpMjuNC4kyltxqsb3izaqiSggp2clCoOdFj3k1Lh1XOqlHsqB42gJfHZF/z
 tjtyCbT6aq72ZIaTc5D1H+5VxDDKoeR+2Mp06q6ArBvR0gH7P//oBQveWlsX7Z52rWo2RX
 jaSsOCtw7n/vtkMLwcRG52rsBFp3OMLNsKb2S6ZbPe7nj/rSubu5Qez/ibfdHnhd3EQDJD
 gxzL3FwMwXf96iROhP4jK54HDgbjAYrhoVThxfBECBrpoJPZOxLj6PQZGqQHqeUDqJIANk
 NpmtvsU+iik/jQyERUr4QtbAu1pJfcG5n9PXScHludAXyzfg+pfhSg++gWtXIQ==
From: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 19:04:27 +0300
Message-Id: <20220524160427.79651-1-jarkko.sakkinen@iki.fi>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1653408372; a=rsa-sha256; cv=none;
 b=Bhktw6jfbHJYnZKG0+zsTGrSfhCqTCRallrQCC6snpoL4PJ57a6EicR0OshIBzkFMZeTNe
 uTKtsfApfxNGn/gb9Db7Hd9wK+pa4qkuYRJY21MjCegAED5dHm/BCh1DTcaImQeDUq8DNe
 FS4ksU5Xd9CAeX7SySd65mA7XjSBG57gW5R6FIhNcGXohfyIguONOq4pUzAwy501jCY+qH
 0UPdeoONTNXqeZcUcFK3JrBp49plWeuJuoC53lNLHfds5oGqIVV5iMSZCVt2go0QcWh5ED
 VO19DiOQaeZr16TV3NguSLb4F53gfiTNbcSxCNW/rcyW8XtiDrBA/rOE7tvpBw==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1653408372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=U+czGg7T9l+5l1LrP8FMXYzjQ9rjt+giFDd88R1Nm5k=;
 b=qqRqMHRBUUoJaisPzFnlCWywZPBNGoq3eXpazL8gi2YtsJwTnRJ2Xn1MYYl/r5IiJRVA+e
 QsMsNsAlX1dhDPTlvyl42dG+pVUL0OI0wfmOohpt+mJ0Rx29pqs0RaxX39eJJ3i1p4PoT/
 XToMQXex0Im/f9ffoFTlh5gQBgbmZyYh5jqgHaBb1h5DqVG1Tq+xiSYQY9s75EfSoxuH/I
 LClRLLPE1skkE1GZ2/bIoA/EnirzIzytlqdK6IAO6DcaJEG9jmriM4TnvQLemgLPCRxrBH
 kn1kmBiVnTef5KWhF30MmbtxqEHOr6pISqlA5BtiXFDOSxV4Gn+6uwtk+1MLXQ==
Subject: [Buildroot] [PATCH] package/linux-tools: openssl dependency for
 x86_64 selftests
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On x86_64, libssl is a dependency for kselftests. selftests/sgx depends on
it.  Thus, select it in "Config.in", and add it as a build dependency in
"linux-tool-selftests.mk.in".

Link: https://lore.kernel.org/buildroot/20220517224809.21f77949@gmx.net/
Suggested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
---
 package/linux-tools/Config.in                  | 1 +
 package/linux-tools/linux-tool-selftests.mk.in | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 791f2c085c..69bfa9c435 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -98,6 +98,7 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS # runtime (taskset)
+	select BR2_PACKAGE_LIBOPENSSL if BR2_x86_64
 	help
 	  Build and install (to /usr/lib/kselftests) kernel selftests.
 
diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index b824c11bd6..06158e6147 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -17,6 +17,9 @@ endif
 endif
 
 SELFTESTS_DEPENDENCIES = libcap-ng popt
+ifeq ($(NORMALIZED_ARCH),x86_64)
+SELFTESTS_DEPENDENCIES += openssl
+endif
 
 SELFTESTS_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
