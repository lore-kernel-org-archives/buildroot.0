Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253EAC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 09:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC84583D31;
	Sat, 17 May 2025 09:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRGY0Cfc9ldf; Sat, 17 May 2025 09:11:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1A0683D39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1A0683D39;
	Sat, 17 May 2025 09:11:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 967C5E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C3B783D31
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2A7GFTJyE6U2 for <buildroot@buildroot.org>;
 Sat, 17 May 2025 09:11:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8591E83D39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8591E83D39
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8591E83D39
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:11:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8FD2C1C0D7A; Sat, 17 May 2025 11:11:16 +0200 (CEST)
Message-ID: <896c41b4-9bfe-4a77-b2a6-30ad5db7440a@rnout.be>
Date: Sat, 17 May 2025 11:11:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Fiona Klute <fiona.klute@gmx.de>
References: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747473076; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZWX9/b5caB025ORgekRIbJxz/Jo2d/q+3eIH+HsvZzE=;
 b=F1IPjjq9zrMHOuQzIM/jtGVqPwZXGA9yDCcEFJBntLaWjxX9uBfGGpVUDMmk2vOIBo7BVg
 WDCNHyosdx25Pnh6cvAOL6LFyA2xeFfTgYSxbtepvslkqjHoBWPEdM701bPFmZfSuRiRUL
 H9ve269vRxWq69V5HvYPE+KMUeCN//JiqENBuXjtjezuqTZKLQeLjNhyZAvFl4ff4rEo/5
 N+Jj414r3OnbdM9G8GuPkHFdYW1GuaJVd6Fq/vMFyf/tT3J9UeUxN4qj1Sy60K/dH3yKl2
 8ydCS0gR8hTg4ktRLKkO4jFSkAmt/T/4/UdHMFcRbnU26m1yAyhpG5y1iIMK3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=F1IPjjq9
Subject: Re: [Buildroot] [PATCH 00/10] SELinux updates
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/05/2025 14:10, Adam Duskett wrote:
> Update the SELinux packages.

  Applied the series to master with two fixes as mentioned in individual replies.

> 
> Of note:
> 
> Refpolicy:
> 
> Added a dependency on dbus if the selinuxutil module is selected on
> commit 523b279. This seems like a mistake, and I raised an issue at
> https://github.com/SELinuxProject/refpolicy/issues/906.
> 
> Due to this commit, if the dbus module is set to no, refpolicy fails to build
> with the following error:
> ```
> policy/modules/system/selinuxutil.te:102:ERROR 'attribute
> dbusd_system_bus_client is not within scope' at token ';'
> on line 155976:
> ```
> 
> As a temporary solution, I enabled the dbus policy by default.
> 
> 
> libsepol:
> Kernel 6.14 bumped the maximum policy from 33 to 34.
> 
> Full release notes here:
> https://github.com/SELinuxProject/selinux/releases/download/3.8/RELEASE-3.8.txt

  Excellent summary of the series, thanks!


> Tested with:
> ./support/testing/run-tests tests.core.test_selinux
> ./support/testing/run-tests tests.init.test_systemd_selinux

  I forgot to re-run the tests after my modifications. I'm doing that now and 
I'll fix any issues that I created.

  Regards,
  Arnout

> 
> All tests pass with Ubuntu 24.04
> 
> Adam Duskett (10):
>    package/audit/S02auditd: fix shellcheck and check-package warnings
>    package/libsepol: bump to version 3.8.1
>    package/libsemanage: bump to version 3.8.1
>    package/libselinux: bump to version 3.8.1
>    package/policycoreutils: bump to version 3.8.1
>    package/checkpolicy: bump to version 3.8.1
>    package/restorecond: bump to version 3.8.1
>    package/semodule-utils: bump to version 3.8.1
>    package/selinux-python: bump to verson 3.8.1
>    package/refpolicy: bump to version 2.20250213
> 
>   package/audit/S02auditd                       | 66 ++++++++++++-------
>   package/checkpolicy/checkpolicy.hash          |  2 +-
>   package/checkpolicy/checkpolicy.mk            |  2 +-
>   ...T-and-rely-on-the-installed-file-nam.patch |  2 +-
>   package/libselinux/libselinux.hash            |  2 +-
>   package/libselinux/libselinux.mk              |  2 +-
>   package/libsemanage/libsemanage.hash          |  4 +-
>   package/libsemanage/libsemanage.mk            |  2 +-
>   .../libsepol/0001-support-static-only.patch   | 39 ++++++-----
>   package/libsepol/Config.in                    |  2 +
>   package/libsepol/libsepol.hash                |  2 +-
>   package/libsepol/libsepol.mk                  |  2 +-
>   package/policycoreutils/policycoreutils.hash  |  2 +-
>   package/policycoreutils/policycoreutils.mk    |  2 +-
>   package/refpolicy/refpolicy.hash              |  2 +-
>   package/refpolicy/refpolicy.mk                |  3 +-
>   package/restorecond/restorecond.hash          |  2 +-
>   package/restorecond/restorecond.mk            |  2 +-
>   package/selinux-python/selinux-python.hash    |  2 +-
>   package/selinux-python/selinux-python.mk      |  2 +-
>   package/semodule-utils/semodule-utils.hash    |  2 +-
>   package/semodule-utils/semodule-utils.mk      |  2 +-
>   22 files changed, 89 insertions(+), 59 deletions(-)
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
