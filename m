Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEBBCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1CF1850E5;
	Sat, 30 May 2026 21:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxorqhFLsBJz; Sat, 30 May 2026 21:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45B78850D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780177825;
	bh=kPQSGNrKMiK8bb/y9Vtvq8OTxXAQl5FmHidRUq/E1ag=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cpREyj3mAfb4M5DLe42VpRe8YTRQGht3+QkJHdy9SA7VPND3b5saf2lRtFO+kiKCI
	 shNPXQL1QGbiqqQV4Xh047u9qszHPqOrBGMSMPyo/8bJ/xEd3qBI4/KJfrASm34G8v
	 6ZVYODtRzxu/Ie++FGWg75xPVZbBcboDHoLUz3bVo1o6NFyr+zHcZga8CXcZQ6FQC0
	 OgDhxvlqK1uk8rb+WT8eZlz8fJzlQ3AO1SmC0YSO0vrzqSXVbWrliec1ItCAy1zBW0
	 yT9u4ARwvbBHMz4fYE9e+VUYq2fruunWqKqw0fZoJcDKwc3tUw15o5Hx22YuUzFza2
	 0iOrwlebHrzHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45B78850D8;
	Sat, 30 May 2026 21:50:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA3B1D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBF4940225
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbqKK6I3BIgE for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:50:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A079C4010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A079C4010F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A079C4010F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:50:22 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1963638310; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 21:50:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTRZQ-00000005oGn-17tr;
 Sat, 30 May 2026 23:50:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260426071710.363519-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 26 Apr 2026 09:17:10 +0200")
References: <20260426071710.363519-1-bernd@kuhls.net>
Date: Sat, 30 May 2026 23:50:16 +0200
Message-ID: <87cxycin3b.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=hZRE3mWGn6niNy0hZPG7UnChu+QmxxLaNaoWdJdTfz/o/YXKlzRVLZmtR9PhXeqsZ2DUUzrlYiCBbeHRP/sRXq5Od6dV6cOUXTdw/W3SeDLXRxyp9595WhHrsPDCqVgJFmeLJv3+WK6WrnqjoF/Ov7iWH2js46fg2kc0JOAxyfBM9YAGAHH260yU4okiBoBeAZujaxFhHT3oPvtSFcdgLYV6z6BYwXFCJ6bnuyVXnYjLth/6qfi1xjhlFXyIuud5DGZh+UTUyhs2ZiqlilfMBA3c6oBAeCxs9xT7VljD/kC/EKFMjtoQZd0yO7CFS9ZlH174uSxPiT7RMzzxwChK2g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=nhX+5j1dEKFTjF47PMZAY+wf6qRnLwX0t6GehE03K9A=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=hZRE3mWG
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump version to 1.11.1
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://mesonbuild.com/Release-notes-for-1-11-0.html
 > Removed patch which is included in this bump.

 > Disabled the usage of ccache in mesa3d with BR2_PACKAGE_MESA3D_RUSTICL=y
 > due to upstream commit:
 > https://github.com/mesonbuild/meson/commit/aac5f78580a3ea1cf0cae487cb46cab68a048660
 > (bisected https://github.com/mesonbuild/meson/compare/1.10.1...1.10.2 to
 >  find the offending commit, the same defconfig works with meson 1.10.1)

 > Without this change mesa3d configure is broken:

 > output/build/mesa3d-26.0.3/src/gallium/frontends/rusticl/meson.build:420:27:
 >  ERROR: No build machine compiler for 'src/gallium/frontends/rusticl/proc/lib.rs'

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
