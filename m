Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57645C6FD18
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 06:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1524409B7;
	Wed, 29 Mar 2023 06:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1524409B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BVCnjXcDnw7X; Wed, 29 Mar 2023 06:49:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54DB740A46;
	Wed, 29 Mar 2023 06:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54DB740A46
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5C2A1BF966
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 06:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CD7C8204A
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 06:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CD7C8204A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LwIwA43vSTj2 for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 06:49:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 633018203E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 633018203E
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 06:49:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3E45660006;
 Wed, 29 Mar 2023 06:49:22 +0000 (UTC)
Date: Wed, 29 Mar 2023 08:49:21 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230329084921.63e9e90e@windsurf>
In-Reply-To: <20230320171733.1077811-1-fontaine.fabrice@gmail.com>
References: <20230320171733.1077811-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1680072562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQCWCguiiZ46gTV9PjCT6sDRk4qkmcMjqQBC7NNqGp8=;
 b=nwqMWcdonS0Qut2o9AtFzDlahn5k237j348axgpps6qfgD0okV+5ki3jZr/+k+bpgSbPFb
 yatEVOLfTQwxDLproIwyTg/UZH0nnWK9KGEIBcu67/ErmhSm3/+LZMHFqYVlMzDW8DPsgc
 OcYiWEN4zNmYZlXdBKkKHfphTxd8cBSr6kothIgrK5IEONd0Z7fsuexEIGXvmxkCt5Excc
 TY2FL5wfXlcxPXPoNu1CkKfWfwToqxb0XX/7/KGxMmgNfg3giKUecboixz6tw2V9XhIJDs
 icjQ+BbpiZXmCbGc0N2FgaE1QTdWxV4prr1ZdkTAgZJU2oAhhq9+GRFFm14nLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nwqMWcdo
Subject: Re: [Buildroot] [PATCH 1/1] package/snmppp: fix build without SNMPV3
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 Mar 2023 18:17:33 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without BR2_PACKAGE_SNMPPP_SNMPV3 raised
> since bump to version 3.5.0 in commit
> e011fa0415883b9d44df616cfaf6956e1a11da88:
> 
> msgqueue.cpp: In member function 'int Snmp_pp::CSNMPMessage::ResendMessage()':
> msgqueue.cpp:263:34: error: 'version3' was not declared in this scope; did you mean 'version1'?
>   263 |   if (m_target->get_version() == version3) {
>       |                                  ^~~~~~~~
>       |                                  version1
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8ef3e4407a51c53c15e530606227338761dd905b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../snmppp/0001-fix-build-without-v3.patch    | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/snmppp/0001-fix-build-without-v3.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
