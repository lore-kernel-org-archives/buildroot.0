Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A482BCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72CFE60633;
	Sat,  3 Oct 2026 07:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CccOZAlPF5u7; Sat,  3 Oct 2026 07:08:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 84B3E60621
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011331;
	b=TLClu2A8CYiXKvV8QF6aFMW8CNhL3z2vHWXammDAPPC7HDO/Zq7MtuUxguLqWyAl9Mw9
	 HRTOH3BbuUh4p+WH2cCUEI2LLiptjKY+GeL+vc80kDLJ2u3OKyU+O/uE45XzDWV66vNem
	 7kAisAfWqDw2JyVlEkI+iCZt7LxYqi4PbZVksutshRYHtNWIHMtDEO1sYgasijobQ9HUV
	 2zwO7Chxb+A5es5MEKJh64MY4jdHCaBVP9o6cEah1ofL4PnWbMsv1IvFjo0W8GrYzWDun
	 zd+4b8XCm6+MiaDZXJVoKvmRJIwI6Lfa1XTFJT955PwM4KYnb/I6vFJAcpbXOQRLwew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011331;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=S0CY0va5UJGFUlIrQtZ25b1pUI4RSZXTs5PpO4FRF/o=;
	b=FyfdoCT/UjSA46wTw5bJFTQruj5tV3wL8y5YQ8DqPsTEmlEuKH1NkfNFDZYFOaKaHlDv
	 vWVztOGZzPLvYr+5kI2Bf251J4tJ5ob7kYV/f+jyFuNpDgrPQoXkB79p0JBtjF4b+nwb4
	 wVbeWr7F1iL0HXSyT+ygUbWtNZSbz1Gp2HMFXtO1VVC/IHSohBvywbvRZTcfPW5pn16gl
	 kzxEjyTgn+QUfs+FIjxIIUE/0651RoqyA2A2W+0xGTzgNQNekS8PC7biMzakOmwmOHFkg
	 UlIZUMezqrN5TUmb3oFAhMjRrlGCx8kL/93WYUPwTLKB0J5f75SEh4zE9WoQTHsPiEQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=FvZX2MaC;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011331;
	bh=S0CY0va5UJGFUlIrQtZ25b1pUI4RSZXTs5PpO4FRF/o=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=omOMl4wJVwZuUUB6FlscXtGVmnf2kmDB6iLjH0tZIoowTBRDjk1dWYANqvEHY2Clu
	 fsPp3iwNwW6THw29p7Gi3rBkR245gX+rYy9UJFz5nhN1UV9NVPxAWLoC/4vqousJqf
	 i62sPr6A6RpfczvkwY4WML1Tuy42Nw59qgojqw6sERw4TJEMm1TGdUn0gumJbtyYm5
	 IpkEl7p/JEeW58MQMl1oe1GBrUoRvAr2gvdtB1OAs9sLaoa7k+BpWr8LE/KvMKe7Dg
	 Y9ntW8L62oEfRBsAFgDILUU5RCg3s0roThkd+q/beeHTSZnK81ZRk07j2TegEGyqZi
	 OsRxz+7aHRKbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84B3E60621;
	Sat,  3 Oct 2026 07:08:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85A2E34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BAE360622
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wwpqL92UFX8 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:08:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 85AE660621
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011329;
 b=QZkJD8vV0aD0lYgpFuMtbc4aUPWfw3XlV+SYFQwdtqlOCm0Xy+IWU7kCN/4K+F6TWOWk
 nimNs0U8gyQkxPcE6GDmAJAYgygxzKAQ9xP7CSlZ3o6TxCPrdHig0ztUVMhkADYvidNS+
 Ub4tvO7j5Wp5q8N9hOnRyXQFla574xH1Xenn7/InMhLNe6sjBh+Cl6JJh1JC94oAVFtsu
 ugWJDXORy6hN6HkrP9fJiSpLUNKLdyCkikmvLhNnXICD47K4i9pRio9RvED1fB4W6I1cs
 SmYjHiTA3GVC5rRoeYdSAfHbEoJu5NE1vIBfOhxPkeyuRxkRwzWYKQDkfn4XKJGxl0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011329;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=viahrL8KxZhpDTnf8EeFHAC3LYyFJu/0sNZc/+e3YDw=;
 b=Og2/Anx5cWOnIic+Idq25LqTatLb6DPyvLw90aQGBe3jRZAZsADhRO1Qi5uZ58rmo4vo
 t68UiGNGLeU6hXvv4Dw6dFHOW3++KmPjpuzpDXNTIBaqUHERXLHJA5ZqSOijp6xBmPc+T
 rXfLenSHKDuZftTh7pY2eqhsuFAQn+U7HzRUEy0NLn8eKDksnK6GpOHwUnzaqUg85335O
 y986rAu1OpFVoq3R7j7TO3/7frlZlPINRhlUSizGl3O1PtUcF5EZ0zEBNl9j21ZKBtfmM
 wee3np98P6EgdaSMbNX/Bwbfh4AcOar7X5eHbO1h9xxiIWu4pyctj326tjQ/ItdY9fw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=FvZX2MaC; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=FvZX2MaC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85AE660621
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010928;
 bh=viahrL8KxZhpDTnf8EeFHAC3LYyFJu/0sNZc/+e3YDw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=FvZX2MaCTW8+jcEqkczgCG+FHZR+dZZIJ7cnW3/dWjukDTCFCM87yb5Vm/Z0wtkZq
 Cu7Lgn7qmPrhDtGGu/JjCUmct2SYdoD8k39OjYNgib2nWOS19FWmTxBXLgsCV7wJr3
 SvqysMse2XqEuIkrYNISU42i5Gp3YMm1lssSO0eUOcZgx+qYJJB/qlQuDAOAfkAUMQ
 IqxfSXA253kDzQ4Yg4FagRAZTyg436Dr6twos8Ewia+/Hl6Ju5P3z1ZrB0Zhoz7PFS
 gy39Anvrjfljthr7sH5KQyA4dbh1NkxYa/Zyqc8/hx/qZiIPI1RUQy+bA2BYjCs93I
 PWOI+MH8LZmbw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 9Fdv6L1ie4PmumuZgT00hrCOY+0hFDCvmhWBqRISEA+5rjO9gmTVI5hZtVLrvrrwv9ttiRGRySf
 jHqfy5xFwQ3FPNvKZvgXnHB7f0dnQp84RMsr1q7i/5Blwvgu+NcpZ/dvZc7Dvd2vs4L8loy3jOO
 U3DYWyQfdEfJr75IHXcV9rCGOCyMavIcQ+6Zro5AVw4UaUbJEjMMquWbq99ep1df1mVusa9Tja0
 t/11iR5ELIbCXy7LjiDBHtOmDY4wkhKXjnFwOrz+hek9MpFkFPNC0eV8kxjq7wXxgqiYwghBseN
 I48c7DZu4oUvfcQgtPURUKY4fDdj9sjjUGbCUmm0qYqEJJtUL2OivmC/ZnQrlpU9Hreb+2VKodN
 H5BMPM8wmnXAXI68BEaEZ1tGaJNRSNtewMsgZJ4xaQq8OLRTveKaB4g/NyP1ywayoyGAGKjcB4p
 d2qFa0iXU8PyxdO0q6r7mYqkBJKDW3Ma77Ubn9hnnNXjJ4/eb1Yx0rHKFAIxHwjVZuQT9ju2YYh
 WldH5R8e2plDZG4ag21PFoV1kwEzRCY7OTfPYcJIRdZLldBoSZANDiU0RgZWeNAO1MfttpJstq5
 ETUGFX64gV9X3z5L1tQnaC8sG8NOvt65ZIFG+DGrXstTkxyoZpcY45dXDoMFt2zh
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3D533A4C542C;
 Sat,  3 Oct 2026 09:02:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkg-000000007Zo-3GrH;
 Sat, 03 Oct 2026 07:01:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:45 +0200
Message-ID: <20261003070128.1295458-73-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 073/114] package/python-pythran: bump version to
 0.19.0
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
 Guillaume William Brs <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pythran/python-pythran.hash | 4 ++--
 package/python-pythran/python-pythran.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pythran/python-pythran.hash b/package/python-pythran/python-pythran.hash
index 7b428a18f0..783f830755 100644
--- a/package/python-pythran/python-pythran.hash
+++ b/package/python-pythran/python-pythran.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pythran/json
-md5  9b906f8af949adfd1a132ad9e26f49f9  pythran-0.18.1.tar.gz
-sha256  8803ed948bf841a11bbbb10472a8ff6ea24ebd70e67c3f77b77be3db900eccfe  pythran-0.18.1.tar.gz
+md5  1a10301204ffc98e04346b2e8147d955  pythran-0.19.0.tar.gz
+sha256  18a096daa8b4bbe3ace06ce5d7325be5ff57aec4cf67b91834cf1b757b3e5392  pythran-0.19.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0be9f14c66a9a3cb66d5263a6495437862ce0c9cdf60d4a6c36d1e51b1244c6e  LICENSE
 sha256  e1c0ed0a99e4462016d79d835f1f479b78c4d4a07fe66598e97f449503ffd178  docs/LICENSE.rst
diff --git a/package/python-pythran/python-pythran.mk b/package/python-pythran/python-pythran.mk
index 271824585a..58e971f191 100644
--- a/package/python-pythran/python-pythran.mk
+++ b/package/python-pythran/python-pythran.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTHRAN_VERSION = 0.18.1
+PYTHON_PYTHRAN_VERSION = 0.19.0
 PYTHON_PYTHRAN_SOURCE = pythran-$(PYTHON_PYTHRAN_VERSION).tar.gz
-PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/d4/84/17c4c44a24f5ec709991e603e601bf316d09c4fe915fbe348c689dede998
+PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/bb/a3/03098a8a5d2c9f801c227cf941d85976934f5f47307ef3d819734370acdc
 PYTHON_PYTHRAN_SETUP_TYPE = setuptools
 PYTHON_PYTHRAN_LICENSE = BSD-3-Clause
 PYTHON_PYTHRAN_LICENSE_FILES = LICENSE docs/LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
