Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506BAE77199
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 20:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07F7780E05;
	Wed,  8 Jan 2025 20:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qkSbCDwp4QX8; Wed,  8 Jan 2025 20:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E9C180E2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E9C180E2D;
	Wed,  8 Jan 2025 20:42:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 314A51EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11C5E80E39
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIf7Ixl3jlin for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 20:41:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BC7680E05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BC7680E05
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BC7680E05
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:41:57 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -714179321; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 20:41:52 +0000 (UTC)
Message-ID: <9cb48bd0-188c-4c58-90cb-5b95b4086021@korsgaard.com>
Date: Wed, 8 Jan 2025 21:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241230200000.199571-1-ju.o@free.fr>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241230200000.199571-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=hvosNk02NPOBd2xHZUpoIWxUJqk14NGqY5GJU0hclvwruA8HXZc4LfulLIXDzHe0KqTZva0HpO3ivpQ9Ouh5mQbYbbtpQrDq3g4crJftAKCKXCOPiaJQsa+xD0UgH4KLSm1MhUZEE+1AI+qFvl9IQLkpqTMJA4FmLihJNrPQ3QPLYKauxEkLTPRG4OL+to52UY3q22tnERQrrLzSWjfsQ3ak0BXKUqdZja8MAm5J3SmKYdQoM+olUTYxtt8hcV5eMxCzgEz7PdR0IysajfkzlzCMJOH93NRbdYPwmXIom5FBagGUoI1DpkgEvbLgTbmZmFQ72o+E6zTy2/VKu5nWeg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Nw5i+39stcHdP5iiruq9f89wKvwuoHDDMEYGLgeBsMg=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=hvosNk02
Subject: Re: [Buildroot] [PATCH 1/1] package/xxhash: bump version to 0.8.3
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

On 12/30/24 21:00, Julien Olivain wrote:
> For the relase note, see:
> https://github.com/Cyan4973/xxHash/releases/tag/v0.8.3
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
