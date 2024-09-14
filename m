Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B346BC0219E
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47411406BE;
	Sat, 14 Sep 2024 21:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWQKkpZgjmLH; Sat, 14 Sep 2024 21:44:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E95940687
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E95940687;
	Sat, 14 Sep 2024 21:44:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 735261BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62B2284115
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfdSP-9eN-BR for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:44:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 883F9840A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 883F9840A6
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 883F9840A6
 for <buildroot@busybox.net>; Sat, 14 Sep 2024 21:44:14 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1spaYt-0002eD-Iv
 for buildroot@busybox.net; Sat, 14 Sep 2024 23:44:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sat, 14 Sep 2024 21:44:05 -0000 (UTC)
Message-ID: <vc5035$9ii$1@ciao.gmane.io>
References: <vc1gt7$8pe$1@ciao.gmane.io> <20240914094802.6ee528ae@windsurf>
User-Agent: slrn/1.0.3 (Linux)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: Re: [Buildroot] BR2_DEFCONFIG not being saved by "make
 savedefconfig"
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
Cc: buildroot@uclibc.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2024-09-14, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
> On Fri, 13 Sep 2024 14:06:32 -0000 (UTC)
> Grant Edwards <grant.b.edwards@gmail.com> wrote:
>> [...]
>> In my external default config file, I have BR2_DEFCONFIG set to point
>> to the location in my external buildroot tree where the default
>> configuration file is located. When I do "make savedefconfig", the
>> current working configuration is saved to that location has expected.
>> 
>> However, the BR2_DEFCONFIG setting has vanished from that saved
>> configuration.
>> 
>> Is that expected behavior?
>
> It is, see the main Makefile:
> [...]
> it explicitly removes BR2_DEFCONFIG.
>
> The reasoning is:
>
> commit f71a621d91ec27f175fc84012962f88b1107305f
> Author: Herve Codina <Herve.CODINA@celad.com>
> Date:   Thu Jun 4 10:16:33 2015 +0200
>
>     savedefconfig: Remove BR2_DEFCONFIG from saved defconfig file
>     
>     BR2_DEFCONFIG should not be present in saved defconfig file.
>     
>     The use case is:
>     make qemu_arm_versatile
>     make savedefconfig BR2_DEFCONFIG=my_custom_defconfig
>     
>     BR2_DEFCONFIG is set in my_custom_defconfig with an absolute path
>     to qemu_arm_versatile (value present in .config) and set in
>     my_custom_defconfig as it is different from default mentioned in
>     config.in (default is BR2_DEFCONFIG from environment).
>     
>     On savedefconfig recipe, simply remove BR2_DEFCONFIG from generated file
>
> Not sure I fully grasp the reasoning from back then.

I certainly don't. I can work around it by running the buildroot
"make" from a parent make where I export the value of BR2_DEFCONFIG.




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
