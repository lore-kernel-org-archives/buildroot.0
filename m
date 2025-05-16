Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCD9C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED58A40645;
	Fri, 16 May 2025 11:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ScQNr2knqi-d; Fri, 16 May 2025 11:42:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 211B34160F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 211B34160F;
	Fri, 16 May 2025 11:42:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4389B185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F76B4177A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXSBFCkJO_kV for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:42:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 47D7E4160F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47D7E4160F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47D7E4160F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:42:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id AD55F5FFB1;
 Fri, 16 May 2025 13:42:04 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 16 May 2025 13:42:04 +0200
MIME-Version: 1.0
Date: Fri, 16 May 2025 13:42:04 +0200
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250516105726.1462234-1-peter@korsgaard.com>
References: <20250516105726.1462234-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <3b0e6c71ea15ec5efbf955346e2a4f61@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747395725;
 bh=3KhF+11Sn1fQQwOROPyKUXLJq5Wz7+YQh5Xm3ckNx58=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A3DOSfDXjvn32VOGMyt4ZBpwBfA70/OZFzg+/GYg3A3rTK6EfLkOCwED0kjDj6G+2
 5KWEv4+86XPSslvSccW+WfthBB/I/Da2vZ3Aw/Fl9ldC3O02eIA9Zt3fGvqXc4t/Oe
 snHkmOYbImdN+dzjYTDC94ub/2eHVRNQ1SYxJm/gfRzo9kcLuuFDB0RCW/TlcoLOAA
 jnATsB5f/TqVI3fMYDQ5sApaarzvmc42HKrgDOoEWVhBx8qVpDdAMVsyvvDhnKmsPW
 LntmOwMReWwDxZMMV3rXURFLqdIA+coE/RIq8BV2OsdM9bx0FvehKLnjmaR5ztapQb
 Er3sngkGVipow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=A3DOSfDX
Subject: Re: [Buildroot] [PATCH] package/screen: security bump to version
 5.0.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/05/2025 12:57, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2025-46805: do NOT send signals with root privileges
> CVE-2025-46804: avoid file existence test information leaks
> CVE-2025-46803: apply safe PTY default mode of 0620
> CVE-2025-46802: prevent temporary 0666 mode on PTYs in attacher
> CVE-2025-23395: reintroduce lf_secreopen() for logfile
> 
> https://lists.gnu.org/archive/html/info-gnu/2025-05/msg00002.html
> 
> For more details, see:
> https://security.opensuse.org/2025/05/12/screen-security-issues.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
