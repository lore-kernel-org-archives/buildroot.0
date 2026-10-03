Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96436CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A2164132B;
	Sat,  3 Oct 2026 12:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZIBuPl-TrFM; Sat,  3 Oct 2026 12:36:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8517F41328
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791030990;
	b=I+93GE/rbutdpIYnhH/nMBpUxGgDEryU12xM6fMaE+uyWPS7qEnFZXx25bC0b11DaaMm
	 1McaBOmHJ0KbtN7K1/9RSAC3g5p4CJsRWHZ0cu8r+ZMyQNdEaxVxGpTyUjeosOwrM++/3
	 exprX1+8Oz0fTjeWC8DX1HbG+Q/t09LktbdSQIs8RerxZD9RyPlUvsg0+qxufggD9w5mT
	 36TVNtLCR1KrnJkJjKqQYvO8zaHt7+k7p2uyRFsxTHVW60gfA70cRGX+kkOkIKuvA21W2
	 /PQW3ETqjhqmBgr3tQHtcyKs2Mzf2uTUkpKGovMojdeYPdb1ocBHbTo3nIK3PCGDBeQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791030990;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=v5flWmk7cfh+97Wo1oF7AhAXlOdJPE35zGqRa2E6yZQ=;
	b=RIC4q8aE5GKsUtMNUmLC87gwqnbAdydCrdg1wL8oTQc/TAjihAMwBcBzG7vwxUUb7Lxn
	 VYM844RwEi5pjIgmDLfgPsltBs1kCvVoE5QMYa+8FED6zTmrrNDSJ2i1me8+52NfVQ5M4
	 WModyYHWsxUXsiNtf4bJIxFSs1bmgkPekisdCa6n5elLAw1MJn5UeZcCHtM8m3VzdMUtt
	 2qOLV3izj4zWCyyezvQG7aJGP/n2STAG+A5hk7N8n4KEbjW1VHUfwu1p6baqKmLELIkAl
	 GR19CWk0NegfYagsM6kLo7U1USpxZ29PI8qM+DtjNv9liCiCrSf8o3K1EShPbfvEPbg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791030990;
	bh=v5flWmk7cfh+97Wo1oF7AhAXlOdJPE35zGqRa2E6yZQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BXPOG8kKvHrdJEirD7mWnSTdWyzxjZOtnKek9zu9PIywNGFa/8umQcJtIyiXbOZ3o
	 qPKTmFt3uwbV8fwNGlsiBc8efbIhA2wjR2Z2uaypQYxEhG8Ow59ejONLEw+rTgBlqN
	 6ULsT5E9bUfxJoSv86ZxE/vb6NMe1eTIJIN24yExoDc9uPJgGU4F9Dxx0ZRCVma4KN
	 vRfonYwkaA+nvrjOkGnzGO+Jt7awKSN6dtI3R8fv7jRcPyDQtlUeQb8m0XH8jSno9q
	 pkitXiG1SvtAo2jZyxdgdBdSKlRcAn2WUoOTIh3QS13CKwEIEXneQBvYU+099tct3i
	 TFBI1Ea0X6Lpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8517F41328;
	Sat,  3 Oct 2026 12:36:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5014432F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41D5060667
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PiFYS5VY_Djp for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:36:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4DFC960652
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791030988;
 b=V4ad+BgfYJLokKP+qybvB1p+Fuev6itzW2iIKYx2WmYz4hVXObGX8ebTdE/esb/IaZEg
 Re0e3QoBnIeq92VsHYgrKHxZZs9WtdskeO8PjKHpXBM0IWI4Dw0J+TjUqF72ifc1mVn6O
 OLWGHDZq8Vgb9HKe8NPQ6vxsrqLKTL8AYHnFgPUxEH7gLgMaYQheP7LFLtR8e+lHLXVHI
 aCvlqS5/ECX3YAe1ISH4LiO8cbd6t8V4r9LdmYV264zLr11YZ48Lsx5Klq0IFPZz5kUVq
 83mU7AKQuJwGmRgGMDU5ak5E7lsYNRC4Po7VeZjkzWEzt2IpPKVTDxzEJ1jjKWcsMcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791030988;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=trv5ZUFUlwhgzHTDaE2zQhcO0MEM0XqgeSSOUAtLq2w=;
 b=SREBcyYVnJqCkFWfPf47wKF9VZuyEl8QKRc8AnzYyHjbBeRk5ZSraZVApIYSOmOIOI6K
 lEHnCjFAJLixxRezYhS0sxzj7wUyhpn91YP2ah/08YKQg5k1nU0j7TFKAKtjYunI5Mb8G
 MiXtMSisMaeG6inYX51AYBdYD6DhKQJ6g+w6f5lE2jeMYIya2tf0f6xkPyvtlA7dryZyI
 5+UKvjIYIBVUTN7pfiKLQEqjSMz62FBBzMxqyYJ52S+8jsDIqiMtRNdrc1SEW5a+V++U+
 drwgYjZ6ugTtpwgV9V8utpWng/G9ZEtEueLlFHNATpVJjVoH2c8idl9/ZVxKAa6ieFA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=CDT49AdJ; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DFC960652
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2C45E4E41128
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 02307604FF;
 Sat,  3 Oct 2026 12:36:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4750910328318; 
 Sat,  3 Oct 2026 14:36:25 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:36:24 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD2xBh-pSD67TZo@windsurf>
References: <20261003084453.545653-15-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-15-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-libusb1: bump to version
 3.4.0
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

On Sat, Oct 03, 2026 at 02:44:00AM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
