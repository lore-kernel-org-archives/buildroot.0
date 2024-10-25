Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621EED149CD
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 16:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B565605DB;
	Fri, 25 Oct 2024 16:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ctJCvFkObNo1; Fri, 25 Oct 2024 16:56:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3633960652
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3633960652;
	Fri, 25 Oct 2024 16:56:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04F982318
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 16:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E607F4070D
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 16:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NgOCe0U6aPwR for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 16:56:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3AE5240701
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AE5240701
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AE5240701
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 16:56:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE2EEC0003;
 Fri, 25 Oct 2024 16:56:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1t4Nc4-008EAa-0t;
 Fri, 25 Oct 2024 18:56:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Frager, Neal" <neal.frager@amd.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20241023130912.966121-1-peter@korsgaard.com>
 <DM6PR12MB500711AA056607D67C2593B4F04F2@DM6PR12MB5007.namprd12.prod.outlook.com>
Date: Fri, 25 Oct 2024 18:56:36 +0200
In-Reply-To: <DM6PR12MB500711AA056607D67C2593B4F04F2@DM6PR12MB5007.namprd12.prod.outlook.com>
 (Neal Frager's message of "Fri, 25 Oct 2024 15:58:20 +0000")
Message-ID: <87r084jf3v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH-2024.02.x] package/bootgen: add patch to fix
 crash with -verify
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

>>>>> "Frager," == Frager, Neal <neal.frager@amd.com> writes:

 > Hi Peter
 >> The 2023.2 version forgets to populate the iHT structure before accessing
 >> it, leading to a segfault. Add a patch submitted upstream to fix that.

 >> Notice that this is fixed in the 2024.1 version as there ReadBinaryFile()
 >> now calls ReadHeaderTableDetails():

 >> https://github.com/Xilinx/bootgen/commit/3a0f879c611d67072aad3461f1c72d1a284cd5fc#diff-404aa20e03f1035b725ac1ea6e64c28477bb65c1663da67f64ffdb1a60552cee

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Excellent job identifying this issue!

It is quite obvious as bootgen crashes right away when used with the
-verify option ;)

 > Reviewed-by: Neal Frager <neal.frager@amd.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
