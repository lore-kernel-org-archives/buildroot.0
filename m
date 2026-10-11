Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CBCCA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B0BB405CC;
	Sun, 11 Oct 2026 13:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFtrvpjoFzfy; Sun, 11 Oct 2026 13:02:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 51E34403B2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723772;
	b=VGPw0Z9bVC7YYTUcCOnTIhEKkUKQ2jyZiCk1vYnNcsYsVMDNEMuRds4WkQjMFjq5dBn4
	 bgH4ojlj9d4p/gXdPuoyyfGelW+gH0l3JmBYF1ysNPPQaRQ3mHL0zTd2l2YNrc/lBCmD7
	 ix9tsKRUa21CmUDtHru/y7JumkPypEHfyVVyodA8jKPDFyJo5iQd2aIALTYL0lkhkzqSX
	 H4L9BKq2xrEf6h2TkiYgb+TrRcnfl+zW80obIoZJKanqewZGwaOe3aijd47MwRDm0/Dau
	 +uhrUXa3BpLU8Udpa9g2kYtc3cVbQeGT0skgHlBO3YkVsCHsahq22fRz8UEQIptgBwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723772;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=psxCyJsOoPQBaNaDsjLgk2N8LRb7iYUy3lMmm3gnKBw=;
	b=lBLwW2+KXgvStc+QabQdiAUjAqoBFRxAkvJIUvigxMSUwJ9BCQfx2JE4MHXK1MUttomc
	 JUDrBd7Wx5M04GVsBy8adaVzvnjz/dftcX27z3l6og45tqy+ZOAHXJbCPkKeFhu6AWn4g
	 vS2RB5UGK/F697VZUGbwxtcJXCkggqYFSCfft5B89OVEMHQ7Xb3IQrU98L+2eBSOdgOBl
	 XfoCPyuzId79DBQ6Mvf1i6Iljx7vDQ+KHpCRqKv8i9CTQ2FbLniShpkYi8yc2Wi0eIKcv
	 3ZMgtfgjVAHi3KqhykTyyhyV5J7R6gaYnjd8ijF2AhQyjQplRZJcHt8u7I/b9CtPsPQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723772;
	bh=psxCyJsOoPQBaNaDsjLgk2N8LRb7iYUy3lMmm3gnKBw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K0CWlsTMh1tGw+iEFOp/egh+gBtJKIIKXwqogV+QlYDrp33GTxm6QTkcchgo9CZH/
	 qWZrBB0cPVLex7lqZBpfZaClOWX4ZsF+JR2BPnefERSDa5Su6iX+x0SOA2VxdPbLiW
	 cj1UqxWRtcAKsrJVkEZD/7D8ahbRW9E5be/Ik7Tl/hxBK6uqePJ9lCsZTJan+wEhxz
	 PiSpaIwQ1cI1XR0TmeTb5Xj0wlnXWgrBp1YBRQ1LtbJGl88QLeXMcFxdVl1RjKJQ1D
	 zF8XCaa6HwIyX7vieb8WOBkC/IrgJX7sXtQlCF+zny6mRtKqk25bB4vGHl8JE3SuTG
	 m4OiW+4PjzmhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51E34403B2;
	Sun, 11 Oct 2026 13:02:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4098E194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3267F6060C
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofu_fdu1gX7m for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:02:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 840FC605E4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723770;
 b=YwWtfqzOP3r35c9OAjNVGhIAgPaqtfSt70H/4BttbsFSAVAUE9PIAeYODMq6R7PTfsoW
 X3ZdiQVuMp52wDuI+cvhwq0YtjL+Q5hk7MQHvIVyBt0PxJVeEYKzDRUQEsUwxMZppQUUI
 yy7lqPsgfjhVkITZ4onU8ARCazcxLtWqX5UeXd0CYZprf4Jm8Rh7PVNd5bhQphxoKC52y
 WowCK+mcCBJoKZEQsR2MuyeCL+dU7HA23YSTRKQMmNXx7YuE8pBJdHa0abJ7CFhkRGRPP
 EtqVE5gUy4uTQ1AKYmNLVDrTB3hlJSMc98LKjROHXdtSl7D2JCLhkM7+cxToogBiJug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723770;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TpIRgXsZr+de/HgCRWGzNekWVv4B6cQZqpVZ9ZPIofM=;
 b=n3HwCKgdL2bUcrAb6nAIVOMvXkTbv8mKyk++dDlS5wQr2xcN4VQ/g3/pMReEmMEAlPid
 TTii5Mr0rykav84/X9n6U/qxr3+RH266sCFcrJigjGstd4cyL/evU5QQU4M3oOcdlPEtF
 ouJOZ5obbtSOjCJRXGOgQQSQPjPLSVEp+4sdpzbKWU2fnBOmYmjxR+Upzrhwv43piw8dh
 yxAxM4bH328GAYG7DPlEOJJqBwjAmxqKYKdUGlm0ttBTTeKz6QUdI0SYsAohGgm5fL2Qi
 ++nQArxLQNsq0MCztiaRA3mvZHFDUUL00rsTbCmVWEIqElyzynmlUT3jd8jHBlsI2CQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=uKlAMVsN; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=uKlAMVsN
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 840FC605E4
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723661;
 bh=TpIRgXsZr+de/HgCRWGzNekWVv4B6cQZqpVZ9ZPIofM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=uKlAMVsNS2cPdsaw357yfQkBrG8jsIlRK5fA0mNjWfEwblYYGMOTjnMibBWDQVSxo
 riW/hdhhNJ0guj3gRguUjHsUizCmzc2XeyVhPlSH7kvAL9/+Zha4nQVhx4J+wUfc+R
 ndlY4JWHwO51QPr7BAGlzDahoEZHqFhZOOFOKiLs64HOdG6oDm4qDzpwSrT/qiXM18
 AqhGGh3RKkAJv1S/MzgQ9VVw7IcW420hOtoWLS0iEOc/W7gDiZACmRrG9hNmrD0k8j
 S3BOaxQUQbwdtvNA5inOIzx587tMydYOy7wGwVx23KxetHZPia9H2Q9rmhaeokv5Tc
 ZnTQeoMJbHtEw==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 mrofl3qWfTJHWbO/0jOXJQqU+6v+d7ufZD9BzElRA3CEhA21M9ckIC9RnApPcE4DzEynVA+uitM
 1nh/H2wGXdlDNJnGFP2aWaOAdNnixJet/di21RrqplJr5segexAEbK5yKuMXm6gYS3QIIaFCqd+
 +ucvkz092VMNr8p3iMLjuQrus/5O5QSe28BT7PgIby46q8FEerdSgZ8qqWCIBMvu935DdOa7EAZ
 YpZKWEMMISsVEPTLV06u7UEeh473PDKNjMYMIWbAp3sixar37Z69HPmKpiifjrQxQBaG4jbTu0V
 a6cL0ovl/CVSjCX0tncP0891/sChvWCz1f6OxK9aZrr+9ZPe2Oe1NsvMaCf/PZvZYN2m6gK4lpZ
 OSDXr3lVb1AvaH6ipgiDwRyg18wDT0l6Y5sknJX+ieBFAEkF31M6HHfH2xLY78bAydvRN+3qeNd
 eyRt0QhxSn+t0mg9qiRr2Vwe47/TBJuUxonhL3zCKsAKzNHWudWO5pMJAmH9wSmFXudk0g4OpL+
 kGAvbqVu3zrWUD5IBFkO5NajCbII+GOYUEYLPnC2n3pdU8S9n33CcUPPGOI2fbS1IF6ERYMyEgE
 AAX+OfDmEE4LSs9yVNtf0+iMDskbLpptnIVUMcQ=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F0912A4C584D;
 Sun, 11 Oct 2026 15:01:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAj-000000007Fz-1ndK;
 Sun, 11 Oct 2026 13:01:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:18 +0200
Message-ID: <20261011130058.3443432-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v9 13/52] package/boost: update graph
 dependencies
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

From: Michael Nosthoff <buildroot@heine.tech>

needs match, serialization and thread

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 362cd6c95c..63c50d9835 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -170,7 +170,12 @@ config BR2_PACKAGE_BOOST_FILESYSTEM
 
 config BR2_PACKAGE_BOOST_GRAPH
 	bool "boost-graph"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
+	select BR2_PACKAGE_BOOST_MATH
 	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SERIALIZATION
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  The BGL graph interface and graph components are generic, in
 	  the same sense as the the Standard Template Library (STL).
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
