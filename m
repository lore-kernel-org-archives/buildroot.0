Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3057ACFD314
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 11:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D10781434;
	Sun, 14 Dec 2025 11:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdFSKvc6592t; Sun, 14 Dec 2025 11:10:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 814248118B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765710645;
	bh=nd5ho6/M7WpGOciUUGu3+/vu44mLe65vJNxQaycS2oc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=etKxnCFwH/y88QD++fhG4kh0mYLnfRLo4fIJ+V/MH0Od6y5SUhYlBnWLp/L6wqJpg
	 u9W/ikCCpyjQr+7lpfkYzWJfVxDcDRcUKGyGK20Loh+vJREz/d61Wu5H7B+bgc/oWc
	 NZmwd7xlXUdpzkVmqlno0gGBlguhlA9Mv6tFxifK/CnD1N7Th87JIPzQCIKVgMzEen
	 0ThfbkhDQh879aU70VTBByZ6rYCh0ya3MMucPR9Ubi69X1aXxmXEQA6wWx4YNv672n
	 uTX33bBfpEdccYfXqBx44UrQ/vOQeqEEaefbiz/AAAF/IvwL3ydCKz6aME2sLd53ik
	 JXhpMysNrN7MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 814248118B;
	Sun, 14 Dec 2025 11:10:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A5332C1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 11:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5E1B40807
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 11:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EiYB_lDzWX8I for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 11:10:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2F5A40805
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2F5A40805
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2F5A40805
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 11:10:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 00B4A13F89A;
 Sun, 14 Dec 2025 12:10:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Dec 2025 12:10:39 +0100
MIME-Version: 1.0
Date: Sun, 14 Dec 2025 12:10:39 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250910213241.1529448-24-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-24-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <acefc76d576d07eb1fcc6c79a5a9e5d1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765710641;
 bh=6gw3u+78mXyKUGVKcCS2gw3KB4NqcrIMNCMJ8xCRoEA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h/qXrrK0jFSLu09sW6l4P7YzGWyvr7MvP/LhWEybbN8WbiNCqEKTrxufPqDh9b+Tr
 UCBbOi9dmRIf6dsJc+lhef/HDyHmbKOcx2XEeJ23sffABBl7mz6f735WV+eFgdR+jS
 EhMxzEx1eklaFR1A/BpmC2Vl9B+ER/apAmfWKML7ExxKX2Bh4YFUoJgZ49kiDbr70u
 JcETQx5cp+egj+DLOTapyk0QN87zUTATLqu8G1P8t8KsXV5TMV73R7Cn1+Xj5h7wgd
 7xoFCN0VK0H7ch6VW2MdurSAaHq3gzxX/OzLPuxKh9qAXPBje3eK/03ZjwWRGcwcXC
 B493k2FAF3xog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h/qXrrK0
Subject: Re: [Buildroot] [PATCH 23/23] package/libgtk2: remove package
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

On 10/09/2025 23:32, Thomas Petazzoni via buildroot wrote:
> The final upstream release of libgtk2 was published in December
> 2020. libgtk2 no longer builds with GCC 14.x, even less so with GCC
> 15.x. While Debian has some fixes to make it build with GCC 14.x,
> those are not sufficient to allow building libgtk2 with GCC 15.x.
> 
> libgtk2 is anyway very old, largely superseded by libgtk3 and then
> libgtk4. It is therefore time to remove it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

For info, this patch was resent by Bernd and applied in:
https://gitlab.com/buildroot.org/buildroot/-/commit/47a7376514fd5b70950a047a73aa792fdb04efcd

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
