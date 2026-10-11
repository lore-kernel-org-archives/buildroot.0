Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA023CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75E5260623;
	Sun, 11 Oct 2026 13:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zRkanOTu9tw; Sun, 11 Oct 2026 13:06:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8D5FC60616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723993;
	b=HzPdvebobbN+9JzJTMbBJm2lyz6XADYTYB4u6DfwSHT7iQmgEM5Lts9hQk3B9ys8qxxT
	 Z3w1CTNYtfo6c9kipv8aeToYvicANs6SX0bZ7kyNjbamrfeo1CUGgml/c92WhR9jpxPYi
	 hoX1OTwF7VYfgeU7pk+LtTFIP5UYPGu6IiGxtPqtGgS6cAQOZuc8z5pG7zZU3u0zTh9yo
	 VJbRMrkjoMs+kwKPgEjVOePm+Z0wRYq9gDiSq1x2pSSBiLJL5Wzfe9w8JbdIIWRSsV+MF
	 BkjFmgbQ3/saZBDS/Bya5qsiElwWS5uFKp2NyRwx5K3Zf4vhSZlE5tY6Cz6LO0j2fLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723993;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=h4zPVStqHZ7TV68Q/w1yPNPX3+oLmg3gjr5gh/u1cbk=;
	b=J9Cx8sk7jmleGm5muUi5fN2aH57RlS0ixEMqAs+xoFV3SpILR5XWimOfi1J0pEFvTLk4
	 9g2QZuqv0B1YYFVYI7mVP/FfU6/RoXDPVcVY+NqBlUlNZd5zEpX0ZmSpqFwyk2+Tpf2Qf
	 bjGtPjE1R2K7/2vLvDZ2DwHzvlBQIHHkhXWhp9pkTS/xP/8AQ8Tl6u3phmBMYEg5M4tE/
	 qgYPWs2XG7CFe3CgdaVn+zsjVkBl7g28Zwb5XzA7FBWqDfJON9lNBQSudAXhRr/ZHr2f2
	 XvDAP/TajpQIJZ5GL/0ZFKA4Vth+aO7w7+HjjV8rK4w+jnPj3TirfDdQsBNIki8E7pw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723993;
	bh=h4zPVStqHZ7TV68Q/w1yPNPX3+oLmg3gjr5gh/u1cbk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RXFjFdLehf+qQq2ACUtALxV+YiEt+BOcK/eaNlJMrnghTEN2f1kwjrsRhJBHo2KTU
	 dZlMmxiJDJJLfHE2B/6wp3oFNgzZNvAeJNSSLgpQ7Fswu1FvfLtzx9kiFczMXeFgZB
	 r9uoT1IyO+LdNmeDQ5g0mK0zkvbq+Yma8XJbvJ5xzI493aUWcxi593gZPyN5VmK0ML
	 ioJhJwNikr7u68WuRsiKXSVgpLf7nYju6XzGmIA6jIHhyTZUSLk2Te4u3qi20LARzA
	 6qi00hU7P04TwmQ6fqqrS/0TqKCP6pwdw9AtiVMmMnDL+hkg0TnlmbEYw79vN4JfIj
	 ScrQWVP/ZFfYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D5FC60616;
	Sun, 11 Oct 2026 13:06:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8ED441A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7514280D93
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17bB_too1Rau for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:06:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AFEC680D91
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723992;
 b=AxyZbbPLQnksfTstoDuei2Cf4WyCf8z0FiF1KC2zWVCmCGx5+hGvQpVl60QZ5otCOu+s
 g4ERkFZz3WA0gE3emFqqLVEcj9hFrFQd4fpMHfck1nXxPnTun9yp8k8KUgQlBCq9IL2XR
 /TikPYwLos1rV8GxDBrVGaC0NDxDdrAyj8VFlbKxcBx+7KdZfS+vzg43di2y0yQ9evLNj
 GSSMYlHp62x22RC42lMIQ2lONXAsbt5oPPaDHxyoeOVXgR5LKoNNl1FFcdONeLSDRyyrh
 jaiNhMAgXVUebU1vX28EA1scQStyfjGRuL7uudauppWHqU49jB5aRWKLB2BSst1AfGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723992;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=GTBibPQUKC2AIOM6aJDgIhenYXQ8Q6kNAn0Vf4jOk/0=;
 b=PZNhs95TwHKbo3cRy+mtX7ahuXk6+nQKothbVm7ZSABfrtC09theXQ0QEDaFn3H+jXCt
 DEaVpa7gl0iLYQfQrB7Aar8bqaP73py2M/6+/S8H1l+u7WDSptiMWht+k6FwQBXw/PsuE
 dxrjvzmC45HcnoJ1Wjx7i6IC7Cbcn6pYAKQ1wnpkHFNPdzEdTIrYQK6nhMuki3J6/amwR
 zIOTi2+y52B79My/eqXG6+cpPHRZuh9xe+akUDKmYD8GhnxZfWA0D20fStpvMjuzYwYG1
 Qw/ZiSxKVI8m0vKj8iZd89vE6+zSVH9cXapyrw2f/v9GByBCpjpBgJhE1DX7AY51cBA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=N3dxFHS4; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=N3dxFHS4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFEC680D91
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723663;
 bh=GTBibPQUKC2AIOM6aJDgIhenYXQ8Q6kNAn0Vf4jOk/0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=N3dxFHS4mb1tgdS2qe0zCvLGBKWBiNro1KTK4wNZWaJzAWvW088V++7Xq9DxWYrIZ
 HhIdjMDBdjNE7JiOP63yE65UbWS6DuzMwHt8WUXZb73Yp+NgzPNX9y0kegmFf69THr
 FzePHC9rb+dzXzdxX129AI2FaYiFVICanqYn2sCJkzPZx3n45RcD6mFQo+iwhefewU
 6GAjiVc796fFeypNBixf0zikJRuvjdCusB1N5s9h6BgQUxGN5U2/3PgOjyQQ8OCQID
 FJnMDWZzoGPCTkb/fp5MdI8HK/v1/w+9FYjx7W/Ffhp3BOF0eM5FSlI2iovG2ORrYk
 ZjB14RzOF9EVQ==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 55hR/2md+KlEDkOI0nEs7pPMWHa3a4r3FIeCK6QgC1XpHanFYCW41BiaYQg2NJuN3vfRXQJla/y
 ePESlHVNlHFykJ37ZUtf+aBHSoFJlu84HfZBbdyc4g43o/3Svm/lY2PFcHU/DnV6PkA88TlnYQQ
 INCG0CJjymenBWsO73/R5qD8pO/ScIcFgK0RPETtvbRH45to6z8vKfKEvRqsoMQd6m6wPGV2cDl
 i8WCbxX0fPMHqK0WVpc9QEuA1WWqYtQ9VHdkxJFdKxo3K77CCERjsjF5s6Up+IHu9vUCVgV1B3A
 jPVs5c6ylArBOS1k3kuwsIIubujaA3EyH+t0YRYCSVvwEUDPkdJav7QR6kQ4pbcFCcPh1UoLkhx
 xjFPPuNDm8qNm0MfJa81EyyeAyLHKOtkBR6WpUwOZVNhnSjoy9up0xiVQDcOPGDJJAC9akcTuXW
 i2C2LQHsEvfRiGZK/ckEwuqAZPTsOPuQdy4+nczjyUkqvyUUkfOamQ4EovRiYldnC/xTo/BpORT
 9OUc1G6nuXseCvakKic9uwJqRIHDecucfg7EClQdE7doiMaWlRirtpCIU7R4F9ZGsDDw06uWzlO
 uAxLYtdDSYSzqIviWdxcjtqiaBLFY13k9BppkchKBCczYv8=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6D0E9A4C5870;
 Sun, 11 Oct 2026 15:01:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAj-000000007Fz-2KHT;
 Sun, 11 Oct 2026 13:01:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:20 +0200
Message-ID: <20261011130058.3443432-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v9 15/52] package/boost: log needs serialization
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

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index e88f497f6a..5ab351d8e4 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -243,6 +243,7 @@ config BR2_PACKAGE_BOOST_LOG
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SERIALIZATION
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Logging library.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
