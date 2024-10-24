Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4508D10374
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81DAA60E0F;
	Thu, 24 Oct 2024 20:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hX8bck22X_Nk; Thu, 24 Oct 2024 20:48:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80E8860ECA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80E8860ECA;
	Thu, 24 Oct 2024 20:48:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8314F4960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64E5A40C39
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YB3Gs9bf_gaI for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:48:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2BAA240BA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BAA240BA7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BAA240BA7
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56F3E60003;
 Thu, 24 Oct 2024 20:48:34 +0000 (UTC)
Date: Thu, 24 Oct 2024 22:48:33 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
Message-ID: <20241024224833.78a086a9@windsurf>
In-Reply-To: <20241007184506.2459716-1-fido_max@inbox.ru>
References: <20241007184506.2459716-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729802914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7k+13Hi3mWMk93koJT9lfu9TgapFpREMLDYHbZyY7YQ=;
 b=h+6vp3vC+fiuGvNoXBXOxh47zLluRHAgldv5pBfg9ArQcAJKjKqtHT3onE+PUYwKmg+icu
 kZmcuQ4/yTxGUvXOT445ehto61yT6e4sNIdNRb71pkUpaHd7Txz5ZfuQ+Rr5IMZ3PjJMuG
 lYclHOBrDT8nbU61+7zPS82tYDi/w1OCuYmdzmOV2Q0smrci11FG8mFktgi3KtOGXApS35
 Qka8jU0wTJb6UACSQvEr4HUF2a4A3XioOPCMC6VcYKyxQdwgwzvgzXQsvOZx7ACgo3jVq+
 GbHKntQp9tTPyWkjyw8a0qAOxZDB7NFF1MBj5/HI1jQzDZET2m94R74KGnTQcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h+6vp3vC
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 2.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  7 Oct 2024 21:45:06 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> osm2pgsql now use std::filesystem instead of boost::filesystem. So
> drop BR2_PACKAGE_BOOST_SYSTEM, BR2_PACKAGE_BOOST_FILESYSTEM
> dependencies and set BR2_TOOLCHAIN_GCC_AT_LEAST_8.
> Lua is not optional now. So add lua or luajit as dependencies.
> Legacy Proj interface (Proj 4) was dropped and option was renamed
> from USE_PROJ_LIB to WITH_PROJ
> 
> Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/2.0.0
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/osm2pgsql/Config.in      | 11 ++++-------
>  package/osm2pgsql/osm2pgsql.hash |  2 +-
>  package/osm2pgsql/osm2pgsql.mk   | 14 ++++++--------
>  3 files changed, 11 insertions(+), 16 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
