Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7A6C9833E
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 07:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 078A360685;
	Mon, 28 Sep 2026 07:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAYd4cIwQ28r; Mon, 28 Sep 2026 07:46:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F219F6061E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790581617;
	b=IqRofquW7Ap2C3OVNFR8CSwlRMUU0ScwZgG9y+JcYe2mUulOdkwmeJhZhg3kiZ4mZ45K
	 OwuMeP7JEvwgcSB2vRZ/+fe30e/By0DcRDvX7Ujbi7QyzdshZG25reRoYMH3a5SrWsaxx
	 Ovk5BNwicpVEDCVKyfzMZYdpCE+04fC7F+xnok+JeUBojr4fsQAqJZSy4sGotVhCk8J3D
	 WGK92g7dl2nUe7rCQfsEmyMfwPEZ2n7ETODNXXBdSNh4Nks/0iLUB2jdoU2muoIzlUMMb
	 jeAjd/wp/Oblgm1UZ0X+a/ZWVRE8GMUycpAuqsfkrrf164mJ8TOdpujltFsb183IYNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790581617;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=9AWbhGjFHR6f9Bw34Me79Y/j6Kjt1KLo3827r5LfCiM=;
	b=jRdIUAK3c2RV5iUuUlYkXGxKj2XBEAvHdI2HzVCna8wqpWPUv+uvuIywXx4U6xIGa1HI
	 BW65U94j4phipFw2T7s3CDTN5TkLHU0eDMH1bqosLNWxDkkSs0jkVCY9yS0LAGIvnbH1T
	 sB6jCAFwZHsyWsVO5Irj1vKfA8OBT5ksQPBHkQ1u7tKTs4XpNdUA3QowDME9HcTfhNQqe
	 ORgSWbIk7aTyMJSdCIKOHyaBdwumuv8GpixvYQaTm8B0qdIWtFwIHz2PB0AVa+SMcRz5E
	 twgHCmdoE+Qmi2xUqWCQh5qP2NTRN6XEL+yx1IC4EGbRxt60buu9/MB16Z9rzibUI7g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790581617;
	bh=9AWbhGjFHR6f9Bw34Me79Y/j6Kjt1KLo3827r5LfCiM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=bpet7f0aEMpZVYh66XYCGTNhLHZqdTHifYi/gAzr4pxaOUEFLxqv8fgD2kdyA4tiP
	 S0I3YpDPJzUfFjsfWPZaRRcrJp+9AhLO3WqBGDKwxy6PEDqX/SoUO3PA3EkERtMKGO
	 wjcNzpOSQB9OP7EWw00CWFsVzWJzrkRjn0VUptEWzEPt5Wn+vCj/VuurWQsl8Vk8VY
	 oAiYselEbr6yPnGlOGxAi+pUFgdmZ1Q5bYhTOOZSAvzV87OFlJGTAUfOEIbXpiJ5dK
	 Ygi9eCFdlyEnOIFk0opMwzWZO+RkQVL3NvOqSztGc1x8vnDXZW+E3hxpg6tPYZds13
	 2MK4hC83zbXqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F219F6061E;
	Mon, 28 Sep 2026 07:46:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 569BD72
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 07:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47615400E0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 07:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQFRxc0jf-2t for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 07:46:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 17C5F400AF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790581614;
 b=G+4o5CLxNz9i6ibssYfC8s4gJG85IJFxzOejdoTo69A7DGqLuRWS/pFD8GiiX6taEPj0
 f3Wk5W06tevAmxoaADLYzCyBkBObGIjuT3af7oKG2O1kdz8fwiZQYGvYJ1JZ1fKmAtDr/
 /B9ynH4Zo3O0hSYAP8NECIOOXRfKZIx30U6MVPboYvjQAhqkJiCNu9VuYA+ipJBZexETd
 xKNEQ7tqgvk2t/ZF0Q/tskZmC1BJaurXxib6cFhb/fJQLAeWdzTSq0+R5U6uSqSksNe5j
 oCneG2noJpwuq/iDr+iZVYfiQLiDjwlQ7+Pj8US2brYpOqcvNJZjodoIKiHjlFxjIcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790581614;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=gp7+uEjz02aY50iFW/++UUZrVUk6DAQNYJvWb8ON47M=;
 b=AWbT8zswLTCaHLpcFlUkcv0GScQCjdeb1vhcoJjButO+cGtAo7cMK0hXZvdnF3sv4qXd
 FkOIQuPRHrOsLcWXM3/kZDJtUfXKB0/bHBOjGiPbbvGFs7P6YbLYBG7R/8g8CPsJ+IX9O
 rCwtFcz4DbgB5imRu851RFdg3xOevQuZ/UDmgAK4rAOixCjs3xRIQX/Bag2pUeT32TB3T
 Jg775PiYO2kXuKrA1wpJAXmVMH9az9yaw4Rp2cjbnlwnOsgQnQjf87/orpYdJ+ubCVl0v
 sEcbbXI/K2nNnJdg36wBMpr6AV75cNZLzWlmLpF9fYSFHbftpnNyfJA7kvKw1gXK+9w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="t/UMSp0M"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17C5F400AF
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 07:46:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E0C834E41091
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 07:46:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B4960601BD;
 Mon, 28 Sep 2026 07:46:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 62D25102F1E95; 
 Mon, 28 Sep 2026 09:46:48 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Mon, 28 Sep 2026 09:46:41 +0200
Message-ID: <20260928074641.1017968-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] utils/docker-run: add NO_NETWORK variable
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It is sometimes useful to be able to do an offline build, to make sure
the build works properly without network access, so this commit adds a
NO_NETWORK environment variable to our docker-run script, which for
example allows to do:

$ ./utils/docker-run make source
$ NO_NETWORK=1 ./utils/docker-run make

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/docker-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 27c169db72..60a12455d9 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -21,7 +21,7 @@ declare -a docker_opts=(
     --user "$(id -u):$(id -g)"
     --workdir "$(pwd)"
     --security-opt label=disable
-    --network host
+    --network "$([[ "${NO_NETWORK:-0}" == 1 ]] && echo none || echo host)"
 )
 
 declare -a mountpoints=(
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
