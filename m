Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139F1CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B886B60E54;
	Sat,  3 Oct 2026 17:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8cB8nSB8CU8; Sat,  3 Oct 2026 17:37:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 90F866067F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791049039;
	b=qsSwbt0tIUE8rtWUtQuMr/P0UoIAepzJYgOgdWDB3k3gcxYwqcNovXN80pbKdCtcAcQw
	 G2poylaSon9NSaMrmElKbSQSiwRazDNnrMI20QIZXKDxeNtvBMffQukNeHAioM2BRdoHC
	 9VYeZLnmvUB+ei+gldBf6dOcidR0+YmT9M9dYACJTDBros+6/vbBG7Y2PQjGnPA9WwfeG
	 ZXI0DBHpahGtZndMeQZra4odphZC9bt6E9rh1CL8y22b45LiTOesyLBAGcW65Kqbcqa96
	 gos0IKrjREY8qH3KMn7/dxEE46VTHNKHBYar1uvfhvq5gEabl1xTzYBFnINme7Xs7Rw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791049039;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eDkrHrcWDOZDWVw0q0K/hlhSTGJng09MvnAwlNrcUlE=;
	b=FIcSJmO29X/HrGunzdskdFWWO008aiWPgOD2zPgrRDM1xUzrZ52AOJKBYhmLLFmPO2HE
	 cY0pasNeSgloXIVSN6fW6V1YGmGLssb4Nkn8KRNLYSGfe0OkT37LPRSlwCAA/2pRCaFVj
	 msupEFtMoCIseumxCHRyP1dFTgl8fVofRdyI3M1cANEpdxReFSft87XnMYwsJ1SGLaOjU
	 DQP0d0tom1UTa14WII0/sCzVfhoNU2uiEMv7l0BP9q+bXvNtW/w3T7CdPNF3LkmrSgFqv
	 fVr30aRP+QEM9SXYsihMOfkK+0LbwxzTRjYSej2/WLbcUqKhrhAd2hLa+lHOG1ztarg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791049039;
	bh=eDkrHrcWDOZDWVw0q0K/hlhSTGJng09MvnAwlNrcUlE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Nw7X9eZi9RhyqorD2qwV/hkal0AtUyv54p98UsOULRV/BN9njw02Oeo4oJ+N0N2Mv
	 Eitu20XVK59YGmBROT2P25J1AzPgA/LUFXc9376AKjwfZInJxcXHeKcZ/+lyu7Jxh4
	 i6ZINc/2o3z9nyQWMzLgKvuv4gdzfNrnwRDZyK1/agX0frzVvZWraReaYfu6FLy8jm
	 3vUvBLmoXle6ZUfwlXXT9i73TuVeBbTBTs4l5qlk6QS14r4O4VIrQ4HGTZGCqK8eN5
	 eROj6thEBIBQ4eTzD4rElzj2jtH66vxVfRY861QRIO1XkXf9ZE1wjWUoZP2MdgAORs
	 2wfv0hwbWPzlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90F866067F;
	Sat,  3 Oct 2026 17:37:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB4E1263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91D8E810B8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9rCVmAx6AYW for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:37:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 59D3580E75
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791049035;
 b=EtbNhrSnzFVM4jNZErr01+8/I3WiCKjJvA1xD831IBsEr1ZJ5vx6fAyqJUkZoyOpw2Ry
 N+r575v8zlugK7nyZvnI0paGpgOA83dRVxVcaLULA5IrWa0RkisGfh/BbSMVon7PfNGV1
 A0DrQ3Gpji02WgxCUb3C5g/ypHq+8rWE1POGzqDUvvKLxIPQPLYfqxwPYpPz2OTttKxYF
 BUfBRgaEfZCRMDMWgyVSFtP/FLkNot6WYMaBcBi5H20brQOAS2Sy5XZgDdxLFrBwbCOql
 35mi6oyQ4WoP+n6+PI43hbyRFz9KJsHhyCEkSqf/JZseYCcpW1xOmr2AU+w4dbg8dQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791049035;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=yehgt2CX5j5RmiuLRSX2GDyDeyTDl5hhi3Rgbte/Zpc=;
 b=sBOVVrEOFkuWUfqcqZGJ2tS/9JZCYbDKaXH5kiHHqahtbKhn42rk7rO999OZbDhv6m7+
 2aeJLGzmCLDSLBUxL5HY1SV0iMrp19xXCeLQ1PvBcNDSiOrHsaJWYe0l508Dw28xK8tVz
 jf4LR8cF3OUxi+8wd7MUUY8iM5d38/EePMr8SKL9ckIIh8ztpan0QIAwJKUNHZY38Cz1d
 Jx9XOJeSkb/FVSl4SmNu99KtzWoYzkC5wwFv8IEmxvw9HscELFcEyStIYdylQ8k9poPCM
 FD+CHfOBU0kE0ss3ksGdReJ3MwHHAVztz+jZqDJWcg66ZUoXE95/8M2uZ9FMojv3MwA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=bearware.dk; 
 dkim=pass header.d=bearware.dk header.i=@bearware.dk header.a=rsa-sha256
 header.s=simplycom2 header.b=pcr+6xCF; 
 arc=none smtp.remote-ip=94.231.106.210
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=94.231.106.210;
 helo=smtp-out3.simply.com; envelope-from=contact@bearware.dk;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=bearware.dk
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=bearware.dk header.i=@bearware.dk header.a=rsa-sha256
 header.s=simplycom2 header.b=pcr+6xCF
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59D3580E75
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:37:13 +0000 (UTC)
Received: from macmini (85.191.81.201.dynamic.dhcp.aura-net.dk [85.191.81.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by smtp.simply.com (Simply.com) with ESMTPSA id 4hxtBT6wXKz1FQWC;
 Sat,  3 Oct 2026 19:37:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bearware.dk;
 s=simplycom2; t=1791049030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yehgt2CX5j5RmiuLRSX2GDyDeyTDl5hhi3Rgbte/Zpc=;
 b=pcr+6xCFBEZR2BPpDE4gkj0edsZEIB7fE/ycqeU1Lbv1G/rlmeWTZz/tSQFNFIL0Exzsx9
 rcCDm1Iyr23TKvWSGsg7gmqjRwxpclBceD4mAGDnD/0+dZMILrh8cwGjSSHp17VHjFxy9n
 Np7fH2Vvac4IhWjRQT1/S0V729caAOYbTRNkBxrbfZULnFQl2gRhjBhwvfw2caKQG+uL9u
 LUcimoHyAJPK+tVXl0OfaIv87motBMn57O82S+kFYxQTZ0Kx1dSQhkHxviGBfXsQEnJQlk
 CsgGec0Jyg/8H3ORJFN2sQDOlVbe0qGN/uFSc2tZcd4m/GCjdiAOs2OADk54zQ==
From: =?UTF-8?q?Bj=C3=B8rn=20Damstedt=20Rasmussen?= <contact@bearware.dk>
To: buildroot@buildroot.org
Cc: Tudor Holton <buildroot@tudorholton.com>,
 =?UTF-8?q?Bj=C3=B8rn=20Damstedt=20Rasmussen?= <contact@bearware.dk>
Date: Sat,  3 Oct 2026 19:36:56 +0200
Message-ID: <20261003173657.1235590-1-contact@bearware.dk>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/setserial: CPE ID for setserial
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpcyBhIHZhbGlkIENQRSBJRDoKaHR0cHM6Ly9udmQubmlzdC5nb3YvcHJvZHVjdHMvY3Bl
L3NlYXJjaC9yZXN1bHRzP2tleXdvcmQ9Y3BlOjIuMzphOnNldHNlcmlhbF9wcm9qZWN0OnNldHNl
cmlhbDoyLjE3OioKClNpZ25lZC1vZmYtYnk6IEJqw7hybiBEYW1zdGVkdCBSYXNtdXNzZW4gPGNv
bnRhY3RAYmVhcndhcmUuZGs+Ci0tLQogcGFja2FnZS9zZXRzZXJpYWwvc2V0c2VyaWFsLm1rIHwg
MiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2th
Z2Uvc2V0c2VyaWFsL3NldHNlcmlhbC5tayBiL3BhY2thZ2Uvc2V0c2VyaWFsL3NldHNlcmlhbC5t
awppbmRleCA5YmVlZTM0OWM4Li45OGIyZGRlMmY4IDEwMDY0NAotLS0gYS9wYWNrYWdlL3NldHNl
cmlhbC9zZXRzZXJpYWwubWsKKysrIGIvcGFja2FnZS9zZXRzZXJpYWwvc2V0c2VyaWFsLm1rCkBA
IC0xMCw2ICsxMCw4IEBAIFNFVFNFUklBTF9TSVRFID0gaHR0cHM6Ly9zbmFwc2hvdC5kZWJpYW4u
b3JnL2FyY2hpdmUvZGViaWFuLzIwMjUwMzA3VDA4NDcwMVovcG9vCiBTRVRTRVJJQUxfRVhUUkFf
RE9XTkxPQURTID0gc2V0c2VyaWFsXyQoU0VUU0VSSUFMX1ZFUlNJT04pLTU3LmRlYmlhbi50YXIu
eHoKIFNFVFNFUklBTF9MSUNFTlNFID0gR1BMLTIuMAogU0VUU0VSSUFMX0xJQ0VOU0VfRklMRVMg
PSBkZWJpYW4vY29weXJpZ2h0CitTRVRTRVJJQUxfQ1BFX0lEX1ZBTElEID0gWUVTCisKICMgbWFr
ZSBhbGwgYWxzbyBidWlsZHMgc2V0c2VyaWFsLmNhdCB3aGljaCBuZWVkcyBucm9mZgogU0VUU0VS
SUFMX01BS0VfT1BUUyA9IHNldHNlcmlhbAogCi0tIAoyLjUzLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
