Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56B7C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 02:15:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6249E60FBF
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 02:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6249E60FBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=att.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1806F833CB;
	Wed, 28 Jul 2021 02:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEOQXguhYWM6; Wed, 28 Jul 2021 02:15:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 678DE83216;
	Wed, 28 Jul 2021 02:15:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0199A1BF3D6
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 02:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F13FB83216
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 02:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cT96z-ZrmO5J for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 02:15:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from sonic309-25.consmr.mail.ne1.yahoo.com
 (sonic309-25.consmr.mail.ne1.yahoo.com [66.163.184.151])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F36E831DA
 for <buildroot@busybox.net>; Wed, 28 Jul 2021 02:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1627438543; bh=dMNk7iecAnaNi3DdPY2mLe8QNjPhsWtHxFi/WLDaYiY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=Fkb4f5XLbuPa7NXJESJX3/m65NJLFpvNYMfQz95weEYyJTGxR6Z2AfVAweNj/Hh2XlSxFkvDEzbzl0r4eQMu3xcMfztonx234q860TlLZkPg+ld/QUOY8SeCgcYPwsGdg/wXVZgqtce78RjrsHlEjNgMR5c0NxlDe2zLE0+yHFQ=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1627438543; bh=esvanhlyeaTDaOdYgCygpA4ch93aGBsiXZ4M9x+zRzV=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=ao+5h2DT06JxJMG8KtFpZ2sGboLqmDButzRWWWtpMUR4lcaBih4oSKICujpyEHJGLEF85hGCca9wRxzMNnaGixEw7KpqgEQ+4EqnK9GFCVgaw93Zt2UpeTCKolBMPJ5VvKL3nVOB0wODwYB5udt6LNmfZNNLub6Dra8QXnNaZfjow3ecOSgUvSgAS6wsTaTkIrJRooHGd9QHycBSaUTyWZ5JcwX3dbcsXGjEzp8DsYu6fi2qUwkH1+a5LrT2vVZ0Ui56crmdo4KMKo4mA/KfGMQF/SPyPmTElPKJhxvP9B0ieA7WNyWCAEMvIXzbmZw71imFYb6UXI5t/QaQ1HCmPw==
X-YMail-OSG: 98bTPlgVM1lXuxpzmqfMHSXq_2hFViOdApoQN9in.b.F8Tb._HeFAobyg26TtOB
 L7XbApFYp5GuTZT9mJhIPsZ_p6JuTvyOoMgPem9TzauqnVFKW1F0cQlCtauPr3zAz4d9RfctpTnF
 5z2xvW_HopF6LVnBwNObWJUDBPnlSjZhsTlU.bvVUWQ5YncNkyDq1Lwwj5Qh8uQLD_K_Fnxxx4bD
 LoRlbdhAmKCjG8s5eyVoSAVxycvjTTceHE3rfNR0dNKDfKs8EpjjwMI5lbHs1fw0xsqZsaVgSfSB
 GukGC_5KiWdHHLVXenE8DwRa8eY9tt8MU8VPhpVq_s9XRDRQUukbiHa2ap9p7.kxq7DEPCN1fZ69
 IKoG729_aHL2j3bIYtAM0pF8XGFwmPOui46dm3stWG.B9cOMW8RBFWQU9P8iGnMqxmEqyIWH2qxs
 oc2ivJQf5jiw.Yzn0DXit_Zu15F.Sp6CKpE6B6iyWxdEANI.Kw4C4cCC92FEDU8FkzQFjryOJf0p
 dqguF6lXhAxB1Za171ELH9eXm5HJEv_c9j7vlC8kJCzmR9l7XmG6vvGtB7WS6Nh1IOP2ZvZB.MPw
 y.Br_idmhV.Z_TER3F6eSZY7F7MuMh29CyS5PHsoIFJSnCmCf17ES5ams4lTiHPQmuj6f3l1OvaP
 Mvr.dKJnKw0BrfmyfGl1xWoXLbN9MvuEYGI3SijaSwZImxi5xr7ghw2vJDs0qdYkOBrNCHOrwIdQ
 JhlA_kceHLeDxhiWJEsfXHS_6jJhszLwCBawLYZeSTk5TBBeyYGJ7tkbCTA1T2oCKlpaGk9bpu0K
 IyCq8MQU_AgBGRq6a832ZCRIvzWetiUqsKcBskLGr.ywqUMTXBVjy_pXOF3SmbatOHa08PWePIIY
 QbvGIk0avrfUBiasAAWhypdxrmGGpH79aKoPuEGjB_gOT.jmbILARxnne8THeznBgYFCqFCUg6U1
 Sc9jvw9Hh9k5si6P75vMFgYNVBZUYaKlaHzz3BrX0uwwbaLjnqwGOe09s38eMAUzeG1kTL2vxSvy
 JqDClp6ZQ7Pkajo.2uFEkKkC0Hx3I_HFKDmk_YESF55te2qUIAV9smTpGpO_bRRCVprdTWUGNNLc
 hIT6cyKqKOrmMQjXw3IUNZl14cXg01sOa1ELyDfmBWfdweaJyLrgwciakXrEEBjim5lN.8BZtaJo
 .9rYwQgX1qb9jjIr4gSNmnz6olJfYTnsZQeU2avawsPFXBxTJog3TCxJ5H8V734S7KOX_UKWVpOB
 HLmuqE3luuR4QAFbR8OBlVvEL7rBhjWLDiQ6ezxfBAUTi.zIHFm7T.z3sliSH26R2k1eY4xXlFhm
 BRVbocb5dGEsUiut6olp32Ykn9LV8VTiu6UvBZqG4sKKWSMOIx0JchZdZl1yMcB2KuNDJXcTmnDd
 Iq7wH9aIQNPAKnSiG5XdaiJT4rS9fAsnBVDsntYpmrexVxdeD7qUy9iCsb1uuQdlYsUGa_rpsSmk
 8yriSEx1WR_CYymVsPI2hz_B6Cd6inrOLDVWn9nz6gUFk7rDk7V.50yiAppP2UxUEqB_jYVYo4BY
 hqHSeOMtSCHgXetBoLlmos.1yfl3E0zHOz1B7V7jOlWEa7hRyFM_Jj1Kri21JDaB4ZZ3lSJDe.G1
 YYQbdhNYPLh2Zrjn8.ECjAIotaD5orWHuL5yCxdd_f7e82Inz_37pcod54NRAYOoIZD.4rTP7kYH
 j2Uox9sPABzB3kJttZq9JRDXwe_2XobTXmnnK5pvb656zj60B6sPi0wPT4uVHLBCgxY2f1X5kL8n
 oX18daTc.ijzzapKMailvx.W05Y1SyQIBG6DI0OzENt4esZUhfRxYBD.Ej34NNAnR2jxPRIsVHF2
 VEO5WgI3iuiSQGyIuHfGaP3sXOy9cKJuKdgmwbGQ7KBJ7TCxMTsG0xbteopwv0YDowTNa8zSKckk
 avi5dsWv5ayrtgNDqMfsbTC7SJCX_rGJUR39XiKTs9ws.dg3ytPlnxO3D1d2uoqhcFfbq2AytXYG
 N2F23Neg7DEbEdItAFoqoOz0huJA2XbngE5thg5Wn8II0JPpB3AIGnkURSHbvj9JZ0bVaFZYlMCN
 bG2nWHbontgPAAkOZkMiKJjdEmgzzXC.qWNATjHTotsf5lfFrlBqz4xC_3rnX.l5O0ab9pyP.aQJ
 lXRWGm42sS_HTZzJciOtCOr0rd3.K1RfS91eq1qkgyHdlt7v0xvvPM0xyUeE3MwZQDkBr962TWcx
 sMTA2JLF_UMn_TVMQBb1YLZBV9b8VD9nyi3aNszHrZYFaEhFwJdoA5Bv4kU1OgdFOL3PyZ6O1xpQ
 aWUtPxNdWhqjeFsKbo9IMHunDBnHm5PMTuNG0atNN6uqfovU7oDfIE4kDaG5BXNRyJGZd0uQQ1y_
 N6ocn.aXi_0.YvGCT.uY6QapZ0QDz8YbxoYZyyx_082Ct2G9F4ueumpQPUsYqhCA.TYDXg5obvOM
 rq_5UPA7_k8zS47bec8FUmGzwOIhqKOHKoBRXhfOK.coH7Jy6Qp3g
X-Sonic-MF: <stilor@att.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Wed, 28 Jul 2021 02:15:43 +0000
Received: by kubenode545.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID ff54ff8f863e60e42fc38b9fbdc4085f; 
 Wed, 28 Jul 2021 02:15:39 +0000 (UTC)
From: Alexey Neyman <stilor@att.net>
To: buildroot@busybox.net
Date: Tue, 27 Jul 2021 19:15:34 -0700
Message-Id: <20210728021534.273986-1-stilor@att.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <94578b85-8388-1cf0-5c57-d970a092a712@att.net>
References: <94578b85-8388-1cf0-5c57-d970a092a712@att.net>
MIME-Version: 1.0
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
Cc: Alexey Neyman <stilor@att.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

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

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
