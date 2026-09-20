Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F358C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 497AF60767;
	Sun, 20 Sep 2026 14:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJjSC5fY9B7W; Sun, 20 Sep 2026 14:49:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 688EF60722
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915765;
	b=sdslHOJH5AjszLc94FylIo77aUMn86WcfZqHfgOqG8Ik//rJPaba5eG+TbMyQAY41I+u
	 Q/1JB8Gltb2JDNtY5CshHNKjjhkVjeR3CsHhXh6Bhp2AJBkNp9iove6KOszseglBwwqN/
	 bLUtQrzN+Y8JvvlUvP0BzFJaUcgF8mmFbycJc+L6CcbGX/30w0VyB1bqgugBBbqnUGGmz
	 39E2VShh7f4N7LisOMV29g6QWzF5PkP/ZEYqdTx8PXQmv1nxDEcjZws/HFIqkZ1trW+tO
	 zZcVADS4uHpIrHNqIZk9Borq+b75/RiABVgQl3OiAjBCDkxopulzPpALcEOMHYmzPQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915765;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QsIOSNeeF6eNUk1SzxTi6cVVk6a01ZOuu9ouF6/ioW8=;
	b=QImwwTNSAn8Bg7lms0/gcJ08pwj7SR2PyFlIUhEBiCi3OMy5vCVLhZeUq5+Iyg7isKlW
	 jUFJ5NdcO6sAIJCMtCxlzgRg3Vav31vg6k+2kMbQujNFyY9CcgfdKglnQoXYFaaWDhAry
	 iUUeNJ9zSnHztbKh6wmnW5e5xrat3P8EbJ519DQqdw4tw7UsQuBA+vQ36DHERaj1g/6lA
	 CgIdcUdIs0xIonAue+OO4er8n882kKQkKW2fDT7RuNh9j/+QEqT89Z0OcdTKyDKALtEr7
	 t9r6keVkC1EYZ39W84UKjTH191skjU6e1LL3L3/WyZrZmJJO4XL7vAboVd4XzDjrJhA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915765;
	bh=QsIOSNeeF6eNUk1SzxTi6cVVk6a01ZOuu9ouF6/ioW8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LU0HdBiR4F4zR65aIfyM4Z0LLQu8VKG+pCq74GLMZqelZsiB9s3RpgQIMXHv0ivdk
	 22GxPI1TArYZ6oNLiMSL+KoW1ZOEo5Due4VxR6L5FQdxAdob22ZrlMbV9Fh5wZZ+e1
	 qu7djIzyeA3c+cz9Jw9F9H+mZEhSIc8TwX1TL26RPrA258Yz2M66v6hBPN9Lv6/y32
	 kepvUIFDlkjJflfhxPk601XbmMjw4TN8hIntoil5pp9weHX8tpOcLT9i83HKRH+5mJ
	 Sf9thJRA3s1KyRj/Evibtmc0X7JmM3Z0sZr4/wja93fpLx436X+5t4PQ77dfUcjAWD
	 3ybUPBHoMsyZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 688EF60722;
	Sun, 20 Sep 2026 14:49:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6335F24D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5495B40E9E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vz2jSE1AVT2n for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:49:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6E6F340D9B
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915763;
 b=iTdUZ3fCUSVCoJJT1FYbtPFRj30FN5+bJPQ2wWD4Actl4SuYWyhsS846xd8+itf1GJY1
 dG1Nxo4rMuWcO2YwQp+PkskEeDEIUZntlE+7fZjsplYQN2HhWN+BczualSl4ZCS789ZPQ
 nt5aUJOOxt1TG1jmCruT/8e3CEnFGULbRmGe1LGj38/W03IQns/11Z9EjK5iL6DftDNuz
 uNTbNWv/2I871bduD9Qxa4z355NhmmQhtOqlyQ1pKZssmoG+tuh3iyYAKsz/PxOUjxczy
 g/vkuvmx6Een2fi98BGQptPY1cO2jwvLEkv19kiI4XbrTHanvHHeNAgSxBk23ZJA5jQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915763;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eS+ZYrlXorlxC5Msf5x7HU5ym7C392UqGLKTnC7hbes=;
 b=U840d/q1DEfidhOWTLDSGbSAoe/6Hg3EY7NvisU+XifHRn/6bZwAvhM3IDj6u6CVpKL4
 HVEaMqVMpoxGpzt3uLSbWobEyzsGIv7MOwsl0bHHzUN4y8ltA4cfNb1HCxJKKhaQ153vJ
 WiweX2qlHQUyn0eHpHlNwmHXm75whnfj9iRWfIiaF5ZrtWhmduZeBlIdKkkBBInYoOS2u
 Fm4l28gt73H3XOSAJJDT+nF/Dbhfk1EjF0sRdn2TKj72HxMzDC55n/fhJG/mPQv1DMaWp
 1vgvFw+wkop5s3hlKcE8D5hsPoqBWahkNJ33nHAZERwTyXFchmU8+nqMlo/jmFC9INw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sViD7Euk; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=sViD7Euk
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E6F340D9B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915502;
 bh=eS+ZYrlXorlxC5Msf5x7HU5ym7C392UqGLKTnC7hbes=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=sViD7EukL46ZOGrH5+kTPzGjGCKM2Gj6UAZpQ42EqlvkALqikJ15WywDCxSFtU1CQ
 0X0hpKdaBPjgbL2Ho65W//7aeqWCnSjc8c6MVLKu23HLH99wOOTVGBcOJzV06LCnWG
 3XPs31K8vjPp/xmlKnfyfGkWhFPlGbCFLsGNIxRRMlj2veVtmM64Ek2pawc/GaAxjx
 WOjULlsw9+wa9SbHRBzce0DUWS9Y85cVSLJooVQywirHX0dE2eDHCnnIwNFzboHuaQ
 s1+tuMk6i2cKbNhp9mJyLnr5ZoKTtNJXCJ72lEcCZivltoKBU7IQ2tA2sqpHHWI4N1
 unRya2kxcIeDg==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:TRT9svAfiLyQRgDtejCvBCpmAzgfonBE13JQwxQy6SrUtTvXr5F3uODRaNqrqmles69piMuGVOVXboXdrIpnnFWzZonpXudXALnnUVDSu5lO/DrNSSzwcM4mKtnA1DjCjWsgqrHMCuNjk7hNFyOlaWyhfxW9kLRmou/kIqWOCmMGu2qKq8X8hUdMb8JkCKibgbVdH2fzmnhYp6T+mluXogWAYiGt+DK3vv8LrjqCIVIj2ZQMwlsWMkbJjoZZTml/rfVtiO+WehcMruQzrK1fJoj0DpdiI+WL7TSoGeq8D3lrjJyQcaCzw/nBENFl6KOsIsQ9GCb0sWkSmQFt30/ls5aP9Ne9JiBBqMoZunH30EoUjvCwYESQnSzqdEaRw8nJ7p6I9f8thG1riAn/P3v9tnM1YcLg3SNPJ8GO3zRCP1nYAhBivW/E0PivDMYgQOgJPVez7RRaAtgJxScaJAIuyAw5+WPkv8eLe5Y/BaEts5VPM2eBLqL0lICjNW004kdRMXrJ5Vit1NA6CAKZfg9Hj+LVXhrQunjXfOTXVvfK/6/ugQKZzbCMQpm/doG+u0tWhkqlRny95MucwyqIlugBIxzJMuV5Gyw=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 72C5BA4C487A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imh-000000000hB-4AhS
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:46 +0200
Message-ID: <20260920144428.3009612-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 25/66] package/boinc: Fix build with OpenSSL
 4.0.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...fix-a-build-failure-with-openssl-4.0.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch

diff --git a/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
new file mode 100644
index 0000000000..22e2ef65a7
--- /dev/null
+++ b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
@@ -0,0 +1,26 @@
+From 9cdcef8261be4891b4814c6f728dcee65027e5da Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <locutusofborg@debian.org>
+Date: Wed, 26 Aug 2026 12:27:54 +0200
+Subject: [PATCH] Adapt code to fix a build failure with openssl-4.0
+
+Upstream: https://github.com/BOINC/boinc/commit/9cdcef8261be4891b4814c6f728dcee65027e5da
+
+[Bernd: backported to 8.2.15]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/crypt.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/crypt.cpp b/lib/crypt.cpp
+index 17a9b57b3eb..b54e2f050ad 100644
+--- a/lib/crypt.cpp
++++ b/lib/crypt.cpp
+@@ -774,7 +774,7 @@
+     DATA_BLOCK sig_db;
+     BIO *bio;
+     X509 *cert;
+-    X509_NAME *subj;
++    const X509_NAME *subj;
+ 
+     if (signatures->signatures.size() == 0) {
+         printf("No signatures available for file ('%s').\n", origFile);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
