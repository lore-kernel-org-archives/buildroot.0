Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FA4E8FDD8
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 11:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EA53405EF;
	Sat, 27 Dec 2025 11:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Y_4IZTxEaQB; Sat, 27 Dec 2025 11:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78F82402D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766834746;
	bh=GB35QcAi3BTEalOVqehZAXMBZNUBt6++yzD7E939IoU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EG8jWTw27/RkJMhTTWk9LeI3W51KmJPV2wyzrAiWnjtn+vhdhg6xftVLx42FPvxxA
	 26NadkJKGUd4EisAWDMYGQ4lXM3WCO8OSX9NCsQ4e1p4aR5dz3f3LcrFgFQ8WrKejM
	 CYsZVRifgCBgX1z5Y19n5zu4XEc01NvnlRosXEWAhW9VZdTqIrIMBbTWWSLWueGglz
	 V5MGmxf+ffRR2QGW2CQCEuy+sxC9OZs5uCCa/xY2orjIHuFypnPAZGx/JMgztd4Unu
	 WWGy3+Ud+Jn2mlMem6YJnHsIHBkAgUixCA+PEK9FATjKlTgWhO48U8cSbPZuN5rwk/
	 ezLVuOXcnDDZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78F82402D1;
	Sat, 27 Dec 2025 11:25:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6D0CEC
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98DA5605DB
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yttvXU1miTa for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 11:25:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CCB6605DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CCB6605DA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CCB6605DA
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:25:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BCDA5B0053E;
 Sat, 27 Dec 2025 12:25:41 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Dec 2025 12:25:41 +0100
MIME-Version: 1.0
Date: Sat, 27 Dec 2025 12:25:41 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251226171207.1211941-1-thomas.petazzoni@bootlin.com>
References: <20251226171207.1211941-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <7da4c7e9f58c96a3a3c4f664cc4db988@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766834742;
 bh=2kFtqlEmCqNXmyFEF9X7NmyzWq8FsbL96sePYiIgcN4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fx6T5YDRWS//uIH6aywOU6FiFgOR5vAjoaEkeYcSp/ZWCh6lBYpWZhV5Sf6Fnb0Wz
 OvkjDZC/daV9El5sNxTiAnC8GHTGrqxILQGqHo/H2Qh2Z64LGBNTK7bSh6QyogsCT2
 /yoEQNm1z9PfJh7UDJq0mCLbjo0MeCuEko4uKp+kbI45kUb+ifMLRC1FhHwIIrteOU
 xJSRGA/9Q80ab27jPnDbQDLqzPN0jeUb8Ljf0i4ti0XV3cbYb7850jGh3ArvmMAD9W
 e3QwQWuZH9pI+oELQw3zUGf25rnNOSP8wHCgTsfV9Aue9dOIqUyOhX0pw/1xtAAc3j
 C/VOslIKLcEfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Fx6T5YDR
Subject: Re: [Buildroot] [PATCH] package/gli: add patch to fix CMake 4 build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/12/2025 18:12, Thomas Petazzoni via buildroot wrote:
> Fixes:
> 
> CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
>   Compatibility with CMake < 3.5 has been removed from CMake.
> 
>   Update the VERSION argument <min> value.  Or, use the <min>...<max> 
> syntax
>   to tell CMake that the project requires at least <min> but has been 
> updated
>   to work with policies introduced by <max> or earlier.
> 
>   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/30c1645d04b9d2b581aa7a866aa19c4001538e17/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
