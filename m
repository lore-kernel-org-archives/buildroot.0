Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A41C47DD9
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 19:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0D98418D3;
	Fri, 22 Mar 2024 19:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 83rHaTUr7S_m; Fri, 22 Mar 2024 19:54:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3BBF418D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3BBF418D9;
	Fri, 22 Mar 2024 19:54:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A54551BF977
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 19:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9270F405FD
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 19:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CYqFa_XSHkqB for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 19:54:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A79040323
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A79040323
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A79040323
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 19:54:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49E60FF803;
 Fri, 22 Mar 2024 19:54:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rnkyP-006EVk-0a;
 Fri, 22 Mar 2024 20:54:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240317110444.258643-1-fontaine.fabrice@gmail.com>
Date: Fri, 22 Mar 2024 20:54:41 +0100
In-Reply-To: <20240317110444.258643-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 17 Mar 2024 12:04:44 +0100")
Message-ID: <87edc22gam.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/squid: fix build with host gcc
 10
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Pass -std=c++17 to fix the following build failure with host gcc 10
 > raised since bump to version 6.6 in commit
 > c13199c9326fa2daa574f08ec8fc063a48d0eb06:

 > /usr/bin/g++ -O2 -I/home/buildroot/instance-0/output-1/host/include -o cf_gen ./cf_gen.cc -I. -I../include/ -I../src
 > ./cf_gen.cc: In function 'int main(int, char**)':
 > ./cf_gen.cc:268:63: error: forming reference to void
 >   268 |                     auto &newEntry = entries.emplace_back(name);
 >       |                                                               ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/613fee008c77f8dbbe04df9a4ce4347e43de9ef9
 >  - https://bugs.buildroot.org/show_bug.cgi?id=15997

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
