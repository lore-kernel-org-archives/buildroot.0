Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFF6C982FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 05:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34D7680BE0;
	Tue, 22 Sep 2026 05:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dg7o_uaM2UeH; Tue, 22 Sep 2026 05:07:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3380480BE6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790053657;
	b=BseVAdKjrrUYgAKuy1dmWuMshf/4y2GXNSQPF3xlSzm3KTCoVZHpESzwXlAeuP1CI6kr
	 CXaK9bOdHfA9VvfIAxzIiY+t7MJbaLUo1yU/PDDOttWwgHyHcbgNyOP8vcY71fE2Shnpm
	 /kPvqePp6TpMhjtX5qt0PwHfiykBbjE3w6mM4aUuZT+aq/W9SEp9aCm1uGObm7uHgxQ3j
	 TG735g276fQMLpaXteEgcy5N/4BJqvCY0KaJfIFEsQvr2b9w0UZfinNCSdyuYcWKPnpEd
	 kn+19Gy7xYKM1f06srdjTA0dxeC3YuoZw5xtku/D7HB5L3YdizYoPV/esPm/79dXrtw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790053657;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-Amp-Result:From:To:CC:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Originating-IP:X-ClientProxiedBy:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LhZeGPPX1bShZSv3VgNfwC1wimoSE215nGwGwMRdaNA=;
	b=NGy1mNXSuiGLxSvqxkE6deyHZcImfeXzFDCyWcyV0dKLGLSKq+Zv6JkMtVSAfjZJlEt4
	 mVRT51xyuYVbBx5lYz6T6CYrEP2VYcKicVfw6wNjT2hKJqXyK4/ik4pKNCbZUkJNW1GDI
	 7doJFd5Gw/DC6R5vOpjr5sYftRu/ZUcRdCkjHqnQFIHZv+GKotnbecsR+RcEnX6IKNv/O
	 GhCK7tCT78hFhcn6Z8Ez73Qt8SmJn4tnqsA8qLBYv0Yg3WMgUMxwE34qjeaeKkZPxE4mM
	 /NpAoGnwOjat5J3zHG3SygmsAafTw4oB3IYAT9chdo1/VVdlAA4iY7xnpDGK0ShioNA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790053657;
	bh=LhZeGPPX1bShZSv3VgNfwC1wimoSE215nGwGwMRdaNA=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X7XM1H6Sfa2IuZLDfo+aa9GPLuWK3Ek1Be//NEuv7RX6jGTljQnXdALt0Kf2Iholf
	 VSeHD2NbgemBgvvrUWEKlUocQg3hGbh9RnNMBeiZCBG22FuM0GKKGeWvAn0CN8pVYK
	 hgE8ZzTFbtUf1P//eeV2dyvU9nTVttRSXaI2PGdhuTL6GYM5H4DYFqTw/Bi9MoqE36
	 VS5zFd/nbWYYQ80t7dFnPe9rghPFDbbO63APXtFj43hh5ptQM+xTcrSRx9Ba8ZxF3T
	 qKAcZYjHx4KlXMHPLoJqtJG2Lh9HoTYSp2lcx+mtJP1G4jlXg0bIKcbJJ0ongypujh
	 D7e8rRnBBcQuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3380480BE6;
	Tue, 22 Sep 2026 05:07:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1789834E
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 05:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 099AE6065F
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 05:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GbthrDeAUve for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 05:07:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9FA6B6061D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=80.12.126.237
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790053655;
 b=UMdy2jMgNCwU6m/tobmAvOQTW76k4GJ4HGCzhVpXYwKzPLusI1PMnikfxZnCHiVzYegZ
 ekG7cUPwUAhwcEL4bvYD8e0CpkUDuWUzO9Q0HX3VILVVDBAfJKJpC+bhiyz02DppqdsYk
 xYBGW6K1vp+2jW7L4mXLsfhAzKzVUNpI9EW1UejdxeHw8zalblaFy/Di3XUfAzcLEeW6N
 0WMIt7fbZhWvxk+OAUSjqHAvbQqjAoQPSawVlB04UcfnIoe8hlbx2DYy+/79O+sMUDLCy
 SkRx2C5rwukUPFnkAPpx0LYUS4PF/UmAyJpMN/j4XaAynkc0p0d2SRuwuRQzpfzInpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790053655;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:From:To:CC:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:X-Originating-IP:X-ClientProxiedBy:
 Content-Type:Content-Transfer-Encoding;
 bh=v/hfUeeUobuPfuIrgL/q5QQK6vdxqgpz0no8aqLXf8s=;
 b=L8jzzN1Y5NYrlvRL79BPXJBdoPWpGbq62AUdR/fp4p/i82m77pLx3Px8KN4o5Twn6EmO
 5qPASNIyymmOKM5BTn4XwAZg7rpbvcsZSeoVEFHlQ/Q36Z9Uabh1twKCW9gDRk9y12BZ0
 I4kKDv83X9U/rAFlGwK6gwviuFAg6GbTcjujhKWqdG/S3NOzGfm3/SnNwZvFEgcJpFCHB
 qTGSVJe/cJSQphpu0l8JFBsIimq9d0Gq5/mimchlJNKv2zy4NNFZM7oxUp397B6AljqHG
 UrqFrsYohy2d8SSOrVhH71XKfwjUlIFv+Mnp2AXus3HYUR7WIKfzI1CB1Kvw6+T5kkw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=P7KZ4Hn1; 
 arc=none smtp.remote-ip=80.12.126.237
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=P7KZ4Hn1
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FA6B6061D
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 05:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1790053655; x=1821589655;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v/hfUeeUobuPfuIrgL/q5QQK6vdxqgpz0no8aqLXf8s=;
 b=P7KZ4Hn19MD8HrwmYu0nMSg3JXKMF5n/cAZc8KnCSSt6kjUI/2GVak5j
 hIBKTZuPUq74UOhfuwN0T/5OtK6KbdmEKz7FaFvXgdW8MbHFcqo8Pz72E
 1Tl1CszLb7auAhoh+Op8RSDdg/OtbsgF9DprpQwTHLOdj3cfyN3caYfIB
 VKWp9pZUOihSyobkytXcpnNgVoNCx4UCF3FYViP8TGcGpnzkcnT58h9/U
 nyfavuPhQTCfLO6cGGDGIZslKPIpuFCzCXli+o9BpI8AKkV1n0kctX1Oc
 jnZkZWN5pRlzymuTUDuXs+Uvepzb8XH/XH/LtC1jJfDXaiU92x3w8ZKn7 w==;
X-CSE-ConnectionGUID: HSAlMwslRP+lLqsrzq5Z+A==
X-CSE-MsgGUID: LBYDz5WoS66FvbQgIA7wZg==
Received: from unknown (HELO opfedv3rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 22 Sep 2026 07:07:30 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 07:07:30 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49;
 Tue, 22 Sep 2026 07:07:29 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 22 Sep 2026 07:07:28 +0200
X-CSE-ConnectionGUID: zKJsSYFlQ5C7KcQSwVG+3w==
X-CSE-MsgGUID: bKznw+VkTUq+qLmLToDa4A==
X-IronPort-AV: E=Sophos;i="6.27,115,1787004000"; d="scan'208";a="470992981"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Julien Olivain <ju.o@free.fr>
Date: Tue, 22 Sep 2026 07:07:28 +0200
Message-ID: <6e9cc7dc8ad61d29d10b302f3654bfd0ca839d72.1790053648.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX501.corporate.adroot.infra.ftgroup
 (10.115.26.25) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH] package/skopeo: use new upstream location
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

The upstream location has changed (with a forward from the old one, so
we did not notice earlier) [0] [1], with 1.23.0 the first release being
made from the new location, which was accounted for in 96aac440dd79
(package/skopeo: bump version to 1.23.0) as it required the change of
the gomod, but where the new location was missed.

Eventually switch to the new location now.

[0] https://github.com/podman-container-tools/skopeo/pull/2854
[1] https://github.com/podman-container-tools/go.podman.io/pull/6

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/skopeo/skopeo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index 5a22658611..5d23cbf451 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SKOPEO_VERSION = 1.24.1
-SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
+SKOPEO_SITE = $(call github,podman-container-tools,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
 SKOPEO_LICENSE_FILES = LICENSE
-- 
2.43.0

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
