Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79E1CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 23:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0D4D80F48;
	Sat,  3 Oct 2026 23:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V38D3vARCcSz; Sat,  3 Oct 2026 23:32:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B51C980F4E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791070359;
	b=m5oP8WkJgxYQ8CqISaVP9UA2RKz0TeKXisBP18MCUSDM6UdslySHDwv/18CfvTaQQKo6
	 pFyfZQ+qrtaa+4Wr4ry7gkQhOd1VZDbjjNTxNKFuKI5aeiXIFdN1YZrgKDHUHKX4QDXfX
	 Y3VH0m5ky9IzWM8R5UdkQPbo0RcTJA57mk8TrIsP487K1q2BOx/8aIPdJKUR0dpzainVw
	 nSdqTTxaaacGcG56OySdBkrG3xb9GIj2QQYZvqziVRCe3WrQKZ4GloPJc/Rvfq4Bp4vps
	 3C0SonuKxfqkgF+Z6ruQVWEYVilyEUrmdRqoaG7siQOwT3BkzR81vg6AFpDpnkBp1qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791070359;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=CJ5fcfJ9hep3mtcYLNdVyvLmBhsT1rdgI27VKmAC83o=;
	b=EAGwuwuY3txHraW9vc2Aka26b3biqW0PCLcnBqZBNR3oCfjRcZzwPlY9DCMKPHG15OPN
	 Y7r5vuFhQh2/esiWOVMp5s6BmoAsrb6EU1eD7YQ2YPbjg/7/gwBmQRr5rT6+Cv0QgGUF9
	 NoIs4T7uWzlJVAd0LgoJILW6E+8OVcdYcI13jiX/yYe7GProrMpJXPuekSRo63JwawVIa
	 q2oHkf/5q3uZXBQ/X4Xvf3GTSFmwsWx9ksHXDolWCn50m+AxZfCFgmwIm9aTYmiA1ElbD
	 HWjiO3kda5IRPKi60Q1n/0DUvO5IScQXzDudQucb/kyvKxhVHHe0AncI8v6GM9+0Gdw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JBzuSddX;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791070359;
	bh=CJ5fcfJ9hep3mtcYLNdVyvLmBhsT1rdgI27VKmAC83o=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=H63bLlAZ2LgoG4JtdseDEj5vY8zT8J076XdkTuJ05BzMOx0Y2VCyF8qpg/omhH7tD
	 lTrrBWXnha7AHeX9i74oUqgS3HoAUT9G80KTYjCmRxBSjhw+lq3Gm8/4PYGPgTcsx7
	 5Gq5/bfRMNfr/n4xC+zztc/JgYOTwgud9AK669Hdh88fyt4Bkjk0AFOPageqNcwGOL
	 TiRV1SJzK6N52bw1VJnvUaudnocR0nZKLL21eTeSArvDvQYNP24kEignGNfB24aGPh
	 FmpZyJoYbvlLklblH3zUijTD/aQfQUFnW5Z0ZuY5mgSIFQclqD/PBjk3EkEZrM9jcY
	 Bo4PcqeX1kuhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B51C980F4E;
	Sat,  3 Oct 2026 23:32:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 75C64435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B98580F4E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljT43imcq134 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 23:32:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7A15C80F48
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791070356;
 b=cPBRU4sfmdmNj7NZed+cgNMzxC7gpYRO8qZfDNwDU7kX0yUqaVWrkKzA31pnNMKA15Ee
 G/xZVYdHxvkCVS89AGvE943KzzADAriFzatMF7geXFK3xbN3ZvXZr43bAcKx9fk9pwViP
 Ro1sex0faT9QIliSQhtCzfRpvgvNWb8COq6rznpRu5m3Gi7tVho3gfeU+irrdgAhF8MXF
 ejK9YQcbMJCkgd9Zy8QpSfzfFRza1Nzfz1twr+3raPdS/oHmFlWiWjai8IpdK0whKgMRH
 OXhdDK9AW/UMflP6qieOmYVC5FzrY1o/JZaayUfd+OcQlyMIwZVz2hv3BoWpRUR8RPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791070356;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=BHkw5G40dSTkOv6eHrOjccWmD6AGIiTupnIuzdYt46A=;
 b=nNlBYkeCPmXVAw6Pt6BnX6elgoGWCT8IxtDRo2b6Ja44aP7ggwpc7N4ABqF7ufrmmuK9
 l9feJ5IEwTQFQNTzy7BDaXrWM8qhBpYeKDuWf8Af3MqlVZBtHNCHgwfw9HAOXVE2k1+IT
 ro2CHFo39gE84NE1BCt0YEd/h+0nIErAaCDtedraPZ/VdTcW8GTz2zr87CjRmox/fYeh1
 e9pl8h4wyhkuZ2UOqfqQ75pEHL03NV0a7jK7E2/LoCkIM6VicP2D59kEoXZ6V2PIxIj/r
 md5kTqiGM7QwG3P1tD4v1GS9tXlki7XdUd91zFKOkn36SZGvlToLIqMkOB4m5oVPboQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JBzuSddX; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=JBzuSddX
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A15C80F48
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:32:36 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-823d139c181so787520a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 16:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791070355; x=1791675155; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BHkw5G40dSTkOv6eHrOjccWmD6AGIiTupnIuzdYt46A=;
 b=JBzuSddXgxa8/+xXOD9SScr8kw0LLG0c2XaKYfUntX8o8cD60D2u9cMsL/AheSKoF+
 2XL2yCiYwvhcGUqdKsCxGomKbh5x7wzGdd9279+YTBUr2W56bwX+Vk1v5P9L9rPTVvNo
 mStoZ433O67hTjH0PmKjI+2rwWT/bg9Xoe1O7joMyHOJqpI6fDzKSEq6wZxAhAH4iFfv
 GnmSm9dZUitcUIe9DFb+d30PvDUWB8sIgv+rFQaOYiNU/rY8FgNyTz9w/jjFP/8fSnP5
 qCmK7e/MroB4Cc0Owo18AgVVesKQzfRRHMrNG+Ou5s0RUHakCDeN2fPpZ0+aoMg9082G
 BU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791070355; x=1791675155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BHkw5G40dSTkOv6eHrOjccWmD6AGIiTupnIuzdYt46A=;
 b=teFh/V84JNYo3D7ZkzviNsXGymq97ftuQ3ocHySdkLBd6q9YZBcASwWhMDmtP/DTaK
 incYcXUVTHNhvHRqGR5/jDhck23GbOzKVn92y/X5KjXoAlLwFsAVWLOIw4XsVycTUC4J
 48nxEJgq4RqSwIyHLTWVAGyV8dlJuXOvR7fWaa0/d9jT/n5cn+T8AmYlSrx0mtZH0qVb
 I3HqUMl7vcTp/DfiFi3VUMI+lwmFxpp0JyEQ4syS4Md8UBRbq4MT6TytUzwT1+pa490+
 o0Shq/0jFMMk1I1k/lSoVI+IetIOP9hodd6WfCJ9yXD5KGW0rEs5ZJLQOtrd+jhpPNpW
 oyoA==
X-Gm-Message-State: AFuF++m0KuCRbIQZXuNxvMHIhaX38h6DqIcEXfei6OKh3FruxxN2xHL2
 4CyqI3EbpKa9/0/wDNnnZ8B7c1v+Ns1d6YSO7MLWB8HEkrCZx3aIo7NHNwu1nw==
X-Gm-Gg: AYBFou2h8hdDkQNUDDo8D4zFDQ5Y4ZeRCeAQNjd4WYoMXMc1kR0WmBs8BL0praLMZSe
 K0w5oNwBe5J85FWITsvgqrNN0yyvQ2z5xnmKK2JRos7gZSoYz3uMY6ACwd4huM8CLfOnF7AYkn8
 1ujHZw962kzFqtgmceJJztRpOI7WD/rYvnCRkzFklBs9QHBsD0x6cfuLVEIwFm3qPYe/dgVYPaR
 gCqFaoF7FMKoE3q3pVrZKw4CKkD3DlxY7b71XB+YyC9kFeBW0oPa8QPE1DSbt8hzfLyF7hth1Bl
 lkc3llEQ7/wEOrZZTeN9Y63QCCkK0RWju5m6WBm7kxX3FfiG4oE1Zmps5gHJdKr3gWF/eND3UHy
 bUYSbXhGoZYli9sIpsBnmPPVkx5FmbZCLvMpy4IrqVKlQTBuP1b/yJLk2Z+Tm6FabCHRjP0VDNo
 l8w/W3H3SotXfxf3iHn7FzKhASAd1r7HTFxt0OBTBIBAb50hkByYpM5hFZqTdzkHwyYd/LcDd7B
 xZvpZjNJFvRXF5DcEeTES6zYzxcnU7si5mGdZ/J//zSr/yq6laANMuqP/jjQXDuA9K+u7RnH4YO
 6yDnQSOcqSZoEr/IEFs7oao3+YcssNVvEJjlgQ5MyzQ0Q3BgnKoThqJFo5fBQSzhKNnYbpAwrRU
 I6MTqIdXmHUw1+Fno08K/emsLc29fS20/KzNea4aYXA==
X-Received: by 2002:a05:6830:4424:b0:822:27d6:c281 with SMTP id
 46e09a7af769-822843657dbmr8305374a34.8.1791070355249; 
 Sat, 03 Oct 2026 16:32:35 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82279b7dbd9sm7045147a34.12.2026.10.03.16.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 16:32:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 17:32:29 -0600
Message-ID: <20261003233231.753958-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003233231.753958-1-james.hilliard1@gmail.com>
References: <20261003233231.753958-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/python-typer: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-typer/Config.in         |  9 +++++++++
 package/python-typer/python-typer.hash |  6 ++++++
 package/python-typer/python-typer.mk   | 15 +++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-typer/Config.in
 create mode 100644 package/python-typer/python-typer.hash
 create mode 100644 package/python-typer/python-typer.mk

diff --git a/package/Config.in b/package/Config.in
index 59d5b893da..0b6b7c3188 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1491,6 +1491,7 @@ menu "External python modules"
 	source "package/python-txtorcon/Config.in"
 	source "package/python-typeguard/Config.in"
 	source "package/python-typepy/Config.in"
+	source "package/python-typer/Config.in"
 	source "package/python-types-python-dateutil/Config.in"
 	source "package/python-typing-extensions/Config.in"
 	source "package/python-typing-inspect/Config.in"
diff --git a/package/python-typer/Config.in b/package/python-typer/Config.in
new file mode 100644
index 0000000000..e78557d95d
--- /dev/null
+++ b/package/python-typer/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_TYPER
+	bool "python-typer"
+	select BR2_PACKAGE_PYTHON_ANNOTATED_DOC # runtime
+	select BR2_PACKAGE_PYTHON_RICH # runtime
+	select BR2_PACKAGE_PYTHON_SHELLINGHAM # runtime
+	help
+	  Build command-line interfaces using Python type hints.
+
+	  https://github.com/fastapi/typer
diff --git a/package/python-typer/python-typer.hash b/package/python-typer/python-typer.hash
new file mode 100644
index 0000000000..aac74ce2bb
--- /dev/null
+++ b/package/python-typer/python-typer.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/typer/0.27.2/json
+md5  2d81e72fd4c60a94c9d1b6ade7142f65  typer-0.27.2.tar.gz
+sha256  269b7eb9d3c202ca84b4bc9618cb04ebb43d3d4d1e567e4c768607232c05f945  typer-0.27.2.tar.gz
+# Locally computed sha256 checksums
+sha256  58992cebcf8dfb6e40c4e2112ed12126c243666dca3912a3d78b7ecac4859d49  LICENSE
+sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  typer/_click/LICENSE.txt
diff --git a/package/python-typer/python-typer.mk b/package/python-typer/python-typer.mk
new file mode 100644
index 0000000000..ca0d1c6ee7
--- /dev/null
+++ b/package/python-typer/python-typer.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-typer
+#
+################################################################################
+
+PYTHON_TYPER_VERSION = 0.27.2
+PYTHON_TYPER_SOURCE = typer-$(PYTHON_TYPER_VERSION).tar.gz
+PYTHON_TYPER_SITE = https://files.pythonhosted.org/packages/16/f7/57713ba479fd405eb76de31404b2c744c289e336b2d999511ebf51e496f7
+PYTHON_TYPER_SETUP_TYPE = pep517
+PYTHON_TYPER_LICENSE = MIT, BSD-3-Clause (vendored click)
+PYTHON_TYPER_LICENSE_FILES = LICENSE typer/_click/LICENSE.txt
+PYTHON_TYPER_DEPENDENCIES = host-python-pdm-backend
+
+$(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
