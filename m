Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7008AC44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 17:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B66DF606ED;
	Mon, 20 Jul 2026 17:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0PqvA_1jmS4h; Mon, 20 Jul 2026 17:04:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F19C60724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784567094;
	bh=uWoJAUlQk//7WEncH6Lm54ItcLvxZIPj2Res6t+ZnPc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=psr7IQWBnq/xgHYYj0pHFCXzKCYglPQlJVeI+aLf1ZOREXZjkMN53O9YIj8lOguMr
	 v0r5/BDzLgK4JrONCsaoVy4nmZIbemmWrtMxI43hjQeLMghKzel5m9TCVaSVvgQXC6
	 uui7XzRC0QCI1JMJJiF2LMoGgHnZX5w78mTE2/zOTlKnMluQx6uIPkElP4C3utFVo5
	 1LE62pEDAiKJvWPyBZypUAQsKr642HnrZ68IXoiP6Tqj8m0axy/K+GWsr8xD0rI5mA
	 LJFXrHcK648SJqKynrxucKgwhS5RUrml+MsxBavxv8MIiWmp4m6TBPBHm5OZevPH8E
	 mcNceAggoVXuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F19C60724;
	Mon, 20 Jul 2026 17:04:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7B4020DB
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 17:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9D9740081
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 17:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtnM8f3USoXd for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 17:04:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C093A40136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C093A40136
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C093A40136
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 17:04:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuUnA-1x2yth2vze-015MVk; Mon, 20
 Jul 2026 19:04:47 +0200
To: buildroot@buildroot.org
Date: Mon, 20 Jul 2026 19:04:35 +0200
Message-ID: <20260720170437.133823-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720170437.133823-1-fiona.klute@gmx.de>
References: <20260720170437.133823-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:lMgKPTso+/WX2T/AIeU70MgQDgTpCTKEcZBXy4RN8xC14ZL29mQ
 JtQ+yM1/zea1gMHsML2yCcb66iFa7UHiJgohI9lO1j/byufSAAc0JWPkNOyNcVsjYGDiABL
 EJgpy5K52ZyrcBXoxYbj/1mDLCccy1teD+2IQ6LqzIvtWkcRl4UJpjfI+X0Ymlyud3GDjkJ
 W2BCflucFqmI2K3bd15BA==
UI-OutboundReport: notjunk:1;M01:P0:c1gpbvBdURU=;m7UQY4/8fkl1dy+Swx60C1PLEWd
 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
 =
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1784567087; x=1785171887; i=fiona.klute@gmx.de;
 bh=xGhQypP+3hUhPiEDut1Em87qXlY6tkgTBpy7PSk4Jpk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=KZY2R5qVaBvBFff68StKfeBucksZytXhWiTS5BwIcQQeQlEi0Zw3u0UVDpQV3B9H
 8kSs3RKeWd1kE1BiV/mpbmCnv8KoRMThOmnXO4ITWSqtwpOmY+IMnKLgQHIGGqShL
 FiInJldogQerCFGaQqNXlL7G1HUXKOjMeWSuA0sjB7af3xePabriaC2U9k2Ag4Y4Y
 IN3+vH1/r8t331D+RhTf+ihERI2X9l3qphu0u2I6OhXrdwBohyrNDutGPBV6IL+7v
 xrIIu/brLMbHjj7HPTkrgXUJsJK2PFBDWp489/cDB9pLHTZfkvQvndTQJ14WYx/rD
 A8AnIr0CQcguBkgCXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=KZY2R5qV
Subject: [Buildroot] [PATCH 3/4] package/nettle: clarify license info
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Davide Viti <zinosat@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Fiona Klute \(Othermo GmbH\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>

The Nettle manual (nettle.html in the source archive) states:

> Nettle is dual licenced under the GNU General Public License version
> 2 or later, and the GNU Lesser General Public License version 3 or
> later. When using Nettle, you must comply fully with all conditions
> of at least one of these licenses. [...]

This means "or" is the correct description. Ellipsis covers a note
that a few files are licensed more permissively.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
 package/nettle/nettle.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 93c638a4cd..dbbd60622d 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -8,7 +8,7 @@ NETTLE_VERSION = 3.10.2
 NETTLE_SITE = $(BR2_GNU_MIRROR)/nettle
 NETTLE_DEPENDENCIES = host-m4 gmp
 NETTLE_INSTALL_STAGING = YES
-NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
+NETTLE_LICENSE = GPL-2.0+ or LGPL-3.0+
 NETTLE_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
 NETTLE_CPE_ID_VALID = YES
 # don't include openssl support for (unused) examples as it has problems
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
