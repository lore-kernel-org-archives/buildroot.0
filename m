Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70F1CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 09:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6835861415;
	Fri, 15 May 2026 09:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zzqo_IHbFiUd; Fri, 15 May 2026 09:09:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA2D96141D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778836189;
	bh=pZ/d/HenqU09IvJcQIsDtLIt3OYWRFcUhOekoUAbuQ8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fqJ+a003PCANX7mcd7UYfIuttUdNDIzbn/YZjDey3H8PpcOeY957Gv4GW+bdwMghL
	 kznBenhXxSO6kRi2XZ6roz0z6R1osu4YzSNFMQsSPkljU/y8kaRoo8vp5SSGNjoKxC
	 BMtFBLC83Ji2g/F3mUcM+2VUKSg3fwNd7r8m4ZzFYMLsvdisZp9FCSbRHfJRf2pdrk
	 U822OoECDgTwbyCafMiAWTXWl37grjdOv71TuSuk+x+hMiEHATyJW6WdL5ALRbfBdG
	 yuZU7n619/vPzf654jimUStgd3M1eMfUUAx6n+IO44vQ1LZPbne9I6Tz6JZIEXyMvN
	 tvw0Y711wp/cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA2D96141D;
	Fri, 15 May 2026 09:09:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 357DDE7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A05E6141D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JO0Jd98UacJa for <buildroot@buildroot.org>;
 Fri, 15 May 2026 09:09:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7840E61415
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7840E61415
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7840E61415
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:09:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 24660780333;
 Fri, 15 May 2026 11:09:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 May 2026 11:09:40 +0200
MIME-Version: 1.0
Date: Fri, 15 May 2026 11:09:40 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260511155749.1223615-1-bernd@kuhls.net>
References: <20260511155749.1223615-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <d42007dfde62ffa3e71c89732adfa5fa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778836182;
 bh=P6rAg9NFeYukGWET6rc2ySCTb15kiQHra5deSK1o6SI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HTC6/K9PZXzwkij7OlAo2ZwqNR5czMFxqczmVxPqFqFW4mC1h8CmA54KePGAEwqHO
 mywQpiiOATT+wZ140H12tEih4beaPak2y3Dy4aVyWoW2H9ICUpwByhG8t6XYfZr0WT
 gUCy7AuAWjzylo6ZonYiJddp6G6BmV/JqXQC17AzMa5sJEcxJ9d/IXIfUTkkGY0CKz
 Ggn8iLXSKwW4/sAVVIL0NEkYBIK+1Se3MpSmttndZhD0ha0bG4yj3Ykbag8jnJ6kfE
 pApWMuxysBuaiFztXKt0+nZUSe2gOXUY92D9Qo62DRp2qrLAgLdSxpYinI+FnZWoV4
 94vP2TeOK80gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HTC6/K9P
Subject: Re: [Buildroot] [PATCH 1/1] package/elfutils: bump version to 0.195
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

On 11/05/2026 17:57, Bernd Kuhls wrote:
> https://sourceware.org/pipermail/elfutils-devel/2026q2/009226.html
> 
> Rebased patch 0002 due to upstream commits:
> https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=1fb2723c504588b60c3f796d91b535b50e0f4fd0
> https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=45bf7360166b30465d5aebb7822f93c26f370b1b
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
