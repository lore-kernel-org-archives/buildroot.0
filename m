Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA42E7C715
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 09:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0B5284225;
	Sun,  1 Feb 2026 09:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYZSXZG_aefw; Sun,  1 Feb 2026 09:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2329E8421A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769937822;
	bh=XmL/BJBlWPy+5h5w48wztPvqi1dVtYSnG8SqVemMHY8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n+NkRdqdjjIpDpqzdwwcycpnijZ5pFes5IiAZsO6tc7+xso/WTtidjQA0K5RyIENP
	 SoLQhGsNOGa5A2dqGYLWiB2elPHZk87X7c6EVZVP0XKleC6Mu8v+8In7s/5bVxd5aT
	 kakEUs4GgHPPCt4xj45eg7Bi+2/p5iIpASui5G32MoR9wioAc7GgXsFsBsTmP4yG9s
	 hG7/pfUCHmXXr3RS5br9EmKbgH71D4qL02NFmazsiSewuepG4Iw/MYfe+/Jki+D26r
	 mF2TZ3To8ZQaHmc8pzoi+Pdqkb+yvFNq7sGJ7CBFf/JusVjlsOfwZF39LJG4dqxlrz
	 y7xIJUVzyQ9LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2329E8421A;
	Sun,  1 Feb 2026 09:23:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6CFF23E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 994B94080B
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NovsSRI8-Lyu for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 09:23:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 865E1407F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 865E1407F8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 865E1407F8
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:23:38 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -165341649; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Feb 2026 09:23:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmTfy-00000005iQG-1mDL;
 Sun, 01 Feb 2026 10:23:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260131175745.2467286-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 31 Jan 2026 18:57:45 +0100")
References: <20260131175745.2467286-1-bernd@kuhls.net>
Date: Sun, 01 Feb 2026 10:23:26 +0100
Message-ID: <87bji8x1f5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mxtGL3KLV9Qc90/FX/8Zc48AwRiwB4PKx9d9NBb6Jt5MVrPSEZgpilowS+BL4Ztl52eTRb8J957u+g3xbkC7AWwE/LY+R5CrfoOVX84aZbzisVm57qS3uydL+MrxRDKsbv+fOljsPDrKjaxkhj9lyCtRxXkR+qIL1vgAW//k0gk3BkuZE/r19VkcwAasHCX1HPALncpYI5C+p9c+4GbjKubxq+cSmycBiaI/h7gHE+7uP3kUn452Dg3IRL04PeWfgKKE8HWH9EJNkMWB9EC14blIOdIr8fKz6nl2uM6rFpaGs/y38ineKywtcfZ7XWo13CiBsxUBlSb+LL/17F1c1g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=ToXHTz4sKSXn4mHo6TcW7YYYUjfAssiE4JZIVuthZT8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=mxtGL3KL
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.7.4
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://github.com/libexpat/libexpat/blob/R_2_7_4/expat/Changes
 > Fixes CVE-2026-24515 & CVE-2026-25210.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
