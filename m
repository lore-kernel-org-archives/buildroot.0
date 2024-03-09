Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4844FC54E49
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 23:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CC9960A3D;
	Sat,  9 Mar 2024 23:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UlTob1DU4w8T; Sat,  9 Mar 2024 23:44:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C37060AF8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C37060AF8;
	Sat,  9 Mar 2024 23:44:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E60461BF2A2
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 23:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B4B740493
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 23:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AKVKwIEgzefm for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 23:44:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 087DA4012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 087DA4012F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 087DA4012F
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 23:44:33 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41317cc388dso13413925e9.2
 for <buildroot@buildroot.org>; Sat, 09 Mar 2024 15:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710027871; x=1710632671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z8A9YnD/AmLHx9mOTvlfbE9Hh+BjrC4vt9XKXZz/9Ag=;
 b=AwUwL2dWspoyZhi1yabrp48my6p32FsC7VUuN3cMBieeKR3pNGF6etbLng34F5ZfHW
 QY2+SIG+8aDFJEmsjGRJKzEVW8rhggw0ZsONHFxJfPQytNQGED9umfYaFcsXkTMKA7g+
 VM5ZCWi0A1uILQvBZMfsN8QSpG6kof6tjBsLZiv6NI0noyYXelnRNHzEicdY+5xhfBT3
 3P5GkFE6XtxSbvluEwDVxnufzpaLsT4z/Hl4YECyfBRLoCdG+rtZcaKiILlHvRUeH7zj
 lk2MyQRBtB0U5ySiPT+QvwdpnMAyuzKe42HlwiKJ2apkCc//HkR0J+NssAF33BglTSof
 dEYA==
X-Gm-Message-State: AOJu0Yy6k79NapIThTbEx1JXYouURfrDpxhpQOb7Udo9y2Bfh/+lDNe3
 FiY4YtRy28+fwSmIh7DCLrcsPKgJHb6/FOMFj+dO5XDEXIwI0suARBqk2+E3
X-Google-Smtp-Source: AGHT+IGeZ22LvM1SYufbSEFQ/2NnPg9Ba77eLQ4ncUBO71Xcqgi/YhhtfcRAfp1Mkaz73ySC+3BziQ==
X-Received: by 2002:a05:600c:5487:b0:413:1985:db97 with SMTP id
 iv7-20020a05600c548700b004131985db97mr2451487wmb.9.1710027871287; 
 Sat, 09 Mar 2024 15:44:31 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b0041312855081sm4005123wmb.5.2024.03.09.15.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 15:44:30 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 00:44:27 +0100
Message-ID: <e792b64d76fdc94756698d5c757a545acf418b53.1710027863.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710027863.git.yann.morin.1998@free.fr>
References: <cover.1710027863.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710027871; x=1710632671; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z8A9YnD/AmLHx9mOTvlfbE9Hh+BjrC4vt9XKXZz/9Ag=;
 b=C/+gFyG7szVxk4JZ1wQm1uIjoSGu4axHSeOwjlHRf9INRusoOLkzhjVPke4WNWpAWK
 DgX/zxJVpWu6hbLJ+RQK2doFxuucZwLliaZHv/ReC8pR4CxSxev3W1BOD7jS5kVucJa8
 L6W5QdlDoa/occ2L4d1rANsXmc9jcPV173VJ/v2f8tDBrbJOscHPxfEQ6GPdzE9IBY5j
 K9gUo8LJXkOKUixT/iWQh8IJY2U5wFm99ysS4HB4XNPybetwL8+g9Iy2bwvMsH8o76LN
 Ok5wvF0SrLBB7QZhHO0HFzXIZTtam5cxOLeeka+c1zWrpOLgd3NG4DWPFr1IWoG91E1Y
 Q6tw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C/+gFyG7
Subject: [Buildroot] [PATCH 3/5] support/scripts/mkusers: accept user tables
 without terminating \n
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/mkusers | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index ee09bbd1f2..08f3344518 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -409,9 +409,8 @@ main() {
     fi
 
     # Read in all the file in memory, exclude empty lines and comments
-    while read -r line; do
-        ENTRIES+=( "${line}" )
-    done < <( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
+    # mapfile reads all lines, even the last one if it is missing a \n
+    mapfile -t ENTRIES < <( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
 
     # We first create groups whose gid is positive, and then we create groups
     # whose gid is automatic, so that, if a group is defined both with
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
