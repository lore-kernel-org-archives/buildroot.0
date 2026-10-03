Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F2ECA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F4B560E8E;
	Sat,  3 Oct 2026 21:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfcZ94jEV0m1; Sat,  3 Oct 2026 21:09:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ABC0660E5A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061752;
	b=Rsw5RM4zVA4ZFvBf1cmjlJgFDp2dg1ud0SAuEJnCz+CJ7/1OTkwUzUKSMoqw4zoVDnX5
	 byK7dUk+fZSZbtb4WsgAedu8ON/wt8y5Nm6KxwFt8kzrBrYsUBhkyEIMlbTN6XoDlJx79
	 WWV6GgFVksMZKIxH7d/1gG8xcQ70xIt2/U8OJ9O+2pFtquzubd4r8InAea98flThoUrTh
	 V3lJPkj9mPzWI1mfoINL635BcB3bK+xbyFsv8I01B406OEK6Mam5sl0Xg7Ib5hZM3PgPS
	 Ao89ZiW/dxRuwHUVzk5Ed2iBX591Qh4A9nfF5mf1wOWnaGlofYbLL2eMUW2ytIGnFsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061752;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=X4RDhOP7B40GR2Gu2Iqeq/JwByaYfMu4RpIPSiweyFM=;
	b=h9pg/vFHcGnDfnnOSG2j/0IL2vCGVBUt30PlIOzR0X2DwFDMAtb90t6tvheswNkue/KJ
	 b8ACQ6hnOrQnUYP9KrbQZ47dpvGskxVw9jFjxYSk91rmsY8Ac9aOQ4+DLchp3vSexyPF7
	 cPp1rRi8uR3FjE8nuarfj1z3BE3tFSfQ3dTlcpdHaya/IedZoe9AvnY/5W3MpVKQOdkuc
	 HDDWDZbE9od9SAD8FTnTETYv/xoRZBljmlU+V1V1vyluvLW2LHmiO1V2Umhd3XfQ8Xngs
	 EQPxp51XghkQKNy1fhJnFdDa3IBu7xwV6O3IWYDbOnymQ+gVnIofhaH1k0zIkX8UpBQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061752;
	bh=X4RDhOP7B40GR2Gu2Iqeq/JwByaYfMu4RpIPSiweyFM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=rXIXn8/I7Fdml5TIZg0Y71CbuH8DnA46SoYLBGlQxEPk6fvKI7r+4msHRhQikpBS6
	 nKtvuqh9k1HoQm/VSwGq3InluTxbtqtJ2NeWi+t70lWV3MMmlpmsx+EhsgJfLF+BYv
	 3768mPlCkHRlO6lv7Cy/5v5FrrJ+L4MbOq3PNftScL9+X/08d6UEI4nfcx5HVnHtt9
	 LKp0cPr9gyqzjahX3if/d2baRy3J9FwVtSRWnbj5O059vrc1dKEtNJ7+htyt3yIChi
	 9GWhnqexb5NdIC0cmDXVqOTJC9KRfkVRCKS3GwLiHIxkymyKsAyZSJNJAVqLl+Vzr0
	 2OXz4hZ41UwRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABC0660E5A;
	Sat,  3 Oct 2026 21:09:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3B4D1A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B18A140ABB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdfUlEo6CGK9 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:09:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B0DF040A99
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::28"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061749;
 b=heYuW71xDp3IocivZyJ2HE3iF1c5jjirOUJ+RtNXVjJ9aQs2qUa5WYe+7JpQSZPDNypY
 85/idaJxXPMi7xF8AHh+hpkfa+EEo7GaozBiqwqjFt1rzSNR00VRXIsX8Ki9rSfdCVvoq
 bcDKVujnaA6e6wFhFItNIrzvl/kI9xX4REM3rxqxiQEzngD4UEpLW+5w6R1tsO+JSippg
 bDAzscttPGbHSYsvgKCV3kwfobk9W4fhWF+JYzQS62w2JbGPp2vpWZxW20LyghTtb4ilM
 a1L73Ji98zOHFQ4gaklE/iXP60lRk65j1f+6nAoXDusKC4jcO24T05uDfah+xlvg4dw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061749;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=XnlCBJ3BzHYFjHtOphxqAQD3YuEQJVypacHfeu7CKkc=;
 b=p3iWR/+OSEYmQKnxFs29ke4EqSLO5KzTm52G1USsnZrwbTf9wHtoS1HvnQSbY/+YzVP4
 hx62mB0M17+ogxrKjMQ0h1eUASOMwz3QwQDyuBEGyyyUO/llYr1pY3/k3nAfFsE0jQb5d
 scg+6Le/a0x33EAUiyzLv0Jp5GPo+FuznKrtZmc/7WeMushujj8nrlMn6bfhZNyvsIi/g
 Rc5msBM12jM6XRrjrmjOF0TbON29qZx0++V9O2qu5Buydcv0FT8xEWFqhPILHlTAA9Yc3
 8CmRu8PscFl+fT+59IGoxhdZTnasgLFpDpU12M83GuvGheFTtQZVwPaRUP00iShVOgQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=l30PN7Z8; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::28"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::28; helo=mail-oo2-x28.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=l30PN7Z8
Received: from mail-oo2-x28.google.com (mail-oo2-x28.google.com
 [IPv6:2607:f8b0:4864:31::28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0DF040A99
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:09 +0000 (UTC)
Received: by mail-oo2-x28.google.com with SMTP id
 006d021491bc7-6dcf2ba1fa0so539038eaf.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061748; x=1791666548; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XnlCBJ3BzHYFjHtOphxqAQD3YuEQJVypacHfeu7CKkc=;
 b=l30PN7Z8EJtMaEkP7Bi5X+eJp7q0T7eMQW0+AjnHQn8TiMLwBqz6j/+eoAdHHfHBhq
 Gxf++6ChC+fJ7q1cABQiMxi/U2ZfsT8R9jsWXLNwedie5v8s08dWjHUbDANSDUA6nFjT
 GR4LthQYq1Ikx7RBLQwjwGR40WEZ0YdDKdSB24x1TNm1gfzY7Zu6wRXdQDvNjeY9QwCG
 KqWr+7ZHstFiRBMknhSltwMWn5yY51Ts0zG6EKOeQGHAEOU+73Y/M+Iv/bU+PmYvWtSf
 e/aiYLspoErrQaNMlWie3AAqV1qDTGGhLpNFG5D3kkJ+tiT6w9LO90ou+eDcUwOsiAf3
 +x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061748; x=1791666548;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XnlCBJ3BzHYFjHtOphxqAQD3YuEQJVypacHfeu7CKkc=;
 b=DhawvbBstIOYl1/eXU7C7f+tdjrOz147Vf0YGEHNobRkZpl2+ThqkRlh18L5FcRbmt
 ymXs13PLY4koADXMIITRtnkzYNbw2Ng8pWbVaB8oibJEClacEoOleuX/EAbLljc9BmUT
 yxwFXOeFmuRJWFMqui+M4o1orMpB5rjsnRwT5XRTfuTEEXpfTiLL1LdBSmmm+BWkOBx3
 UwzdphbC99m3Y665HpBqf/6UGV78Yd269eDcpb2YjEnNYDkZQAD69mHHPrXP8gcbUPkO
 Hbr0AaQ6yszblCmhVafC5wzro9eDPaH1PvjwKnvF8daWjsTnpucp81RqA/I7YLBxNzsY
 rZmA==
X-Gm-Message-State: AFuF++lVQEGF19so2v5pj60PA2b8WrFW19dJCIxZfZADoaatt9fA77Rf
 gUlTk5S/5GZgaKBfbSHT5YzaxmnYWEyx+YZrVrz5iWUv2Bn7bqP1lJiwCKNb1g==
X-Gm-Gg: AYBFou2RNbaG279M7/fZ4KPQGkbYrWC2W7hsrJ9/Nz1Sh4ZOwcpNkAY1Jll/48514EC
 Ddf4BSWHxqw/gdd9WRzI6ni4ahPuOJ52shjOGjjpzW4DkN/hk6CGIyde7Nmrm7IvrCKmtty4dFd
 1uQ0ilnhxiNARmm9hQBzCiFygmuPDkIGg30+mlqLdblNdXfr7FDHwVSXDM3cTPWyqQ7hLuYATwH
 QrtUINPq/DTB+STTfulZzQzezd32JkTJNELvvhFkSAsfVZ9abR8SfmCjaOpJVH5Rmaan267WJNc
 jLEmQObs0Vd4rhel38edcpzJ4wnOMY7dhtiR0TZFLso3r7I6mEV21DoMYUBx2Bm0rLFhw1lceDO
 57rIwdXjCNKPgR90gmyZyU8Wzwzyv6TEWEhFvh6F1x/uk/Q4R3bLnYg5j9uS4FO6yELteigCe2I
 QrtvW8/KjynjsRzJp9R/4OkVO6knDGzWg8n8seNbkvXY8NMlqd1RzjoIXX4e18srobNia0Fmq3Y
 o64/bqeTZJNGytIlTEXc4t6WD9YvNad2jiIgDnPCm1yDzXyVYnFOFS9v7OizotAzGtONKKxJL9T
 wSlAWWSqndQxbsVUEzYkmtSITMEzYPd+Ms8H0gQks0l+p1KUOwzbF9ufgvcBAxOe/EwP5izA/7j
 YBVDkk60BNADAMwnteqb5a1Y3lP08Q2+Msa5L8kPUoA==
X-Received: by 2002:a05:6820:188c:b0:6c9:80d8:a205 with SMTP id
 006d021491bc7-6df35c3a0d4mr5439504eaf.66.1791061748453; 
 Sat, 03 Oct 2026 14:09:08 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:09:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:08:07 -0600
Message-ID: <20261003210833.735937-17-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-ruamel-yaml: bump to version
 0.19.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to copyright year update:
https://sourceforge.net/p/ruamel-yaml/code/ci/6846cf136e775ed0052cdef6ff02330269c86011/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ruamel-yaml/python-ruamel-yaml.hash | 6 +++---
 package/python-ruamel-yaml/python-ruamel-yaml.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
index 5f7c758070..732182a146 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ruamel-yaml/json
-md5  6966b2f273bdb08cf679f521fa0da4c2  ruamel_yaml-0.19.0.tar.gz
-sha256  ff19233e1eb3e9301e7a3d437847713e361a80faace167639327efbe8c0e5f95  ruamel_yaml-0.19.0.tar.gz
+md5  705372657890e1641fd7b5d07cc1f615  ruamel_yaml-0.19.1.tar.gz
+sha256  53eb66cd27849eff968ebf8f0bf61f46cdac2da1d1f3576dd4ccee9b25c31993  ruamel_yaml-0.19.1.tar.gz
 # Locally computed sha256 checksums
-sha256  0ce9ad6a9d4f0829296a72c77d07795dd67f42751e2922be56c051d39ae1c011  LICENSE
+sha256  3e7632bb0dc1150f15f8161f5eec48dec8a99aaa1dfc9e8f63c02931e0fba7f8  LICENSE
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
index b1f7a3e039..33f66f7bc9 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_VERSION = 0.19.0
+PYTHON_RUAMEL_YAML_VERSION = 0.19.1
 PYTHON_RUAMEL_YAML_SOURCE = ruamel_yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/0c/5d/8a1de57b5a11245c61c906d422cd1e66b6778e134a1c68823a451be5759c
+PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/c7/3b/ebda527b56beb90cb7652cb1c7e4f91f48649fbcd8d2eb2fb6e77cd3329b
 PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_LICENSE = MIT
 PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
