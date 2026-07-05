Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE3AC43602
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 09:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ABBA606DB;
	Sun,  5 Jul 2026 09:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLJyaGcF7L1i; Sun,  5 Jul 2026 09:28:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66C17606D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783243713;
	bh=r/NW/1yYjUySC1o7MamOl84SOysHTlCjsB2Qp43sUjg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KBCSGNc7ooGI2Gg/UoddcLcs9nZpw3LSQ7xuPAw5CcPjFQ50mVjOZmPxzkCRy+Gm5
	 ZCFDpAUSnqO+rMhsxmP+nz5MxAqfVhAGA6L1SJWGA1P6s/qvsFJxqSzjy8YF5Shjsb
	 DF59v/rNwE05RC0lTb/A/M/Uu8Kd1YVAKYykH9iDs4UKu3R6RqhK4KlSPGK9jm+t9g
	 6nNtqPAPgEkHwLrXXECE9yjBW0LTh2khUqN6uJWtGH6+VuXyp0Aa9OQioLjjV0sQ+l
	 9mVmr+D7H1/kMVSBdHMvc6ZtVcKWAfZG0EtzEEkeD5/sNRuHrBMJHUTk+FaUxlVbiK
	 +lCZ87Er8MbXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66C17606D4;
	Sun,  5 Jul 2026 09:28:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11D402A8
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFBDF4023E
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgWX2kZq391F for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 09:28:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B665940237
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B665940237
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B665940237
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:28:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 602C9B00565;
 Sun,  5 Jul 2026 11:28:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jul 2026 11:28:26 +0200
MIME-Version: 1.0
Date: Sun, 05 Jul 2026 11:28:26 +0200
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: buildroot@buildroot.org
In-Reply-To: <20260621224313.3061196-1-jarkko@kernel.org>
References: <20260621224313.3061196-1-jarkko@kernel.org>
User-Agent: Webmail Free/1.6.16
Message-ID: <f8acb67726efbb68c6c64e99d87ccfe5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783243707;
 bh=PYZ0n7H0uiXmxM9ysSb62ZA6BTQwjmAUVEGx5/ndC5M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hsqaL3Q7o8ARCGZOPbvrGYHP/xcKmp9Yfc/Vyonaaz8G5J+aU7adIBrvyoSvm2Mzu
 nhR5noGqfVQMv82eT4mZlvWqZFubrEMj+H3CZuSXtavaInA3gfXnWEiqc4/e57ePMN
 +spcNqgzX3eBP/j4bXa26B/JB/ljYLDEHnF2fX8rODlKAUS9iQ47nZPbwChyuP9eE8
 unb3E2vlYAbgYgXmPHd2h0qxxG++DAsuhFTuGOOWk6bH5YHJLOr0JoO/WXbVw6347U
 /wiG9Wy3AtHzD8jxpDX08BP+i2Z4RTSK0kYWRUNkOugmQTbwOPlqXomx1xaGqDubXG
 cf9wSpqPErS6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hsqaL3Q7
Subject: Re: [Buildroot] [PATCH] package/systemd: Bump version to 261
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jarkko,

Thanks for the patch.

On 22/06/2026 00:43, Jarkko Sakkinen via buildroot wrote:
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>

systemd is not a trivial package to bump, when updating its
major version.

Could you add at least a link to the upstream NEWS file in the commit 
log:
https://github.com/systemd/systemd/blob/v261/NEWS
and summarize what are the important changes relevant to Buildroot,
since the previous v258.7 version?

See for example the last major bump for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/c38d7326e093f45252c01e241d0faf6b04023e02

> ---
>  package/systemd/systemd.hash | 2 +-
>  package/systemd/systemd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/systemd/systemd.hash 
> b/package/systemd/systemd.hash
> index e96d3ba7ad..1c82877a4a 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  
> 6bd311c25f00d634ae3b4544d582e27df0d4166e6ba3d403b18b3129d7f44cae  
> systemd-258.7.tar.gz
> +sha256  
> f1c2e6a0d19ea5cae946386eb288432de12f3c6b7730cdb0d2a06f8ab8e3f8dc  
> systemd-261.tar.gz
>  sha256  
> ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  
> LICENSE.GPL2
>  sha256  
> 6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  
> LICENSE.LGPL2.1
>  sha256  
> c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  
> LICENSES/alg-sha1-public-domain.txt

Running "make systemd-legal-info" fails. The license files changed
upstream. Could you update the hashes and summarize what has changed in
the commit log, please?

> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 3223915d40..9a0b5652e8 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -19,7 +19,7 @@
>  # - Diff sysusers.d with the previous version
>  # - Diff factory/etc/nsswitch.conf with the previous version
>  #   (details are often sprinkled around in README and manpages)
> -SYSTEMD_VERSION = 258.7
> +SYSTEMD_VERSION = 261

The systemd package has a comment describing few checks that are needed
when bumping systemd in Buildroot:
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05/package/systemd/systemd.mk?ref_type=tags#L7-L21

The first point applies: the kernel version requirement was increased
from 5.4 to 5.10 in:
https://github.com/systemd/systemd/commit/1aeba33d8ffcc4882566881420e1106c9dff61f3

This change should be reflected at least in:
package/systemd/Config.in (BR2_PACKAGE_SYSTEMD depends and comments)
and
system/Config.in (BR2_INIT_SYSTEMD)

You can review changes running the command in the systemd repository:
git diff v258.7..v261 -- README

This is also observable by running the Buildroot runtime testsuite for
systemd:
https://gitlab.com/jolivain/buildroot/-/pipelines/2652633093

You can run it locally with the command:

utils/docker-run support/testing/run-tests \
     -k -d dl -o output_folder tests.init.test_systemd

systemd also received new meson build options. You can quickly review
those running the command in systemd repository:
git diff v258.7..v261 -- meson_options.txt

Those should be either included in systemd.mk (conditionally or
unconditionally), or eventually the commit log should describe
why no change is needed for a given option.

>  SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = \
>  	LGPL-2.1+, \
> --
> 2.47.3

Could you rework this patch and send a v2 please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
