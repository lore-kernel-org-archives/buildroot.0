Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C99E8FDD0
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 11:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE3906077B;
	Sat, 27 Dec 2025 11:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g69nHHmEt6Ch; Sat, 27 Dec 2025 11:23:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50DD5606B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766834589;
	bh=HEjNT3GVUu+K9ScMsJ00lCJTe6cOuwKJBBH3xL37BQA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E884IMVWAXU64cgfVRK+nKNv9sA+zQBJM1teE52HbaR+VzdSA5CWgif/YptwXYUni
	 q1P4HX4vR5ICcID2SSn7iV8eRbr8HjWka4FC2QUosvx0VfkY2Ck5hypqT54c4DrLDh
	 jtSvJFiJ0So9DVOYqgOFEsNQnk13CIdJuo6vYx9mOXCxrHKrEkRJfdB7btEFr39pfD
	 yPyX/luypkmV1gK7QLqvJre0AXQB1kAsBmf7H4kn+Ok38N7u+GAa68mR4si3dIMLhO
	 Djld2VfssA1Uw1uE2ydULb7EqWI2GW8Fh0H9NdoMGqnuZXf5YMF0vBdUzSU5ougnZW
	 gukPoDcUEn89g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50DD5606B0;
	Sat, 27 Dec 2025 11:23:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E0A1EC
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54553606B0
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXabDRP2Dw6x for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 11:23:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A03D606AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A03D606AA
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A03D606AA
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:23:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7110D2003EE;
 Sat, 27 Dec 2025 12:23:03 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Dec 2025 12:23:03 +0100
MIME-Version: 1.0
Date: Sat, 27 Dec 2025 12:23:03 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251217223317.1993455-1-thomas.petazzoni@bootlin.com>
References: <20251217223317.1993455-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <8fab18d4671f6446c2262faf200e3e22@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766834584;
 bh=j42iwYruxhsAD+g2R+6FQUrJmGGqn1rTL13+LvDFhAA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WMYe0pjqvlwX2rfdWUnVv+3A67w9BuUSumnixANQtTWlwbioI7if6Tml1PQxZOUbQ
 hak8BsXG/SaReR/FOodNMQ5pd6euauIO3FTMnFOZYsFTp10+0hVwQ8tTsftAENmHQ/
 Jyoa3+3QOuy58kVThtqYBBAOSyh/X5g+Z3ELiDv9AR+GlwQdAZnx5OuYtNmhhELg/W
 NAEy1j9iH5cCqkwqw1vx+jwzOzoCXRz2E1TI6aak5uerS/y/AkpX6GWgjPB8ZSwAjw
 DWlqchmEa5sEkf4vdPS+h2/XZhiE5tvMzSyoHYZCssu3/E2Omchrbwukp9g1Ba1Mn8
 R/Q3XbsDhPhNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WMYe0pjq
Subject: Re: [Buildroot] [PATCH] package/cppdb: fix compatibility with CMake
 4
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

On 17/12/2025 23:33, Thomas Petazzoni via buildroot wrote:
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
> We didn't submit the patch upstream, because contrary to cppcms, cppdb
> seems completely dead. Last commit is from 2012 at
> https://sourceforge.net/p/cppcms/code/HEAD/tree/cppdb/.
> 
> There are no known autobuilder failures for this issue.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> If people prefer to drop this package, it would be totally fine for
> me.

Since you took time to send this patch, I applied it on master.
But we will certainly remove this package soon.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
