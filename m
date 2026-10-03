Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D96CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3342840E1A;
	Sat,  3 Oct 2026 07:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3OV_2u9Xteu; Sat,  3 Oct 2026 07:06:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 44BB340E09
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011208;
	b=WboGAXj/96Z6WsI6UEe4shoBvc60/2Tfhk3qdv8Ki7P8sXGkLRU+iRjgDzPPUt3Uqz3Q
	 h2J5VfLMY3M7M/mQDF2+cf2CSwlVmW9hrxAHt8+WrinwccdGyUJO7flDQvZleVYclsSyj
	 9gd/9DIR52MHBM4mb9/S5J6arWeiOyFYxyx5WCCtwiE019WwQYDGiPQbtk+h9o85Zqa5B
	 obMF0ZnW8A0GEdFtxvZAmbXRxYOBmzkqE3fFz4zRhoI2hz9033U2r6VWllZ+7KPU6v0x+
	 lEOjf2Df7vQdr3fd3oYFILUz71fCAzRRF8ABoRYIXRMpy60dP6+LtYAfNTFq+O8QTIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011208;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fOZoxqBb9Pz8I6IQOCWBtUbHUbQWywDLP29HyLesL6o=;
	b=m0ynAEy+Gop+c9wN40d4jZuBlf/W5F5/X44fyImd7XGGuLjmon9azmEXK1wQK5EhdrnI
	 zBAP8LMtwOeQxPUnn5qiIhr+x1rYI7TwIlg3FAOLb2eYH9WtcHcRfIMSOCRScxIiBLHbn
	 JvbKU53o8cSkavWcHEqSOJFOWVyHIjAWD/3r6v2UtIuhkmR/+x48Kpecjg8m+ooIzNqma
	 MuiFwwVVCYq78wIdvpTfJfb8rigJrVxLOrg4WF2FrcZw10370EAhz0KzO+bXQAVve8IOV
	 Q58g+8kbtaGqWQTlItu+YyGTjYzkQUHm3GNr+Rm1QUK3ufOPC0nU2Ar0xYdxJMBljyg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011208;
	bh=fOZoxqBb9Pz8I6IQOCWBtUbHUbQWywDLP29HyLesL6o=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=J2F+L7R8L2XkgTXKKiybVY1qrNz+7PiTzAlkJEipFgzBAnress9jxecNq09X1MMSu
	 gEmzZDVOYh7deUmWFiOTGXEush/zw9j6mgD7jAZJ1AIooUKa2ZihwUVu5YoTNVYhFp
	 Bm00RKr6wIzxzW4qngUMXfz6gg8Smsv92770H4ZMZIgdH8mrIK27S/4Wvjfj7nBavx
	 Q9MeQTUtP1Et0r/m2463OchC1PWvwNvA944oIV3WFrjj25ozEi+Qpv2iFbAceUla8e
	 rYqX50u1DD5eEov6d8JCkmFsGvLxUXJL/w1vkHVE1aN+56x26PzhB+LPXptwn4ydvJ
	 E+aSK1+WmafGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44BB340E09;
	Sat,  3 Oct 2026 07:06:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B9A434E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D53C60633
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_y4QZlu5Mi8 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:06:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 664CA60609
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011206;
 b=Io2Unf0yie6OxbZmf2gIIhS8px5CnT4Te7XknE2lddsDcbQpdAb4h673SbPcthBpsmBp
 bp2hdtFEUqta2izzIDjxXm0SqA6sKdLGz45R1cmLpls5ZhJQvzpbf4HvjVWbMiftajlaO
 KGstZy6nXp93ZzptULd7SChKEEUwjTT340xhLvjUhOJ4qJKNPuHEw5zLHvwMgAHemsoFs
 KA4YQMJxqQhFlcwefhTN4WNPw3FXKZhH434GUdUj9tVi8VnVI1pEsl3YMsZnZJ/Ek4OyR
 M5KK9GUhHuclc8FcJ6uD/hM9AlJ8pNpjFCt0TLXV1z8O75GTGfN9U5PHwYT4rZuGBlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011206;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qpISMJ+/4m3vuV2M7c0IBLz+06/R+7S1f4Cz0C3sbOU=;
 b=NlFJp73sylk1CjvAbzsYp9dZiNmG6e2Idt2fSC0K4pl9aSJX9Z3aevLA5rPp0VkCta5Q
 nfN285A8NVYBqNWpEeOnRGh3y174AYB1xERKibti8Pm8Q6rUj8FEXjFwWDiIHc4Spg73M
 MzgC+JjIdtwte4Fc0TD7NBgVB9kR5OeZ0RUj252PZFc1QBqTiwL98yQEirCWlvroQSVML
 hY7kgSVWDFxqjzD6easU+KOyDSebFkH2vP5BICMbNeVhVA7TyxwCPpbOCtWTL4TG0nzHE
 aeWbylg/T5puzm08a4xLT/CUL/PHxHyGPKJT/vRY0W3rtG/8kDKKENStNMp0n8TFqzA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="ma/PSu3N"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ma/PSu3N
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 664CA60609
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010926;
 bh=qpISMJ+/4m3vuV2M7c0IBLz+06/R+7S1f4Cz0C3sbOU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ma/PSu3NfyfTU3DGg/IcBu9walnreUqz6gERLmrA6GNFpLe7H0CbuP8AOoGa1vJd0
 60ZkEe7mAeVkvifhUPhL7d+y+UdLnD1F8GFqUqv517RduiFmCJcmZoXSdcUy0bjYPG
 0BMYUJ6zrpQr4GpoGWSooNcO4o7r/GDuyGCQoaYj8dK9mwZpDZR95RjxCmB7/H9CQO
 RfOkVORtnG6fvQNN0vjxI2t/bEspMvu48PFKVIy7lKDq8LrQ6VdBYlat7K2zjHGpUt
 E9PPIw8ELonQE1raYitMcwojNOqsNYkGvECMZcoa6B94ghDP0Q6FT+dKpVs5TpeFBo
 qw3KdWJeHjzRA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 v7cAL4j1mB7eDLjbbK9wQfvqaGCxwQBqjMyTFYcy04TwifduJ8AuVvOgm7MuxOiCnT5uCwwjCUO
 IhxxDsUx57SqLicdreLMB1hVwTVn3SjlgxjK3baupQ7R9LsJdFKN9/0mk5u9tSmqisU1JwZ2LWz
 GFtSPJ/mjs4qg7VB/O3qtkyQFb1CKfhdc5Cjzf4oXrSwA97Ac5UdcHLs+g08FbSUJ2kdSk1kGG2
 SDtLXRQDCiU3Axhe7meaFLsPLgTTamFEpkmjWKUD6GFU/pUGvmge+rdSeg3fugf4pCOiDJ0thjv
 eZtCvF2d9GGtTYAMQMKlOJ0jNFsPjfA7jASxiQt5mrTSeNxid34Gu7dTEIZyDrguCyMgqFdTNy8
 izxYRRAUjozYcpbtC1Dk2GuaThJqkJIJjuLocivG2w6QQlBjMkBZRaqREsNcG2XeBI5lya+En0d
 49pi1V/x1MbgB/wfpvqgKpqyJhNk51QfuXGIsZIz/BuD89v/tD734EPfyURVkKhvpdgEciGhgQa
 /Z5MTe56OZel2Yb9X52R9S+V8GwYKkeCvwfgQyy7f1ZPlAuncla2uJw36lQZAwO8H5MjszsuKW6
 YAPkiS7A1k9fOnCMr8EmOF5giXvN3B/h5ZxNiiOntdGP2lEXBUQP9knzjoGKATxj
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6EC22A4C5422;
 Sat,  3 Oct 2026 09:02:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkg-000000007Zo-03sF;
 Sat, 03 Oct 2026 07:01:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:35 +0200
Message-ID: <20261003070128.1295458-63-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 063/114] package/python-pymysql: bump version to
 1.2.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Steve Calfee <stevecalfee@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pymysql/python-pymysql.hash | 4 ++--
 package/python-pymysql/python-pymysql.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymysql/python-pymysql.hash b/package/python-pymysql/python-pymysql.hash
index 21f84af741..e08aa83435 100644
--- a/package/python-pymysql/python-pymysql.hash
+++ b/package/python-pymysql/python-pymysql.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymysql/json
-md5  abb9c2e708ca71c6534cc04b7e4a8f86  pymysql-1.1.2.tar.gz
-sha256  4961d3e165614ae65014e361811a724e2044ad3ea3739de9903ae7c21f539f03  pymysql-1.1.2.tar.gz
+md5  fc45000cf0191d5c6a22fe01e7a60302  pymysql-1.2.3.tar.gz
+sha256  d5b288529782e536ae171866df3ca9dc4f6cbfb3cc2f18e6f837fbb90dbc262b  pymysql-1.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  314120dc65f0800f738a4b31400c76ee14decd1fbe77ce9c3540a421b86ea7b6  LICENSE
diff --git a/package/python-pymysql/python-pymysql.mk b/package/python-pymysql/python-pymysql.mk
index ce848d8e1b..7459286517 100644
--- a/package/python-pymysql/python-pymysql.mk
+++ b/package/python-pymysql/python-pymysql.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMYSQL_VERSION = 1.1.2
+PYTHON_PYMYSQL_VERSION = 1.2.3
 PYTHON_PYMYSQL_SOURCE = pymysql-$(PYTHON_PYMYSQL_VERSION).tar.gz
-PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/f5/ae/1fe3fcd9f959efa0ebe200b8de88b5a5ce3e767e38c7ac32fb179f16a388
+PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/b1/d4/c15b459e25a23767d2f4065ef40968920320f04e302889574310c21c96a3
 PYTHON_PYMYSQL_LICENSE = MIT
 PYTHON_PYMYSQL_LICENSE_FILES = LICENSE
 PYTHON_PYMYSQL_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
