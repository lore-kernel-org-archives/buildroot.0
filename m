Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0393AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 00:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5C84403D3;
	Sun,  5 Dec 2021 00:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24nreXLV1KRJ; Sun,  5 Dec 2021 00:55:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCD6440261;
	Sun,  5 Dec 2021 00:55:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96A631BF963
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 786164034D
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DCMCtPRy-kZk for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 00:54:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B24804033C
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 00:54:20 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id s6so1126380ild.9
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 16:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3fhyg8eCMUnUa30WF7cbKARAZyXQT6C62KXTuRV1Pm4=;
 b=poMYi3kofao9oSXGSNV5wqZ/wvgc6vCZFfvphnkgksZ5T7QSOqAukDvd4+gqPKT3gQ
 hRvCPMVf0uTEBm/UDEKzA0I3KY7IZkHBNiWUft7sEgPk7lde5DxKZAq0lOYqbWaoB2XA
 GVJb3+VEFGMTHAUY+D1UkTZmLS/kssfIxYkGYqHuhp9W1J5dtW8w4sb8IE1FihAkdSh/
 xFWiNy9SV3GM4mCjUWjVQenZt55bKOVF+JSgAJiVF71GYkFRJV30QL/JsOX1j6wgZyup
 CGVxpKeaq6s1QLNHzcwddjt0Ua42V5IO37YE8emGPpdqAhX984sAxcfSbuXOhRABJUUL
 apKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3fhyg8eCMUnUa30WF7cbKARAZyXQT6C62KXTuRV1Pm4=;
 b=7PIOkpLAEETxahZXmnL/DU8Ue3k1CWFy5DgnOMB6F+/Njfam1ls7+go593Hsj/mT9l
 k1s4e6Gc+92RfGwIkBNr/jL4iweu1/WfVFFWM40cAurzUXM6nW2ffyqCcSum10qYE4N0
 oPo2mqRsIACMRoCLEU4AuZJTolwFBg9AZbKgp11dG2UpzPm5kubDe+H/KQd0sgE6J2P7
 yDvowwrpGF/9f3ncf5kJ8yq4oU/zb4xNP6JoD+Dkp5Gt6r5JVFEqcT5ffJDzg6dSi1jy
 ROn2olLgT7NPlGyqUQ9xG7qEAZ5u78BJuzn/5pE7Zt0hgXg0cV9hgYyIDHRa3n8xNuVw
 NRLQ==
X-Gm-Message-State: AOAM531pWczrKmgWD6RKXBo4J8+Z6n93fNP3hmFXglzKMs13KHRlvnDy
 jQYU6fF6iHE+dzluNzcrrhmz0dX6SK4=
X-Google-Smtp-Source: ABdhPJzlXeQLYQ5iXcMXu95UmYjFVuK6bkPRApaYXeaNnp/WlETEcfTi7x2ChCqdkuPCTYdktBgTaw==
X-Received: by 2002:a92:cdac:: with SMTP id g12mr25882729ild.204.1638665659731; 
 Sat, 04 Dec 2021 16:54:19 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id g7sm3903914iln.67.2021.12.04.16.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 16:54:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 17:54:08 -0700
Message-Id: <20211205005412.2888068-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205005412.2888068-1-james.hilliard1@gmail.com>
References: <20211205005412.2888068-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/7] package/network-manager: add optional
 libaudit support
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/network-manager/network-manager.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 5d836d0bbc..c07be6d19d 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -49,6 +49,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += --with-iwd=no
 endif
 
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+NETWORK_MANAGER_DEPENDENCIES += audit
+NETWORK_MANAGER_CONF_OPTS += --with-libaudit=yes
+else
+NETWORK_MANAGER_CONF_OPTS += --with-libaudit=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 NETWORK_MANAGER_DEPENDENCIES += libcurl
 NETWORK_MANAGER_CONF_OPTS += --enable-concheck
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
