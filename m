Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF59FC52D7F
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 20:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C7A9608EA;
	Wed, 14 Aug 2024 20:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aywZ3VYyAmS9; Wed, 14 Aug 2024 20:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E56B608ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E56B608ED;
	Wed, 14 Aug 2024 20:50:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04B941BF97D
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 20:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F35C64013C
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 20:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CsK64hOHnpI for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 20:49:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.103.80.155;
 helo=mx.kolabnow.com; envelope-from=zgyarmati@zgyarmati.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F7D0400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F7D0400AC
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.155])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F7D0400AC
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 20:49:54 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id EFDAA3849CE2
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 22:49:51 +0200 (CEST)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out013.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id mkihIwCz9Cni for <buildroot@buildroot.org>;
 Wed, 14 Aug 2024 22:49:46 +0200 (CEST)
Received: from int-mx009.mykolab.com (unknown [10.9.13.9])
 by mx.kolabnow.com (Postfix) with ESMTPS id 69FB13849CE1
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 22:49:45 +0200 (CEST)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
 by int-mx009.mykolab.com (Postfix) with ESMTPS id 568AE20C76AC
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 22:49:45 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 22:49:10 +0200
Message-Id: <20240814204912.7116-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received:received:received; s=
 dkim20240523; t=1723668586; x=1725482987; bh=2MhI4dhwO3wVpUPbNrd
 DP6cp6PbTkGD8Kb3Z17umgBs=; b=eTliqlVKs5wEvr8StORFROU7n94NzllC6HG
 r+LwhruLitYkcb89CSLForNb93g459k6teUrm9+34nHdcgi3srbG8PYHCmDFtld5
 IYN89SFxUNV/QS48WmY7/8rytVMwKk9OWZNxTeO8vTpBxgJd+ueveSGenWm1cXXt
 PcxVZLnsff58L+GGok48C2eZUXWw0r3D+g8TH93Oas03McnzjDh3OyjwhwmYybmr
 giP6MWXiBE/80yOhhZ2oMJk49+bf7hQirrfhnS4EFLyqUrI5SEhIc7UbqPN/PmbM
 wzZmRLUkF7prkqbLaoSzUtT06u58T8QdDHu3gmSwy28rogFJ9Yw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zgyarmati.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kolabnow.com header.i=@kolabnow.com header.a=rsa-sha256
 header.s=dkim20240523 header.b=eTliqlVK
X-Mailman-Original-Authentication-Results: ext-mx-out013.mykolab.com (amavis); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [RFC 0/1] package/libusb: set dependency on
 BR2_ARC_ATOMIC_EXT
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On ARC libusb needs BR2_ARC_ATOMIC_EXT to be enabled. I'm not sure this
is the canonical way to express this, please let me know if there is a
more straightforward way.

Zoltan Gyarmati (1):
  package/libusb: set dependency on BR2_ARC_ATOMIC_EXT

 package/libusb/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
