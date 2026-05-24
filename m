Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFEACD5BAB
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 19:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A410C83BCF;
	Sun, 24 May 2026 19:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s79oopdY02ZC; Sun, 24 May 2026 19:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D01B283BC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779652039;
	bh=vknZDgLj48ZBoyFjb7IpRFXr3v2siJ5ChWiohtn5z/A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fUVsZUoDlfmlH5DqqrtxNxfFbo/GtNVlnq1tY+Pi9I93Ka3WW6y45OhSBIYER/ReT
	 H+5FvWwwsy9PB3SBM+8Ldx/x1zBtmyAt5tbxt8Hy8nIrgrajq5Y/TfDHDhvs3DQuXw
	 jyc7ddaxEOOi1GuCt+OxOlk9A2S+bCB+ft+FGabJAb3w7uelKvru4OIWeZjj6g5YgQ
	 8o5HtWgRTj8q5pJQnm8d5aTP6zr5a9rlfZa8hIEnw9NC1HKfzmeKMMi2sq1UIF6iEr
	 ppUCeKy8foWF6bexhg8aRtJN/5aohMiNBXQtb7/cdERGQr9QJtdjKW57gWWLH9L7nu
	 2rsatsQIg0/OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D01B283BC5;
	Sun, 24 May 2026 19:47:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37C85263
 for <buildroot@buildroot.org>; Sun, 24 May 2026 19:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 297C783BC5
 for <buildroot@buildroot.org>; Sun, 24 May 2026 19:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XbHxoU6VH02 for <buildroot@buildroot.org>;
 Sun, 24 May 2026 19:47:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28F4783BC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28F4783BC4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28F4783BC4
 for <buildroot@buildroot.org>; Sun, 24 May 2026 19:47:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2275778034E;
 Sun, 24 May 2026 21:47:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 May 2026 21:47:14 +0200
MIME-Version: 1.0
Date: Sun, 24 May 2026 21:47:14 +0200
To: Viacheslav Bocharov <v@baodeep.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260519121951.70289-1-v@baodeep.com>
References: <20260519121951.70289-1-v@baodeep.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <7c10a2c3654988c9369542ed57357236@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779652035;
 bh=pPyNCWLQ0mZav2f2btPe0YV9CwhhC70t2H49kiC7jzc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=drJgylG6kJGpswD/1UxYlfT47jCgDwI9Sf/iecE4KUh5t4XO+++8NS/XkVmWM0Mzb
 RV/i9kHuGIg7MJ65EKLa9qVrWM4rJKXMwLYXo2S4EHSc0XptDS/J8nvEERoBIyrImP
 Jz/1KNR5DdWGQfka8G/DoEZBqSlpQrVsDVFZpkQP56tKvRHUpE0z0o93nVY+r8Itbo
 zll1sR3IDdX8Vb0C1/zWC0SBj5pv/aMZOqaJ5Su7XmoaSHL65/8o8S5weXMivaAZF7
 qepcJUUzGn2lKrRus6CCe2zNUoglZAQ83iYnL8FjEI1rMH5WKPL3BsW40kuLpxWEVO
 Yz5tzfaYKh7Sw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=drJgylG6
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: update entry for Viacheslav
 Bocharov
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

On 19/05/2026 14:19, Viacheslav Bocharov via buildroot wrote:
> - Update email address to v@baodeep.com.
> - Take over maintainership of package/amlogic-boot-fip.
> 
> Signed-off-by: Viacheslav Bocharov <v@baodeep.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
