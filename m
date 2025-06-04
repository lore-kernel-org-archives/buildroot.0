Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF2FC5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 19:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D8FE83A65;
	Wed,  4 Jun 2025 19:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PoKBCQtS7_8j; Wed,  4 Jun 2025 19:24:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 300B583A5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 300B583A5F;
	Wed,  4 Jun 2025 19:24:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA1861A4
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 19:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9828583A5F
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 19:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgRrIsVqVSkf for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 19:24:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6CA483A56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6CA483A56
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6CA483A56
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 19:24:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 04F781C00EF; Wed,  4 Jun 2025 21:24:28 +0200 (CEST)
Message-ID: <1172970c-ef6d-4463-b330-bc4bbba9b152@rnout.be>
Date: Wed, 4 Jun 2025 21:24:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gilles Bardoux <gilles.bardoux@sagemcom.com>, buildroot@buildroot.org
References: <20250602110006.3257934-1-gilles.bardoux@sagemcom.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250602110006.3257934-1-gilles.bardoux@sagemcom.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749065070; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Hv6jXHMq65jYbURdI5vlmFyZarkqaOIrTShcx2RMuKg=;
 b=Zdz1XvMmhUS95jAh3n8iwsPlSEEu2V4sE3hQzZPKOFwLZ0gRrAlXEXf9bVdefMw3hOxiCd
 crGOgX0HGITRzZHE+9/SyJ23euvJNrzZ4RcBaSsNqhSIpc70por+rtuV3LtKV76aOQTr5A
 LULW2U98ginXydZpO4YhEPumoUXJO+PVmdU8qmyrhJyFTE1m/2IN2TZIAIkerY0Fd1Hpuk
 WckXO6iAK538+KnkHEAO6otOeI26cfqSroMD+my8IZkW0BPLGg22bNK7hXl9oTluIixmUG
 R+qlx3oUgtuaaqCu4YTm6kbaAhvTmGY2RJnYNWxKSaSIqq1ODNavM9cqTukoQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Zdz1XvMm
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: strip even non-writable files
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

  Hi Gilles,

On 02/06/2025 13:00, Gilles Bardoux via buildroot wrote:
> Currently, files without write permission are not stripped.

  Good idea to fix that!

> Since calling a find exec script for all the elf files would be
> slower than doing it only for the files without write permission,

  With -exec yes, but if you use the original -print0 | xargs -0 then the helper 
script just gets called once (or a few times) with many arguments. In the script 
you can do

for file; do ...; done

which is almost as efficient as find -exec.

  It _is_ indeed a bit more efficient to call the bare strip with many arguments 
rather than re-starting it all the time, but I doubt that you can measure a 
significant difference. It's a small executable with few shared libs so 
launching it is not so expensive.

> the STRIP_FIND_CMD has been split into two finds:
>   - one for the files with write permission for the current user,
>     without an exec script
>   - one for the files witout write permission for the current user
>     calling the exec script
> The find exec script (non-writable-file-cmd-wrapper) has been made
> as generic as possible. It does a chmod u+w before the command (here
> a strip) and restores the original file permissions afterwards.
> The find command for special files (libpthread and ld-*.so) was not
> split, because it concerns only a few files. So the find exec script
> is called in all cases for these files.

  This is starting to sound super complicated...

  I think it would be better to move all the logic to distinguish between the 
cases where it needs to be made writable and the cases where it needs to use the 
special debug strip into the helper script.

  In fact, even the find command itself could move in there - though that is 
less of a factor I think, because you'd need to export quite a few variables to 
that script.


> Signed-off-by: Gilles Bardoux <gilles.bardoux@sagemcom.com>
> ---
>   Makefile                                      | 20 ++++++++--
>   support/scripts/non-writable-file-cmd-wrapper | 37 +++++++++++++++++++
>   2 files changed, 53 insertions(+), 4 deletions(-)
>   create mode 100755 support/scripts/non-writable-file-cmd-wrapper
> 
> diff --git a/Makefile b/Makefile
> index f90b834ed2..cf2b517938 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -637,17 +637,28 @@ STRIP_FIND_COMMON_CMD = \
>   #   applications and libraries. Normally kernel modules are already excluded
>   #   by the executable permission check, so the explicit exclusion is only
>   #   done for kernel modules with incorrect permissions.
> -STRIP_FIND_CMD = \
> +STRIP_FIND_WRITABLE_CMD = \
>   	$(STRIP_FIND_COMMON_CMD) \
>   	-type f \( -perm /111 -o -name '*.so*' \) \
>   	-not \( $(call findfileclauses,libpthread*.so* ld-*.so* *.ko) \) \
> +	-writable \
>   	-print0
>   
> +# Stripping for non writables files
> +STRIP_FIND_NOT_WRITABLE_CMD = \
> +	WRAPPED_CMD="$(STRIPCMD)" \
> +	$(STRIP_FIND_COMMON_CMD) \
> +	-type f \( -perm /111 -o -name '*.so*' \) \
> +	-not \( $(call findfileclauses,libpthread*.so* ld-*.so* *.ko) \) \
> +	-not -writable \
> +	-exec $(TOPDIR)/support/scripts/non-writable-file-cmd-wrapper {} \;
> +
>   # Special stripping (only debugging symbols) for libpthread and ld-*.so.
>   STRIP_FIND_SPECIAL_LIBS_CMD = \
> +	WRAPPED_CMD="$(STRIPCMD) $(STRIP_STRIP_DEBUG)" \
>   	$(STRIP_FIND_COMMON_CMD) \
>   	\( -name 'ld-*.so*' -o -name 'libpthread*.so*' \) \
> -	-print0
> +	-exec $(TOPDIR)/support/scripts/non-writable-file-cmd-wrapper {} \;
>   
>   # Generate locale data.
>   ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
> @@ -756,8 +767,9 @@ endif
>   ifneq ($(BR2_ENABLE_DEBUG):$(BR2_STRIP_strip),y:)
>   	rm -rf $(TARGET_DIR)/lib/debug $(TARGET_DIR)/usr/lib/debug
>   endif
> -	$(STRIP_FIND_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
> -	$(STRIP_FIND_SPECIAL_LIBS_CMD) | xargs -0 -r $(STRIPCMD) $(STRIP_STRIP_DEBUG) 2>/dev/null || true
> +	$(STRIP_FIND_WRITABLE_CMD) | xargs -0 $(STRIPCMD) 2>/dev/null || true
> +	$(STRIP_FIND_NOT_WRITABLE_CMD) 2>/dev/null || true
> +	$(STRIP_FIND_SPECIAL_LIBS_CMD) 2>/dev/null || true

  So here we would have:

         find $(TARGET_DIR) \
         $(if $(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)), \
                 \( $(call finddirclauses,$(TARGET_DIR),$(call 
qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) \
                 -prune -o \
         ) \
         $(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
                 -not \( $(call findfileclauses,$(call 
qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) ) \
	-type f \( -perm /111 -o -name '*.so*' \) \
	-print0 \
	| STRIPCMD="$(STRIPCMD)" STRIP_STRIP_DEBUG="$(STRIP_STRIP_DEBUG)" \
	xargs -0 support/scripts/strip-helper


  Note that the different STRIP_FIND variables can all be removed.
  Note that no || true is needed because the strip-helper doesn't return errors.

>   
>   	test -f $(TARGET_DIR)/etc/ld.so.conf && \
>   		{ echo "ERROR: we shouldn't have a /etc/ld.so.conf file"; exit 1; } || true
> diff --git a/support/scripts/non-writable-file-cmd-wrapper b/support/scripts/non-writable-file-cmd-wrapper
> new file mode 100755
> index 0000000000..efbbeb6e7c
> --- /dev/null
> +++ b/support/scripts/non-writable-file-cmd-wrapper
> @@ -0,0 +1,37 @@
> +#!/usr/bin/env bash
> +
> +usage() {
> +  cat <<EOF >&2
> +Usage:  ${0} FILE
> +
> +Description:
> +
> +    This script runs WRAPPED_CMD with the file given in argument, adding the write permission temporarily during this action.
> +
> +Arguments:
> +
> +    FILE         file path to give to the command
> +
> +Environment:
> +
> +    WRAPPED_CMD  core command to run in between the chmods
> +
> +Returns:         0
> +
> +EOF
> +}

  This usage() function isn't called. In the support scripts we typically put 
the usage in comments because they're anyway only supposed to be called from the 
Makefile.

> +
> +helper() {

  We typically call it main().


> +    local file="${1}"
> +
> +    # make files writable if necessary
> +    changed="$(chmod -c u+w "${file}")"
> +
> +    # action on the file
> +    ${WRAPPED_CMD} "${file}"
> +
> +    # restore the original permission
> +    test "${changed}" != "" && chmod u-w "${file}"

  I think we normally use test -z "${changed}" to test for empty string.

  Regards,
  Arnout

> +}
> +helper "${@}"
> +exit 0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
