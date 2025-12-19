Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC904D7879F
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 18:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 904A8612CA;
	Fri, 19 Dec 2025 18:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shVp0GA5lJOl; Fri, 19 Dec 2025 18:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A82156061E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766167348;
	bh=V5ZewP7ljljUZJsoEOqJIcprgskTHp5WT8qe+j8lG8U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l0NjynzL1o1OigsTK+/y2EgHo3pgalh4YllKPMJLMIVBAU3520Kfo0iwwB5snVs7U
	 AcTGCSBbl5yTmNakAgtho2zjpHAoVZImUPY6oYTa442Ssdhr3KxzoxhXCffNVpRT/r
	 LCTSWeWXgaiceTF8J70nkv/mzf7FB7X0VzpZQpm9FmeoO4YyJ6JLcScnfyWB03+79H
	 nwWfH0Lyr7QtlPySgdSlYFMR3OqTUoSwdKF3cflQvwzTCSeZ26QPypCxbwnHB7xalA
	 /3M0PRSpYNaIGUNYb5Y43P04V5A6ghUP3QuQhXNkRxEIPVsc1EnufWSNCBBlOfpjg6
	 Mxc2/xBxonB2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A82156061E;
	Fri, 19 Dec 2025 18:02:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2FC8293
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 18:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B479981192
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 18:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8Sny4uMY2Xv for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 18:02:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D75CF8118E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D75CF8118E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D75CF8118E
 for <buildroot@busybox.net>; Fri, 19 Dec 2025 18:02:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E0B5BB0055E;
 Fri, 19 Dec 2025 19:02:22 +0100 (CET)
Received: from 2a0d:e487:418e:8c09:857b:bc67:c232:7cba
 via 2a0d:e487:418e:8c09:857b:bc67:c232:7cba by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 19 Dec 2025 19:02:22 +0100
MIME-Version: 1.0
Date: Fri, 19 Dec 2025 19:02:22 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20251219064523.317601-1-francois.perrad@gadz.org>
References: <20251219064523.317601-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.12
Message-ID: <517adf6f9e36374ec55b34d470fcfb67@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766167344;
 bh=sPusd1lbatbCwZMsYhaslsy9jy5BNNj1pl3Cjek8dsM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JB8wCAh5kWKjW/5PjG7AqoXeFxBrbBU6SV+JUfbk61bD6BiRjaPWCu6tj1IANvJ0Z
 V73OZ2C7sSZYaEJ9wKMAdvIThwV0lSN2P8TOfwBEe9h133dASyYQVMvcrrKaYWL6mY
 o0pJWYkk7Tnc0qpcAQvMxxRdghL4leiw3+I1QUlAO1XSpxSK2ouPwielhjLkJrJt6N
 hn8n8Dh78L8Kj8pvsX2RdgXxTiDI/eo7eNRsUQvwogrDNGr6VFu4uivmTTGlV0hFTb
 sIakCtkwBCr5cXJym5cOhnpk4Yb5R3w4qom5w8dCMV1itKswjK3eBY7VyEQ+3YneRt
 ICg/rDS3lAs8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JB8wCAh5
Subject: Re: [Buildroot] [PATCH] package/perl: bump to version 5.42.0
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

On 19/12/2025 07:45, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
For info, I added info in the commit log. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/11d6d10debc81a64de901ec0217b8103c0f366b0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
