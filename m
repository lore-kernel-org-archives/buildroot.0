Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A19C48BF6
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 11:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29D3E60752;
	Thu,  7 Mar 2024 11:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZM70gd2NyyeW; Thu,  7 Mar 2024 11:21:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4959B60FFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4959B60FFB;
	Thu,  7 Mar 2024 11:21:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DA891BF40A
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 11:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2778040788
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 11:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z4YxymgTt5gp for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 11:21:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 61B9A4077F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61B9A4077F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61B9A4077F
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 11:21:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1233420005;
 Thu,  7 Mar 2024 11:21:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1riBoQ-003Mro-0n;
 Thu, 07 Mar 2024 12:21:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240306121823.610202-1-fontaine.fabrice@gmail.com>
Date: Thu, 07 Mar 2024 12:21:22 +0100
In-Reply-To: <20240306121823.610202-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 6 Mar 2024 13:18:23 +0100")
Message-ID: <871q8mxp71.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/squid: needs gcc and host gcc
 >= 8
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

 > cf_gen.cc is compiled by host compiler and unconditionally uses auto
 > since bump to version 6.6 in commit
 > c13199c9326fa2daa574f08ec8fc063a48d0eb06 and
 > https://github.com/squid-cache/squid/commit/09835feb258c3058d028918e36d959dccb3f7496
 > resulting in the following build failure with host gcc < 8:

 > /usr/bin/g++ -O2 -I/home/buildroot/autobuild/run/instance-1/output-1/host/include -o cf_gen ./cf_gen.cc -I. -I../include/ -I../src
 > ./cf_gen.cc: In function 'int main(int, char**)':
 > ./cf_gen.cc:268:63: error: forming reference to void
 >                      auto &newEntry = entries.emplace_back(name);
 >                                                                ^

 > So add a dependency on host gcc >= 8 and gcc >= 8 as advocated by
 > upstream in
 > https://github.com/squid-cache/squid/blob/9d3433c4ac6cd547c10cf298b8a5e61a463fb753/doc/release-notes/release-6.sgml.in:

 >   This release adds a dependency on C++17 support in any compiler used to build Squid.
 >   GCC 8+ and Clang 8+ support C++17.

 > While at it, drop BR2_TOOLCHAIN_HAS_GCC_BUG_64735 which is always false
 > with gcc >= 7

 > Fixes: c13199c9326fa2daa574f08ec8fc063a48d0eb06
 >  - http://autobuild.buildroot.org/results/f1766d1a3b2ce7745fa23cdeae1101806cd97aea

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
