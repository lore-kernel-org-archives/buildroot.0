Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FCDD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 648D181276;
	Sun,  7 Dec 2025 17:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPgTUuPHdMtr; Sun,  7 Dec 2025 17:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A57382279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765129014;
	bh=N3hkvPSSquHOhViNywHa7gEaQwiVYZ1a1SCg/svA1P8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Vb9H77JGLx4ZFuyaAYXLuhggQTrR6Q4OxStWRKawuOzPix9ZyG+WXbVKbkN3J+IZZ
	 BQaTqPzNDBob/7zVGrbOJ0sZEKAiK4eAl656TV6DlCdY3TLcF98G30cr9pMa1ezNcH
	 5+4eW31lAaDfO/8rIew7zJLuVhl5R+P3yFgPP+p6+2wvHD66uw/BQwuz+QtJRJ+4La
	 R5prM9hcwadqxsc2jNAerWUE31b3sM7I5OryJXFhUrfyOeoDRgHuQ5fSxyjSy0B9Tq
	 nTJkb/0QmDfwtKkRiJPIdSXS5MQG+7y9/jSo3LHDo5vHEZkOZA12cpPIMEM3YFa70P
	 gWuoFKDr/PclA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A57382279;
	Sun,  7 Dec 2025 17:36:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA0CB2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBAD7404A2
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 243Xs9wLuGIM for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:36:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B933E404A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B933E404A0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B933E404A0
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:36:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id DE39E5FFB4;
 Sun,  7 Dec 2025 18:36:37 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Dec 2025 18:36:37 +0100
MIME-Version: 1.0
Date: Sun, 07 Dec 2025 18:36:37 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org, Alexander Dahl
 <post@lespocky.de>, Davide Viti <zinosat@gmail.com>, Eero Aaltonen
 <eero.aaltonen@vaisala.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, Romain Naour
 <romain.naour@gmail.com>, Sergio Prado <sergio.prado@e-labworks.com>, Stefan
 Hager <stefan.hager@ginzinger.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <a25b12aeab13c4d62f4d13059a320a36@free.fr>
References: <20251203214709.2321976-1-bernd@kuhls.net>
 <20251203214709.2321976-9-bernd@kuhls.net>
 <a25b12aeab13c4d62f4d13059a320a36@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <d3a1d85b454dad5e4de5491e8825be39@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765129010;
 bh=tP5dxs36DgZXH4o2r4q2kCqRUqHJsLiIfcT8vffR4A8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ttez1vsKTAB9OO6yysuyRm8NvfGOTmSELGzP+syGnhs00Pxwaaq6P+eu8QneGNhWP
 cPR9f0GTekE/FuvufW69i5B236PNzdNZeQ0uSi6NBhaN/XkdjjiEnTPNEmp5Mct7qx
 aGjzY3mvez0VvUBfrUWYBloLkrLFG+pKZKHKeWo1plyL+4GnYt5XD7Fa7RKW648B/D
 YOVt4xQl2RvSD+Z94fK1ML9Fk5QBUCWHvbko7aH7BYsar1AdxTYFhN6iIO9sY8H2H1
 uYaMUx5DUqfVeJvldUsZbOeN9EceFD4twZcECkt4XTvXxvzJF6oKaua0tb/F8c43ab
 E8jfovtgbPqcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ttez1vsK
Subject: Re: [Buildroot] [PATCH/next 09/21] package/json-c: fix cmake 4
 compatibility
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

Hi again,

On 07/12/2025 16:51, Julien Olivain via buildroot wrote:
> Hi Bernd,
> 
> On 03/12/2025 22:46, Bernd Kuhls wrote:
>> Fixes:
>> https://autobuild.buildroot.net/results/dcf/dcf72922750a830901279e8eb8fc2def95d35e01/
>> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>> ---
>>  .../0001-Allow-build-with-cmake-4.0.0.patch   | 25 
>> +++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 
>> package/json-c/0001-Allow-build-with-cmake-4.0.0.patch
>> 
>> diff --git a/package/json-c/0001-Allow-build-with-cmake-4.0.0.patch 
>> b/package/json-c/0001-Allow-build-with-cmake-4.0.0.patch
>> new file mode 100644
>> index 0000000000..c9c957885f
>> --- /dev/null
>> +++ b/package/json-c/0001-Allow-build-with-cmake-4.0.0.patch
>> @@ -0,0 +1,25 @@
>> +From 42864e12b0d7af01b1cf989d6da9e9a4477775a1 Mon Sep 17 00:00:00 
>> 2001
>> +From: Rudi Heitbaum <rudi@heitbaum.com>
>> +Date: Fri, 28 Mar 2025 23:14:48 +1100
>> +Subject: [PATCH] Allow build with cmake 4.0.0
>> +
>> +Update the min version to match parent CMakeLists.txt 3.9...3.12
>> +
>> +Upstream: 
>> https://github.com/json-c/json-c/commit/42864e12b0d7af01b1cf989d6da9e9a4477775a1
>> +
>> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>> +---
>> + apps/CMakeLists.txt | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/apps/CMakeLists.txt b/apps/CMakeLists.txt
>> +index f7c9dec633..ef2271d131 100644
>> +--- a/apps/CMakeLists.txt
>> ++++ b/apps/CMakeLists.txt
> 
> This package is currently always built with -DBUILD_APPS=OFF
> 
> See:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11-rc2/package/json-c/json-c.mk?ref_type=tags#L13
> and
> https://github.com/json-c/json-c/blob/json-c-0.18/CMakeLists.txt#L582
> 
> This package patch seems to fix only the apps. I don't think it is
> currently needed in Buildroot. Can you confirm?

Looking better at the autobuilder log, I noticed apps are built in the
case of host-json-c. So this patch is needed at least for the host 
variant.

I'll apply this version of the patch.

>> +@@ -1,5 +1,5 @@
>> +
>> +-cmake_minimum_required(VERSION 2.8)  # see ../CMakeLists.txt for why 
>> 2.8
>> ++cmake_minimum_required(VERSION 3.9...3.12)
>> +
>> + if(POLICY CMP0075)
>> +     cmake_policy(SET CMP0075 NEW)
>> --
>> 2.47.3
> 
> Best regards,
> 
> Julien.

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
