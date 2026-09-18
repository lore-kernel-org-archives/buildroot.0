Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BA6C982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C732760E4F;
	Fri, 18 Sep 2026 19:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6QjKHcbTV5o; Fri, 18 Sep 2026 19:35:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D679060EB2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760142;
	b=Wihh9XQb6rhnVlff/3AnuGZPouGpqOz6JsknWRkykxhtVlgixLKrPuOUnC6n4DCzrROF
	 4KtE1enRY4xCfcDdvWP2Tw3DCFpjzZA9xnEUnMWRSnvZelJHeWmCdEi53nc6ZWrmlSHcG
	 5q7wPbLiTfRHO51D9NJoC7/KGeq9dIqRKgR9jlkMM60ZmpjGFDW06HZegd4nTeLbV9rW0
	 dDymQymOrMgMXIJqTpmc47KAj6L5LIEgKLdQcYmxkmBayWr1pX1zDX9DMpPeIaroSZyR+
	 uat5+BsVtoecTl6Y2NKY6UV8r7ID7YjzDQ6eYSQpwKI8ELcP/5A0Hp822854iMHid1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760142;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CkKtZP9XksUOwq/y0jaxARxbTeteZm5kUY27hJzpIEk=;
	b=rcKYESDzKBw/tz5ndkAQuCgnByTH6cKLgjrvZovE7mhU6ZbqRNTSleegvmHZ7EsWCvL8
	 5XVdFm+0YaLlOOJhGo2nOJ6HMgN0ciV1SeyT/qj8w4GM9/XksryMXiKHAFCUb0yFXv1tW
	 sI/mbfgY2GK6WbBWegg417mtmnN91bGTDPwgzjaAuDhUVMi9TPFBypa/WV1yuX14lMwe3
	 LWSnDxymcgy7mGSQ+PsBAVffH5/dz0NZ7EKDCbppS4Gtvr8PpwlfGvJZq1wF8LewHIGqT
	 FXfulBED94qQJWqo38ibwFnqx/xeBvTpXH/zXI5cN1PqonIn1I7SMpsRdFGh3LhJWxw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760142;
	bh=CkKtZP9XksUOwq/y0jaxARxbTeteZm5kUY27hJzpIEk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rXNSYImAeVVsMI8D+SKaxY0BlHg4w71bd8xEVzuxH0TccmWmTK9f4KkP2WlXNd0uw
	 dHyUGYoVugoz0wABDtseJeiI2tC0oZ7oAUnhgDmFsrjWIseVx6ebo0l4PN6jrXT5Zq
	 077NgqrYTCwW5ZhNzKp/lzhd+PxLTqIwmc7lTSzDOW5SodT0k7D/jd62vKIlv0rUwd
	 Oxelw8HutXki0zhfa4im3EpDj0Ad2YjXj3aFbNhVIzWcaLl8SfHGV1e9RNJgLcK1XS
	 WrLrhTyiPIqCIHA+RdInG0pW9EMrn4wENboFMWoXSk1nCOypNnNYrSw3Ktwf1CUVBn
	 9l5NZMsPppMew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D679060EB2;
	Fri, 18 Sep 2026 19:35:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 878E825B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7570B60E32
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2UNRpHDlsCfQ for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:35:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A398260E10
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760132;
 b=f+8kNr33msALiJhtzbibkhf4GWkyym6i4R1hgZBJfYFZrJlRO7f8HZmb8PtlIwadVsV8
 thhFijlTKRunOcR5XgjdDfjV1bM+kaX2sE2OJXMoJ3S/32lQMNTcSr5cCjlR5VK2Tb21A
 GmXpATwjV4yk1h6va/TStxGQsuTZt1xkfV6xmGkuGxmx3lK2HyNMRMtEU03PYnvA+EWvL
 pUmQECw8xqDDUOa2XAsIDrApbHLh/VTGpPDOh2fF8pC34r0qxzCdGJF1v4kDEt9vQ9tIM
 Vl54UO7kT510oVxdpgPxJW7jhEaonNoaz+WETrodvsnOFcB5jzt3gK8zy4BZxU/J2qg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760132;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VS9zkpQN8DViBazn6duqlV3qyOOmCiMVdsVjuDLEwNk=;
 b=LRQ+Hf9yEhW6bmTW9uHY4/YiNAtoGA1UNoJUSOB/CW4riv4hL6ONirn3ijB4cZsP3Gan
 eHupyeYVouZqNxNsmc1WvVcs4R+K7sGD0G6xhpmN/5t8b4W/MNRFtWCZhVCEr4SsSnpme
 EM8dg/7L6hGqfMNdPwZ4daM6/JSI/l1Kze8z4nnyJrKQgqcQ0BBW5gUx96SNdxGzS+eS8
 H8PlGIkZUySZQhEEPdI+aXc/+q/WQ7aEj1cbmvYINlCWIFaKTwcuiuJzIyNTEFaxS/XL0
 udzbfLb+QZLa1T53U4OJSpjS5Fx3CWzR1psMG7Iauh8IkmvLihTl9zIT+igv3y5zkvw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A398260E10
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E791976AB; Fri, 18 Sep 2026 19:34:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:25:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fbbe6b681281d1c2dbc300d336a79a5c69406c1
X-Git-Newrev: f5a2b355311dc877b18613856af3b26f401c2c89
X-Patchwork-Hint: ignore
Message-Id: <20260918193425.2E791976AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tensorflow-lite: propagate
 libabseil-cpp dependency
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f5a2b355311dc877b18613856af3b26f401c2c89
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_TENSORFLOW_LITE selects BR2_PACKAGE_LIBABSEIL_CPP without
propagating its depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS,
which this commit fixes.

Note that this doesn't create any functional change: tensorflow-lite
is anyway limited to ARM, ARM64, x86 32-bit and x86 64-bit, all of
which are supported by libabseil-cpp.

Fixes: fd29fee3a3ac0ce45404ed256d2059836c352728 ("package/tensorflow-lite: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tensorflow-lite/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
index 751b963b22..604a1ea9ec 100644
--- a/package/tensorflow-lite/Config.in
+++ b/package/tensorflow-lite/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
 	default y if BR2_i386
 	default y if BR2_x86_64
 	depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 
 config BR2_PACKAGE_TENSORFLOW_LITE
 	bool "tensorflow-lite"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
