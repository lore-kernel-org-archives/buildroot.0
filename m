Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D91C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 19:38:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1248B60BD3
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 19:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1248B60BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEE5240247;
	Sun, 25 Jul 2021 19:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id db9_FrpMghi1; Sun, 25 Jul 2021 19:38:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22B6F401C9;
	Sun, 25 Jul 2021 19:38:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4607F1BF405
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 19:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34FBB401C9
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 19:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JAG6PE8ZOSye for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 19:38:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C825401A4
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 19:38:06 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id j2so6790471edp.11
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 12:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=YJbNos88Qbn4w9YQMzWRv5HuB3NlPDzA/k2GOnGWLWg=;
 b=hOJFif3Iek36QJutgaA3+l4oNb3V8a/iDgLt6xC54T79c1YBJj/2F5L7XbeFD8uH0Q
 NopQnEUBBDeubRDK1PXIgx41VGyec2iglxMDNiyeJytRlA115aEDE7vc5BIfSidMrxOp
 25v6Mhqmqp5sU6eniF5VgUO3wsXNsmjplNE7sHA3ZCV23/b1kmn0KiO1vQyRA33pKbPm
 aezD0/NT30//YM9Y4JyUo8Pn8hoZDfNx9dDy94Mzro0G+I1hOG9s/72nhu0kiLLs9nvi
 vD0jcKDDCHY38i0WAookZn8PTWRHkoqFEa4n6eokq8JDjokh95u93A14vLjTu7ja7IYX
 P38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=YJbNos88Qbn4w9YQMzWRv5HuB3NlPDzA/k2GOnGWLWg=;
 b=g5oNX5/Sb893xisOMHymn8ohppyKPIQg9zbHmxLhIcW8HEsCWRk+DTSM7hkvNQaEHH
 gz4Ib1ZJyEzLSGHQxGaiC+N1tEr9AFw2k51QZjg3wZL4xejVHoFlwKMpFlMqNhL6repp
 qPMM1NEBhQ3TgxSqfIsaVPCMJU19r4Hc6bel6l/inpd8df5VAUyxKLYapZ4lneGpl4cH
 s9i9cq86PXI7m2cDVkXCeIBdmhJmRjd80zhfe3TCUgm8qVwGkZc5CXhRBwj+xkgmlZhf
 lP+wQcclKuYa+vySqbHWcZnzMozGUv0Nc85xdRGuCnKOcIs8XafT/egCTnl9v+B8TJcE
 BcTQ==
X-Gm-Message-State: AOAM531YaOS6FEy6rGGNNMqi2AKQrhRqNaoVg+SjcZSk9jXEdFrEzqdl
 4Ba0hh9DlENIiemg8LLXqI1jP1wUPiF4Lw==
X-Google-Smtp-Source: ABdhPJzc6GghCTBAJim9zIX7fRiwe/m8a0SvsXdzu5fFScQZFcqIFqN4jUg3GUUsgid+11pchKdVeg==
X-Received: by 2002:a05:6402:1c8a:: with SMTP id
 cy10mr17457793edb.232.1627241884458; 
 Sun, 25 Jul 2021 12:38:04 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id d8sm12049475edj.19.2021.07.25.12.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 12:38:04 -0700 (PDT)
Date: Sun, 25 Jul 2021 21:38:01 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YP29mbZnR6ENTNsC@pevik>
References: <dd7ac7f1-924b-7e12-d55f-f217853cb041@benettiengineering.com>
 <6228377B-52F6-4957-8373-7A87E1C712CD@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6228377B-52F6-4957-8373-7A87E1C712CD@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: fix time_t on 64-bits
 platforms build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgR2l1bGlvLAoKPiBQbGVhc2UgZHJvcCB0aGlzIHBhdGNoIHNpbmNlIEnigJltIGdvaW5nIGFu
b3RoZXIgdXBzdHJlYW0gcGF0Y2guClllcCwgSSBmaXJzdCBzZW50IG15IHBhdGNoZXMgdXBzdHJl
YW0uIEkgc2hvdWxkIGhhdmUgQ2MgeW91LCBJJ2xsIHRyeSB0bwpyZW1lbWJlciBmb3IgbmV4dCB0
aW1lLgoKQWxzbyBmZWVsIGZyZWUgdG8gYmFja3BvcnQgdGhlbSB0byBCdWlsZHJvb3QgYW5kIHBs
ZWFzZSBDYyBtZSAoc28gd2UgZG9uJ3Qgc2VudAp0aGUgc2FtZSBwYXRjaCBib3RoKS4KCktpbmQg
cmVnYXJkcywKUGV0cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8v
bGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
