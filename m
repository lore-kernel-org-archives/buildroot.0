Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A91C3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 12:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7282160FBE;
	Sun, 15 Jan 2023 12:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7282160FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ReS5chabObgd; Sun, 15 Jan 2023 12:54:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8E5A6118F;
	Sun, 15 Jan 2023 12:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8E5A6118F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 900A41BF29D
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 12:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75E6D4167D
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 12:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75E6D4167D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BRWJUzctnfJg for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 12:53:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 172CF415DF
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 172CF415DF
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 12:53:13 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id az20so43188578ejc.1
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 04:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VkcK0rndVt/0vobRIpFh+ekJXQB9/eAGIKhNDzijbT4=;
 b=VQgk3SPf7BqIx4iOXfRPaM+YW4frUFT/44BTfvQDUHy+NftD/9cIPuatp9bu1CvPSa
 SXYzIyqs66nJKHSfvwA64DToPKb/tL+67Rk8hUlsCkOjkro8bhtcuCiWtKFx2nFskiyO
 YR0PxyE7v6ChvpxF3BLiwfPyLOmaXfmrd+nvzFI9hMktdThpHZN5B1hPtKJJq364UaR8
 2WntuiLY0aF/QG5vEbBrFwsycjH+sSOuXESLG26h8vCCqsZW9otrQDeVfxhREFnOGSXl
 oQgYx81N5Xm2fU4GXqj9JWeNKYE4GG5NcPEovXApUnwjx7JVATEZC7JuFnmvfbIoOzl8
 uIBw==
X-Gm-Message-State: AFqh2kpWaFB6cTlAqDCbPOQmaSqc4oGbg96xTOtNyjYMtCY9fsmFrnWN
 G+TvVHWQ96sj/vhkmhQDlemFQe9EUVs=
X-Google-Smtp-Source: AMrXdXt6/JaSkq89q0WLw/nxzwQeUm8tHUQpnZPpLbaP7IcdeFeGWaJUPT2q160cND2PGXTCrJwcKg==
X-Received: by 2002:a17:906:f88e:b0:7aa:491c:6cdf with SMTP id
 lg14-20020a170906f88e00b007aa491c6cdfmr9680190ejb.18.1673787191307; 
 Sun, 15 Jan 2023 04:53:11 -0800 (PST)
Received: from debian-noppl.. (84-113-221-34.cable.dynamic.surfer.at.
 [84.113.221.34]) by smtp.gmail.com with ESMTPSA id
 r18-20020a1709061bb200b0084cd08e5cb5sm10581673ejg.159.2023.01.15.04.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 04:53:11 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 13:52:50 +0100
Message-Id: <20230115125253.280257-6-nolange79@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115125253.280257-1-nolange79@gmail.com>
References: <20230115125253.280257-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VkcK0rndVt/0vobRIpFh+ekJXQB9/eAGIKhNDzijbT4=;
 b=fXu+iP3CKOJM642+E2zy+Uw9vGYF+gfsveB5NO1ElEkNFmvQj/WTrp6+Xm6wEcq+Ib
 X4uSV8Qn+WzCUce4df2xllw5rzrbkfRGvGKYcdojz2fPBoVbgc8Pt2Bb/e5UaceEE8GG
 fDp3GLLFva7eS4tYdH+Xzq1SIM57ByjRC/811nzffhyFLSrpoc0Wbko/iVGnyw3S4aj9
 P95IcpXYqi00beiTnyeCUQRQZ6dpaLnGQc1VQxXmkGNNsg1fr66RWx3AG7jglTitirmA
 e3bOyN6bu6zSWYizPHX70dxTZmnLgRM9yTi8zD3Stehes6QAYCyvhs+F5Oit8BZywyS6
 9uJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fXu+iP3C
Subject: [Buildroot] [PATCH 5/7] package/skeleton-init-systemd: fix
 var.mount options
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The mode should reflect the mount directory,
and 755 is the default - so drop the mount option.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/skeleton-init-systemd/var.mount | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/skeleton-init-systemd/var.mount b/package/skeleton-init-systemd/var.mount
index e97accef93..a681ab0c54 100644
--- a/package/skeleton-init-systemd/var.mount
+++ b/package/skeleton-init-systemd/var.mount
@@ -12,4 +12,4 @@ After=swap.target
 What=tmpfs
 Where=/var
 Type=tmpfs
-Options=mode=1777,strictatime,nosuid,nodev,size=50%%,nr_inodes=1m
+Options=nosuid,nodev,size=50%%,nr_inodes=1m
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
