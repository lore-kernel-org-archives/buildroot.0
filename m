Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7A6C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8CB041729;
	Thu,  2 May 2024 16:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSYSxrANS5hL; Thu,  2 May 2024 16:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95F9441763
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95F9441763;
	Thu,  2 May 2024 16:28:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B31521BF296
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A05B860EB3
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAKc3ih31XAi for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:28:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F235160EA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F235160EA0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F235160EA0
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:28:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9495CC0009;
 Thu,  2 May 2024 16:28:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s2ZI6-00ArDX-2o;
 Thu, 02 May 2024 18:28:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240301213722.91942-1-fontaine.fabrice@gmail.com>
Date: Thu, 02 May 2024 18:28:14 +0200
In-Reply-To: <20240301213722.91942-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 1 Mar 2024 22:37:22 +0100")
Message-ID: <87plu45gbl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/tcf-agent: fix x86 build
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
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following x86 build failure raised since bump to version 1.8.0
 > in commit 81802e263a12e173e0e1028449d1e1e11b2e5974 and
 > https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/commit/8df5540c53b862d516ac25f908c2fff4a547b4a6:

 > /home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:
 > In function 'unpack_elf_symbol_info':
 > /home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27:
 > error: 'STT_ARM_16BIT' undeclared (first use in this function)
 >  2079 |         if (info->type == STT_ARM_16BIT) {
 >       |                           ^~~~~~~~~~~~~
 > /home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27:
 > note: each undeclared identifier is reported only once for each
 > function it appears in
 > /home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:
 > In function 'create_symbol_addr_search_index':
 > /home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2228:78:
 > error: 'STT_ARM_16BIT' undeclared (first use in this function)
 >  2228 |                     if (type == STT_FUNC || type == STT_ARM_TFUNC || type == STT_ARM_16BIT) {
 >       |                                                                              ^~~~~~~~~~~~~

 > Fixes: 81802e263a12e173e0e1028449d1e1e11b2e5974
 >  - http://autobuild.buildroot.org/results/8388acf59689ed7e621bdf158483e3df1cf9bef7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
