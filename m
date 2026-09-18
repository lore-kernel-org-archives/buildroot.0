Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22999C982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E80A760E4F;
	Fri, 18 Sep 2026 19:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWFb28FAFtKJ; Fri, 18 Sep 2026 19:36:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0B70D60E16
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760186;
	b=OqDc3cO6eM2/gemzasR34zrZVuHXR4W4iyFQSI1WMXRkc/zw06S28iAqdW5agKtoNkO7
	 FvvzacOEFThTn/MlQXnnfS8YlyFzVSqEDCxMsYa1UmHXU+iazipavcK9GYNfaR9GdBi0u
	 mha4h+G5aoVmgZwIz0JGP/eJzNQlZnlZDP2gLW+xWyDdA8bzQGJm7psgoYsO+eFFnEfnX
	 s7HsYsiEuLVpeHoc6d63Snt9sCdbG6CfJeO4ojl7rprBw7CFhjU9EKucCAfX2DQ1JKBTJ
	 Svv8EwC6TEhlRyqg5iKPap7hCoHWvlpgdjnGKB60PKTOJ93SeMKa3QFw1G0VSsuklWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760186;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=fgG53QsRtcXurHHl6qUsw3QGYQ4KdCfPTlBywuzOWfs=;
	b=LBxi9+2PRXPRyiTNgyzGsFyDhGk00IHHtbXsF9TA83o+Glav8HpY/SiN6Gq6dNkJVCqM
	 aidOG+sT4jwf5DSIsSd8QfNPnHFqw85PwtxBdBtKyQ9X+DghwH/n51/w3J/RVRfLTSKvf
	 IMegOPizlLNVEHEDYR9yIzILa3BaCYJpEDHqYCJSKRj6xXD0iMYhifgiUFXgcYw0YQWHs
	 rY7jWtXBpa1J+ghXE8FHe4S+Yy4sPaJaecrf6/OjoHSxq5rq65pi1N5p8ZlulIg/VAdnV
	 n9iFWwzIyygSLEy89LKp+5QkMy2rLkqmUfce+oAFWZXeLYJk9gja1Um8zdN+fainD4A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760186;
	bh=fgG53QsRtcXurHHl6qUsw3QGYQ4KdCfPTlBywuzOWfs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D20AlRMJxlCSwA4NyCH4duAavv1N1sARu5R1BAbEv0bwAhaX+nCNB70+qC4DQGQj5
	 gT4fmLLJNJ37lIYQOgzOmAjliz93E5rZu6ShnCW/+ai9cWNxm8mXxu9xpANIYsvj9D
	 wQjiJp9z7sbLmMz0Xn2levdwy7Og8vRj2q9Qj4VPPznJuTOnks6D99YIAMKbXRxg6O
	 k9aykTAzzQsXinzhv+FkKiaKdp0INKqLU0Epq6uVkUAnkrEDRinZw0jd0mSJyeFDF+
	 jvtX+W6Y//uoVjipgLG0qZGIU/pXCHMG6a3k9U99YcntD5/MDxcb/CxlKcortUG6l6
	 fNmWw69ldHUUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B70D60E16;
	Fri, 18 Sep 2026 19:36:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E78A13D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5450660E16
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAXMenRa178p for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:36:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 73D9260E0B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760183;
 b=srRsVBwFDa+Jxt+/r5eE+UIltLmGtk5xya43B14/qConsGsT4dRvDXzSFnWRMDqzlqak
 E8LTJlPsdML8umC6UDw1Y5HntrGcGuswte5trpDSwYOHU4lF1q6egV4o8uMYkF/74qZFG
 Ff6ANp+SGB/DWudbANBvlhi12fxZ9qtUWkjQI70DVydZfT+yJ0K6Kg5+qcjgdnSp42WyT
 Wru4WuD29lp/3rJ8d4tBYpFHlSwVBcg9w17VqrGkBSIkkpCz4d+ij7m0ptjEy7dB5Mii7
 bX5fYDVAMrbo1gpDRa8xQ+L9z/PUrGYkar8uDJ4sbd4Qadn6p5tpZ2eKGAoZNYx++NQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760183;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=2A+gczUMJyOgq3vDXXjcEaHqO4fsWDHgfuIb5vJu9CE=;
 b=EQDPDDdI1CaT5XhhknMvFycIRe3/l+j7m7jGKPx9gXEblCW6j1ybw0p6yZcyQTucWvaj
 /eZeQUqihwomSG348L/E2ry59XIrSv+TwiKYYSDCchEEML1hjBHVtTN3/cB61z40TEmMm
 XhbWuoiJiwUu5Iux6TaHTJSLnjEZfHIKL+y4VtEWNrywaqO4ayiWbnfIJ+CNu3GFmV+OI
 W9T1Lov88+Y2MmDiON7di6pUg9C3cncPrsFotl9+ZFGbBe4fRXZRQjXVYqSRZVJHCCrZR
 203uhgmJ9GUWYdyO9JQaP5VQkRIgR7Ml38RtZpvNfB018CmirY4n7x7WCcbOQ5IL0eQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bP9+Zrul; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73D9260E0B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:36:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1FE845FF88;
 Fri, 18 Sep 2026 21:36:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 18 Sep 2026 21:36:18 +0200
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 21:36:18 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260915213830.2025823-1-thomas.petazzoni@bootlin.com>
References: <20260915213830.2025823-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <7a604816e29f1316cda06e94fb42693d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libgtk3: add missing
 !BR2_STATIC_LIBS dependency
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

On 15/09/2026 23:38, Thomas Petazzoni via buildroot wrote:
> libgtk3 selects at-spi2-core, so it should inherit its
> !BR2_STATIC_LIBS, which this commit does.
> 
> This has been an issue since libgtk3 started using at-spi2-core
> instead of atk in commit 2c3ca7bea1de76163aeef432412eb14551ed0581.
> 
> Fixes: 2c3ca7bea1de76163aeef432412eb14551ed0581 ("package/atk: remove 
> package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
