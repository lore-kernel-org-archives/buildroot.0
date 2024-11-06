Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7483D59F75
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94E3E40305;
	Wed,  6 Nov 2024 20:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXLoZCmam0el; Wed,  6 Nov 2024 20:57:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9046B404E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9046B404E9;
	Wed,  6 Nov 2024 20:57:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABDDC3B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82CD340260
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWO9k3sNBxL9 for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:57:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F05440281
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F05440281
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F05440281
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:57:03 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 981865221
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Nov 2024 20:56:59 +0000 (UTC)
Message-ID: <28fa3e81-4abf-4ee1-8b93-e5c3a43c4e6c@korsgaard.com>
Date: Wed, 6 Nov 2024 21:56:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20241013103341.78501-1-bernd@kuhls.net>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241013103341.78501-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=KACTd6in+zydtN2Rm0o68qrbKJU2Q8xfl49ekJWwqFK8HNeeTYvvKi1DOy9jLbjrvI01hA5kOjMWIZlgymzzbkHdqimUZCP7hf5Cq/S4LVuIaVEn2CrWHlkCHuD4KdFzrgnOShwSHXONVe2NqnB6dEVC25jBIWY1yY1uGBMz1k7tZ2NkT1Qr6+OjZCzhY6LGGuEEdctJJFSYibRG636NMrw6FcreJt/SHA+WuWLshDsxiSnuahmc0r80bOEzr2fhNXqghd+/9L8grA6iRB84L4o6t75adnOIhLS1+kVL8xpAiJQKEEToANCy6MT/gZ+7Uru4VDcqxwz5mgd99FLb+g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=4ELEB+dPX+hfZV2/QJWPe2539cIyHlu0rc5fDQnIXjE=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=KACTd6in
Subject: Re: [Buildroot] [PATCH 1/4] {linux, linux-headers}: bump 6.{1, 6,
 10}.x series
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

On 10/13/24 12:33, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   linux/Config.in                      | 2 +-
>   linux/linux.hash                     | 6 +++---
>   package/linux-headers/Config.in.host | 6 +++---
>   3 files changed, 7 insertions(+), 7 deletions(-)

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
