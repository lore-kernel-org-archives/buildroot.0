Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA27ECCA464
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F8F040911;
	Thu, 15 Oct 2026 21:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xFWEds_o-pYA; Thu, 15 Oct 2026 21:52:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 820B440952
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101163;
	b=l5HChc2A48U1IPNAED3HyrSsIWSipeSoAb3ucv7NffZi/9e46NUL5aaN6ebCJFrh5Zkf
	 otpabZgiJ8k920e2OGzmi7qIbKyxSOJHHTG4FmUBVriI1C5Pw1mucyQICrNJGjYxDxbI0
	 XSmS8CQwOb7i3TOcLjT5QJZOu+ZgjmZ6WHOpEITRLaOk1yzp30n4e1XKaSEU/Uy6MAYcH
	 Wyzq04s0ugFciMCjuv+yDnolsEAO1u8fUE8SLb45q7XTe+vj2M0eGZ8l7VENQO1U4QCsU
	 xNZDrsogK1m4DZHQbAUJ0JKfksxMAcAue1FyEI6QWihQBwDC/M2z6Sc/JLhte59jTiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101163;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2QkzWtS/bsrOMoOA0OBwwqNEaHPyYCYvaMuxjLoIxvQ=;
	b=oErCB8b5oAHHvhoVfvJ/8S9EDqfusMCqwhHKYk8F9bkks7Y6/+O9MExjHvZET+/oBh0/
	 p/vhUn7imd/fO/KTt9iBaZAAHXrTDzuBS0YJD/8nAQIHQ6miXFhQzLd12VrM+q1k8T5KO
	 GtKbA/U67qyQQ2iUDb8ONtLt1CqqqmXUheMQ3cqp1qlDgPnTxIQIa90aoVJiZ4i76gmb4
	 OXlOrKH1Rfuulved6Xz/YYf+cdQSLGmPiweaJqQ5hmg36/Vh5CJ1vRxzdLz/r6zp4QCqo
	 LS01LM1BMQIOa0Vqx92dgSpLYorZqteKxmTP5EaYsln6O2/okSyeV518eMXtDdDbshw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101163;
	bh=2QkzWtS/bsrOMoOA0OBwwqNEaHPyYCYvaMuxjLoIxvQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oKWzwWU5S2AHhmvBTy/TYjVPn6dfQh9cvh2Vn4jMrXtuWeaonio+jukenER9CJbxV
	 2KimNG/KudvMfpbQW3m+Q1xkye4pFqswpMKzNilYOCOnrbWwBGQMHOXEqvYHC8QB2i
	 Pi8wb7FDGhR0kK23EN5luckicotHgGF3OLrZTJftGdwv1WbjcyC9dw0Ntoumi0Oz6Q
	 3Tnu+Ri0hxN93sAWhATyQ1+XgEozrCoy4Z2LUakw33iE8DR1bkmhKbHYvud7tuhuZm
	 4UePuH5OzpNM534MWwW/+f5/vXBwcpLesAXu6cIwlsZqS8YXcoeEI0CzJdy6Ybj8bt
	 4VID6TG9yFx7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 820B440952;
	Thu, 15 Oct 2026 21:52:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EFEF362
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E443A60B07
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GacAwfjkJlIm for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C079F60A94
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101159;
 b=VLvZjm6FiRCihUXoxXTKuMizoFnlKVp6IBhDcuP8wlpzLTanOiDPb3MxHKCGxq8ubNbM
 b6qc88x90Rz2U2HNML3IqrzVG79m3YLTDmUNMZxZzZbxHf3sn6/9Kiw6pXnVsPf+5Px0O
 GQw8Kc3GzP/zK8iDmPZ7D8ZcUioEKVHG+aHEJSZDNIGgcqdECTxMWSVrdtHl/ChUX/Zaq
 az5E7MXaSjx/LtSJnaQb5NX1XBhAx+OamoODlQs6JO91JhP6FNy5Gs+lWMEQjlf1gSYwO
 CTkCGk8SbWzYae4kBj0EZUPwByrpKwZHpmZEJiVoDrL2gXWoz9TwJPXIjDX2mldfSew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101159;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=DqmbThyfyRCEYAeZG4aJ2Ao68O5BrebRlMlKvOTujeE=;
 b=AYWcmW14M5Es+EELn4C1x0pLs8doetkUYoh7zEzqX50ifLQ1qTHHKAtwr9cfq+wvVc6Q
 y5VPYVbTvqtlnHgrLTzFXvmmk/+bsjhcU8SGz39DRfJSDM6FD3lQhHyrCYkK6klIubadm
 /QjCT8nYIzDf2ZNqNA1pcnEgC51E8m3WHyLPj68oLwct8ckpasdGEqTw8xtG/9yXUok02
 mcLN2sN8CCH+39Ix6JrZs00PmYM8oCjFMwT3ZlhMQdC/1n3S3zy5UZRkoGDywzrA0YOGI
 /JK3xRi2l/Z7C3N/J1J1ymSSq8TlWWM5L8DCIFIwGZ/gTlPWox3CTB1l9jwobFkJTqw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="iui/CaJu"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=iui/CaJu
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C079F60A94
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:39 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-4f58dce2ad9so4230487b6e.1
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101158; x=1792705958; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=DqmbThyfyRCEYAeZG4aJ2Ao68O5BrebRlMlKvOTujeE=;
 b=iui/CaJuU9N/f7TyoM0pxzqJFf3Dggaj034cTuhtKK7fbr48oJmIWwkrOiLFHYFDQZ
 Inxchlm0tBr2gCZF4+y4pf+tnukpZXTfuDdShW972w8mgYAqYjqByggjb9kUODDm2Q1H
 KyDx6sJiImM1zIcrlo0jb/yL2tZoZW2KeWXXLbQsXxwROXq07RJniPy0Da/zAoz4AkWw
 IaSW9dGUO8sCAiip/Ng6cDe7lHUU9hq00SAv1ifbwP/RGJ1+JQhWOagyLg5hAeltpydU
 XIbFTZ2UikIt44dbFDMK4Dn644jA9siLENAzrGF2Xer7e7D1x35WkA2plEyc2lqWuIdY
 /qLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101158; x=1792705958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DqmbThyfyRCEYAeZG4aJ2Ao68O5BrebRlMlKvOTujeE=;
 b=c4OmR3cgx5Wu63JHhzF9RbGBe1+FLNe21B3e6BpKY0FmMgjnWpayXLODHP261gcEW+
 DXQ6XlDwJAxP4Txb0pEXh0iP8nHo3kewWItPWtojdeG8BFRF3wsnJqIPckLS89U6kXLP
 ODs1DimZ4s3t+G0JCGq5JDjyc7qQ6Js5vMAoCdPDSjJQw+WyrzaD7TiuSc3DMr/Pgt0+
 1ZQ1jo92a51C04l44HcwosRle3s4U/yZPr7Pk5X7jvQcyZnVxM6k5J+S6d3kLXVPWzkl
 ngG20SCIeeBUi+3wjRgSZ8svaDU4sQpElwBgmNUz1h3Wj/3yCWKP3HmIU30KioSFjG8g
 BIzQ==
X-Gm-Message-State: AFq9FYJeRv0IPHexibxH41F/kO3YSDn5objgXMn1D+D04UQd/2KkqJ53
 KKboJEzWbsTDGaq4i0yqWNNAVRk6isrqiRwT1KsG5aULaoskO5fh58PWiOHhZQ==
X-Gm-Gg: AYBFou30VxclKcr/Opb5FN1HlBrjGFB3AdG5d/3YdWMd1p758//nK8w/VGTz1cq0SVd
 C6PUZQ2CW2Mwk6mmVuafzx5fBTZLuzQXS8w4zItx+tqVIjWbb2/mKko1vszTBVAtJwBKtmmtypA
 VVswRrmyFpv0aP+c0A7p3N/b5UDjIMs2LgBW6KmGbE6OmooNSIrVnvueDcYefQh8qFh1P7H/Sjx
 Hwvv937UGbWlMusyvL1kSgtiFio7aHn1jmqEYp2KM5DIo3OXWbTSVMIjOscuQYcSnqgZHleisKz
 xdDEKqpvABRi63eu/Zxn4d35mpXFjqeHYjhrT6Rz0cr+H02nTZ4CinulrPPfEMR+La74tkYM/eK
 B+JAnpHKl/SR2j7GCcXLXNVjwttYmewWC1TubGr8jChYFd0ylC87NB8zubq3qa0ICuWgFYba8G8
 XOZnv4fi6flgCmohO6oMXuZABptjLVIwBay1iOwUME/1bd9iISghLQz1RRdpUIOtHfPOKLnPun2
 Hu/J7LF4EYETCqZ/dDTChhAfqN0u4tQJPzBxqFCO1UUWGOrh+NEezUaC7qzIiRyub3QCPOcp35v
 sLSBB5raBguarbNpacvg0/FeRkmXlNrDeDh4DhY3Hor4yNWDUk8QPoilVVssTMEm5ftp0pDidLm
 OJ1pVGpTP+oYsD7dsqHo7SPeYyJyXUAF7AOYh3Pdt4JI=
X-Received: by 2002:a05:6808:1a21:b0:4f4:f5b9:8c74 with SMTP id
 5614622812f47-50c34f65bf7mr18432342b6e.0.1792101158334; 
 Thu, 15 Oct 2026 14:52:38 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:51:51 -0600
Message-ID: <20261015215210.3426895-15-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-wrapt: bump to version 2.5.1
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wrapt/python-wrapt.hash | 4 ++--
 package/python-wrapt/python-wrapt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
index f384c7a016..3092a879b2 100644
--- a/package/python-wrapt/python-wrapt.hash
+++ b/package/python-wrapt/python-wrapt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wrapt/json
-md5  62a3f2bb129e77c859aaacff584c53a6  wrapt-2.5.0.tar.gz
-sha256  c48cdb6c904dca76d9915a579e4a5fab6b0c25f650c1019ce78a78effaf7a345  wrapt-2.5.0.tar.gz
+md5  44850a284b765d6e8aa1fe09ce5fdbd9  wrapt-2.5.1.tar.gz
+sha256  f595bb0185aab3e9dc31950c95d914f56ea8278810c3b928f3426e12ed6d27bc  wrapt-2.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  d4f66854a24dda2f2a5282912aedebe6b18186b86284510a433d78fadcd88e5d  LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index 7c3f4152a1..29f8dc12a0 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WRAPT_VERSION = 2.5.0
+PYTHON_WRAPT_VERSION = 2.5.1
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/3e/d2/a254a26d8ceaea87e0eee2e89fcfe53ddc1858418647493bb2937549ab6f
+PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/04/22/89e2f3bdae5cb34e0cab0cd86d7172dbf418de4b46c9b17b9c7a560dfa44
 PYTHON_WRAPT_SETUP_TYPE = setuptools
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
