Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5069FCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A4FD40E13;
	Sat,  3 Oct 2026 07:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IB-6GAP_4JJC; Sat,  3 Oct 2026 07:07:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3A01C40E09
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011234;
	b=ahmXCPiQX7xhGxJn6VBSnS8YXavE65JIKT4DRNAdRsUIPrJ88T8Amj1mscSCSyB6cNzu
	 3RjzjpjQVHn+TXbvioeglS6f973cLQ/KdgjQTEmgfhiC7X/X0S1Sq/msrqJ/ubtCEoENK
	 Xt81orkD6sddNcA7lKMFV4gAHjGEJW6j+vmUZ7si0aMzdrin1nniVEZ/0U3XsDK6zS3bN
	 QnF/JyAXmPaesCLfS3VHTwc+Smb6t651BcAzhL4aa8DC+p8XhKUqkvKubwupqQpjJF+ot
	 pE7eyqJmCaie1oQpX1KWDn59MCCrkRCUPIN7xsiMvf2JqZC77y+5xkwk+xvFFBQaYHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011234;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ShEcGp68IJIIGGuHJhnhLFv89PqdT/h0dgNX3L5TcfE=;
	b=leqgJw/uRJla//kHSvjP4Bt7s4DUAelWMtmYPXGmAhEFtFj3J5tSV4KeIQgePnzdQDGH
	 HsElVfjpqUb3PuZhWdzTqYLe5+N3g3XK3KmmDYkIGm+Nl2iCKoqpajuoTuQqVnv460XuA
	 t6Gy9GpaZdNCi+ZN2mUG9uxUGtji0W/SFJFhAbeEF3AZWOO8voFErG4KUQRnN6bwF0yco
	 b3JNPMFfLjyxv1xRspF3sReLXyqMDV8ZUsaBg4xyqkEjZ/sCDqYehumlaTaiOWiBkyMI3
	 Fd8eZvNU46MgZsU9mBmCRRWjZEsxW1dAVWamwVKLCiXrUd58Tkf5xNBSO1tDWtlCGtQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=oZqT5pAV;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011234;
	bh=ShEcGp68IJIIGGuHJhnhLFv89PqdT/h0dgNX3L5TcfE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PHLuAX3GT0EVFlghkXfLo/A6v2NwTQkFxf+0mcf835mUw5gHu63G8VIYb2fJkQLXU
	 8BMdsbJztmFdaGtA1Sq8CAGH4SM+bJR7N/U323+VzUZuSuvra3GyP9OGiOXDJ22E4M
	 VHvGqwe9EonJk1vsDB81NF+371FshzswLZnsj+NfpQetWLvOm1JDEEWbERBLh0HIL+
	 XoST6zjNpjzzi7EmuO95u1PLzXv4ilIEva5WKdAhft16fdFsAFIN+jjHEJKO6NEccj
	 7o6YhVzuCjOgZoRn+4mN9IwUuyYgs5k98ydQu6pmlGF04/N+IGojiHbdJwyP6TQyh0
	 Sf9Orh4hj3L1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A01C40E09;
	Sat,  3 Oct 2026 07:07:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2439F34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 221C340E13
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AsbUA2fTSIbs for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:07:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 286AA40E09
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011231;
 b=U+RKZ4hNmIT6A786/0bU9JRgcjl7OO/9eTq2BPs8EqgiGZAXPSqF7UuDvaDogh+zb6L0
 0MgdcMj+bx5w9BNUZXWszk75UtUChzn3sX8G8/SRa+EO9mu9vwpCszE98DbJiKCeoxV+c
 JLYEoy7df0u+aXUlKpeWBhkMsNllFhhMbGNVf/6sID/ToQ91xqupHV+wxLHzSo9zoanWP
 cJ2glwad8QqWgyXeRP6diaxooL4EG6h4Amu3C3Smr756wzMq5DjMdEqnfEaVu8BSfMtFl
 s7p56nvFaEPwc8Pz9QHckFgS+kiBdmnUOEnxuVtf3cotBqLFwRY8KOtJAIwDLdt5mtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011231;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=rMveSitrJH3X9JFKB+s5qgIpWzRwMsgXhXhc+5nkeqY=;
 b=oOneRnq27RS7oqIshoWAUwwdoJ2Wrl/h0m+9RDsLLhAuJIB8XkVyZT86bumcW4Zt/ajq
 kbfaqfNkGmebkUh0s2T+TiU50Byh5If4RCj1L4nAUXye/qa0sH3VgvyoZUgFVFQ8hddyX
 VFNNDZ09mr4ByHX1GPEKb2ftJ4dqeOLhSXgaHvlSW3vA8bGyaM1CgWzDrJaVsMqPGGcpd
 nMhF2seX9nLF2E9pvOrJrhXfk4HEvEu6lCNHPPDiGo2UAnciBHVio24dFOW0ng2OUYvRt
 krVCQaIfHXP6sxroL6hM82ps7HehTQiomRJTyW8zS6UkrisBcRkspNkodwveT7af1DA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=oZqT5pAV; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=oZqT5pAV
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 286AA40E09
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010926;
 bh=rMveSitrJH3X9JFKB+s5qgIpWzRwMsgXhXhc+5nkeqY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=oZqT5pAVs620TZQ/D1axBpShw+eNanO+/E/IpM+j8UUjJXskLSN+H9erhFME4AsnZ
 UYkk+MAoR1J6PDqvIUZVxAvqlfPQSY2U1XD2XF1Qfq3Iak92pnE+SLz4TKFQBlUvoc
 xn6WE2ileM0PIx41NFsBHeIt5vTp6ts1cgCbZb/WlOYw8kU6yCFgSpDXN2YADqa+mW
 Iaqm/cKarYJEDHr0ooGcxrusmVtjV8gZP0e2lQbVupeVpWsw/Jfd81DeQmMe7kzAuh
 4rpJAK3iXVp5A6a/pQNYuRxhfo6Kwn5ifamv4RlccP03GGXYjhQJol03Ou0K320KzZ
 uT8urm7mQrUgw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 3J5hg89qZIJZMEiNw8CsWyb57cIb8FNQ1FYKPM/c5MdLGBbu6wGFP5tHf8GClmnr0akLq6XWhPZ
 Te6C+Vijj6kZ10Z6CmZt7LHPFTKiTeecS1Ok2suvb+41elq1eMe0vQZm3/u9Hi8z28LZdMQRuwH
 QX83AbxSdtObqSQCg5F+/noIV/yW09by4qBlLW/BShgz2+0cKT0x3sUuqIa4JmkTYf6KhGoQ7km
 Ja1C5QvoqbGac4Ps0BnVUc9xeybMqrO9h0ONzUXbt1kKlyygFlIxN+hJ5ZHRk19M728OLcHY/cS
 mwMQW+RzQnq8gr4t1d8Or0dh5JpN6LvM4tcqq2QLX/f6Mxu3dsigK2f17pyg3tkDZIBH4issmT5
 YI8Y4LYuyp+C77cXlgfAQoQ9JMMxt9Pkt/+ENpBJtyyDi6LW9VSA0nIPjbOXdgLVXFjRLxaP4/k
 MxcXn2grdPXG/U2Uz+buMjvVvjXjsz6KafZ/fCEJhvDCD3Wtc6/bTq4NFsSd81ybSDpcqWLApJ2
 P4QMm9PCUV5wFw1n2gMbKuJ1Zjr+SxP85qW3LEmN/BaW7xYLPfYkzzpqAjErWz49obJ/bBVCs+Q
 r5/yEIxHMQKGsWT2+PJloYt9Cp1/g7J80znPnyhh3Nt3hod3uvpRtYKkQa0JDbvI
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C5996A4C5424;
 Sat,  3 Oct 2026 09:02:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkg-000000007Zo-0iv6;
 Sat, 03 Oct 2026 07:01:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:37 +0200
Message-ID: <20261003070128.1295458-65-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 065/114] package/python-pyparsing: bump version
 to 3.3.3
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
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index 509813d777..1413dd7fb6 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  ca3bea68cd1a84584b68cd7bed679464  pyparsing-3.3.2.tar.gz
-sha256  c777f4d763f140633dcb6d8a3eda953bf7a214dc4eff598413c070bcdc117cbc  pyparsing-3.3.2.tar.gz
+md5  2b2d965323de78ac4721dec660361ea6  pyparsing-3.3.3.tar.gz
+sha256  928ae7e20211f3b6f3915a72f06a0cfd29ab9d24279dd6346b6b1a7146397d36  pyparsing-3.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a5425f9dc14ac74d4c5f0b679e941f2442e32cca7452a4418d5b1a49893ebe4e  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 316b864302..596a61c3a5 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.3.2
+PYTHON_PYPARSING_VERSION = 3.3.3
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/f3/91/9c6ee907786a473bf81c5f53cf703ba0957b23ab84c264080fb5a450416f
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/e4/11/b213bebff182584360cb8d17c72c1677fec5c5c228de439e63bcf8ab1c8f
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = flit
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
