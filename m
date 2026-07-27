Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A830C531D0
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 20:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D18540782;
	Mon, 27 Jul 2026 20:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MDu5dSDqMOyh; Mon, 27 Jul 2026 20:27:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E61AE40778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785184031;
	bh=GGFKk0hG+6c0W4mYUS+xG0s9RQwU0POx6WWiMd3hEbo=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xjcau4EDpGPh4F40JatBbjhT71MLjPaajrZLIrWIRBU5sRnVu6IbTmMJBLf0FpFGo
	 0AYxJfocLrfyLnMdmTf+9JVnsXjEWeDlSl3YHnuDy9ZFOtZJdy/ey9Kq4V9TZbZ5Gm
	 yaE5UXAHzlGIGopCzeK1Tw+rxH6HZhjLxL7+bYHGk0Xhf9D1w9SoKfVZAmwpvwte0l
	 4aYpVUrLv2ETi7v0RguR9M3mL+qyN9wpob6VB6lcSfrikviHseQGyjBwbe5NACu6na
	 YHOzUPIT+mIUchpNurNqF/iBtiXUIZVxyfao7kuDoeGlE32Fure1Nug+R1NJHDbD3T
	 d36AzjinpItOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E61AE40778;
	Mon, 27 Jul 2026 20:27:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C4A6194
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 20:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 022CE80F06
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 20:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1IauH8goVFZI for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 20:27:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.212.143.9;
 helo=cpanel10.indieserve.net; envelope-from=rpjday@crashcourse.ca;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3CAD980EE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CAD980EE0
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net
 [199.212.143.9])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CAD980EE0
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 20:27:08 +0000 (UTC)
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com
 ([174.115.41.146]:58558 helo=sheena)
 by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.99.4) (envelope-from <rpjday@crashcourse.ca>)
 id 1woRuj-0000000BAP6-1HGb for buildroot@buildroot.org;
 Mon, 27 Jul 2026 16:27:06 -0400
Date: Mon, 27 Jul 2026 16:25:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: buildroot@buildroot.org
Message-ID: <b232d27c-96ab-d8c3-af33-4f2c94a25985@crashcourse.ca>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sLta2nmqXQSw0E6udAJL38v1qf7ppW3HrCz01y/d/zY=; b=wcoIAiPc7cZUpSsqw609UEiqX6
 KCS46iLkMv1jaH+dMWJbF3NFTG6sRSIDoN7BmXtyA5XMcYudSz5H/ZOVH0R0gzpkzoIFYf0pqEetl
 P+/dMkYkodGHdz1u184j7HmrO++9V8au4YaoJxzDOOq+hz4QmNvyHPycA2VaAj3CN+jYi8LCGwvzo
 FMjuGyzrsPdGZMe4JF/iIHwR4lNmXvF1x1SeZdoR1VLN9oqjKiFCx5HoI5aLE5HORtUR5ayazqzNV
 eZxxtAfPPmG5Sdk3WNp5razCVihuqSuJp10HZNLNfxwVfCGITfidPJkwjpT9lFZFPQ/kWnPTFM2jA
 SFgWZEeg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=crashcourse.ca
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=crashcourse.ca header.i=@crashcourse.ca
 header.a=rsa-sha256 header.s=default header.b=wcoIAiPc
Subject: [Buildroot] what is proper asciidoc markup for monospaced font?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


  before i submit any more docs patches, i notice that monospaced font
is rendered both by using plus signs and also backquotes. google AI
states:

"In AsciiDoc, plus signs (+) and backticks (`) both prevent formatting
inside them, but backticks create monospace code text while plus signs
do not change the font style."

  so what is the preferred markup for monospaced font? the current
docs seem to bounce between the two.

rday
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
