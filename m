Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA3CFDEE48
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 20:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C67BC411E9;
	Thu, 23 Apr 2026 20:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1-dcAUca7Us; Thu, 23 Apr 2026 20:32:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1849B411DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776976344;
	bh=7Pwi6To1fLQ5phJcNFbw1EIvJUpKhv2Ax6mz+OabSF4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bEXrXYlr6sNMAmQ+ghup3T9pD/3oJXt3OvQlt7QpUpkixCGag1mviFRd8AFriF91m
	 VdudBd8YlZ66keJ1OAJcj0fQFDm8ua7oYiBzs2Yf+cOxIdysyk+vL5Av5U61+PDnkA
	 mG/Do9JqSDaeFNqBuhMIxxDTEFbVJxTxB0nKoIQfFEv+ZCL70opt2IUtVWPD0sddlg
	 gYBoqXTN19HqgAZrKIii3AgvxKve7rYaesB1U6Cu2/w51ZEqSu0bd+svrALMJbRXsO
	 kNtRLZYmhqStRXZV/IH/1DNlY7QLbrwMXOGnDk912MQxkq1z8UEEFjpgUIOemSRm6v
	 0VxOcCTudNfhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1849B411DF;
	Thu, 23 Apr 2026 20:32:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB27E231
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A187D411DF
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRcmRHSD3XN5 for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 20:32:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCCC6411D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCCC6411D8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCCC6411D8
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:32:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id DD39E19F58A;
 Thu, 23 Apr 2026 22:32:16 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Apr 2026 22:32:16 +0200
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 22:32:16 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260421190532.2722923-1-bernd@kuhls.net>
References: <20260421190532.2722923-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <f2bb4f739d51aac3c22865a577976102@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776976339;
 bh=O8nA4aglsAO8d1wUs1wwI//tvz+1N+AS5mZ3d8KPK7U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SdaHJTWg4FAmgWAT0YMjlrKRBtVtWxOVFiXbJx2tB16uemvcioXKeZXHvd6iqNSEb
 W0ZyFD7ZE4TDbxHB+UnO939FcjRhc5/ki/F5xwQnKEIcgpZO+CZsCkxa0OiwF9MEFa
 8UrVOH6xObv/7C0E6PFu5bday+9Y/eJFVPDxOGUJpDydsuSPvlcdPLWhKV0Hb6arAf
 51lUygLmlm/qcuPoLYpcBakqMEzETdZbunnjXCFxPGCX9uvvT/9hU6TgCOQqPOOOhW
 Sx0oz2K5FejyCJDxeWU5wjK97NGjRgJnYE+yzXaMwM+kOnPPw1IEOOsaiYz3meCbMh
 lMn2+Vy8netEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SdaHJTWg
Subject: Re: [Buildroot] [PATCH 1/1] package/haproxy: bump version to 2.6.25
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

On 21/04/2026 21:05, Bernd Kuhls wrote:
> http://www.haproxy.org/download/2.6/src/CHANGELOG
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
