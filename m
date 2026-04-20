Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AA7F36C51
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 07:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF01E6108F;
	Mon, 20 Apr 2026 07:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yd6hUDd4dWqQ; Mon, 20 Apr 2026 07:58:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F366E61079
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776671887;
	bh=QmJhoWnqrQPNbwyvQ5bBesOq5os9tc/HfD5IbVaAWm8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ncTLbiPF+JWzViTnhprhJO3Cdgqkj2diQjS9pJNqMjFjtYlEXp5QT2c6t6pQy7QhG
	 rnPPggYkItNJobNPuSgJ6xTjnzi0H3FB36wHltUM5CYXuZULPpwb9Z5St6kSlDV5ot
	 PXBldz8ivO8R3LREYI/LW/ZiQGlRkranUmKezmvnmzhQLFpqdYCXc+oyz9V2rTcS0S
	 Uj7t1Uvm06dOWib72IJDVhlcisAJAC0fhm7A6RvdDHxEbIFKmo1AcXItmcOKGJYOh8
	 ZcuWn/YItB1MbL10kH9eUlAS5G33A76T7aBdLoQg12lpoQw2YXMNHgXrjl2XdndBUl
	 X417JC+iUwyFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F366E61079;
	Mon, 20 Apr 2026 07:58:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1537424D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 07:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06D6A400DA
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 07:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmSJwDQXuPY5 for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 07:58:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E5FA040024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5FA040024
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5FA040024
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 07:57:59 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wEjVz-000qws-S8; Mon, 20 Apr 2026 09:57:55 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 85f62558;
 Mon, 20 Apr 2026 07:57:53 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 20 Apr 2026 10:57:49 +0300
Message-ID: <20260420075753.1967051-1-aperez@igalia.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I7g6bu3qTmP3+EbUseyspVVGfHfUeiNCQX1T4cpyflY=; b=dFON2njuDgTN9Sojmn6NXZhnMT
 zAaqcT28X9tfkYWyOtP3bfWZbPLMIkFt38Fs+aETBMi2dM7x+4gPh/8yQfDPIU7/4wee6cVFD86bh
 HSepzdoDv7mXs8iGRiIid1+ZVOciURxqgGNX9WMOuWadMkHQUX8iUkNl9tIVLyv7tSqTdSdkfoC6F
 LUrMIzQHSsil9gJGG/cHVJSSYsx7QwVeI7txNmmY8Oi0tsDpflqA7BT0zuqrTbO876gSTGFkebYEt
 zBgGBgM/k0uYHV815JLIWYoIx4CyNoYwLboV1oXEMK7gCGT7Lxik1GOLwhpsTVD2o1Q/cR+IUwA8u
 2ldrNCwA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=dFON2nju
Subject: [Buildroot] [PATCH 0/2] update cage to 0.3.0 and wlroots to 0.20.0
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

Hello all,

This patch set updates the Cage Wayland compositor to the latest
version, which in turn requires an update to wlroots. The compositor
adds supports the wlr-foreign-toplevel-management and drm-lease-v1
protocols, and the second one is particularly useful for VR/AR
devices.

The new wlroots has a new optional dependency, libliftoff, which is
always disabled for now. A later patch set will add the missing package
and enable its usage for improved KMS plane usage.


Adrian Perez de Castro (2):
  package/wlroots: bump version to 0.20.0
  package/cage: bump version to 0.3.0

 package/cage/cage.hash                        |  4 +-
 package/cage/cage.mk                          |  5 +-
 ...ibinput-fix-build-with-libinput-1.31.patch | 51 -------------------
 package/wlroots/0002-xcursor.patch            | 33 ------------
 package/wlroots/wlroots.hash                  |  4 +-
 package/wlroots/wlroots.mk                    |  4 +-
 6 files changed, 8 insertions(+), 93 deletions(-)
 delete mode 100644 package/wlroots/0001-backend-libinput-fix-build-with-libinput-1.31.patch
 delete mode 100644 package/wlroots/0002-xcursor.patch

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
