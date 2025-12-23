Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E29AE6FE2F
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 20:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 685F960E7B;
	Tue, 23 Dec 2025 20:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eRXMEi4hfpzi; Tue, 23 Dec 2025 20:41:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FC7F606E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766522509;
	bh=sdtDXbXL186l1Zph6/e90ZTqjweFQDptUj0BGk4ahn4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GejeufrCGA2kLD88EDCnVO0hpCXpKLhTIzlTxKQti5vVBGV6odCt1B0QPx6/LxjUd
	 0/PMXCF1Cr7yquLlo50Njm7h7LBtUrsiEA7cY+NM8dzFgYqstZwwQ0TgWmmrM9eLcX
	 BLpZdo7LglnqoU04Ku9/OzLXepxggH+XQcKd/MOYtl10X7yhvqWz9riMtJjgH3XN8+
	 RAOysk/OeURLpe86tEeEx7TllZIqwAHAJZKI2KxA36L47J56Y1dw7QYdNghqCOW4CO
	 ywYrXt2rQk6peemli0rxvZLNYYZCOOJKRvFKExx32R9cbvotQIAiPtDn53gWRioDWN
	 7BlAb8ENzRP3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FC7F606E5;
	Tue, 23 Dec 2025 20:41:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FEF4BE
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D923402F0
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Hv_xwGcS6mC for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 20:41:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98D9D40024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98D9D40024
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98D9D40024
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 20:41:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8E6082003C3;
 Tue, 23 Dec 2025 21:41:43 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 23 Dec 2025 21:41:43 +0100
MIME-Version: 1.0
Date: Tue, 23 Dec 2025 21:41:43 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251223181013.383914-2-thomas.petazzoni@bootlin.com>
References: <20251223181013.383914-1-thomas.petazzoni@bootlin.com>
 <20251223181013.383914-2-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <77272ac30aa221d77c47fa2d9180a193@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766522504;
 bh=60YItAucXf2sDHa0LYP5uugJ7uK0othBKwIzUTItwZA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XnUYlisxTHKko0RR3LwN5F0aOvs5TrXr5pkVsTNuC6hx7nIq4OvLg0wg+0jSUHP02
 CEDSXWJCDt50Y+od6pSLXiEOocPPKZIUQqzUfXqgYApej5vSexeds6CtK4Led0LRN6
 6Kn4OrYng1uDuBM4ttpT3Hi4pdlTI2JLNU9FUbdrfSyYI7W+RVCy5DqU1PCwRHlcKV
 EW84XEd4JP1LJXMmzAA5BtCd91FpSV/DrqDCo+nrXp+rmGIT+o1wuG3TPIxnY7ycor
 ssETCKrTiIhbvr+gJSFyYKnTjei2+qlvO8mn/Rxp+zw0fwbmtl9eOH7XVGRJsU5WyN
 79b5L69lc+sNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XnUYlisx
Subject: Re: [Buildroot] [PATCH 1/4] package/vim: fix reinstallation
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

On 23/12/2025 19:10, Thomas Petazzoni via buildroot wrote:
> While not very common, it is nice when package re-installation
> works. Unfortunately the "installlinks" target of vim installs links
> with "ln -s", causing a package reinstallation to fail with:
> 
> cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim ex
> cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim view
> cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim rvim
> cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim rview
> cd /home/thomas/buildroot/br/output-all/target/usr/bin; ln -s vim 
> vimdiff
> ln: failed to create symbolic link 'ex': File exists
> ln: failed to create symbolic link 'view': File exists
> make[2]: *** [Makefile:2749: 
> /home/thomas/buildroot/br/output-all/target/usr/bin/ex] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[2]: *** [Makefile:2752: 
> /home/thomas/buildroot/br/output-all/target/usr/bin/view] Error 1
> ln: failed to create symbolic link 'rvim': File exists
> ln: failed to create symbolic link 'rview': File exists
> 
> To fix this, we remove the target links before proceeding with the
> installation.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
