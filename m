Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C72C433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 10:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 448B184D44;
	Fri, 14 Jan 2022 10:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rlq8KuUw8ss7; Fri, 14 Jan 2022 10:13:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13AC184D4B;
	Fri, 14 Jan 2022 10:13:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D90CE1BF37A
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 10:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4E7560AAC
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 10:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUOj2d2LF7cW for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 10:12:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 127E460A89
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 10:12:56 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t20so7272834wrb.4
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 02:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XJA4tiLDwNTpI+1BSKDzCtAd5iAymAU2saghk8p+QSE=;
 b=RI2tNzzlswtCP2Gk7zflz/Gq9Ht2agCuYQYV0r33KK2vznfkYdCf1HBExKNwiEB4x1
 VJ1elpi4mX102iQ+PHEnTq+c3LhPvHxk6bPQzwHbSANl8V7qLq9R1EN+xuqUv1xzLJ5v
 bRYqTZoPUiwveII6OwpSwz3t+xmq+8n5t3fQRBRcwyZ/6QKXsYYBIDieVH/FhcLbtaNa
 7eNYBV9zR2QxlpbXILM5PlicrZlv60SPzGRl7oE+ckoCR/A8f9kg4LAAdh9F47SvIYSw
 mnetkmLLNlxgCYNtdNkx8+5TJQ+Sg0NT5cJSdM8KxULPJV0Ki1grzfz+yLMYz409i7OT
 dxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XJA4tiLDwNTpI+1BSKDzCtAd5iAymAU2saghk8p+QSE=;
 b=bMzauDFeRo4lmXgb3SNNDUA/ywUSpSpjYTAq1MJoAhylGlx3LEpiDDKiJx5at2aaf1
 OZjYu6UHAYwyTq6Za5c06AH7neYORlvOlw5oOCzxP3kIoHwOwYyqKPAenY0I99xryGDH
 4Cc3mypHWkpCTHvD4u02Lwu83cgF47k2IOsjgArkIoMtyrH32Zrq0dCNWNfs1qInpbtq
 Vez/bSXW5VxYIrJbv+aHxg4xVTzMjXAAziZL8kWySQrQNtt8f4DFhcZI9nhC7JHRSE2Q
 UKHXRGB6Da7gvrQ36FJmhlHvq4JbJ9Gmvdq4UA9ysfmTzIU5ZoCVDOMfNghZZ7uuGiVQ
 yqBQ==
X-Gm-Message-State: AOAM532ajzF5Z8XD70I+2or7k39nrvrBaELG1FJI7BsEOwgCnQdYTiAq
 CjzNY403H+V1vCiC6mzA3mOllIQf5nRrMw==
X-Google-Smtp-Source: ABdhPJxFbGFSO531CIS7Cmv9WEXQ7QwaCSG+a2cjWOFnKenKQ+jGP3Gwx7MKcBRxPo0JNpXxfDuZuA==
X-Received: by 2002:a05:6000:3c5:: with SMTP id
 b5mr4918578wrg.312.1642155175253; 
 Fri, 14 Jan 2022 02:12:55 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id i15sm133853wry.99.2022.01.14.02.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 02:12:54 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 11:12:46 +0100
Message-Id: <20220114101247.342256-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114101247.342256-1-nolange79@gmail.com>
References: <20220114101247.342256-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] mkusers: change default from normal to
 system user
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

for all packages, this is the fitting default,
but the fallout will be user provided tables.

Also update the docs with the chagned behaviour.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 docs/manual/makeusers-syntax.txt | 11 +++++++----
 support/scripts/mkusers          |  6 +++---
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
index 467e596230..3d1013f447 100644
--- a/docs/manual/makeusers-syntax.txt
+++ b/docs/manual/makeusers-syntax.txt
@@ -20,13 +20,16 @@ Where:
   It can not be +root+, and must be unique. If set to +-+, then just a
   group will be created.
 - +uid+ is the desired UID for the user. It must be unique, and not
-  +0+. If set to +-1+, then a unique UID will be computed by Buildroot
-  in the range [1000...1999]
+  +0+. If set to +-1+ or +-2+, then a unique UID will be computed by
+  Buildroot, with +-1+ denoting a system UID from [100...999] and +-2+
+  denoting a user UID from [1000...1999]. 
 - +group+ is the desired name for the user's main group. It can not
   be +root+. If the group does not exist, it will be created.
 - +gid+ is the desired GID for the user's main group. It must be unique,
-  and not +0+. If set to +-1+, and the group does not already exist, then
-  a unique GID will be computed by Buildroot in the range [1000..1999]
+  and not +0+. If set to +-1+ or +-2+, and the group does not already
+  exist, then a unique GID will be computed by Buildroot, with +-1+
+  denoting a system GID from [100...999] and +-2+ denoting a user GID
+  from [1000...1999]. 
 - +password+ is the crypt(3)-encoded password. If prefixed with +!+,
   then login is disabled. If prefixed with +=+, then it is interpreted
   as clear-text, and will be crypt-encoded (using MD5). If prefixed with
diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index 9d8295e8a3..f7a3180e30 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -14,8 +14,8 @@ LAST_SYSTEM_UID=999
 FIRST_SYSTEM_GID=100
 LAST_SYSTEM_GID=999
 # argument to automatically crease system/user id
-AUTO_SYSTEM_ID=-2
-AUTO_USER_ID=-1
+AUTO_SYSTEM_ID=-1
+AUTO_USER_ID=-2
 
 # No more is configurable below this point
 #----------------------------------------------------------------------------
@@ -433,7 +433,7 @@ main() {
         read username uid group gid passwd home shell groups comment <<<"${line}"
         if [ "${groups}" != "-" ]; then
             for g in ${groups//,/ }; do
-                add_one_group "${g}" ${AUTO_USER_ID}
+                add_one_group "${g}" ${AUTO_SYSTEM_ID}
             done
         fi
     done
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
