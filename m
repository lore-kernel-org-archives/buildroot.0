Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099C6C48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 17:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9C2660F2D;
	Wed, 21 Feb 2024 17:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vfy9Imefy8bA; Wed, 21 Feb 2024 17:05:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CED8D60EE2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CED8D60EE2;
	Wed, 21 Feb 2024 17:05:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B3181BF384
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 084DE810D7
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNf463nxkZmW for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 17:05:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA8C981BC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA8C981BC6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA8C981BC6
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 17:05:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2D8BD13FA38;
 Wed, 21 Feb 2024 18:05:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Feb 2024 18:05:15 +0100
Date: Wed, 21 Feb 2024 18:05:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZdYtS7iUJBUWjJkt@landeda>
References: <20240221161909.40317-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240221161909.40317-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708535118;
 bh=GoWMSg7fTohgP78t1lMrIxPkDl3qV848CCdx698xHJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NXH5KP1bDz+UCF49sZghNv2kFzDyHojtQwEtlwV95PO1atKF7W5P11KZvXfW2IcfU
 6s9owh/uXxVYWYRMyGo+QXqerif9r2OXJ/ff4R3EbHwmvwctp/tFLrsk70S2SSO1gB
 2o6UpEDwrC3MExhNT2VBUh+DY0bV3dsNjtnZcIQjkVXdIKz4x9yygXkHvhcV0FTYwi
 GAtOSt8moWRCDo6xFBmXpJGf/qC5Wyje2t3OEHB+uR5jpqA37pV9j9NeKlL9fFTIjv
 3ObMrJZbJIHTzKiUxM/H6H+hUMp8kEHNEK3GEn/vlsTqcU06fIUrtiLa9kZ9nXYa/F
 kmMpQVoQlSYdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NXH5KP1b
Subject: Re: [Buildroot] [PATCH] support/testing: TestCheckPackage: update
 expected strings
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

Romain, All,

On 2024-02-21 17:19 +0100, Romain Naour spake thusly:
> Commit dfed5acb56 ("utils/check-package: use https for the manual URL")
> replaced the default url to the Buildroot manual while it was used
> by TestCheckPackage test.
> 
> Update TestCheckPackage with https url.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243484
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks for fixing my mess!

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/utils/test_check_package.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
> index 9aa117d211..2125b34170 100644
> --- a/support/testing/tests/utils/test_check_package.py
> +++ b/support/testing/tests/utils/test_check_package.py
> @@ -200,13 +200,13 @@ class TestCheckPackage(unittest.TestCase):
>                             self.WITH_UTILS_IN_PATH, abs_path)
>          self.assert_file_was_processed(m)
>          self.assert_warnings_generated_for_file(m)
> -        self.assertIn("{}:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)".format(rel_file), w)
> +        self.assertIn("{}:1: should be 80 hashes (https://nightly.buildroot.org/#writing-rules-mk)".format(rel_file), w)
>  
>          w, m = call_script(["check-package", "-b", abs_file],
>                             self.WITH_UTILS_IN_PATH, infra.basepath())
>          self.assert_file_was_processed(m)
>          self.assert_warnings_generated_for_file(m)
> -        self.assertIn("{}:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)".format(abs_file), w)
> +        self.assertIn("{}:1: should be 80 hashes (https://nightly.buildroot.org/#writing-rules-mk)".format(abs_file), w)
>  
>          # br2-external with ignore list
>          topdir_path = infra.filepath("tests/utils/br2-external")
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
