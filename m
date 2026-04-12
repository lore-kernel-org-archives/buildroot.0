Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48327E937EA
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 16:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1586D8457D;
	Sun, 12 Apr 2026 16:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sU2I4LyCLgZ3; Sun, 12 Apr 2026 16:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE0D684574
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776009719;
	bh=Tnj0LP1JC2N1iIWlhjA07diPB3nHj7FSe5X9cxfkWuE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qwT1zFsKap/Wr/G4usIILuunFEMRAzjrdRM7H6bQQq3aCw5V75WGjwZRdXimeTp2J
	 F32CYzb69vTNd5DmX3EXfA7hQjX52BeTkhYs2wx5XMdSeglJerQGYdfGdB9lVUxpoN
	 XARVDZAgBbhldLSRh2RRs+56aheijN5auCIIwi8inwXLrwio46CTUyxr5motA3Fvtf
	 BM498L6GrPY1I5OLdESYNYMkiQL5hW0QLSfLjV0vRkLJzmaT+ope87hq8g7LIHCtF+
	 Bt475GfCoGp+O2xARK84Ux0fv5c/eRZFTU0ukIJFmEZeGQDG05zeHSKgDuP0D5qoTN
	 1imw0Ey3L6zKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE0D684574;
	Sun, 12 Apr 2026 16:01:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC5E3194
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE6CE84573
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfJ2eDKt2HEe for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 16:01:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A6F7E84569
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6F7E84569
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6F7E84569
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:01:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C092F6014E;
 Sun, 12 Apr 2026 18:01:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 18:01:52 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 18:01:52 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi
 <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260410162745.1448746-1-dario.binacchi@amarulasolutions.com>
References: <20260410162745.1448746-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <c5a16d899d4cac8af9253f3c5f1417d9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776009716;
 bh=Wkz7jiJQQ9JGe1oxtpk4E12JLAmgQtINRBDEB1xR56Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fIvleF9dVwW1N4nxziAL+ZAzgYuMFo86JE0cpduxQONiOPO+IHRG3Zm5bWEQggwk8
 ssd4Ntm93rouo4P0WxJ/DtHsGrqMCLZV3Rwv5qRfgXMIwH4zFAUA3SLH93UFCFA9f+
 /+HPs2X/NGHIvRlJI1RKoss3K/AIu7FRedPkUyEq1P/GCPe5gtNskJB39+aKSrITCL
 GcpUKbkpMSNPYb47VQy+Sk5VM62ljsny5+5Z2XSErvA+UYoGllBFVqdNnRXbIR6+jo
 /lBm3LK5+N+eK8nYoxO4jn5EfwoyPw6dMOIQUOVdDpGLsvIpZfFyGIuIhTp2ks+IHH
 thcVBH3DSZ64w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fIvleF9d
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: bump Linux
 to 6.12.80 and U-Boot to 2026.04
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

On 10/04/2026 18:27, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.80 and U-Boot to
> version 2026.04.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Could you consider updating this defconfig to use Bootlin
external stable glibc toolchain please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
