Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8934C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 19:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7385783E9B;
	Thu, 17 Jul 2025 19:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WvZOHCgwM3Rg; Thu, 17 Jul 2025 19:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7989783E6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7989783E6D;
	Thu, 17 Jul 2025 19:58:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A526B226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96E1A83E6D
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id byNkXFz5K4nO for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 19:58:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B90680D21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B90680D21
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B90680D21
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 19:58:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DCD74B977AA4; Thu, 17 Jul 2025 21:58:42 +0200 (CEST)
Message-ID: <39b7ede8-f16f-4e77-807e-a83c586a1700@rnout.be>
Date: Thu, 17 Jul 2025 21:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, thomas.perale@mind.be
References: <20250709163647.115213-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250709163647.115213-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752782323; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=ZGscZK4FRPUGoM+crg+ikIbZJHf0Pyq/if97n/OdD1k=;
 b=PC+KHE+W5n8YJ33SEq068ujRd/PyPiBX8gnENWXrWfQjcXo/l2lefNUg3D2jC8lKHlXYsg
 1MYraPgKXbpA0850Ma+dizYw3NRxrzK2MK2dDnPdwlBwF7kMWvBnFmxSZLSLzFYeH8D6RH
 hicVoiQVlCcO45yLpOF3PcGYBTfPR5rtJH1pYVq3V2yXIA9gHB7A+6yKvf7I2PKJdsLpSS
 0AEv44QphhsF8r8T6ibGtQQz3M0ilV20NOnzkkHNPs8VSfecuJd+dfREBY2iiw3QNaM07Y
 uNjdMhFvcFJhLrR2JjYgP94QqrOLxZPJn1yfC9GuuC5kWf3P4MLC2EZkouEGJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=PC+KHE+W
Subject: Re: [Buildroot] [PATCH for 2025.05.x] package/git: security bump to
 v2.49.1
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



On 09/07/2025 18:36, Titouan Christophe via buildroot wrote:
> Read the announcement: https://lwn.net/ml/all/xmqq5xg2wrd1.fsf@gitster.g/
> 
> This fixes the following vulnerabilities:
> 
> - CVE-2025-27613 (Gitk):
>     When a user clones an untrusted repository and runs Gitk without
>     additional command arguments, any writable file can be created and
>     truncated. The option "Support per-file encoding" must have been
>     enabled. The operation "Show origin of this line" is affected as
>     well, regardless of the option being enabled or not.
>     https://www.cve.org/CVERecord?id=CVE-2025-27613
> 
> - CVE-2025-27614 (Gitk):
>     A Git repository can be crafted in such a way that a user who has
>     cloned the repository can be tricked into running any script
>     supplied by the attacker by invoking `gitk filename`, where
>     `filename` has a particular structure.
>     https://www.cve.org/CVERecord?id=CVE-2025-27614
> 
> - CVE-2025-46835 (Git GUI):
>     When a user clones an untrusted repository and is tricked into
>     editing a file located in a maliciously named directory in the
>     repository, then Git GUI can create and overwrite any writable
>     file.
>     https://www.cve.org/CVERecord?id=CVE-2025-46835
> 
> - CVE-2025-48384:
>     When reading a config value, Git strips any trailing carriage
>     return and line feed (CRLF). When writing a config entry, values
>     with a trailing CR are not quoted, causing the CR to be lost when
>     the config is later read.  When initializing a submodule, if the
>     submodule path contains a trailing CR, the altered path is read
>     resulting in the submodule being checked out to an incorrect
>     location. If a symlink exists that points the altered path to the
>     submodule hooks directory, and the submodule contains an executable
>     post-checkout hook, the script may be unintentionally executed
>     after checkout.
>     https://www.cve.org/CVERecord?id=CVE-2025-48384
> 
> - CVE-2025-48385:
>     When cloning a repository Git knows to optionally fetch a bundle
>     advertised by the remote server, which allows the server-side to
>     offload parts of the clone to a CDN. The Git client does not
>     perform sufficient validation of the advertised bundles, which
>     allows the remote side to perform protocol injection.
>     This protocol injection can cause the client to write the fetched
>     bundle to a location controlled by the adversary. The fetched
>     content is fully controlled by the server, which can in the worst
>     case lead to arbitrary code execution.
>     https://www.cve.org/CVERecord?id=CVE-2025-48385
> 
> - CVE-2025-48386:
>     The wincred credential helper uses a static buffer (`target`) as a
>     unique key for storing and comparing against internal storage. This
>     credential helper does not properly bounds check the available
>     space remaining in the buffer before appending to it with
>     `wcsncat()`, leading to potential buffer overflows.
>     https://www.cve.org/CVERecord?id=CVE-2025-48386
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to 2025.05.x, thanks. For real this time :-)

  Regards,
  Arnout

> ---
>   package/git/git.hash | 2 +-
>   package/git/git.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/git/git.hash b/package/git/git.hash
> index 6235a8aa0a..d965d061c2 100644
> --- a/package/git/git.hash
> +++ b/package/git/git.hash
> @@ -1,5 +1,5 @@
>   # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
> -sha256  618190cf590b7e9f6c11f91f23b1d267cd98c3ab33b850416d8758f8b5a85628  git-2.49.0.tar.xz
> +sha256  310831de967f1c8c5e8ff55f92807dea89f83dc3d3d2a5d16c209bd01a31def1  git-2.49.1.tar.xz
>   # Locally calculated
>   sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
>   sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
> diff --git a/package/git/git.mk b/package/git/git.mk
> index 68a0fff65f..0461285664 100644
> --- a/package/git/git.mk
> +++ b/package/git/git.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GIT_VERSION = 2.49.0
> +GIT_VERSION = 2.49.1
>   GIT_SOURCE = git-$(GIT_VERSION).tar.xz
>   GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
>   GIT_LICENSE = GPL-2.0, LGPL-2.1+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
