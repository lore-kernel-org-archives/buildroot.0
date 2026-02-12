Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C77EEA84C
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 19:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D0D341253;
	Thu, 12 Feb 2026 19:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_sbR-2YgBOv; Thu, 12 Feb 2026 19:43:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D6044123B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770925405;
	bh=Pdqb1HJ98S0BA9KUFIEohuYOoHd3P6Yz66Z+B3hlSYs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lupg2tGCt3uOoVdCQeQRzPXz6eDDTIWuGvkNef5eZawmrDGuvKCLfUYuagHHjW/up
	 Vob4WfTdooo2E4SqBgln31cHHlFXXYOvYhu7GTXbmZMR6jWpToiOd8fR/c6p3bsSjS
	 V+PcbYbvzcjQXvcjDTqS0Y1WlV332iKbNOPhOOlvvRwe9drph+On4HYFOmCde/ZMs3
	 QUYZ3WCghBTb2YRAog/Njb/QxCvbOk0vKrtoUWrC77NcebRLGbvZGHghF1leOY0bOf
	 jNP0HWG8LrOqF+ZF9qVdWlGycKojLfLVy05za/RwEVs5L6vtVQYd+hrN+DtWz9/EyG
	 3yNg8UgqBbQYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D6044123B;
	Thu, 12 Feb 2026 19:43:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71E021CA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53B1C40347
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYT3CURcC65Q for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 19:43:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6769A40330
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6769A40330
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6769A40330
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:43:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 11253780383;
 Thu, 12 Feb 2026 20:43:18 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Feb 2026 20:43:18 +0100
MIME-Version: 1.0
Date: Thu, 12 Feb 2026 20:43:18 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260212192740.1895472-1-bernd@kuhls.net>
References: <20260212192740.1895472-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <03090db680a7271b79afc7fc2e1df837@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770925400;
 bh=2CjgRqjmIVpWPmq3Y/V785D56bd/G+SmuhDdd26EOBE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sMQB4fp0XDJCBc/GP2lIcKWrbVGveAEPUm7n3CXuTb0PXDYDK7oExbyV+RlDND2xx
 FyFMKTw5b9B92mkqD++DieiXN+K2Ec2XoCJ/H7VOmwQ3xrIk3v8oAnxYVmSXHXaHoZ
 NzXep8oh3WHob7YGQ/JZt48t+DYXldAw6vh/ovVP8/+RQL0tFN1cqscWJpFBIVzU3+
 lVCzzb+DgltmcEXIaTEcObimC4fYK1sAkDxg+rAM/RHe91yqE3beRdC/Cw4COZiQVQ
 LWXLH0vE285upAANxHY4ofpn1ZOYopwpPMYMN3jmI+RYjeLMi9CiaLzss83MnVO9E9
 jBl++iAq64NWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sMQB4fp0
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.9.5
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

On 12/02/2026 20:27, Bernd Kuhls wrote:
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.5/ReleaseNotes
> 
> Updated license hash due to upstream commit:
> https://gitlab.torproject.org/tpo/core/tor/-/commit/2b0be077600beb95066ffa5f06094eeca906851a
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
