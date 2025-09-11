Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F21ECAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE3AE40826;
	Thu, 11 Sep 2025 19:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJpminhtQnGx; Thu, 11 Sep 2025 19:13:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECCB542228
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECCB542228;
	Thu, 11 Sep 2025 19:13:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 318D1E20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 226B684A47
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkcEqrA7g7FC for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:13:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F8F38498F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F8F38498F
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F8F38498F
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:13:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6DA4EB9787FA; Thu, 11 Sep 2025 21:13:46 +0200 (CEST)
Message-ID: <bcc13966-2c43-48c8-8bde-b084e55a3761@rnout.be>
Date: Thu, 11 Sep 2025 21:13:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Anton Bengtsson <anton.bengtsson@plejd.com>, buildroot@buildroot.org
References: <20250911121235.3062715-1-anton.bengtsson@plejd.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250911121235.3062715-1-anton.bengtsson@plejd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757618026; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=EvrtHJFA7s8fCyRXIXxUbP7jC+9AikMwyFlGUmOnaFQ=;
 b=EBV/XGYQCzEUKneiwCY0noDxQTv99ppzIr6N3tZc9UHgVtfAka9c6RHeVLnjqg7ewLwv06
 v9e0jY5VQ3dhiwrfU0IlArxhaH+ytwHfhkqZHkKyjrQz7zDeDstN1ipfldJLr3hNg+o/Gl
 buO2k56cmksicODppf9eW5VnrXdRQ7PVqaJEIYAWlYPMyJ/S9SX7kXp++nIx0D66HKIe+j
 QD0swmKcJsSuS2jrW0CQo4NHz541FHdpRMllkwzPYuSv8IaXSAloAGlDQapuDTs0cqxMtp
 xuA9wTLvwL77zuOufLZ4gW/Ehgw3HT76VzDYmlXkx1tlUS5Jkrepvrdt11ILmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=EBV/XGYQ
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/cve: replace distutils
 with looseversion
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

  Hi Anton,

On 11/09/2025 14:12, Anton Bengtsson via buildroot wrote:
> The package 'distutils' was removed in Python 3.12 (https://docs.python.org/3/library/distutils.html)
> and looseversion appears to be a good drop-in replacement for distutils.version.LooseVersion,
> see https://pypi.org/project/looseversion/.

  The problem is that looseversion is not in the standard lib. We try as much as 
possible to depend only on the standard lib. Obviously that is not possible any 
more since distutils is _also_ no longer in the standard lib.

  We have a few scripts that have some external dependencies. Mostly in the 
tests. Otherwise it's (I think) only check-package that depends on flake8 and 
python-magic.

  So, probably OK to move to looseversion, but then we need two additional changes:

- support/docker/Dockerfile must be updated to include it;
- cve.py should get a header like check-package has so that dependencies can be 
handled by uv. Cfr. commit message of commit 
6ffcdb52e80b63e68c890aed52ff7f4d00e079b8.


  Regards,
  Arnout

> 
> Signed-off-by: Anton Bengtsson <anton.bengtsson@plejd.com>
> ---
>   support/scripts/cve.py | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/support/scripts/cve.py b/support/scripts/cve.py
> index ba41762fa0..63372c3273 100755
> --- a/support/scripts/cve.py
> +++ b/support/scripts/cve.py
> @@ -19,11 +19,11 @@
>   
>   import datetime
>   import os
> -import distutils.version
>   import json
>   import subprocess
>   import sys
>   import operator
> +from looseversion import LooseVersion
>   
>   sys.path.append('utils/')
>   
> @@ -190,7 +190,7 @@ class CVE:
>           by this CVE.
>           """
>   
> -        pkg_version = distutils.version.LooseVersion(version)
> +        pkg_version = LooseVersion(version)
>           if not hasattr(pkg_version, "version"):
>               print("Cannot parse package '%s' version '%s'" % (name, version))
>               pkg_version = None
> @@ -202,7 +202,7 @@ class CVE:
>           # version, as they might be different due to
>           # <pkg>_CPE_ID_VERSION
>           else:
> -            pkg_version = distutils.version.LooseVersion(cpe_version(cpeid))
> +            pkg_version = LooseVersion(cpe_version(cpeid))
>   
>           for cpe in self.each_cpe():
>               if not cpe_matches(cpe['id'], cpeid):
> @@ -214,7 +214,7 @@ class CVE:
>   
>               if cpe['v_start']:
>                   try:
> -                    cve_affected_version = distutils.version.LooseVersion(cpe['v_start'])
> +                    cve_affected_version = LooseVersion(cpe['v_start'])
>                       inrange = ops.get(cpe['op_start'])(pkg_version, cve_affected_version)
>                   except TypeError:
>                       return self.CVE_UNKNOWN
> @@ -226,7 +226,7 @@ class CVE:
>   
>               if cpe['v_end']:
>                   try:
> -                    cve_affected_version = distutils.version.LooseVersion(cpe['v_end'])
> +                    cve_affected_version = LooseVersion(cpe['v_end'])
>                       inrange = ops.get(cpe['op_end'])(pkg_version, cve_affected_version)
>                   except TypeError:
>                       return self.CVE_UNKNOWN

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
