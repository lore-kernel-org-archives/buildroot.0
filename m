Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95144CA5FC4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 15:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5507940D8F;
	Fri,  2 Oct 2026 15:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NU8VDLydeA5H; Fri,  2 Oct 2026 15:12:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6710540D76
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790953977;
	b=NZ739GDDYcWllhEq/C4EIOmzKUl0jKyuF3GxL8yMzlOOHlbc3Ftpc931NNPFVaVWo5Yg
	 uY0aOpQHYMzirCWzAtQtclA6SEGA5gC5sId+9Vlo7rlC9fDlAR3AWRbT/pw3bQpOSXtwG
	 YdvotIG6OZL7xb4nhkyyNPIXpckrRuMEnWR37QiSvnld0GSmhZ3g2dEJDr4kmn7gX7PIu
	 xgnsAw/sURPtuURcf4+yVWBvg0QsmPIZTX+tDxNABJTrLBrNKr5iMrM0EyvWOs7Ry6cGX
	 y7MBFv0NhA+PSkSjJRg2mRdbPAIC/swPy/7oqI8B9yQwgbP3Dkox1STlQU8TPPpw+GQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790953977;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1oJR3WOaE0E6UuljtdNstkmRaPkR13m6eVzyW2SHf2Q=;
	b=OJsMd1U2ZoY5IHAPlS3SFQ+M4BvnjkzGDRuWVbYlT3uccHpNH+Yik8aQM3VKUyma6/pp
	 e8cm1deijI9cOvyNkMZkkDYts8bGHJyP95VUOHToktVUkgNmBiiG/zujXDFWV/J8aIvxr
	 wO2EyebwVfdKXA/QKByj/qxD2cpi7epU/qZHNPhWd4R0qDw2u0tbDIh/mdU9ECnd4iA4m
	 dOoljF5ye54JJGu9vkso3yORkeS+mQmWPiP85Wp4Rlp8EXPfrV8Ni1SkGM5104dF2051i
	 EFnJbZhWT49gEEKX/Ts9JaNGTWavBQ0aLzfse0ot00quTCJy/keo9jgNHECa38L5s/w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790953977;
	bh=1oJR3WOaE0E6UuljtdNstkmRaPkR13m6eVzyW2SHf2Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ecVasFDLALcXOZp7jD0R1IOYLhaorLfXE/xxDojfv3TXKmya81NgbzGml3s6mP06W
	 zD/43rxDOkx3Vxq0opNryMRf4LhG0e/IOfaxmOfa7yALOUGf5G5pJxXrnom7cghzz7
	 v5u52OqX4LS097pINF6RaSjKxZbUq+aIMIyZYg8She7oFoBB5EJdTpEYfZuOzEX+Td
	 uMFuxxbTa9dRdgAY8PMGPBztKg4kmTBuGwK+DuTw7ltvqlruiy1DiN00aabmVqTOGN
	 9mZS1QN3s3YCW3Zlbr8njNJUpKxYkITsDxLV5eqqM7n9nC3uSUvGg4jJHjTDZrvtrY
	 ubJaPqMJzFWeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6710540D76;
	Fri,  2 Oct 2026 15:12:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA639435
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 15:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0AA640D7E
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 15:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gCxhEnvfIqL for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 15:12:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AF56740D76
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790953975;
 b=GsDl5jKn8EPTaVOfVXBvNauNj2QXfYcFTtS6kWhG+KtBkVZHt6l+cyLtgiu7XWYY2zhx
 VD75qkIkjk4unYYy7k/7Yf/B3MSW/xvBWg1a/qlFoMx+w9sYM3LiVoE3/ToT0VfhSt3FW
 wP93tD2HKcYLMeookhW8RoDLVlqesAvpFJNnIb0xZ5PUz3IFr0FqlgeSPTz2wciAoG0uu
 jHSCkN+Au74rqlGZp1bwnIubdK1mNGdjEj+7ft3zyjXhN2aYdbM3HuyWXP9AoKPqAnN2P
 Wueke0IwyUVgJvsFAXRA6tYdzGPrsbF0zdJxrF/mdoEq3kQ94RqA72/MCifNlI/Xmkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790953975;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=iY0/l9SZNIxv+/S6ibwi7LG6yoL9P/s83hFZI5evKIM=;
 b=UPIYFx38aJQTF7zvGYEU+8vtlRFApadYFgoVgiEK/Y8JpABB4VZ44z1DNJbGS24K0kVi
 pgZXo+tdlUEHu+Cu3cK59LlV4WOGkPKFLytErbVkkbgn5EHCjuTo0ZpRwDRHSbxqRqHyt
 asQKHMLs9N7uqaS14vaMEnPNLsw3je/HeXz/abAA9C/eouLRVUx/zRs2oBMHjp8c6GKRt
 q4c+LdFMufbq2XPQT4xug0swo4AqOpoeAEWTdD9qKpX3I6hLG7D0AitIrt+1ulPUxkm1n
 effMsSzxH0sI0SmBV8m37kl+6wRfVc+Km05WWdb2opUle+Cdjh+70HYy84NvDMPQtXw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=uP5JLrMx; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF56740D76
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 15:12:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmlTC-1wSumh2ElS-00otUS; Fri, 02
 Oct 2026 17:12:45 +0200
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri,  2 Oct 2026 17:12:25 +0200
Message-ID: <20261002151226.867507-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002151226.867507-1-fiona.klute@gmx.de>
References: <20261002151226.867507-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:A5DgH1ekyj0HBpLrpRwQGh8lG1ctQIjSM9T/fVss7xZdZPGJrot
 pEbLG7fMBKOw00XNj+zuUYfaJ2dWJvUZTW8LLo12MxOV0eOpDkQ9bxW56oVKQZI4Cgg0T+j
 omOUbYAHGY/4zf6/rE54yI0p+Zu3wN1klh3bTsHdvfjn6Pkiy+bqS3aPUixoz8sJCzVxvG6
 7/e2NsGtwHq82lyduEPQA==
UI-OutboundReport: notjunk:1;M01:P0:T16cBW+PSPw=;nJwbOE6VT7vUrGwEYAbL3pzIHjG
 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
Subject: [Buildroot] [PATCH 2/3] package/lvm2: set unconditional dependency
 with "=", not "+="
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

This is a simple style fix.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
This patch could also be applied without the rest of the series, no
functional change.

 package/lvm2/lvm2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 8db1899ed4..21fd5134c1 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -25,7 +25,7 @@ LVM2_CONF_OPTS += \
 	--disable-nls \
 	--with-symvers=no
 
-LVM2_DEPENDENCIES += host-pkgconf
+LVM2_DEPENDENCIES = host-pkgconf
 
 # LVM2 uses autoconf, but not automake, and the build system does not
 # take into account the toolchain passed at configure time.
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
