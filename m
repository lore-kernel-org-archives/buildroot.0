Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8730E7718B
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 13:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47CE54250B;
	Fri, 20 Dec 2024 13:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Q_voFEt6835; Fri, 20 Dec 2024 13:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEDC8424ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEDC8424ED;
	Fri, 20 Dec 2024 13:31:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D0176C
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F10E1605F5
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKtKzv4EM36w for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 13:31:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B0CB6605EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0CB6605EC
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0CB6605EC
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 13:31:14 +0000 (UTC)
X-CSE-ConnectionGUID: kjYMEXFCTuCPoHYUXXW0/Q==
X-CSE-MsgGUID: yJU4Hp/dTOGpHyOi5doX+A==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 14:31:12 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 14:31:12 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 20 Dec 2024 14:31:10 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Dec 2024 14:31:10 +0100
X-CSE-ConnectionGUID: sEKFtdADREa2YVRwZLjwOw==
X-CSE-MsgGUID: 8SzjUWzQQaCPwSKBPW83JA==
X-IronPort-AV: E=Sophos;i="6.12,250,1728943200"; d="scan'208";a="235131010"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Fri, 20 Dec 2024 14:31:03 +0100
Message-ID: <64f9d09898aee7370ee86df702b207182e6d0cb5.1734701459.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734701459.git.yann.morin@orange.com>
References: <cover.1734701459.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1734701475; x=1766237475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LyQ979e/HIdTZzDmCXz4nrobj8NIGaVGyX0qFx8dRDw=;
 b=jhWhDyVze9nSM0csTgqm3V5MjVdr/n3MiEDMDL2mvnV79flzp1gTrEFR
 zoJAKCTRcDw/68/J+TUHAcTouBsqmvsT7Aqu/1WTYUyDwfnozkhOGyxsk
 Q8ExdGrfzHhXIgAEGcIlsXEyyzDlcc7KMOsnqaYAegcM5HkJiW0FO2P/r
 HzEoxrgpgUAaWitgDhM14AyeMUg3ddjxr2QQUrwNWPdVqx79KoV5S6vD8
 x9LIkWs+Bqw8YgkTsHeqBhd8xhSQZiLpmTft4ZujcqjIbzU1gPMFK3wm3
 seTLwrOpwrV3URnufiH6v6l9yfrDQhDF9Yt9Dcl+14QGwqrJkdcXhpQwA
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=jhWhDyVz
Subject: [Buildroot] [PATCH 5/5] utils/get-developers: add option to report
 Cc: lines
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

It is very common to use the output of get-developers to add cc: lines
in the commit log (see below!).

Add an option so that get-developers reports Cc: lines ready to be
pasted in a commit log.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 utils/get-developers | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/utils/get-developers b/utils/get-developers
index 3253ce5d6b..f66477751a 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -17,6 +17,8 @@ def __main__():
                         help='find developers in charge of these files')
     parser.add_argument('-c', dest='check', action='store_const',
                         const=True, help='list files not handled by any developer')
+    parser.add_argument('--cc', action="store_true",
+                        help='report developpers as CC: lines ready to be pasted in a commit log')
     parser.add_argument('-e', dest='email', action='store_const',
                         const=True, help='only list affected developer email addresses')
     parser.add_argument('-v', dest='validate', action='store_const',
@@ -99,9 +101,9 @@ def __main__():
                     matching_devs.add(dev.name)
 
         matching_devs = sorted(matching_devs)
-        if args.email:
+        if args.email or args.cc:
             for dev in matching_devs:
-                print(dev)
+                print(f"{'Cc: ' if args.cc else ''}{dev}")
         else:
             result = "--to buildroot@buildroot.org"
             for dev in matching_devs:
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
