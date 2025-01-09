Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310AEE77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 09:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE15280F2A;
	Thu,  9 Jan 2025 09:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHOwxEwBaKNM; Thu,  9 Jan 2025 09:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AE9F80F38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AE9F80F38;
	Thu,  9 Jan 2025 09:19:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39631940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 264F44052D
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gXTg4mATnFQ for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 09:19:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 106E940103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 106E940103
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 106E940103
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 09:19:51 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 213212678; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Jan 2025 09:19:49 +0000 (UTC)
Message-ID: <b9b24211-c3e6-42f7-851a-727324cb2719@korsgaard.com>
Date: Thu, 9 Jan 2025 10:19:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Akhilesh Nema <nemaakhilesh@gmail.com>, buildroot@buildroot.org
Cc: Richard Braun <rbraun@sceen.net>, Martin Bark <martin@barkynet.com>
References: <20250107002702.191013-1-nemaakhilesh@gmail.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250107002702.191013-1-nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=YYq70o4ZXiK9J/hy6QrEFqL/gKzSY0RXDn2KRFYIr864D3xPDcrP4GjKLtBKnAsnhumJVPWNXufoho+3vJXDDaNCr9+TcVCETs/mHweL/DzpjLkBnBuF4zeuU9Dw6dy+fe5fKxwP3Vpn/szD9lj6YIEhe4uxsQczPrzYFeQOjl+ZIC900sSHgxv2dNCRm11JaqmczvQHwtKGn94aFaKzJdKRU12Z506bT1KA3wrymxo78nBKj7iSvCfAmgQsNzod5S1DjOriBHTk0L9aQHg7uKup+YH3Nf07ST3d6ZhJNfJ+w4q12x4tscGFollMkQIhxeJ0miGk/ipA0N2USJaoMA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=kM2pI/bky0kWA+AogQS5YgufUmpa9f1GxGuVoYQdnb8=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=YYq70o4Z
Subject: Re: [Buildroot] [PATCH 1/2] package/zic: bump version to 2024b
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

On 1/7/25 01:27, Akhilesh Nema wrote:
> Release notes:
> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/IZ7AO6WRE3W3TWBL5IR6PMQUL433BQIE/
> 
> Rebased the patch and updated the hash URL.
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
