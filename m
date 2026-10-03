Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256F5CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F186040EF0;
	Sat,  3 Oct 2026 07:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABPcBe7Kqcho; Sat,  3 Oct 2026 07:11:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 11F4C40EE3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011496;
	b=ifdrQKu1zyXVmX5KQSL0589Uq3gIaP1+pE4YfwE/Rv/InKTls0npIkMqw1caQJduzwvA
	 Y7wv5UMeDdgZYWqvvHTWlnk4TEaa5I8tokWhlxgYW3QteJg6UHM3eQgUif2QW1EMiYIs4
	 O9yOZbtVXWzi1yIDQMW0cBI4v4M9One3mMkxR5ZDu57tZCPHdiw7FPLLBuMIcsdcLS0tl
	 /WVn7ORKtH9ne9uU1G6V7PGLCIavZ8H26v58Z5hG22BOdQkssJlfQ3VrrY0VzjZ3kkrZM
	 22Vi1iGyLpb193b6GcpfEygy7uPT3yAdgt9FG0oeyYnYbhdXKEbFAhapPULMLTPXKQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011496;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UYRYyVUAtfAaAtFd5UsgYcdfJFNYA/4Pby/WQXZRfpg=;
	b=OL5EtqsJAlqXZ1z7oUATgz14NEk0YqqN+AwrswXEOfBMh+DZXrs/kQnVyRX6Lux8WeyW
	 P4rjs/knIBoQPlEjKrwRnYrexDJFyYanbUcbLL8FmKn8euyU/CPzm1p8Ip6k5+as4/DAr
	 +6LWX/9WXmUlZ2jOCpbpirEpw9PW+eVC5jqaaWsUB2N7NniqKytCKoqUQDYbusPQsiovU
	 12bnABl2WZFJ32JYOOflCxsWA5H0ymH33E/SecheabyFARNdJdGHxWX9gueVmMJQEQNph
	 bcPssy3gMrvlpBZyvTc86kq6lFDFUcpQ5F4td5/QikG10QD0hsLoponoZBFbQ8GCutw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011496;
	bh=UYRYyVUAtfAaAtFd5UsgYcdfJFNYA/4Pby/WQXZRfpg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JXTSDiCE+Iiwbz2A28aVL9mW8gZZuBKtqcV6+7dC6aEPJJBWUZgBVfh6+cHt0dADO
	 i5fvL7i2H46Fa4B3/IMDLdr/w8FGtWdoNFQIViynxtdi40HzGeUfmbBHj2lyEL0dCf
	 UvCI3dILonAAHnoSsndYaf3GbpXg1HzRqOgNjxNfqJe8AnZtwQvGmy6ILNOsOhPkzv
	 89W6TZHAFZBiUvopNEGSJshpc1C1Gz2tAyNXvmjCY/Z3600bxbNlCmSvna0KxTKq3c
	 CErWPQH/kLxX1s+gRLKCl11QtiitasNjD2VdZYaicWWxsxQluZvVyKcXw1AwHAxV0z
	 eiOAtNP17TLeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11F4C40EE3;
	Sat,  3 Oct 2026 07:11:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A863A263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E31B60635
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:11:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cE2Mi1kPtSDg for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:11:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AA10C60628
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011493;
 b=gzekxIvgoIW+tUpX7IZ01ChroEbw8G3LY2CFgtVB/Tb5KgHRUfnnqCzzdR8+pkjfZyr1
 NjTZTdMwfA8NvSfhNLvje7y93XkC9VKRsPsOvILC6xoa3b4T8DEhpvGvJ0EqXfHHXUI1T
 JVvqJ50wASgfiJc5vrdCEQaTRTk9o44cL7J1V+bGg5/MMTv56Wy6NSxiDg7E/FcbiXXKi
 Xpyrqke8M85fIzFySSt8L7TXqyE5/5jXDE8tr5U5TY12Tlupfe7SD0Po+yh+SezSlqBBZ
 CCpGaQPRSA9Fcb1jg+bGIXvCcm6FHBJafzTnGoWIDeUge5EALZ1WwMZo1sF+J8wYcKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011493;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TV3hwGvLvrBfqrCWHOAMeFpcgyRPihB112la0/ttVDU=;
 b=kgyiPH2rXF71bYEAi/Mhle0Qjj5p8Dmta8OUYX6TeawxJs6BfV5Gklq9DTloKD+LXagQ
 bzMPiNejfBO1Mq1LILTH7/CGn03DR9FnDr46NN+9e6spSSajipSKgex6MprGYww75vP2X
 hX1NkDiOmO1zccACAmm156gSv3Dnkn6K39UuMNEsFhrGNyyT+pcUUSUQIadO3C2hGDVVM
 rcdV3zsICh8dEn4wHMWi90pcObVBl+pgCVeOjpMCFeL81jaE/HyxqpHIbZnNzxIhfbS89
 VzzVUQu7g81Jxa9KvVTF1vcU1AaNrNnjT+o1rxdt5OhXjENbWtFvuJEoVjHdRqxAZlg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=MuKwxDJw; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=MuKwxDJw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA10C60628
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010930;
 bh=TV3hwGvLvrBfqrCWHOAMeFpcgyRPihB112la0/ttVDU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=MuKwxDJw7L3gOTZaQLrUosmIyszFTI4E9BAQ3t04EXPfRNBkRgVYjLkwoOpDfNRHj
 F3Y4s6AIXFskiQztPjDvQzHriz19bYobjj2K2KNT61On8tcFdjAJsllBmppNBSeTaj
 mFinCE+k36GUIGQWeiu0h22xhYuL4G0+rdjraAdQWjufZqpApIY5An7Rf2PQRzChJL
 d3E8v0BwyaNrl6eo2LHYDpaKrYI2SOfd2AfcZr6g7e0jMPmGIgF86pf4VxqobmhHBP
 K0A836GM/X8/U0nb9Ofh30y1LJrUorEGnvYrfqmSV/jXjgc/MhujhHtVOKsC3VoSGW
 PDRKtpqjpjocg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 AWhOtMZ2lsjWx71OYiyeoaFHgvaIdH0h5XcW/B2rTqjEIXJ2yRhjEcieN/STGI6bzGeVBKXwX7D
 gWlcdXJWp+wWaEC0C1G/hIxanw/IuwhMuVXj/M2lYPLdxT3/LJ6CzEF7TB4LOm+yfE9UZTyCOar
 FXjqrWjXV5hguvLT275RWszznqhmNa2gPvGF+0jGkb6wEjV+Y/nGqQ4ZsMyKMIrtOxDphLoXiss
 HSF3s3UpHiyQIbCJN5dCAOysLNiB3OqaZKMv8x3SEtbOBPtJ+T/GxKpQunWo1xlrEvaqfFZH3Ri
 G+m2bvRw4SokzGzWOy5qGyQDL/W7IiZN87kSHEq/XXz8o5OvkaP8+OOyf8akKMHJXXoeD8fp3u/
 YlOsfsvUHjXDVybQzYm1IQ+Al+NfZJg0LFxZLgYoa+rmVG5JcwQ5n3Q5xrTtE46yOgQhIoYgImo
 Ir058EZTNjE7uf/gzogW3a7SLmvWSyNZHQ4BdyO64E+JSuSVoh77DTWX9fdLXw7d6MujQqqMw2t
 KLKS7LtJuCjHNiRX6SsnpnTGrsWzIcjqbcYXCLHobFuHnpTUb2JC1vSK/0Ng1v1KHUte1yyftfC
 QFXnKfcblOrklGYcf9ZkODPaUfnWt5+DPwyhzNMaRCnLYw3C8X5WdQNt5hvE2GaM
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB074A4C5439;
 Sat,  3 Oct 2026 09:02:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkh-000000007Zo-3LlI;
 Sat, 03 Oct 2026 07:01:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:58 +0200
Message-ID: <20261003070128.1295458-86-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 086/114] package/python-sqlparse: bump version
 to 0.6.0
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
 package/python-sqlparse/python-sqlparse.hash | 4 ++--
 package/python-sqlparse/python-sqlparse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlparse/python-sqlparse.hash b/package/python-sqlparse/python-sqlparse.hash
index b541aec42f..b0bb518e72 100644
--- a/package/python-sqlparse/python-sqlparse.hash
+++ b/package/python-sqlparse/python-sqlparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlparse/json
-md5  2023800dc264c2fedab3250a8eb43995  sqlparse-0.5.5.tar.gz
-sha256  e20d4a9b0b8585fdf63b10d30066c7c94c5d7a7ec47c889a2d83a3caa93ff28e  sqlparse-0.5.5.tar.gz
+md5  900c83341958cb0a16380b204f2fd748  sqlparse-0.6.0.tar.gz
+sha256  113c35c75365ab9cc9c7231d68c6428fb11c085fc8e9eb1ad659b7ddbf6cd2b9  sqlparse-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index af1af475d8..6dc7b59a96 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLPARSE_VERSION = 0.5.5
+PYTHON_SQLPARSE_VERSION = 0.6.0
 PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
-PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/90/76/437d71068094df0726366574cf3432a4ed754217b436eb7429415cf2d480
+PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/5f/d3/3f06a1006f2261d1342aefb3c71eed02f5d4ca5bdbecd86ebc12ad38306e
 PYTHON_SQLPARSE_SETUP_TYPE = hatch
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
