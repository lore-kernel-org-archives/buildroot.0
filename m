Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038E0F9D0EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 19:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDED742CE8;
	Tue, 14 Apr 2026 19:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwyhRFD7ctM4; Tue, 14 Apr 2026 19:08:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06AA442CF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776193699;
	bh=SOYiaLy72oUkQXHOOJ44Dcv0J1L83FzXT5D33hWQEMk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QH6JHhFCPo3NLnGmIWDKzZ9cyliNkVTfNIb+gCJ2xby+JFEJ9R3h+/xexxxdcIZj6
	 n+xNusm/wp0lnIurdZQdSI1IvDIGlrUCsRw75QYgkWEebIV0OBp5QCEs/0bINNeoTv
	 Xh3rsubs0W0mYkSOHea6mWhXaiq5OmawT2MRcBPFJhkkNluCF4/bxGQKCBPhX4ztyC
	 X3dJTBOWoDVo435eLggDo+yvVMiocjkxN44WAXVuWSTsJ8/mPQADdrlOU4rYJEBHje
	 U6qXzBh1O7xcEYN+oy6neVaMoxQkuMqkJxKdjS36IOr2Nur4m3gTz2VRF9lz5gGPPb
	 I0wWGPH9v1wQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06AA442CF3;
	Tue, 14 Apr 2026 19:08:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0231A375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBF0C6F4EE
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bc_tmQgp9CUp for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 19:08:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E9C7F61B0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9C7F61B0C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9C7F61B0C
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:08:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id BC26E19F59C;
 Tue, 14 Apr 2026 21:08:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Apr 2026 21:08:10 +0200
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 21:08:10 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20260414074605.3769357-1-giulio.benetti@benettiengineering.com>
References: <20260414074605.3769357-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <39818bc39854b55c68f6e00fa6fc14e5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776193692;
 bh=EEi2FDvEXeUc8aGp/ETiTt1a04amvYcxcvFkA/DFqWc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ffl327O+TN2FfUFk+ZLIl6QatZyV9Dx6ecyJEbQpVdg6L/eFWPUhob7n5OkBr0oyU
 tvNCU5FaEesmpVW0JxmuAcFL48wWIr74S6/dpLJLYXrbEDdISWxo6E4oVgli+wCUgr
 uJJd6N6a8IJ50QkM96OyKI7ffPj5FK6dJIAMUYc4rsI8eMEmqvirR+59DIRkaxzlGm
 fdalazynPgy+42//hsDqsKl1YPWmAW8LOfzoQwGnNWnbyK3lme6CfP4c1Tkj4TVo+7
 hXbQ5bg282PX9EMQu2IDipjBPG86quQuYsGRt9lHd368ecrqGpULB7RSaaoSK6tJxo
 UxFb6WjrZ4dlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ffl327O+
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.122.1
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

On 14/04/2026 09:46, Giulio Benetti wrote:
> For release note, see:
> https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_112_1.html
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
