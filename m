Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BF8C54E67
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 14:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C110407B4;
	Tue, 26 Mar 2024 14:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NKJwIK2fBok; Tue, 26 Mar 2024 14:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52881407F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52881407F9;
	Tue, 26 Mar 2024 14:39:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D9BF1BF4E2
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 14:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A6A66085A
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 14:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZlG8wV7J3Aho for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 14:39:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 24F1F60836
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24F1F60836
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24F1F60836
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 14:39:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C08CA240004;
 Tue, 26 Mar 2024 14:39:52 +0000 (UTC)
Date: Tue, 26 Mar 2024 15:39:51 +0100
To: Christian Hitz via buildroot <buildroot@buildroot.org>
Message-ID: <20240326153951.432b68fd@windsurf>
In-Reply-To: <20240228145013.411919-2-christian@klarinett.li>
References: <20240228145013.411919-1-christian@klarinett.li>
 <20240228145013.411919-2-christian@klarinett.li>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1711463993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xcl0yX5HWswz2LfSsktWBbG8ce+BPKJP/+nQlrV9ugw=;
 b=bhFqa6L4YwhEEEU1Sw7RSU9DXttg/eyVJyAogtDE+BZ4pVP5bUVbmLW/bGbn3I6XNUQFwB
 zSxK2QQxYBmplvuTYkOm/qx9ihCtnKVXh/dvxGURd1qV+mfiOE7Na2LrHZf/636xdT0OFr
 hgcquqNqmb7UGzXonQhT2T7ZSYM3NzbEh8+eJDEVZkYrGK63ScdY09vfCQvBaCYNFsRjV7
 Co8PAQ9e3AInaXcjBprawgP+oh8johMEkZW+j7oFqTiJoH0CexmINp82df5FM9VI+A30hh
 iJk97j0GtqL+quJSA5I6OZZA2m1uWoqAC9JO53fXs3S1FXOAWwwMecy5ogbvDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bhFqa6L4
Subject: Re: [Buildroot] [PATCH 2/3] package/googlefontdirectory: bump to
 2125bc9b447971543caaa132530b828e5e682819
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Christian Hitz <christian@klarinett.li>,
 Christian Hitz <christian.hitz@bbv.ch>, Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Wed, 28 Feb 2024 15:50:10 +0100
Christian Hitz via buildroot <buildroot@buildroot.org> wrote:

> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> This is the current version on main branch.
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> ---
>  .../googlefontdirectory.hash                  | 2551 +++++++++++------
>  .../googlefontdirectory.mk                    |    2 +-
>  2 files changed, 1618 insertions(+), 935 deletions(-)

Thanks for the patch. I applied it, but after splitting it into 3
separate commits:

- One fixing the missing space between sha256 and the hash value in the
  shell command used to generate the list of license file hashes

- One sorting the license files

- One doing the bump itself

All of that to clearly separate changes, and visualize better using the
diff what actually changed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
