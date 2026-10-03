Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B35CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38B6640D6D;
	Sat,  3 Oct 2026 07:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxwKf4igeNXF; Sat,  3 Oct 2026 07:06:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4E5F640DC4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011172;
	b=YBN2TCLEoo055yov4uNdkqFhypqqY0credGgsMoimBTVAIvH1tEzKY14Mo3orMBfj9dE
	 ttz4XoEoy8OEWjvaGv7WPwlZLoFxgEpb4hXnbl4R9fefuHVQqFJIlAoLUCmMSF0MqL0yz
	 2XG3G20DA1ALpa9RL7EMpkouJdeNBLqwXV4p+giFSHrm9h6tcSYbGpme6Ylg5Orpssq86
	 83/8yY5TmTsfFZCt4fXPzJrXcjE/QCTNjdyNTeAhIKsnQl1t7Z621qCE01OOd/NncBRWa
	 v5N6olE+Xam94181NEHMNN0ytddXVezzU89Amk3JDgnfrVJsj5u1i2gN3vUw5S1kkzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011172;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yamkEsrDojKZfYHSv93KTYGoHjlUgA7i9G7OZ51OAlg=;
	b=Q3liUeDY9WLg77PiEuPlxfw5MqeJMdyCYYyL3XE6r2HscjctXj6UOWjxbdBVV6NYXFN/
	 bGNjM/b4ATy0cDG7zHBgWLxmKnZ8p3hk2/q7fn/zXWBcqrTHSjcro+eK3JJuWOSy7g8b1
	 ygAVIr4I5OgsRXD9yr8qEs8LitEuBMHqXd9ELnhrnK7Sit/aMdmj8mOnEWRixO0Snx5xO
	 PAYbPFieNVuLAY/ncbtehAC2nqYEs25Ck/6BFj/ehPRNTZ8hNEqXjpiG8DD7NQQ42dsf1
	 rCY+T3LojYtZ+d4wGoXlxPTkkAliP2x5vY7fISL0h7Q0QIfjH5mnH75NUGvbtLeltTg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011172;
	bh=yamkEsrDojKZfYHSv93KTYGoHjlUgA7i9G7OZ51OAlg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Cci6iiy/qsdMTrWHw71JCR9MWxobHJPbZ4I6sVj9NrHr34iTfIYgKFDzeGeRv/Q+l
	 2lq0zsCCL//4K0QFKXk7uO2phDmxRFKtZNYX+h4he6JgcUJRrUs6paUDgDR5Dt6IX7
	 xJHDLNpXtiTC90ggb6GjGyspxXPBY+3O7+4g3rAuo8lMgN0wVxla20y8b/psw/+9Iu
	 15fhyYMawbJ1yRI+Mseu3Rux0wZHWxoCZJMLgbu1wzrUqpvkCiHOQuX5UIY1Evk0K2
	 hFoLFRl3jK270yeAurUUNgiD6U6FD3rzAPBZER9jgQHo4xgyUZ2ilLKbfy+x1TTgGS
	 0ROFGT/r0TXhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E5F640DC4;
	Sat,  3 Oct 2026 07:06:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E7FE263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2015981183
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9xxGzzGnRAJ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:06:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3A9DF81178
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011170;
 b=mol7uKHEPfqZBBeqLWPlVtGH1MuNuz2NW5v2EOdQvORCuIsJ0GbdolDZgRFKZTb5CQKB
 3XfHTRwhhBGwzu6vTBjAQ4wUWSONSyoYVt2qRxdtBalmV6vwgrDUhK+3jApNYKTVBubuK
 H8WRy9UeBw5QNS/8XMW2L1Eln9vaj2JPFu7j9OFtFRtNdsRnWZlgEkUhx0PEk8zW5Wc+A
 b25Xj9D7PvFFauVUWIvNsCrMPwW5s6wgnC55VzQ2KfO7T9AOzhN/sa62ahDWzhWRivpeO
 bU4CY76qFG5RszmgGu5aT9BHFC8eZmuoZH3VwU9SwYq24zhZJnPggpThix9Ye0CplTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011170;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZCl9pyNDgc9Gdg7NSB3ZDYCtgodLbIieCZbUNKJQ3QQ=;
 b=so3577fm2D8zfmUqD4qHM3VdkumXoDLJ1gm+K4KxhQS+qliTjieTWhnztEPz2JhmTYO1
 ocyFk/VVWAnMphjOe/3PJttNP4cAnrYcEEHFNzzsovM5gH3vTT/hTBo1nArVFmlH5Ucfc
 9jK8OEAIx9LL6FMSSSqIi9GNvEZg6sEg2XBS0FK6wtDL+c22H5xZTeq3aXo+t5R1Omz4o
 kiSsxzJUckxJhBjXeRTSCP8y5K4VyJPAptofFY+01xqGxTkPjR6RtrqCKSuqCnGM8WGAd
 2vFDpHNuixyrVq6QPnIpkNpz7hbjJgV5ZkD0m8PA6e8Jf/d2NbKlSX3Ri9dGuEGHZMw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=f1Or5bDz; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=f1Or5bDz
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A9DF81178
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010925;
 bh=ZCl9pyNDgc9Gdg7NSB3ZDYCtgodLbIieCZbUNKJQ3QQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=f1Or5bDzurWBsxOPrdXQIBGtT0wUbc2UirJbyqhRzx98QqyhuLsfKYrEaY09JvplW
 5HycTlSQqh+YiXi+IuxooFvy4TRTpX0XMgj2JotJBMVLD48sG8k9PFLD/i+Hv5+j4R
 GYtr1eMRpbyomce9cn0mT0X1YPa1oZzO3NRBHPQdcoStIUML52zOAAVuVWSyVxW6zg
 69BlSVvY5ihc+JzZA8bLuZHjO4PiRIKXV/y0i/73Djy+tR9FGql+LzCMuvu7ky1Lzd
 SEf5iv5rZK0iVO2Ez/nvcJ88FGme9y8iZCmmGPAIICO8K5ViTButS0tRprMMm3PwbX
 sjtX1tjQrx0TQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 42b2LtmllAbBAKhrjZRYCmS299+QTGZifbx5CQteAmYWhBIFXE1m65rKzxYalVIBWpbq4KD9CdH
 OqX0sZnx1danbvMv00mMSISff5xtz4HarGhWlrFplH7+wswc0Uv+zuGXq3xdGZUC/XVwVd2xKgJ
 rc/g3S3/sy6cCT87KHBAIr9Wy+VrVERg4472Gve4W1Q0J6LQzLkxzjMof0VDqvGWYpCOskvvvyj
 HfeHUmyVCItvPLAublN332KZJpdmVdJzulcjnH4wt72G/vV4O06lvC7D7Gwbthq0DC6M9lhUnsC
 /8yVPDL1TVu3IOu2OTrROLZZ4Io49jjeqpsvol0zXzd8KKUP9eW8gpV9WL/F9OkZoNbq8KmiimP
 JDTPLafFZMGnqyHQG5Z6ZHU4+ZK6Ie39f/w9zsGmx6A/WbjzVePXVQ0L5NW7vR0t6nIfaZu3eAR
 31EjASnE+M88sgthUJjW9r0oQBTHiySslOXoQAxXbEOl+ggeJXzRtfK2Z7uhQrMdOGAB6a8IEir
 FtPz0SZjWULLYxQ3ttT2GPulV1uES+xrJGGqOlE11BhQ80C8pUdveqVx5+YWENAEfLX1OGg+DSR
 oZ5+tdjKkqBcNA4MJP8fdNHpMIHmfAjoL7oe0gKvz4FlkFbXqSWP8dLdRXtsXXaf
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E6811A4C541F;
 Sat,  3 Oct 2026 09:02:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkf-000000007Zo-3GJp;
 Sat, 03 Oct 2026 07:01:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:32 +0200
Message-ID: <20261003070128.1295458-60-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 060/114] package/python-pydal: bump version to
 20260520.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pydal/python-pydal.hash | 4 ++--
 package/python-pydal/python-pydal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 89589abd62..22d0114dec 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydal/json
-md5  681d6bc922b202ac950c769164034d0f  pydal-20260313.1.tar.gz
-sha256  2df8de415dda8821f0a291cd66459fb889b28458ee6501778f682e55530847e9  pydal-20260313.1.tar.gz
+md5  21ca33debbc8a022137143d4b04dbaa4  pydal-20260520.0.tar.gz
+sha256  a1a01d28655231b7e0893ca13e9c92084549f7761042e1ae9ef70d37146737c4  pydal-20260520.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 94cc264b44..45ccb2e888 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20260313.1
+PYTHON_PYDAL_VERSION = 20260520.0
 PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/68/51/c6ae7cfa615718812f974560b24001aff542ee6739232fd689e87ba75b1f
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/20/4e/1d576fcb6857f56cd0aeb413c387044fd609140628d1c401b7ae29ee6190
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
