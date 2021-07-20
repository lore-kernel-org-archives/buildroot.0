Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD60EC636C8
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 02:37:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 930706121F
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 02:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 930706121F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=att.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59A0840383;
	Wed, 21 Jul 2021 02:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UAlmD-gbMDOn; Wed, 21 Jul 2021 02:37:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B81B40496;
	Wed, 21 Jul 2021 02:37:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97AD31BF82B
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 22:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9499782F9B
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 22:41:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=att.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ZSSn_vVMtDP for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 22:41:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from sonic309-24.consmr.mail.ne1.yahoo.com
 (sonic309-24.consmr.mail.ne1.yahoo.com [66.163.184.150])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CD9982F99
 for <buildroot@busybox.net>; Tue, 20 Jul 2021 22:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1626820861; bh=D0fD/D/oa8UhTfwyxMkLAcRyZYETvTnkNmP3ABdkbWc=;
 h=From:Subject:To:Date:References:From:Subject:Reply-To;
 b=vQMXYZqdl8yevBQ4rNs+98BFmSpmErMDZmd5GOkFhcWcuSsSa31a3dU40kAPogeefDYhbcImCBVK59QzWlI3MY6DNTuzXw1OLMv/e4KMOcNBvbAzQVXpRhKvsTIbAxH+ZgURB+37R4vbii24rtCkX6yicRkPM1BDoFtjidMDqUY=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1626820861; bh=/4P5D9d/QH7Hcxv72OtXOmqOff1LQry8u8tHDDR1U/K=;
 h=X-Sonic-MF:From:Subject:To:Date:From:Subject;
 b=P/EisZEWbnleXG6qOXgqjvqjV9UqnFYAzMj2zYUTu/LIbEfZlxoyxs22zEj1gQnqfjOWV5sV573bfS3LIt6r/tpu/va6uRExApLVYU/GbdapftVd5o4rJqVt7A6WnDogtbVV52jFJtPMigrRc0WQ0qxu36D4DPAnLGZjZzYxwA4zyDRboS1MHD/pdMxGLjwEXy4ND4zzkBG5tD73mNCDwr3m85CDH0tuRxniFchcsoociH13bXPjHSKwrAg/QlLCoKTM8PaD4CS+bkryqDpzQhCoxy/Wi5vL8oOQH0DKVF1DXPavJ3mdwuU4IjJfGI1xUhqlKWMfCEtZy3vNvlwqgA==
X-YMail-OSG: ROdwbJkVM1kHqup3TiMQagalEsJZ5akB6XO5EBptF6QE.1XA0O4NCqWUzXB6ov_
 jdvPH9eO2XiLGjKbwCvAEQA7xVIs4vvfSy8psSvV3uQcIc30VAsea7HpsWazeWGRVC35PBaQilCM
 pAMHYNvYkYPZ7Klhr2B4xZlDjxV2N84bnCBDbG57MwWJkHjMPJjctaBe5nW5lhRt39d7c1Yfh08J
 01gGNARfhF_cZmGEtd1obUbJLlb3XdD696ODuY6CVegUvxnsVKq_P3iLqoQNzZNtRy4BG1msTvrF
 SKBmrF6oLHYKysQFo.KAAQhn0fMxSPGWo0ySs46UAo0G39NZPKLBZTgUzkMml8KWQZZMK9EVfXge
 BHqZohrqF7Vu_u3qC1Yo4JoRvHyqp4GXw_2ugZ_cW41Mr9yBIlCv09Sw1uoOsZqEAQF0sHHQhxqe
 7C8MnkUj2KpT7w2Wp7acmv3yaaECooZkghiV58p_2D0xz2lM6T0RzJ4P1Hjvz8m0egEB9L0.MoiO
 oN1L9VfP7pZh2GJTPFBbBgrZFX_MhzHXhey9TD.gYnTbHDyrExoB_bVDEBS3FLom9TSpwNSaWIN1
 gOClRYYssIEK_UAIPx_Z.YuaviyAesd6kVg8bu6MPaQaXgCVO6Sl5aqxrgM40421SzfTmmqjU8oh
 QyBZTdtGdfzNiuxZ9W.IIyHNjM1TaiiRDkrCId6azsi0P4yYJpVGHodNwsBWH_PgZSdpYjZbk0n9
 EElfgxcSlh31cTgCbQ0iOwX7H6y8p96bzY8cyzeTQ6scyuroR_I3XExS90qJqn7pb7PmrXRWKGl4
 FHdnZzCqBRynkBf.vCeQgFmw6RwtSvSVTYWfarnXpy99lXoY3jSlNO5oQxSf8pVTV3bVplHmXfZ4
 oTTIwJR4IJGIgUwqNKS88Hf3OKbVYFta84Xx2JU5jXH4fT2XCww02EhsK2OOEAwE.rFpUng1_H.j
 7z55LrpkGJj7IgYtwDzlXBdFsIF9udrHTekfKLLJDwjXPVfj6nk0ewAs57NjEIsHWTTCBLFsYvSj
 MmSNlJcNIKL1_VMDlFCy0HytL9uAM4klM0bdN44McUF1ay7dWJX8rRAI_B2mnwtMzHTXVQy078x_
 uTgz0.IBIktR7l6owiNB4Zc96dftF4Gv6E7s7NNfNxpBkYdmKBvs_rHwCV.KdPYcxu.GSBgUxGmC
 Z3yQ640_rBfBrjbUtijbzoSizV7GH6mSmoJ8QzmjcwH1qBLCUiR8BM8U0iWFKqZwsFTp0DCemdI9
 H7YXJrL4cg21JwvPmwUPyOKC2t.Mg3P3EH8vJa75OMHzsL3EmHa8xp9aX3kaElL5XM7qNRLispjD
 PiKaOc9SRC3oWISDivr_wg_Te_Tlv2O5hz2sRWnHgZ6nDnoiIekZtM9mrSgJBgs4PV1qUoJbQZ7m
 woWoeVm_12wIkSsuWilZ7tvMZmimhU8U6A9j3Duda8pY.xfMulok4CHCSWCa07MFPcfJQc7nkceF
 wQ7coD9PP7Y2UUCXpnGqcERC0_mS_j_cKexh8cKio2dE9MZcpXZpszcjrHntJd7XkFDDV.M5nEez
 mNnRZ0CjWZyndjqZGSkzUMID5AW0FIKhsfaq7a8lSEvf1t8.BftMfK7ouwgpu1W33Voq.2527sa7
 46rSDKezWkActT_jqcm1wchGPDVUk2N83K7T9ykZC_DrfgakMCdeAs.FtWoklcMGyeb8nq8qdJJc
 hkEAZNZmEwYQtSlfcYEYEdvV7ZymDHBmHgmPztcKO48FUEo0fmXDHL1D21fBF60P3G7.pn8JO9l0
 2dMVFdKuUDax6BZkX8nloc4HH9LmNhPdncn_RuUtQvV8rqEWhwzpKual6KZcVtCk9Cnh0QbnOlKp
 wIDl2UZcVHy4VRheQzoNdiU2FN_P56Kbra_1f4C4rSbMhqoFaNUKa1r4o1XuWEmc2Y6_df.IHlRT
 9txHDWrb1RX3fkq3vipGVDJREPIOfEJm_eaoQDa3FDPzdnsiBveBumfoao2vre.PmbvX9s5fTjyd
 kPgJGuFUm4fPmQMxAOXrJUoYDfThplDGVnxn5axwA8zH3s57yqk9a0wo_Jt8khatnusd0mbaKP73
 4m.ISLW3KzQl5b.dJnUxVmtD_lET_a02HjOccXsBQXbteo5a1V1uJgUXWOzujRgmJ13PMd_PNJLh
 pxTPw7xeSqzP2shMXegoAmPTQOOLlqjX4TUFJpNIYehkD24k_oo66tojThwJTo_eJ1aUIR6ZzawV
 YlTH9DWk55IfP66zJxEDjm2vCyC6g7XV_CjQq.q02ZXN0AJZbcBhXA1Dr5Ec5FTC_5ZGaGTC1eGb
 SMpUe0Iz1OD1HofwX1bkzCkt0RV6KWsdsBo0CS58pCOclv_f78ajmTJVvi_eVkr4hYhpJ0EHN7xG
 0OyxBE8Xy94o1tRD6Ox9PfJJn1trYmuHDk4eq1ODbYxuY3gWQ47VhKlfTrI8UYU4-
X-Sonic-MF: <stilor@att.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Tue, 20 Jul 2021 22:41:01 +0000
Received: by kubenode507.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID ad51ae967264123cae8ed1dfeaee5266; 
 Tue, 20 Jul 2021 22:40:57 +0000 (UTC)
From: Alexey Neyman <stilor@att.net>
To: buildroot@busybox.net
Message-ID: <94578b85-8388-1cf0-5c57-d970a092a712@att.net>
Date: Tue, 20 Jul 2021 15:40:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------B3BF59D32250524E1F080550"
Content-Language: en-US
References: <94578b85-8388-1cf0-5c57-d970a092a712.ref@att.net>
X-Mailer: WebService/1.1.18469
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
Subject: [Buildroot] [PATCH] package/nmap: fix ncat on Unix socket
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This is a multi-part message in MIME format.
--------------B3BF59D32250524E1F080550
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

[For some reason, this email did not appear in buildroot list archive; 
resending]

Starting with nmap 7.91, ncat segfaults on an attempt to use it for a
Unix-domain socket (`ncat -U path`). The fix has been committed to nmap
in r38121.

Signed-off-by: Alexey Neyman <stilor@att.net>
---
  package/nmap/0002-ncat-unix-socket.patch | 28 ++++++++++++++++++++++++
  1 file changed, 28 insertions(+)
  create mode 100644 package/nmap/0002-ncat-unix-socket.patch




--------------B3BF59D32250524E1F080550
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-package-nmap-fix-ncat-on-Unix-socket.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-package-nmap-fix-ncat-on-Unix-socket.patch"

>From 6588bd602af6c6b314e375a83ceea39ff8d807a3 Mon Sep 17 00:00:00 2001
From: Alexey Neyman <stilor@att.net>
Date: Mon, 19 Jul 2021 14:45:59 -0700
Subject: [PATCH] package/nmap: fix ncat on Unix socket

Starting with nmap 7.91, ncat segfaults on an attempt to use it for a
Unix-domain socket (`ncat -U path`). The fix has been committed to nmap
in r38121.

Signed-off-by: Alexey Neyman <stilor@att.net>
---
 package/nmap/0002-ncat-unix-socket.patch | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/nmap/0002-ncat-unix-socket.patch

diff --git a/package/nmap/0002-ncat-unix-socket.patch b/package/nmap/0002-ncat-unix-socket.patch
new file mode 100644
index 0000000000..adba49af01
--- /dev/null
+++ b/package/nmap/0002-ncat-unix-socket.patch
@@ -0,0 +1,28 @@
+ChangeLog:
+
+o [Ncat][GH#2154] Ncat no longer crashes when used with Unix domain sockets.
+
+Backported from: r38121
+
+Index: ncat/ncat_main.c
+===================================================================
+--- a/ncat/ncat_main.c	(revision 38120)
++++ b/ncat/ncat_main.c	(revision 38121)
+@@ -846,7 +846,7 @@
+             targetaddrs->addr.un.sun_family = AF_UNIX;
+             strncpy(targetaddrs->addr.un.sun_path, argv[optind], sizeof(targetaddrs->addr.un.sun_path));
+             targetaddrs->addrlen = SUN_LEN(&targetaddrs->addr.un);
+-            o.target = argv[optind];
++            o.sslservername = o.target = argv[optind];
+             optind++;
+         } else
+ #endif
+@@ -865,7 +865,7 @@
+                 targetaddrs->addr.vm.svm_cid = long_cid;
+ 
+                 targetaddrs->addrlen = sizeof(targetaddrs->addr.vm);
+-                o.target = argv[optind];
++                o.sslservername = o.target = argv[optind];
+                 optind++;
+             }
+         } else
-- 
2.27.0



--------------B3BF59D32250524E1F080550
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--------------B3BF59D32250524E1F080550--
