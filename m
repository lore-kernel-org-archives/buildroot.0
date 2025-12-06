Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4930BD3ABF6
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 06:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2EA040AA6;
	Sat,  6 Dec 2025 06:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZzGwF-WTDVS; Sat,  6 Dec 2025 06:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C388140AA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765002928;
	bh=7gTxyy765oZGauTg1/XXbHHtqgMeClGxhKwa992g230=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bvnEZX3AJhw/oZ7oQ4M+tLfW7vg98ijUvnxvksjTO/2H6Uc0CxF0fYHpmFZrgs4Jr
	 26nZxko2DPjkjgZISr32xXgEM/i8k0bP2+4M8zxObWWh7ZZBppt2/xq85USt0LL/JR
	 aOvgmMwn4/4DxZhOGoJgBI4EneJXeLdC30R/iKYrOfNoOnoh+QFbUKOZU2l/SWmAwY
	 ZbxZQ+ebE4iNMHVWBDukpyoh8AKeYEB/KzSiHPrDE4psjeMwXw3EqL7XOYjSBP8ced
	 h3TFn5yQ+ca8p2j2YVUGvR4SNUi+/lNT7c1MvLs3GtwSGKFVTLZ8nshwyru6bVF5Jl
	 Lw+gkBtoSDEPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C388140AA3;
	Sat,  6 Dec 2025 06:35:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E41F9151
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 06:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D608D82974
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 06:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6EHMtI5EhZh for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 06:35:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A75BD82848
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A75BD82848
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A75BD82848
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 06:35:25 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1240205036; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 06 Dec 2025 06:35:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vRlt4-00000002gJz-29pK;
 Sat, 06 Dec 2025 07:35:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Marcus Hoffmann <buildroot@bubu1.eu>,
 James Hilliard <james.hilliard1@gmail.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <38b18519-e386-42d0-83f3-a6409ec9df81@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Fri, 5 Dec 2025 13:51:11 +0100")
References: <20251124160029.3122459-1-buildroot@bubu1.eu>
 <f69cf684f6b0b903864c5b3d74b22703@free.fr>
 <38b18519-e386-42d0-83f3-a6409ec9df81@bubu1.eu>
Date: Sat, 06 Dec 2025 07:35:22 +0100
Message-ID: <87wm30azit.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=UoA5PaF6wr3T6JrILG4XuWxS1TWB8Kf7BH4gqt6lV2As2VLrdxDbSiO46f1aD/rXhHYLk9lzufbWbOR1u/SbmqhR1PGKXloucxP0MG/w/oA/2Jb82eLsHBb99uQ0QiIoHaNWn6unCD37gA0oL2tAUnuA11poSEW4hJIPXCDpafMZAazQUBhvmE0bPfvn738CawD0vIOjU0dZ0A48WVSLXhtujWfSUjJY1I93K6AVPJkr+E9qEB65Tp2g9sz+1HMq8B4Bg3YMPt/NvZGZf/RcMbYatpIzH6EbS7tns0MiESe6aklHvRgVt2Nbz1tmMOIoFqQQRd7yvJ1kTpf/OE2vHQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=ZYYXiuc9cO62cWRWozF49indUBFej+H/uLLY4lsoZqM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=UoA5PaF6
Subject: Re: [Buildroot] [PATCH] package/python-fastapi: bump to 0.121.3
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

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

Hi,

 > (oh and also fastapi has released 11(!) new versions in the last 5
 > days, so I updated to the latest one now, but not idea what's going on
 > over there...)

It _IS_ called *fast*api ;)

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
