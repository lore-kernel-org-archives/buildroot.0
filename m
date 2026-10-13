Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B218ACC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 23:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F12880CC5;
	Tue, 13 Oct 2026 23:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0e6jPzQtbL6G; Tue, 13 Oct 2026 23:30:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3136780DCB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791934203;
	b=jOHp+9TN9fgj64p5Sj06IRfCFgR/qqDjoMsHejN458sfPZE2J2Nw7jG0NOfHYmBKwirC
	 ZIpdJw8uIqYs2QyCqyp+LM2PrED+FIeWM5JCA5lWYWvUJ55VIpTrCO1T7z745jQueESi1
	 rOlDvlmT8u1z+wfnWxp8HX0ZSGo1SQWYFJ8cSGrue02Ign2tBH0Eb8zqhtmIsb+szzMhh
	 32APttng9Gs2h9qeDMpzmU9qLrVCBQ25VSKYvidta1HTxM+m2lTYlPozbQogGzwBOJESF
	 i7Hd0pHKuK1N0daJsdmAzb95dNo4SyJgoQFw5OFNKlVxE3AxZJ+FUv593oolFDRgngg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791934203;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=UfKNLcxN158xn9t5rnAg00NE4SCROfhmro5OTc3Wr40=;
	b=Yx5zmANeIphZkKMzNmYE6x8X4Uegm/MWJ5IudI++LwK3S60CpfbbC+u4eSIEz3/fcLq3
	 DDFeJXS35kywhHoTqokbXfhkVoaI3H8DFcoUZuHmoxRnlGENJEyzrIXArIf5DDBz/J/jR
	 UUBuLifkCkn1+/vB8nwRUCOqaYFqUyqrH257t2JktiwBM1zLsAsGADHTHR9ZIK5NuEUS9
	 AShIpkzCd/bWP1Y3zbZ0bjOq2vj7wRgIVRIcpwDizH8SZjQT79JXyuOuuxkM3sxRj9w2X
	 hi0dJjNPmU3iu2hoJMRMVvQCiD0y/aBWUgmQQ5cg03rGlOG1hcuL4yr0490KiqJ5jyg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791934203;
	bh=UfKNLcxN158xn9t5rnAg00NE4SCROfhmro5OTc3Wr40=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CAKnv+KEWGfwrYHAthLvz62n4igUOwrKjFwmD9xXVjWd89vV2dLwsJcvv9poCa9C+
	 IXJwBSjhJ2EEcxn0Big/kdSebV1pdndbsRJWIqCHhiM3eCRRk0HaWMx7dwH7HlKTqR
	 M8eVn7AOK3clTAzt5zGWQhfXrABpwRi1PYru18Gl6YN+HuqFZATDP5wgY9/Yyw5Nw4
	 lcHj8vYSmhWwgDiMWx0ft2sP0egZ0urXuPy7Jp+Xw46KJO6tgBIcw5J0nVxFX6x+EW
	 KGGJ3UHpSmHTzbiFm7mesE/4iqw78ilnTH/myGMPeOP2gYrLusoHm8wYqu4pq6li4o
	 oxDrTlRWzpv0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3136780DCB;
	Tue, 13 Oct 2026 23:30:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FF6343F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 866544070D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ur2vwv6asGBx for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 23:29:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 93674406E1
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791934196;
 b=E7ughCaFZHP2p+GQiblRZRg2ku9lASGKxCAheI41AcAmbjcdtLJQ6UUx9ygqpq7uU6W7
 o+GQcWZyV0kZZvtrHTBtIgqhGjBgCzivOX+Ys5nCvLcaccJUeJfQEtOWxu1IuKKfd/dtf
 LSRJE2R1VBiZb+j8UkTjqoTKU+8CpO4VUG1bccgq93Hv1464kX19HUrzfsccxXS2V3xDT
 WCVLCRs5rMCBDxs9V846Hck17LXE8rBwPU8wQoHDWA7bnGasXX9kBvR0P2wB59HbX5NxJ
 w5Y3GCbIexGnt/V1hwgxiEQQnGca8rrzehaAtgqOPQDWBlhbfJPG00EW5At9a4pgEJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791934196;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=0Uig+GUqjq7p/YlYEaXe9xFBjKEYrpKZRhcYNSUTRVo=;
 b=AOCYr0SP7hCSQ8aK1ValHWFJWOqU9YodX6YeHqLBSNTven+pyVUR1eUrTGJwfFPzwfpf
 DwVJzWlnRJ695gA5raQWj6Ama3ekgPfkUGdQcM8EwUFrluH36H/fQKkYNYiT987uyp4J8
 FVX9wMW5igYlfOJvywIqpQV6iEwZF99BGRebCGO30NsX2ZhFY+DyDWdBx1eTne2TuF4c5
 XdG+wF2P/ArMQm1Y6I3wqsrt4K7K5dEIXDqhBAdCa434uZHQSoR6M7+ddW5kDNIW//E+3
 QVEbVdeaOqhVHnHanjLo98Tpnjgvae4v9E/5k4mew6pkFMLLSgvfdo4QDHz8fneFZmw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Ei1cVgR8; 
 arc=none smtp.remote-ip="2001:4860:4864:20::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Ei1cVgR8
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93674406E1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:29:56 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-47b47de8b4cso2143447fac.3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791934195; x=1792538995; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0Uig+GUqjq7p/YlYEaXe9xFBjKEYrpKZRhcYNSUTRVo=;
 b=Ei1cVgR82yfKU/PPW0vWg5GI5ad8sMnX7Hqfy3LnEEtBoGYu6/EppqYbrg0NnXf19R
 YPfE9HLU1ttEKQBqPox4jNsyd8G/siK3M0O8BPs8aOlFIy5vUFmBxsds4CvmqOSWSfXa
 rb9qHAqpDRfqZAdeHTVLt4oqY5dl47onJ+H/2u1OrSew38ujtal+dC8ONHnV90blH29V
 qEf4BuY+E7CzWf0N7OV+zFR44wVZZmh9scddF6Jqz+S92mpQv7BsglSAAENXdaTtoBfr
 sYanzqQ1OowVwXOumj3Iwq3gfDTIy7Jztl2EIubt0+RZyscF4H1jImRJtmQD16OCav0f
 rOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791934195; x=1792538995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0Uig+GUqjq7p/YlYEaXe9xFBjKEYrpKZRhcYNSUTRVo=;
 b=0BMmqFfoOIkhSlg5Fw41N2/OMWKRn4arQ0hQ85PQS242eL1dzI8ubMOFnEV6EnLqsi
 hi5hXNuiUPogPQNJtWlB563eqRRmAYuj4fOYItUTIX7wp5MMDpTMt42VATveSSnJEots
 PZIHXgvITW9RpgK6Onkfym+itSTT5sYgYQPuC2CeXmvf4nI+h6lTO1Tw3nBV1vnPqqrj
 mL0Pwy1ocHfi9bVrRTMXSjBv4JGEEZmVrBoWazEH8ztmrm0d1QBRLQk7OtqjumeLdcOw
 cgwzmx74vrtWdyhpjU1JmA9xJgdk0q3fu2CrGrFlVNf+m8QBDynuwzhEUdA6LWmFiXSF
 ayhg==
X-Gm-Message-State: AFq9FYLlpyKCa5XDNd96WiXD0DuKTbxc08tFEICIY9/aPFKt7mQFbatB
 R9gF+SdFln5a0ieMIi4mkwlf7EoYL+5eQsCuaAGrFqhDdN4B61gxzR0wg8ariW91
X-Gm-Gg: AYBFou1W9OoeMBOqKhYkZftUDETI9sBGSaq1TdVuAMa4z/8AQm3qeP+v7RmJbMWWv2J
 g+Z7+2NeBNQ6ys4BhGZyltSziQ8BJhoNoGAfartPeCn/2QCah15kUoWGDesw7wr5bjeJC5S2KCG
 WamEX4IW8qmL96cuQCX0RumQokD1WslwR9Km5emGKvTooonOLh3MItBR7aKT+m3aD4Rug/oxTV8
 6oQAiOL8T3E+Nm247u/g/ch5lpd2Bhhb8BC4XD1kNZdINvcCL/5ORrs83DhHsQBBlfY8HgwqwhG
 PY9lnt+PjIZRv8dEllJrI/zPK7+xjcW4VgysfriR2SVuz+6BSSwaulIhC8S5F3zqvlVn1WywSFj
 7Dcpvn1UW6Ocj9Aq5+/SSUSX/QrCtYG3A+ZFTz50tqaj4qenhxm0Q7DdXOPhEpzHvmUwwpPNG8k
 yBdK8Psrc2paAB2uVnqVp2kZirvwrDQQ81aWiYxSZ5djolvkGUkNU++p12PG0lVy6ti+TvmOmSg
 h3he+evsHkSWli8BOfKxCWOuODcbo1HJuoFE6siHD6d34RBlSmsnwQlxcnYrNGUYJTOnC6jZPhg
 rR4a2e/yHywIyGLCDi+++JZJMrFe+ZDyhQi2AGbdrXbgc7lfZbSeqSZmO7jjnsLn/fYUSOj4t0h
 Qs29e4UOO2lb1dzGNzma6S3hyze9n1sIeaU7iHldflO+ESWqLqG53sA==
X-Received: by 2002:a05:6871:10b:b0:494:a6a3:b58b with SMTP id
 586e51a60fabf-4a2a8540c5amr12670198fac.7.1791934195307; 
 Tue, 13 Oct 2026 16:29:55 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6dfbd6a92sm828514fac.9.2026.10.13.16.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 16:29:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 17:29:40 -0600
Message-ID: <20261013232940.2690456-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013232940.2690456-1-james.hilliard1@gmail.com>
References: <20261013232940.2690456-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 9/9] boot/uboot: add host-python-pkg-resources
 dependency for binman
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
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Binman in older U-Boot versions imports pkg_resources to find entry
modules and read the missing-blob help text. Setuptools 82 no longer
provides this module.

Depend on the standalone host package when Binman is enabled, so older
U-Boot releases and vendor trees continue to work after setuptools is
updated.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 boot/uboot/uboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 96b8cd0d2e..1f98f1b268 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -304,6 +304,7 @@ ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
 # https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
 UBOOT_DEPENDENCIES += \
 	host-python-jsonschema \
+	host-python-pkg-resources \
 	host-python-pyyaml \
 	host-python-yamllint
 UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
