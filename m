Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67073D2E9FF
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 14:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22BA380A74;
	Mon, 11 Nov 2024 14:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N74bIwTmyOEs; Mon, 11 Nov 2024 14:35:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C19D80A79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C19D80A79;
	Mon, 11 Nov 2024 14:35:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B79B8DB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A618C80A79
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28gkDBXliwJM for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 14:35:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CAAD880A74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAAD880A74
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAAD880A74
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:35:11 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1525839445
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 Nov 2024 14:35:09 +0000 (UTC)
Message-ID: <1cc3197b-6e74-4945-9b95-43a36530e4c7@korsgaard.com>
Date: Mon, 11 Nov 2024 15:35:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240921172634.3642820-1-bernd@kuhls.net>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240921172634.3642820-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LZZQ0aub9v8Ms/tnSr74W+ztayrmch1YHwh8xhn/M+zxATvxPAB4coh8OKtEI0PYdsBXzcC4wa2J1yxEeQyQ9q2hV5WjiRHz40xHjoJosVxSiOFkuZCrv3R/IBPpZbm7KRZ4OZ/JLMMSR0DB7Pv+kSOojTQAuXJxfUSAqo0EoK6qoXJxL0uV8UZVqOBuiwViOf5BFMhpADQ+Le3Ll3+BTwD0DSDU3iVXzL8yXxfm8AKqvg2x2U3F0/TjKA+BhONu5f+aSZdzGx2Hrto5RBO3f9VDO7vXQ9SNB/KYl4oAu+KMCgem7IkRbAriNZ7mJJQ90F6g7Bgc252wvdOTWC6zaQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=jKgI/htKbWTYHwQkEqWgvPRJzZrS9X6Hp/UJs/2T1Ec=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=LZZQ0aub
Subject: Re: [Buildroot] [PATCH 1/1] package/libxml2: bump version to 2.13.4
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

On 9/21/24 19:26, Bernd Kuhls wrote:
> Release notes:
> https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.4.news
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---

Committed to 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
