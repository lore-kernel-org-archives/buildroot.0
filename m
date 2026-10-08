Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D0ECA600A
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 08:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E3DE8113D;
	Thu,  8 Oct 2026 08:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTmttofjjZR9; Thu,  8 Oct 2026 08:59:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6A422811E6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791449955;
	b=nxSwMUOZG7OR4G41/mcWGqnojXta44v9a/nZeCtqh/aiMfmn4JPcXBwl/94M3uWcOncr
	 Wn8qPLOPdFV3HcX3QBlpk6i1jV+KWGe0pHrc2bUTz7AE+z7eRbV32Ms+HVJb2qXBwBewd
	 ZfQADf69DJ423PoiNoZwks4JVRnzU+2BbCyMztRFXEHivqw0Q2kOKG4plixCiD8y26FmV
	 ay39wOvQMuyynaYHW4xp2SUsBKQlzdnlE8M6hpbRd7GSdUthybpZiBE+KQ3GNkK+Lga5t
	 724G+h4aJQxZhD1xP7tM9yPplPXHJ7LTEf1OABmf8Fd+i7qovWIqR9agb8xyNkhVgOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791449955;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Organization:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oLS2XhwQw2AfM2mZjbacIizQDyptd5Ubw4LbtxITUNc=;
	b=fdFvR8bVB6SxZMrP6G+ifZLz2FGubm/PF+uWWqb9JSd9jNPt+/jCNkFcZc3mS3uBzmyV
	 VZM/W8NqMPFrCRVvlr4bZcPnzltUe8oVT9Q0vhvC+QjtaMPi3ke7jF+9DisYorGT48YB8
	 ijqfWlymVESAlU6F2J/f7le1HED1IK2A07MSd18Moyehh8+fQmADbYVCmo7LElAYfYoP0
	 XLcmmuRRYhsLBykVPVxNj7hDtMemEtq1w1XGHRfeRLASgG5rvPRVFUuaAd+t5m9IH9rau
	 +3RPulhi1BFNFOqSLm4uYciwiOR6JfiklbPr+SL3IEdKSqPVLEbsXWWEBESFFfQOdGQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XrRSHP5r;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791449955;
	bh=oLS2XhwQw2AfM2mZjbacIizQDyptd5Ubw4LbtxITUNc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nwUrzhXccgsMAwfjAF6mPaJRJ7GP3tj6xmJFjGS91GOxoZxpkJjPZ/ktWbP3j+keW
	 FhAIduO6Gx+RamRYEjxDii4RVfV1TUawJdcbEUMWUT/NmKZoURGamPyfMOIDzIVNfH
	 3Vhnd9DPDmS9Kjnp0UNcFPflq+3dH6Dg6Q/36bBlmgV5FH0gIgSUAMDhEdf6HW1Zga
	 Ci7Sv0OCK8jBTV4a8wrGUbHr/sVb4NUkHhIFk5uBlT2yAXn1St5B38/vLcZv+fcR4a
	 uQ/wZz5fQJyrQ5pG6rfBzkIwQGSHN7OSbXIcDU/I++Wk3qmjXQXTOx30RKUQ4iYDvU
	 M9H9qjmO0A4Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A422811E6;
	Thu,  8 Oct 2026 08:59:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 982B222B
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 08:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8996C811C5
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 08:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5pDv09Ky9yl for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 08:59:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 77E8D8112F
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::536"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791449952;
 b=KocuvRwU9u/0m+43XhmyfIXWyowwUsR4nI0j5seTtVnYvgoUqPKmQNIgwuiTAUdBEAr6
 bBA7/p+hYW47VHg5CuSqGJLHQygkzCWlC2Jh64PqenSaV7tW0JezRLpj7SG9EUpw782Ck
 QMCjSFneBU4L3Va1fqXnWh1hoQJrM7hDMCD4aptBT+YqlJ894Bb4ydWIuE+JXBDQiy8EF
 Xz4o6FN7WDmAnUYvL6/4l6JE0PMKtkhSU9mG5zLsEbz1eUiT2ofGdhwFQzUdwqXAcuTXz
 bQ3yzGWhql4dRqpQjf68OMNXHvM0ogaf+azOc6onwXU3eWxF8hlPkbPeFOByf+JFPeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791449952;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Organization:Content-Transfer-Encoding;
 bh=8pknZGw+W7kD90ixQcm++TJq/IqbTSPohgdc4EyLL3k=;
 b=j9KfeMrcNGosjerh794xxO82sGoPWjubMybrJBAs5tM6yTJj+OADBwxQVTa5PLXU2x2+
 XnmQ6ZQjIKUpW7RYrzh6jtA2YDbGiFVlud7FLqiQeaJQ3SG38OpRRGyJRQRd6J7Cnod01
 3LMmuaFWuxshjIUcoGwjKsUAcKw0qhffQiesWDF/k0JBhfH3397lttuV07j21m/byiEJU
 /G+73LuP6KQsdiFpY6CRkmnVixILJ9W8HtPvaynGzrHpKTZXVlrlr/wFBskTJruJjuQw3
 u6Tdv+TdS5YHOES0aI1FN9FshYsxNDZAc3vgJLeo65927G0dkg8ydEtXbrE910Y6B7g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=XrRSHP5r; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::536"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=XrRSHP5r
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77E8D8112F
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 08:59:11 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6ae185cc40fso890162a12.1
 for <buildroot@buildroot.org>; Thu, 08 Oct 2026 01:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791449949; x=1792054749; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8pknZGw+W7kD90ixQcm++TJq/IqbTSPohgdc4EyLL3k=;
 b=XrRSHP5rkx2Z/3P03KgR0VdWoD45B1UJKGSxQAlDAw8ToWwIJh8cdHscX8x5zKP+63
 4FqbOPlPekxuR3L9yZFUR6xWs838dRnBwYoQQYbGj7m9ongJBrrmRNGAtN29xa7svWwT
 M7k5X3WmWLFs74EM1V/OPosIFOIdheHqCqE2/WoYF7n+rcYahrZz9Vz/jILTYuj7q+Qq
 tm80atTUn5jdn8W62fSqQCijQA+wPTJRmRePtGJ6+yGamsBUGyA/K5MOzGe4zoa3p9Rc
 uMWlVXoBuZXHHHwaH9P23YSNZqsnlk/n/jLV1WnMfiCvdRMbpYRAzXdHZEbN5wqJ6ly7
 AbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791449949; x=1792054749;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8pknZGw+W7kD90ixQcm++TJq/IqbTSPohgdc4EyLL3k=;
 b=oNAKzqKezMBnthDtp7lSfsCCe5n9c8YnJji+hpt9mZAsU1gISpjgOTxoHLxnitKfMY
 2vYkBcwCwKWPw24umf7014GckGtuMK+GilR+EY9fAYByKFXLP/FhMgv7lqXU/+DHiz1m
 pNVEP87oQ/zt+tGtDkXyciCOCyd9jZqhkDEtKb/ppSAN+7jxSMJsbWFoYvwaVZ28y6JK
 P15hAhtSYwciHXjRZTFgXD5rB4z8LsNxepCdOjkcc7pHYK/ZhwYW5j01PiZKdzfllFq1
 Vhe+ha6xwngh3tnXpVmVAtIP70u/fPXFLjdlWIkLuyo+LE+07tBAcZcnEOvg6RTowTYX
 yJow==
X-Gm-Message-State: AFuF++lFNKyRXo0SoVm2Z6QgaLeebYI7FbisBmMpX5+18+nDT5YphyxP
 Fyz2A5Ut77HBQQKi4HkjTkUQs3g628uDUcEMVDjbyCN9rF31WKaEQ9RGMmydi977
X-Gm-Gg: AYBFou1+vjv4fM2rxRbVnXifnNY3yPIcepYO9f+5kHu36NUQNB37PaSUeD+u4BK6zta
 JU8SNw+HAJGGeNYOAOBmtGmZk3j1k9zFFRac7kivtVIuPg2oMUtEbh2q00TNr8sH8nyBwUmlSO4
 0m8Yuz+4vwgB9P9rKvUyhYKe8tRJezsrbJ0Un1vwLKbSx0IDIpkNIqEsmass+FvnvRo3d0/9ro6
 5Z6pPFj79fNaKRxZYTVIbrSTJHEUtvuFRA37QBhgzGNF9Fl3SuTHHU/uKqw58sW81kBpwhxikGG
 apFFhSufgNsb89m3aGSuMBDFu46P5LEZKyZqyChJZ/TXM12L8UNeiEixeh1+h2CsxpxWMBqPv+O
 qz4MMp71KB8WaTVsKBo+ZRk466PdiACW1mzfWw/mYtfeP6FgnPPEVMitdhKBx/w/lLaT1O7vo0d
 8r0EkoxCnx+XElHj2GtoC4ubHFqVBUyhydDn+M5zqXf/2irZIPY8Rkl9Hv+isEINbqnridTaX0J
 AkUyd837fUaj7Q/KoFVVESSoGUCfNpvAzlnqfZJRcfpzATk
X-Received: by 2002:a17:906:ef03:b0:c2e:33f5:766d with SMTP id
 a640c23a62f3a-c3191980314mr159717366b.4.1791449949022; 
 Thu, 08 Oct 2026 01:59:09 -0700 (PDT)
Received: from gimli.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c317c33ff6bsm197171066b.73.2026.10.08.01.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 01:59:08 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Thu,  8 Oct 2026 10:58:59 +0200
Message-ID: <20261008085901.2692162-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008085901.2692162-1-troglobit@gmail.com>
References: <20261008085901.2692162-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 1/3] package/firewalld: bump to v2.5.2
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

Bug fix release, following the v2.5.0 feature release and v2.5.1.
Configure options and license file are unchanged.

Release notes:

  https://github.com/firewalld/firewalld/releases/tag/v2.5.0
  https://github.com/firewalld/firewalld/releases/tag/v2.5.1
  https://github.com/firewalld/firewalld/releases/tag/v2.5.2

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/firewalld/firewalld.hash | 2 +-
 package/firewalld/firewalld.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/firewalld/firewalld.hash b/package/firewalld/firewalld.hash
index 48d80b1b87..58358b0f52 100644
--- a/package/firewalld/firewalld.hash
+++ b/package/firewalld/firewalld.hash
@@ -1,4 +1,4 @@
 # Hash generated by GitHub https://github.com/firewalld/firewalld/releases
-sha256  d441705746cf3d0a5efaad58b1b1193a23c58114162d81a9a0f4fe0c58ee43cf  firewalld-2.4.3.tar.bz2
+sha256  99d7468c22f6cafd8c72aa53173a632f2ca29cb19aec913e8ed45b6102af322d  firewalld-2.5.2.tar.bz2
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index c443ab3db4..8a390c0fe6 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIREWALLD_VERSION = 2.4.3
+FIREWALLD_VERSION = 2.5.2
 FIREWALLD_SITE = https://github.com/firewalld/firewalld/releases/download/v$(FIREWALLD_VERSION)
 FIREWALLD_SOURCE = firewalld-$(FIREWALLD_VERSION).tar.bz2
 FIREWALLD_LICENSE = GPL-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
