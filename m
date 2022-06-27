Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A438C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 05:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0283260E19;
	Mon, 27 Jun 2022 05:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0283260E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bA2r9-hmjBP9; Mon, 27 Jun 2022 05:36:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA2A360F48;
	Mon, 27 Jun 2022 05:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA2A360F48
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 021711BF33E
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D06DF60E90
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D06DF60E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BqiajNH4BzjW for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 05:34:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A6660E19
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2A6660E19
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 05:34:34 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id o4so5288953ilm.9
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 22:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PGTzkUqyFRqD1k+YDHWGDYCQOKMs4gsvKsAhv4BrKog=;
 b=CTKxt7/Ea9WjC5vxoUq1SECjyX/zD86amAoS/E1rD23MbkDOroyvRMokdBggWcUFRN
 MtVg2r+4FUluZAyZ7mlKKJG6E5l1dy2L4lxgvneZj55ZjSDq8lLVdQ94r3L+CqPC7DDZ
 2NUuH4IGRAZAivbROfEW6jKf5ddlNIQJvu4swAWwoWkJ74px0TM8oMr7Ysp+sgZWu3+G
 EQlKEiHR21OY7ArsyeCA/3bZtjlFLoU8ho0nJXxJ+RhrN4HnjyUXH95IIcdqC0j3WezN
 i48Qn5HOYHmGPFQTpyr/FHd9SxeFCjr9eTYyxadLNkGzWEmfjWqX9mGTznilX1cnCshS
 rKEw==
X-Gm-Message-State: AJIora/sYN/OxmH1KH+mZvt22aINeWILiWQxBOmgbojrtUxeEfmoCL9k
 DSwh+s8fCRIdQRvyJJsHEMnPW1T2HeU=
X-Google-Smtp-Source: AGRyM1tshPOb/KJE6oFlF0guMi7xKPnKTVXV8N9N6m6bOfeXwe7osJXlAyPvwjwgJSl6RXCBkN0woA==
X-Received: by 2002:a05:6e02:20c5:b0:2d9:3368:3db1 with SMTP id
 5-20020a056e0220c500b002d933683db1mr6156700ilq.112.1656308073887; 
 Sun, 26 Jun 2022 22:34:33 -0700 (PDT)
Received: from james-x399.localdomain (97-118-147-20.hlrn.qwest.net.
 [97.118.147.20]) by smtp.gmail.com with ESMTPSA id
 n9-20020a056e021ba900b002d95fd5ad64sm4082623ili.59.2022.06.26.22.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 22:34:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 23:34:20 -0600
Message-Id: <20220627053422.618280-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220627053422.618280-1-james.hilliard1@gmail.com>
References: <20220627053422.618280-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PGTzkUqyFRqD1k+YDHWGDYCQOKMs4gsvKsAhv4BrKog=;
 b=e+FHUQQYwhXOAaOtOGkAF2kn+9dpTE7gbQie+asDo78nABUMgGOstAt98ZXSPebLdm
 TwHugqUQ7ZKR3uvSZA4pnhwjpcYBGiWZ+RM54/+2Ebpog6xrb9VmInvryuPUtC9SAgHP
 e751J7H63dGbcT0ZNJT0tX2ZaGvyS5OqQ/PsD/FfdoUD7d4pWpZQIdNhh9uCnUhaTleh
 qXOMpS1CHsyD6UG5uI/VcmchgIgs1xRsiqCf8mM2IUCmoJgt9SvmASdWNP+ppdFb8d+z
 eUiWmV2ITRzDWqeiuMNn3b0zUDpiJr47IeRJoBEu40C0+ev/MrubSvuyBTpM5uZUzSml
 /5ag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=e+FHUQQY
Subject: [Buildroot] [PATCH 10/12] package/gstreamer1-editing-services: bump
 version to 1.20.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../gstreamer1-editing-services.hash                          | 4 ++--
 .../gstreamer1-editing-services.mk                            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index 5d77a9bb72..18dd1a79b3 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.20.1.tar.xz.sha256sum
-sha256  6ace1b21b58e0110b7dadd469f79b77e2f47d6207604231492531ae9fd4148df  gst-editing-services-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.20.3.tar.xz.sha256sum
+sha256  5fd896de69fbe24421eb6b0ff8d2f8b4c3cba3f3025ceacd302172f39a8abaa2  gst-editing-services-1.20.3.tar.xz
 
 # Hashes for license files:
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index dbdf2abca0..417aaf2a45 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.20.1
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.20.3
 GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
