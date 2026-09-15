Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2393AC88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9D2880AD5;
	Tue, 15 Sep 2026 17:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-CMXI2jWx5w; Tue, 15 Sep 2026 17:04:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 25FAB80ACC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789491886;
	b=OE2PbFEZwlFS+F4i5Hlnuu93mfgCwYL697YssYRDhL8rUpHkfAkaun1cjk3OYW+tHb6w
	 gT9G+uf/NyVjqwCcIJlfDiovk8/GqfOipmxctyeHG18Avn8NbPRY+yRDHMnl9j1eRBIiB
	 hmIhVoFFrzvPBC7ic3k6yJC91tAD89MXR5qEtjFsaWIB2sWEEIkOnM5DCYvtTeE2Vpudz
	 H8Jx1R6bb5xWcK5B+WS/2DD6xZsPATZnIup0uafLzq6uAjovuM+HC5V35Pq6ecAsPZbNi
	 HAAYjC9zAPn1TG6k18x0saQ1kFxRu6Bq1vAZ0qkPhks4KFWIScRQDhTD0tlvs306ong==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789491886;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=5JfQhXH4+HtZgMNfFH6RC2OCQhJXFvr7q+s4YI/8VHU=;
	b=GEnigI0pk293Xjg7QgNVP8jrkyjKMJWgsegl8PTvfIgs+2AekpGJEZanI9Cz87xL/7sG
	 1VenmhF39/mbtdWsuTcOpgS6S/VdaJC4fGDcvaKJs18AzsbjeYnOcPHQj762OfM5zF9wN
	 EzCZNyNcRInjINWZ4jyWzpPWeSMm84mUx3b+P82FZwbZD/Bd8jgQc10bvBqVNU6M6EqgB
	 7ZuzPr3EFI2P5dIGgg64znvV/EAjNOWW3Rw882Ybc0gu6eEdkraTGtqxzLJytQfRLMJd7
	 2DgfatvRjuS+jSFOMlvP/xL4fDrw1ockOE9mQrX1pXqEMyy+BSsirCPO2x4iB2jsrTw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789491886;
	bh=5JfQhXH4+HtZgMNfFH6RC2OCQhJXFvr7q+s4YI/8VHU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P6RMetL1KzKp760BfzUH5PEnRbIOyGCnIEm0276OFU8YszShRFCREwjbSMEDJOk+T
	 WgmdG1+MLMZjj7gYnHgkqKJQ29a9U7jvhcXDC9O///eJgV75Ezshu7kMxUzI0KNtoP
	 fak9gpu/rByYA4G0sr9Rt+gea3HUg8TC7jNwD3JS809rhYQWkMGccfcwhg625saOy1
	 QKf38KlfvxkyDmKwcOUI/q8ObmgOpIv9ekY8ZnJ93pDgfNABaa8tmKoHQeUPZJxID3
	 44MZDggfBW0+rtjrTMF0kd8mbuFAt4b9kBEzNbaCzu3CNmkyF84VolKtAMyLurDYGQ
	 7fSoI2tKzGaZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25FAB80ACC;
	Tue, 15 Sep 2026 17:04:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5B1723F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAA5F606F7
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBXSBlLV01Do for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:04:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BF44760715
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789491882;
 b=ZvZ85/GWn+lxM1MAC47gT4cwARPbVIUz6HBPybzsBfajR7632RnIyuJBaT7XGIhZCcvM
 AMTG3N/WdKKMYLxl9Zi+nqyII6m3BC9NayDp3dXBL+KH6XbvA3X1x+7cyiivM/dFXLSDG
 72hFvsTDPoRI8CqN3/knjUhqtHXBN8gXFwJY+YJ7+c3nb2WjesuZZx60i7VaaOAbOOfry
 refuqQsEanLOzJvBpIMiTDg4F9lJRrZOhfuuqb3y6vjiO2QO3iNwoovY2VuZQv8OjMKNW
 Smv4RpxIRF4GUmQyWBpmWZkrVhJLtYFg4BMcnjDSJl+/zHZXPPbdcQmM7eqFR1O9lzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789491882;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=AjsZJCRg3rKrG813hCu01Pzur+e4xiVt8wJNYdsvs+w=;
 b=OvKDzTx8M5vhBxUAUa2b7czlerYd47m7sW2A5I4FlK/7UCrNjzfvQwYtJ1Q2pjLYnR8X
 WsqUWc8POQECbC2nSdc+WOJ/pBJPQNinHMFv8Mu1we7mOvMYGwGEFhArBn3RpMpyxEfv/
 D4UWWia0KUs79fZYSODw31uel4nOvukXLLNF2i76j6QFNBF0l2/1wL0/QvtW9wPRz7bBY
 dkrpFnqJtFzuWZ/p9kPweW/GpjfvVjTaEARpLjsWObURz2FwuXNV9z2hNaUTEFIyvHROF
 eaBOSfVHooApbzikSoXfbEyjBh6MMEiIOnKB3M+S30HTsHIiUb2u010aAXxeiJPDdDQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PgHnJ0he; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF44760715
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:04:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D45A2B0054E;
 Tue, 15 Sep 2026 19:04:36 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Sep 2026 19:04:36 +0200
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 19:04:36 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Alexey Lukyanchuk <skif@skif-web.ru>
In-Reply-To: <20260915095653.279455-1-thomas.perale@mind.be>
References: <20260915095653.279455-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.19
Message-ID: <a5b07bdae6c3596ab5f5a5e875819dcd@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/zabbix: update SITE
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

On 15/09/2026 11:56, Thomas Perale via buildroot wrote:
> Zabbix version 7.2 is no longer maintained. The version 7.0 is the LTS
> and the stable moved to 7.4 [1]. The source location moved from 
> "stable"
> to "oldstable" directory.
> 
> This error is present in the autobuilder since the 22nd of May.
> 
> [1] https://endoflife.date/zabbix
> 
> Fixes: 
> https://autobuild.buildroot.org/results/636/636c4514c67f1b0fcd20976d064f17b0e0a314fe//
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
