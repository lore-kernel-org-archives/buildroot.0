Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10213CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D293540F3E;
	Sat,  3 Oct 2026 07:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPm-8Ovbsa_T; Sat,  3 Oct 2026 07:13:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DA73240F42
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011594;
	b=EuP0uucnUZyeH/YqZPaAsT1yRe4UEYeBPOPdU6Qp298+BZuVkco5by79khoCxdgGjAyE
	 tovi1ftGKGmtCy28aMyqws2Hh7wmiAmhvQnWV64iOqojRkDasXhDqddpbA/XFbzqCN54b
	 8vhdKfTDcqYeK4KYtcczMMyGyxeNIORhp2WxOP38C5/Dy3+nZAJA8rtAOB3JwyK3ZmFfH
	 WrU6aM40wQdn9qVVhbSfen28vJfodW4Cj52rd4fmj2VvuQVLvve/YBGnPstlmc+Poi5vT
	 Cjx0MlqMAOtUkkSuUvN7LCIIBAfHo4HdFwhTaZBCV2y9hyxRPC2lxFYrWXuEnOUzgVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011594;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gyeMauCFdeHFbweum0/PP5rUrZyQkgm3Xi60dqzzF2Q=;
	b=rmeBvGnc3OhF9ziML68yTFKmjir4qULZjBqHLFfkiBfdgMXgVNWsvVS9w5yFbSO0Cx9n
	 7efiLVi1gQeihcv4Vqmmne2UtIuE5KNhY/MwLtnld2pakcFfhzZ14gQNtnmy+M9X5wZW7
	 mo5CvhL56BIaB1xtw4nJBHbJNek20mRsW8i6h7Vyfy7FW33ybPBMEyRbwM+urEw933FRX
	 erLQB6UBbia16u+5WsyqtM4w2YIW7hvUHjga0hCMxN2OzltsM8Y5+mdYlBR6HxQzCpkvx
	 Eh8UuR9wowgjXpLirx8Gl0tVfsI0hXw3lT8qCK2B4zkxwA65jJdpkOBjxJxglaLhS0g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011593;
	bh=gyeMauCFdeHFbweum0/PP5rUrZyQkgm3Xi60dqzzF2Q=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CJWI4osy3G0CUWJY6IQGPImjy8chLYB8Aohzqo8ifkCHVjtrkuruLZ/rL/hGQqLM7
	 1tGCBZfMZlsIzmHR/XVDjHbcNS/bfGAPJhM3drPL+SHsX1ZOVyTO6EspacM8z3Rtam
	 49NO+YK9ycoh9fDDlAu1wHHBGWDQaJM1k/9LyOmik2fvr+mT2Mm8M7AgPKMQqn5Yvd
	 U+vXHUMNxQPii5K2RMLik7azVK2ovyeFsTzL18NnrcK3ACUFkKNgHWWzAHfmm1X9ih
	 mLegUzXY9GCAleCrL0c/BjKkIZboBLwCO0KQsy9uYboDn6tS0tUOVCCyJBZOsVUcut
	 Qo4CPbYsZLJQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA73240F42;
	Sat,  3 Oct 2026 07:13:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0069534E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F24FD60643
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHnHAGCSD6lm for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:13:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1B7D06062C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011592;
 b=mXApjfJDq41Zc/ylVhgiTD4Qdtpa0QAuAQRWkvI54crWwMH90FkID43wW6SDWANwkMZM
 3bootdgP0yjFcMNhUOH5dkOeykLqgTFbvLIRvga44UXLk741NvaseXAUt0XAyQna/0rqT
 dvUbFTY250CgAwcGTFLnMpGrw0kbTTYGLNUU83RYxQwKJAGTer0ylbaVJN4dyPXlpypqH
 B4KrK7Ipb5A5x36m1j1eT59VJCCkDim/TUINCG37KxEBChs/J35TSUsN0AANy7y/rZuox
 mV2AZrP2qwTc44eOqjBDwrUIW4l7LRGDbC/4xQ70JiSMDuLYgnR6jWUjjanHOQpGEVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011592;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=tKygjml/F3XoTcI9YOcHaYjrgk/Eyd4djeRj5dUZF28=;
 b=bDDzbcu6rcDWK3QGL2nA4nUo3YzYCEmcngQ94hUKTPOmww4YbiVokyqrzRbHwU8Twxf4
 1pP+/trSU7OrovZHEF/b8NS10/3eNqlju2Ulw74+trTvYg8gAi8xS/2DWNOAeHpG8PcBc
 lXFY8+KWob9PFi3crHVpp1zEY8anljt3Q+bWKpVb06r/UPJyYQQl7nf30eKJnO01pevMR
 bN6T8a//4gUJjBq21X4lIvarUxbQg0A8+gmv4W1BFaKBa7osflFdomJbQ3K5PhbF50i+/
 FU3vbHCkBlsMn5EeGEwl2b65UtMghu/w7Jsbr6K2FQTYxdUN72O+p1VHmKrqte+DGsQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=DLcbGElX; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=DLcbGElX
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B7D06062C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010932;
 bh=tKygjml/F3XoTcI9YOcHaYjrgk/Eyd4djeRj5dUZF28=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DLcbGElXz4lUrLwZnrR8hoFfqvyfyBFIxtJmYAVFqzDvIvqfSY9mYUH1Gr95w/WTF
 FEwojeZ/4SBa6JlX8x7Ji4p8LpVR7idRNlseJ54zg/u2iNF4fgSu3/W6QtL+tHp7sS
 499Soq00JmxPnLClLuY6zUBOIxWF7GLf3F6jy9OC1gDkqiPucxrA9UaFL9mcYRa2tw
 mtS4BzFQjQgisKsykhdmvBhIh5QH024BjBEEbxvYwBjmq/y+FlnAje+v3uh/+xOTiV
 RM1Sc62RZ8g2Ir7Hn6ShwX3vgGS1Px5hSEieTRgezQlQ/WWBMFtGEaJjZuM0PSE9GC
 GkpTVmfHLfJ7Q==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 vehCOFwrtYaZ1IatboTw15LcErUASzNvKR/4z0ABtyMZgsntNvPK6J+ezszBAvWag3TOZqeLIbQ
 59MSsWsNecn3sJfH914usVTbo7zYPahH30Dem49+sGISS0shwctv/tiF7ivDP4WNguRmOCoExUA
 6ZoTHhDGm4W9oWfS2Xxj4L0Cm6d+yr7lOuX7e0jUuKZZt6221ADtWMuVkzC/IqEwSS8pg+0fC2Z
 Dby7mIrvyuFlR+XDdAMiWyBqK0L5HTk4adt+kiuDSVC6ZXVF7oUgH2X7nV6ZzMnVwXKI9svXXXB
 K2OYHeO4/nJotXyE5hy6JySfeBuFuAONrq5ZIvOkKuF894/uG8IzeD7gOxiPe3I3ZPlfu2bt5qW
 1zYhJ6ArcYApMWfQT9MQq+fRkyTiSZBlGdj+JU9mXcBMSMbnLq7TYr6Awe2d3q14fdqIQTF+FJM
 8/y4qGXzUXpP6waxEAq0I+S0LTAWxTUXjQ5sgMaBL8OZZBlPzOCceJwDlRpd4VyBeveTtCuHxUR
 BhU3ZkuDAWA2eo/tZ+4F4WL/1/wZ57Yy0FUduIQ79e/PUHNTLFs8If4GUqvOPp1IzXrLl7qHh+Y
 qrAkSB/K4JwZeqQKEHvESIj4kLchH4XtN6V3oN7Wz6hde0DMh0s+ZIG8QTIoyYHf
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 59C39A4C5443;
 Sat,  3 Oct 2026 09:02:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtki-000000007Zo-1iCT;
 Sat, 03 Oct 2026 07:01:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:06 +0200
Message-ID: <20261003070128.1295458-94-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 094/114] package/python-treq: bump version to
 26.7.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-treq/python-treq.hash | 4 ++--
 package/python-treq/python-treq.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-treq/python-treq.hash b/package/python-treq/python-treq.hash
index 0c2582b4ba..18aa98884f 100644
--- a/package/python-treq/python-treq.hash
+++ b/package/python-treq/python-treq.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/treq/json
-md5  b0a3c2e315375388e820019afc59919d  treq-25.5.0.tar.gz
-sha256  25dde3a55ae85ec2f2c56332c99aef255ab14f997d0d00552ebff13538a9804a  treq-25.5.0.tar.gz
+md5  eb16ad46a399062514b09300635f3b0b  treq-26.7.0.tar.gz
+sha256  43e728e12aca2d897c626cf07dc7b4392749b73de050a7d66e086cb3a6e15da9  treq-26.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7cc1b65e1937b1cc07052bb864ec96d8e5fd413400c0842e5b89a8201a600293  LICENSE
diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index a8e451731f..7ef7fd38c2 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TREQ_VERSION = 25.5.0
+PYTHON_TREQ_VERSION = 26.7.0
 PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
-PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/ed/7b/b9dba8d947584481aad7e29b01f2ea6bbe794a0352e0cdb68e99ab135c31
+PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/92/13/96aceb81d076eea518bf174048db701ac8b139c7aed1082913318a55a7d2
 PYTHON_TREQ_LICENSE = MIT
 PYTHON_TREQ_LICENSE_FILES = LICENSE
 PYTHON_TREQ_SETUP_TYPE = hatch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
