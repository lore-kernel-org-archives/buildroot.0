Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD3FCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66D4B600C4;
	Sat,  3 Oct 2026 07:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8IM6MijNjcA; Sat,  3 Oct 2026 07:07:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7A613605D1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011245;
	b=HNkhGcqGIe1dG01Xm9yNnpnw4oeI0lTOmuEtlh34iWU4ET6KcFwz5l9jMCmAsF5w/tqB
	 wo+b9cHQF2AYlNY1FZ5FZlKU08aCuXbZXYdoSQrejYYgF3e95wercPcXKbSr0dLYBhB+R
	 QpZtp1v3+x5k7jrSzwXHRnh8cpmTytOQjiYCedtH7e17xxHOM6s0W2UfmQTXjU+2y9tRz
	 zMmo8ON4mJZmNMlHl7BHr8X1gDrrBbZiIfmcp+oMkFOZUjWTuG+emeqIuxif+VsATz9y0
	 8PM60EWJF+rffdFvD4n/diLj8OkqITwjPP6qJ4YPAjKCnAmeFfyiRoB0wbpfBSy144w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011245;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rcypXppkWY0xQC/H8Oqfa0H5LzxN4NCdU3C5O9lxQ+Y=;
	b=VHyyxJLz/Dua8kzxm3MACGYmIW9rVbKYptMAL478jn6AMUqb2HyJqarp55PYByxV8BpM
	 chTyw/LVlHsx7/s8zfU3AkPb05L3dtDtqERg2GZt8hY6i1ZXhPhvKYmpLOxpRu4Tl1K+N
	 BvE0T8rgKTxOiJ/XrqhUtyfHcmUc2IKC9doYIl1rFYCzifN0Sjjc+DlLNCcpRYPcHBw28
	 uglIkSZ7ZVteZqlQgtGW9uynvb2uzBPvayLisfK8/URkUFXzw+hKMzY0Ds5A8BQZu4y9M
	 9P31/Bqk8DULw7IKLFxu9mfR3SYVfltNo6i5WBDiJkp3NEy2OTkBCxkPvHNpu41g8Dw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=rwMQims5;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011245;
	bh=rcypXppkWY0xQC/H8Oqfa0H5LzxN4NCdU3C5O9lxQ+Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cIPf2G65YKwrNJXvcpVjBxxaukT26QTpDx4XTCExZ8dcmrCi+/nDfNjO9Noj4FgQg
	 cUa7W2lYRYRTVcA4pG7ujP3U/+nxl+U72kYRudQbvmil+OSYTtSnBSp5dcgICWdMJF
	 aSYwoA3qz08BNfH0aWp8LnxWc7qWsAAmWDpSzQAhYaO22iHPckGPoWY86gOF60hYau
	 oPj22/yEXeohtK5QIKeYn6RZ+Kq5N6rcHnLRcgz8ShW1UiWH0QZbGB606ZhetBWme5
	 CdNfLe2bZmnvIFWtdBazPGwRQPMk4PA0jomJ6PbdWOTbPmdPk7f9YqXhsF5mkBwoQR
	 ZLmdbX4Swehlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A613605D1;
	Sat,  3 Oct 2026 07:07:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 848FA34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A799605D1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NE6tIpKEBAZ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:07:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 884A1600C4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011243;
 b=jTJFSUsdcI9IKM9sVCwt8FwQnree+GxqQphtT3LelfUQU8GVtSRvN3AirdZJWGndfgVK
 4Xykfjk4VnFZPrQaBgDpQSBHFOikExXwffIbMVwRlIBnIJaeHFV/XsbG+nvAYMyjZUsQL
 iUuLpZwCu/wdmyx9IpvOWL9PmubMPCGKm10SHQyLyg7+BSV8i0azRBGl/ctXRT8r3d3w4
 RFgoGhG37K6WD+hidBCj7MI2GrIyOrxvLtCTL7phhBsJizSw5wMzA+LW+29Z0G6TcE+kr
 gdJRvh8g/narIO2nmWVqRANhtdHaTH1bxUm3MggYJi+MvdVvT3qRvCRZWMunS0L1c1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011243;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=cpmWLhBOWwRUfWedlPAiXxF9krmHeTN8qFqJGHi+gjY=;
 b=PWRrm9IlT+2hI/KD9MHCWzM1YsUsq4QUxc4nlLWQ9hjVsIeu4Ustz6jjPnI7ueePNdti
 N2CD5IT6x2Mo2K7BnnTk0xv+RlVdfv66k/CRNlBczae5LpyYrySGb5tubR+5Q+lpYB6Pj
 rxyg4WjqwC17H3fwOn/eYObrclMoMxaiZaW5hE0sYMXbc0s6l9JbNFEC1FU8OO5MrXCoC
 aPAajGJtnC7NwEFWWRsQyc8PD+h8ADQ85jT1jM447hNpGPzR6IQtxWkiVetik3mmFtVeY
 XIpELtaCaULT+1ecPI5yzXX/OT+dTh+2lkk2EyUDSNwMGrT8s3U08V3y8sUd6CKIXSw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rwMQims5; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rwMQims5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 884A1600C4
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010926;
 bh=cpmWLhBOWwRUfWedlPAiXxF9krmHeTN8qFqJGHi+gjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rwMQims5ijx5bFNWk42KfBMd+QLqTYAOU41atipP3EvsqUfKC0r9pzQ0Ge1t/5byw
 bR9PytYhb6FowkIwhyNc5peT2n2hKX/t2xH8CtdkeB0tz0wMCU4axhson3V68romzg
 GOtrNXTjhxVf+Uf/S+T9o6QIGrjpieh00QB8ifdV3t8C49v1/rvM7mdm7/hvKfVCHo
 ggwLywdmGkaLtilGQraey3qe9Qew1EQT5L1XBftXYotFGTzqZBuVlgKlp4qq/gCO8G
 S9+szq8iIah9TmotuS+FWXQQB0Nxtso0oF8427JTB/Z1fkZxQe/hzZV8pP9tqGivVD
 a4d07rrWq6GXw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 A/93B080rO9s4kB7izcJ/VG4uJ7vp/No+8xHlTiJb45A6Mq6GWgVhjv0qnmvrklcm/eDfdgPdZb
 G8rVh5u2372gHG4QnfH0ddq7F4OhBDvu0v/l224sHGopQ9KHRUkO+VGuPp642CH8WJTKIHGtNGE
 OOpsK+lR5GyPN+EmKuYfO+wM5YX28MxpAlI1FPpDvx7Hc2X01DaWe49FORHNFGzln6fjvgsboal
 fojLSFbZA4/ZWM9tEEP/Exsg+D//yxX1IS55c1F4aMxKNAcitXlaR1ZDEhLjNqs/nQvxOGRlpka
 4jttQJnBBZbwisFwNzXQBtmJ4irXLsidDmpzVjXUww65ON6dn7NKI0FddSeSgA1R2dXJNhc2+on
 Vn3OfEUZ/5EpenaSP3DUE6o2bnQdQpwy+lKh06o06/xrAusMV2Yq3MqvdCSkdOv+VFz7z4zscUA
 o/iM5U+4h4xJptUvEi5YMESxcPiAgZJkH9mjmcG3WtT/EzQhy916Q0w+1YF9s628Ep+PKNp9mYq
 pFfZ4JOtY9+D5UyuEeSvsNHAJfze4o1ii/dJZooMvYcFDxpYOSL0Gi8K8lI+S0G7q+h3yJ8Amqo
 YXOUREbYEs+ejLSyBkip5asGuiESc7/nuW7zTv6QiLjesuEsak2TSCRju8zvBltm
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EED45A4C5425;
 Sat,  3 Oct 2026 09:02:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkg-000000007Zo-120Y;
 Sat, 03 Oct 2026 07:01:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:38 +0200
Message-ID: <20261003070128.1295458-66-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 066/114] package/python-pyphen: bump version to
 0.18.1
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
 package/python-pyphen/python-pyphen.hash | 4 ++--
 package/python-pyphen/python-pyphen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
index 4385fc0c9b..3bd71aa4e9 100644
--- a/package/python-pyphen/python-pyphen.hash
+++ b/package/python-pyphen/python-pyphen.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyphen/json
-md5  ce57c010cca3a3b67275b393d2a8b6f2  pyphen-0.17.2.tar.gz
-sha256  f60647a9c9b30ec6c59910097af82bc5dd2d36576b918e44148d8b07ef3b4aa3  pyphen-0.17.2.tar.gz
+md5  b54265294e34995fa435ec9048044d15  pyphen-0.18.1.tar.gz
+sha256  dbae6fbbe4f01cb206108b43573d857c67107be9d0e38eb1b08d6fa2210634a7  pyphen-0.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4fd1c78fcec632bc872ba7b42ba04be330029cfffa411039b48a4f2262bb8240  LICENSE
 sha256  2233a3eecf299bc271f1a9f57f0b3198343ad4ab16571d70320133002c51496b  COPYING.GPL
diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
index 8db0518aa4..5c4254610e 100644
--- a/package/python-pyphen/python-pyphen.mk
+++ b/package/python-pyphen/python-pyphen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPHEN_VERSION = 0.17.2
+PYTHON_PYPHEN_VERSION = 0.18.1
 PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
-PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/69/56/e4d7e1bd70d997713649c5ce530b2d15a5fc2245a74ca820fc2d51d89d4d
+PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/94/47/8430452269cd28863d73b903d07d329d058cf762527ff211b3864ba61fc7
 PYTHON_PYPHEN_SETUP_TYPE = flit
 PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
 PYTHON_PYPHEN_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LGPL COPYING.MPL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
