Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6985DC88E6F
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 20:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18ECE4043F;
	Mon, 14 Sep 2026 20:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlN90xOv47GS; Mon, 14 Sep 2026 20:41:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 32F4A4047C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789418495;
	b=e9CAXRzX/YCAZj2kBTootHoILImyRkX1nJd2w9qd6viE/lcZd9bCQuy5Nsf3RpcDgDU8
	 BkETC1t/YWo05JRVsUoVNoYvOjQFjddQ+zAFupDC5kJ2dzdhyPz51FAnOWYIpORkPCiv1
	 3V7v4ZkAYKOmLqMbAHojVoGXtHk0qXyc/9XsmXEoKhh0vuG1mlKVSi/RamhG06pGdlGL0
	 PWDVRRq6mA5heU1q7uDKyCm7gC4EGMk09CdeqMvo9bqFtRnnbtwjYZNxR1Cr+rKpCki9h
	 SsV1Oq/jX/bpUFZJy6STpGdpFkHHjcpmOz3jX/u2l3FSp+HznzfMTPOsDUwT/OtAg/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789418495;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:Date:MIME-Version:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QTP0C8yEMd8ibJOGy1vDFgsMoEzBMA/KQnKdjTySgn8=;
	b=hoDuJvZm1Q7m3/qo+yhK/JqFzH62BVJPgC9e2tgrMfxGGlPqKsKR/MDn3zLSl/ZmkGoN
	 w2Bpd04haTLtBcp2XMgwzYZyqppceTCrAdzkdSWdEDF7a1uEWl5QoE939QWyumPtGlcFU
	 PCNbvx+wEivvu6xJB4VDJo28MuV2B9X0Z2AF1FiSxBeokKm8nikYrs7rfJdvVqaAUmfBv
	 uO2miA629Hhqy9qWySyHgHWt4v+TEQqGQvUXL5r7cAUpCPFpGAxUk66jh+CYDzb0+zekJ
	 tjMAdlhbrdzKEKWuHBrYWc8klVy2aanUxtd1AwkPDayDYqVPRCMveUqHgcnjNTrsqyA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789418495;
	bh=QTP0C8yEMd8ibJOGy1vDFgsMoEzBMA/KQnKdjTySgn8=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FibMKPhZDt0rKNZ92BTI+lMYXKqRyJohw4IYiMHtiybgw8GIAslNuwXnt6rSq8h1I
	 aNBuejZA1SS+bBfegmBlrwnP7Gk+aqR7mVHuZNLcNyE4FZ3CJhaDl3EYnB3RyLOq6j
	 yqqyuL9rA3vWc2xff08IjPGQ6PmlETc4STO6G48BFqbyMXl9lPpASAZRZ0ozo+I1+B
	 2keRiZeavP8S++fz91Z1il82pJJTZ/G+QTaS2mRZI5jNTPdokkM9cPknjkKouXrqXo
	 JV0Bfjka8ZxbPznyBcx7kbPgwBi8A3QZEEx82WAVqTvD0gLFkpq0ZO59QI49mQVCca
	 z2WSXi7ETetKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32F4A4047C;
	Mon, 14 Sep 2026 20:41:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70A86493
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 20:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56C5E605FC
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 20:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-sN2TLKNLcr for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 20:41:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 246CA605DF
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:39::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789418492;
 b=Q5Bt5Bao5V+H+NS8p7rxriGitnfOirA7sQs8DFv59SyR/OHm0s8qy1/As9AYNqXZ2+Qv
 OBIB1hjNW2YNxg8eXhT7luuJE8sTJzfVwU/O1s7MCM7iX9Xc+tywid7SUgYJHrRrJ2+Mh
 +mJBg85OPS2bwmATGqjIVV3CfEnODF47DIenjOntXho5dbjEqf05FfWqSlT4+dqKHeLnc
 nvLmxB8gR+L2ye7jAngOYvo47d8jNSFYTHKWdXdQMNEvupxtE48JgXAo63X6OuyfbTqVd
 Lse41dySSoQwwP2YEW+OHNve4ilIXNXYENSr1422HGaAdGGtiQpiupe9hifXhKv4Xhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789418492;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
 X-Developer-Key;
 bh=XIRmzUYXQOTyQndQcv9aVsXwS3ZL+ef9OaVRUn9o9XE=;
 b=UJDKRnbfVCyHj6aba+iCGjng5vOo/SiGY/wCTen/OGBcnVTp0XGHxS1yhXoA4M1hxKs9
 e7YVj63WrkHNBTf4HbUUgc+YsaqiEWwnIjr8mXPOXzFpfA4S53ixniPQv4bbABiOyTNwU
 PkX+5Or/dp5YXG7NfiLlKnQi5LBpmaPlZyANBeT2286KucSgX3CXMcce2vHZ2fzcAfrRZ
 X0iLokwQpP7DtN6NT/sfZy9gAh1uufHBoTG/eIpJjQYY07NedpTqNhrPUesm6+2abmN++
 vKCvJeGcjEjA1Bq8eONjwIUVCtEL9LtFqGPpP8Sl+sWkoPsl1Vf8mYEOK/19P3KrWRQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=anodize.com; 
 dkim=pass header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=bnVb9ivz; 
 arc=none smtp.remote-ip="2607:f8b0:4864:39::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:39::11; helo=mail-pj2-x11.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=anodize.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=bnVb9ivz
Received: from mail-pj2-x11.google.com (mail-pj2-x11.google.com
 [IPv6:2607:f8b0:4864:39::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 246CA605DF
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 20:41:31 +0000 (UTC)
Received: by mail-pj2-x11.google.com with SMTP id
 d9443c01a7336-2d747ed9866so26843155ad.2
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 13:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1789418491; x=1790023291; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=XIRmzUYXQOTyQndQcv9aVsXwS3ZL+ef9OaVRUn9o9XE=;
 b=bnVb9ivzuwzCS527+oSoS+QTcq46nF9y7VPqthAUi2vJW2nH72gaPka+OuoPoTYLQk
 6IX7BWKUNA3eC5ZOXvMedYT5Tw7fRisPhXv0v/vMW9zQzz46YWRMkDsCX6px6Z00ZfbO
 K7loIqCGxqHPZ8kbzB/GeQ8wG8EdEAM1SbF4eBx6/inn65ZowDKDfwLA5Y0bnNS6AFzS
 VXf5YSzRGivvpsvt/WidJaq+DKFBlbeUsS+NlivqmdLnTajJW7OevTeq61rqwL7fWhVe
 UCoxvty+qgnS02PnKWh5O0Qq9adEjA79X5pbqU741ml2znNVg3mf8xSxPeIBmRlRckSV
 X5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789418491; x=1790023291;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=XIRmzUYXQOTyQndQcv9aVsXwS3ZL+ef9OaVRUn9o9XE=;
 b=PSAuyrp9j4W57d1RafJ0WVp+36tDj6Zv6+PTeHhUBZrfUnvsUaAjw+stfAxXx3k1eG
 aXkIDTzYL4Am0HCq6Z4+k0FUn4Igwp1w9qliTIyOeEti1L2B+hpS6uTqVK/MEbBNeNpL
 lQr7Jev+OZkraGpLcxphVFWxxBDzU8vRqExqqdZom9kkCtvyhAwfinSd4mVc0Qxqayw/
 BMH61kv/qod2h15dHCz7VG/G8CpE4FzlglEF8UUA9ZPX0rR03APY2COKy3n07A+lCBUg
 uDyAJOGEjmRnWSgR0NFhKuBGrVIugMlEh2tH0gVufS4YekL84WMjeVNermLYNLv/7eWg
 5ZTQ==
X-Gm-Message-State: AFuF++kr0L2lNx0qDwtl6KZFuDRg6mP4IupCxxl6O7nLstgpKcWbL0ee
 UJ7twKETli1/uBxVAZyx9Km859epxzriiYgQJ4RUeiUguY3JEGk7z+xoJcnt4HioiBztwfgtSU6
 qhZOH
X-Gm-Gg: AYBFou2j5DEoXkURfIsqTdQLPTcZuGoKEUiAHAsLrYnzHigb/yefjbPpXsB8RfuNQLY
 EYoXudNoy7lrXcMyyE/gaJQwJ74rSWWuIsuT4hDpWpWg4Joxc55tJKUUquIN0r+OXerJ57iZBNH
 QnMFzVL7uiBN+dCKDPKlxTpKhU3tm3WtSf0mXCf9YRnjV2qMUuDFiqfYqDTw6IGtulv0J6yka0C
 qco//4sxY5iLKrhKLdgB6ByS2ln1XVAFMAsM/hkraqAOLwS1afgRmzoNZsDxJJuvu/ixpNsX06i
 Ub3Z2qwjCObiHCxSCXiUeKAWxQkjuL3S2+0aqyLqbSY8Vq5UYvpPxlU24eHgS90uJTpVrvmsa1Y
 aV1LjJEQgXmYadsue99RZTEx/cwoZqWpyGDW9aw4kpzqVIAFWr42zShfZhE1YvGwewmor/wOqKL
 6zpeynC+Wcnt9mceT4syqJBVmiwm1XrjgXtciZQzWopFhTGOfnR5xFh2HWwCmGiYfoGIU=
X-Received: by 2002:a17:903:1a6f:b0:2d9:2fc9:5706 with SMTP id
 d9443c01a7336-2dd6c5b17bdmr82826065ad.2.1789418490867; 
 Mon, 14 Sep 2026 13:41:30 -0700 (PDT)
Received: from wash.local ([50.47.124.161]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2dd2ceb72f8sm56075415ad.40.2026.09.14.13.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 13:41:30 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Mon, 14 Sep 2026 13:41:15 -0700
MIME-Version: 1.0
Message-Id: <20260914-passt-20260728-v2-1-9c811b239e43@anodize.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOwQ6CMAyGX4Xs7AxbFBZPvofh0JUqNWEz6yQq4
 d1lePb4/W2/v7MSSkyiTtWsEk0sHMMKdlcpHCDcSHO/srK1bWpnnH6ASNYbttZpezCIjW8NNqT
 Wo0eiK7824aX7sTz9nTAXS9nwIKR9goBDiUaQTKkMBpYc03t7ZTJF8Ld1MrrWAM6jQbJ4hDOE2
 POH9hhH1S3L8gUfnJ2D2QAAAA==
X-Change-ID: 20260818-passt-20260728-241cc6b71c6e
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Joseph Kogut <joseph@anodize.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789418490; l=4485;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=aSHjTRNeSwrhczgygzPBT2f9Zj4CbefGvcoGTfQmqkc=;
 b=QP/dogGD3VSz74GROYVfuqQw+SskOtrU0bCrTrbIPZUmkdHOGOiiq2Dz+zLpirt/KFo1W8rfv
 jgCHUMVCV0WB7SIkPF9s8Emj3VNVxjqMfXirFsd22S1W/FeFVtYGCh6
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
Subject: [Buildroot] [PATCH v2] package/passt: bump to version
 2026_07_28.f8df3f1
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

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
Changes in v2:
- Drop patch 1/2, as it's been applied already
- Add upstream patch fixing musl builds [Thomas]
- Link to v1: https://patch.msgid.link/20260818-passt-20260728-v1-0-aa8bc1ce2c5a@anodize.com

To: buildroot@buildroot.org
---
 ...ation-Include-linux_dep.h-for-close_range.patch | 64 ++++++++++++++++++++++
 package/passt/passt.hash                           |  2 +-
 package/passt/passt.mk                             |  2 +-
 3 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/package/passt/0001-isolation-Include-linux_dep.h-for-close_range.patch b/package/passt/0001-isolation-Include-linux_dep.h-for-close_range.patch
new file mode 100644
index 0000000000..2ccfd9a9c5
--- /dev/null
+++ b/package/passt/0001-isolation-Include-linux_dep.h-for-close_range.patch
@@ -0,0 +1,64 @@
+From defc25b9444c508d21badb6bc9a0b835ddd01126 Mon Sep 17 00:00:00 2001
+From: Huang Jing <rne.kou@icloud.com>
+Date: Sat, 8 Aug 2026 00:10:32 +0800
+Subject: [PATCH] isolation: Include linux_dep.h for close_range()
+
+Include linux_dep.h for close_range() usage in isolation.c. And now
+that the close_open_files() function which makes use of linux_dep.h
+has been moved from util.c to isolation.c, we can safely remove the
+header inclusion from util.c.
+
+Link: https://github.com/gentoo/gentoo/pull/46644
+Fixes: 0a510066e916 ("isolation: Move close_open_files() to isolate_fds()")
+Upstream: https://passt.top/passt/commit/?id=defc25b9444c508d21badb6bc9a0b835ddd01126
+Signed-off-by: Jing Huang <rne.kou@icloud.com>
+Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
+Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
+Signed-off-by: Joseph Kogut <joseph@anodize.com>
+---
+ Makefile    | 4 ++--
+ isolation.c | 1 +
+ util.c      | 1 -
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 77474d6..b315242 100644
+--- a/Makefile
++++ b/Makefile
+@@ -48,8 +48,8 @@ MANPAGES = passt.1 pasta.1 pesto.1 passt-repair.1
+ 
+ PASST_HEADERS = arch.h arp.h bitmap.h checksum.h conf.h dhcp.h dhcpv6.h \
+ 	epoll_ctl.h flow.h fwd.h fwd_rule.h flow_table.h icmp.h icmp_flow.h \
+-	inany.h iov.h ip.h isolation.h lineread.h log.h migrate.h ndp.h \
+-	netlink.h packet.h parse.h passt.h pasta.h pcap.h pif.h repair.h \
++	inany.h iov.h ip.h isolation.h lineread.h linux_dep.h log.h migrate.h \
++	ndp.h netlink.h packet.h parse.h passt.h pasta.h pcap.h pif.h repair.h \
+ 	serialise.h siphash.h tap.h tcp.h tcp_buf.h tcp_conn.h tcp_internal.h \
+ 	tcp_splice.h tcp_vu.h udp.h udp_flow.h udp_internal.h udp_vu.h util.h \
+ 	vhost_user.h virtio.h vu_common.h
+diff --git a/isolation.c b/isolation.c
+index 94cbe7f..a30b329 100644
+--- a/isolation.c
++++ b/isolation.c
+@@ -89,6 +89,7 @@
+ #include <linux/seccomp.h>
+ 
+ #include "util.h"
++#include "linux_dep.h"
+ #include "seccomp.h"
+ #include "passt.h"
+ #include "log.h"
+diff --git a/util.c b/util.c
+index bd4c6ca..28c32e4 100644
+--- a/util.c
++++ b/util.c
+@@ -27,7 +27,6 @@
+ #include <linux/errqueue.h>
+ #include <linux/in6.h>
+ 
+-#include "linux_dep.h"
+ #include "util.h"
+ #include "iov.h"
+ #include "passt.h"
+-- 
+2.55.0
diff --git a/package/passt/passt.hash b/package/passt/passt.hash
index af55658594..296e2724c4 100644
--- a/package/passt/passt.hash
+++ b/package/passt/passt.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  ac2562e4b589c518b6e30101daaa430691da2605ccc2988d0b704079c2aea4f3  passt-2025_06_11.0293c6f-git4.tar.gz
+sha256  2c9e0f3cdb33585edc28b8171d23e0631d718ace8acbad5c58bd415e644008af  passt-2026_07_28.f8df3f1-git4.tar.gz
 sha256  32dfe03d9985f5feb581da26a2fe6c84530cccb6b53ede0d8dab075cd048ac5b  LICENSES/BSD-3-Clause.txt
 sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/passt/passt.mk b/package/passt/passt.mk
index 8f9ab937b1..e34e7e505e 100644
--- a/package/passt/passt.mk
+++ b/package/passt/passt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PASST_VERSION = 2025_06_11.0293c6f
+PASST_VERSION = 2026_07_28.f8df3f1
 PASST_SITE = https://passt.top/passt
 PASST_SITE_METHOD = git
 

---
base-commit: 2d40ae9f2c6026fe201c894c79b2fc844e953465
change-id: 20260818-passt-20260728-241cc6b71c6e

Best regards,
--  
Joseph Kogut <joseph@anodize.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
