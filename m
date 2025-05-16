Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CA5C3ABDD
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 874F560BB8;
	Fri, 16 May 2025 10:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_0oB12LYPU6; Fri, 16 May 2025 10:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE8DD6103E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE8DD6103E;
	Fri, 16 May 2025 10:58:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FAF313D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BB8741A1F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdwLcL0P2xSg for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:58:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F4BD4070C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F4BD4070C
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F4BD4070C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:58:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 83EF61C10F5; Fri, 16 May 2025 12:58:31 +0200 (CEST)
Message-ID: <70d4b1af-e58a-4fa1-8a20-e01cdb006de4@rnout.be>
Date: Fri, 16 May 2025 12:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250508180134.93333-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250508180134.93333-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747393111; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZqwIhPcMSwBJ/htE1aLb0YEhekRSOL2Eb8a8ODCKNpY=;
 b=byirbFG/3ufZ8BamsmUkSGF/rADdBiso5SfGUgckfwVWmXk6eC9s02R7A1DACH7+YA+tZs
 hsfVJcC5dMJNvjm5nz2d1L8uqkrYr4xZn4HV+2sLJaSZff2PAEwiQvEIuORYj85OYKTZBJ
 VmSLeF1om5aRcwXs61NH8JOM3TM2u1tLgOx+jNAMRrNOrEXAeTSf8xTYdsSY6g9phKFOFc
 9357z9RofyM8OZwkTRGkFbIC17qw7yGfQMDqmiXJQqhcUBzBEwIcDH9j1r6XBfFuzixuYP
 NVeWGnNgHmfsIurmCPurKJCCUeGALyFAPe7XVH5Ko2pwzlGDUnBwp0MG5r+kvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=byirbFG/
Subject: Re: [Buildroot] [PATCH v2] support/dependencies/dependencies.sh:
 awk is needed by Buildroot
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



On 08/05/2025 20:01, Thomas Petazzoni via buildroot wrote:
> A basic Fedora 42 container does not have 'awk' installed, but it is
> needed by Buildroot. First by check-host-python3.sh:
> 
> support/dependencies/check-host-python3.sh: line 6: awk: command not found
> support/dependencies/check-host-python3.sh: line 19: awk: command not found
> support/dependencies/check-host-python3.sh: line 19: awk: command not found
> 
> but then even building host-expat assumes awk is available:
> 
> config.status: creating Makefile
> ./config.status: line 1404: awk: command not found
> config.status: creating expat.pc
> ./config.status: line 1404: awk: command not found
> 
> Since it's a pretty basic tool, make it part of the tools checked by
> dependencies.sh. One minor annoyance is that check-host-python3.sh is
> executed *before* dependencies.sh does its thing, so when 'awk' is not
> available, we end up seeing:
> 
> support/dependencies/check-host-python3.sh: line 6: awk: command not found
> support/dependencies/check-host-python3.sh: line 19: awk: command not found
> support/dependencies/check-host-python3.sh: line 19: awk: command not found
> which: no awk in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin)
> You must install 'awk' on your build machine
> make: *** [support/dependencies/dependencies.mk:27: dependencies] Error 1
> 
> It would be nice to have the awk check *before* it gets used in
> check-host-python3.sh, but that's a topic for another patch.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> v1 -> v2: fix documentation syntax, spotted by Baruch
> ---
>   docs/manual/prerequisite.adoc        | 1 +
>   support/dependencies/dependencies.sh | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/manual/prerequisite.adoc b/docs/manual/prerequisite.adoc
> index 5d3aa297a9..1bfcff1a4a 100644
> --- a/docs/manual/prerequisite.adoc
> +++ b/docs/manual/prerequisite.adoc
> @@ -38,6 +38,7 @@ between distributions).
>   ** +file+ (must be in +/usr/bin/file+)
>   ** +bc+
>   ** +findutils+
> +** +awk+
>   
>   * Source fetching tools:
>   ** +wget+
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index fb0defd0c9..2843e3c5d5 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -154,7 +154,7 @@ fi
>   
>   # Check that a few mandatory programs are installed
>   missing_progs="no"
> -for prog in perl tar wget cpio unzip rsync bc cmp find xargs ${DL_TOOLS} ; do
> +for prog in perl tar wget cpio unzip rsync bc cmp find xargs awk ${DL_TOOLS} ; do
>   	if ! which $prog > /dev/null ; then
>   		echo "You must install '$prog' on your build machine";
>   		missing_progs="yes"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
