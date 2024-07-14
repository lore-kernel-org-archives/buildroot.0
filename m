Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E683CC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 09:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F30858050C;
	Sun, 14 Jul 2024 09:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjOVpLwfTQ1y; Sun, 14 Jul 2024 09:12:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D6CF80F60
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D6CF80F60;
	Sun, 14 Jul 2024 09:12:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77CC91BF23C
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 646984069E
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akMtMgkoyVnM for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 09:11:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF12E40665
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF12E40665
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF12E40665
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:11:57 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-36798ea618bso1985353f8f.0
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 02:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720948316; x=1721553116;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UxWka8A2f/vEqkxQL+FZFzcbywnoGaIip/vBEoLIXg0=;
 b=ClyNXL1h9+rqaHknImCvA55YBP29+m6va4wqnzuuXiJy2Gc0aRCV3U6UhZN4lGgBxl
 Ez5OlFGqJzUFvA8arxVsJULxXfE+F+zwqjSuSAbHXG1I++ee8rlIJcpN1BZdijpmLWOI
 mQRoQig11oOVpm055zKtAY/6Smz6rZvtixLgFuZN2z5k3hKXl/Djp8UzzzT1oA7ch85k
 m+7rRokbLKSTKZwDK7meCjXJPviC11dataH3ScC8th3ahFv4QBS6EnWT9NcgjNN9smi0
 7PhfRcDWBD/LSHWbAgbeDxCPIVo/JAE7xekMEtY5YL3t80+D4oPBT/0v/oaEeND7S81f
 ojnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfkHBa3UltfzbhOSRvQw5pfbwbJb6A2Zy0MIM3D+AyEifT+xo46X/4UEkcj/V7xZu84CbMWkHIvH+Raz15FWgVadZXWRgZAQ==
X-Gm-Message-State: AOJu0Yxpw1VeHngNXgVQNrN0XyzH8608xOFcn68uYowZVLHWeuUsX8Lk
 2vx24P9ypuAVfGV7e6QChquQ85tB0zcwHsW3LkElXGYl2SOvjTzipb7V10yKmHk=
X-Google-Smtp-Source: AGHT+IGAMIiiI0YtHjM9lqZutc27gvxCo6Nx3ybQ3oP8YHoPv6IWPBWYxcV54Z9R1RQsi/n1iEyVvQ==
X-Received: by 2002:adf:f288:0:b0:367:9851:4f22 with SMTP id
 ffacd0b85a97d-367ceadb1bamr10435355f8f.58.1720948315513; 
 Sun, 14 Jul 2024 02:11:55 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db047c4sm3361420f8f.108.2024.07.14.02.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 02:11:55 -0700 (PDT)
Message-ID: <17f2b2dd-4e77-490a-b4b0-9e8cd55cfaf6@mind.be>
Date: Sun, 14 Jul 2024 11:11:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1717779951.git.yann.morin.1998@free.fr>
 <077431bc77b4c376129ceeb628367591bcd5e8ec.1717779951.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <077431bc77b4c376129ceeb628367591bcd5e8ec.1717779951.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720948316; x=1721553116; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UxWka8A2f/vEqkxQL+FZFzcbywnoGaIip/vBEoLIXg0=;
 b=NaesqML3qjNsTnu88cyiJ8k9FG7Xio1oNqMNxGsMYarm6c1VCXuzxrY1rKivegZaw/
 iHN7uRtZYHH36nf88yhCJjmmQa/FG+6CvSMK5fdkIMPDgJnZDZp+IN23Qk2IHSlEhZLT
 zYpgj/FBiEsxTRZGtOBXBk+T2DX0i292DzfFIAuoff174e/cOjRSFlZInJL26xstR1Lr
 xoSIl2y6HhtkqWfaN0lJuIH/PG+wqn69waQmkZtAWwiNgzwZJrdlywozilLmq/YquLNA
 NPI4G6RN2LwO8tHO7XDml1vD4DOIoGGx3R82JYw6Xcs23cx8clJHz38TMe0nuNcnsTme
 6zTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NaesqML3
Subject: Re: [Buildroot] [PATCH 19/20 v2] package/pkg-cargo: allow unlocked
 packages to provide local Cargo.lock
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Yann,

On 07/06/2024 19:06, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>   docs/manual/adding-packages-cargo.adoc | 27 ++++++++++++++++----------
>   package/pkg-cargo.mk                   | 14 +++++++++++++
>   support/download/cargo-post-process    | 21 +++++++++++++++++++-
>   3 files changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-cargo.adoc b/docs/manual/adding-packages-cargo.adoc
> index 0ed529a770..e252c347ee 100644
> --- a/docs/manual/adding-packages-cargo.adoc
> +++ b/docs/manual/adding-packages-cargo.adoc
> @@ -82,9 +82,23 @@ typical packages will therefore only use a few of them.
>     environment of +cargo+ invocations. It used at both build and
>     installation time
>   
> -* +FOO_CARGO_LOCKED+ can be set to +YES+ (the default) or +NO+, to
> -  specify whether the source tree has been cargo-locked or not. See
> -  below for xref:cargo-vendoring[more details].
> +* +FOO_CARGO_LOCKED+ to specify how the source tree has been
> +  xref:cargo-vendoring[cargo-locked] by its upstream:
> ++
> +** +YES+ (the default if unset): the package has been cargo-locked; it
> +   is an error to set +FOO_CARGO_LOCKED=YES+ (or leave it unset) for an
> +   unlocked package;
> +** +NO+: the package has not been cargo-locked, and no locking should
> +   be attempted by Buildroot; it is an error to set +FOO_CARGO_LOCKED=NO+
> +   for a cargo-locked package;
> +** +buildroot+: the package has not been cargo-locked, but a `Cargo.lock`
> +   is provided in the Buildroot package (next to the +.mk+ file); in that
> +   situation, +FOO_CARGO_LOCK_VERSION+ must be set to a value that changes
> +   everytime the +Cargo.lock+ in Buildroot is updated (e.g. by setting

  Ah crap I forgot about that, indeed we need this variable...

> +   +FOO_CARGO_LOCK_VERSION=1+ the first time, and incrementing it for
> +   every change in +Cargo.lock+; reset it to +1+ when the package version
> +   itself, +FOO_VERSION+, is updated); it is an error to set

  Strictly speaking we don't need those constraints, but it's good to document 
it like that.

> +   +FOO_CARGO_LOCKED=buildroot+ for a cargo-locked package.
>   
>   * +FOO_CARGO_BUILD_OPTS+ can be used to pass additional options to
>     +cargo+ at build time.
> @@ -110,10 +124,3 @@ that archive. If a package was however not locked, then the versions for
>   the dependencies are unknown, the dependency chain is not reproducible,
>   and the archive is then not reproducible, which implies there can be no
>   hash for that archive.
> -
> -Packages are normally locked, so Buildroot will by default instruct
> -cargo to atttempt a locked vendoring; for a package that was not locked,
> -this would fail; in that case, +FOO_CARGO_LOCKED+ must be set to +NO+ so
> -Buildroot does not request cargo to attempt a locked vendoring. It is an
> -error to set +FOO_CARGO_LOCKED+ to +NO+ for a locked package, as it is
> -to set it to +YES+ (or not set it at all) on an unlocked package.
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index 90e4facf52..034402c20e 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -203,8 +203,22 @@ ifndef $(2)_CARGO_LOCKED
>    endif
>   endif
>   
> +ifndef $(2)_CARGO_LOCK_VERSION
> + ifdef $(3)_CARGO_LOCK_VERSION
> +  $(2)_CARGO_LOCK_VERSION = $$($(3)_CARGO_LOCK_VERSION)
> + else
> +  $(2)_CARGO_LOCK_VERSION = YES

  I think the default should be empty, and it is an error to provide Cargo.lock 
without a version.

> + endif
> +endif
> +
>   ifeq ($$($(2)_CARGO_LOCKED),NO)
>   $(2)_DOWNLOAD_POST_PROCESS_OPTS += -u
> +else ifeq ($$($(2)_CARGO_LOCKED),buildroot)
> +ifeq ($$($(2)_CARGO_LOCK_VERSION),)
> +$$(error $(1) uses a Cargo.lock bundled with Buildroot, but does not define $(2)_CARGO_LOCK_VERSION)
> +endif
> +$(2)_EXTRA_FMT_VERSION = -lock$$($(2)_CARGO_LOCK_VERSION)
> +$(2)_DOWNLOAD_POST_PROCESS_OPTS += -L $$(abspath $$($(2)_PKGDIR)/Cargo.lock)

  So, instead of all these additional variables, I would simply check if there's 
a Cargo.lock in PKGDIR. If there is, that one gets used instead of the upstream one.

>   endif
>   
>   # Because we append vendored info, we can't rely on the values being empty
> diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
> index 90155a2fad..3431d04a72 100755
> --- a/support/download/cargo-post-process
> +++ b/support/download/cargo-post-process
> @@ -12,12 +12,14 @@ fi
>   
>   manifest=Cargo.toml
>   locked=true
> -while getopts "n:o:m:u" OPT; do
> +cargo_lock=
> +while getopts "n:o:m:uL:" OPT; do
>       case "${OPT}" in
>       o)  output="${OPTARG}";;
>       n)  base_name="${OPTARG}";;
>       m)  manifest="${OPTARG}";;
>       u)  locked=false;;
> +    L)  cargo_lock="${OPTARG}";;
>       :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
>       \?) error "unknown option '%s'\n" "${OPTARG}";;
>       esac
> @@ -49,6 +51,23 @@ while [ "${lock_dir}" != "." ]; do
>       lock_dir="$(dirname "${lock_dir}")"
>   done
>   
> +if [ "${cargo_lock}" ]; then
> +    if [ -e "${lock_dir}/Cargo.lock" ]; then
> +        printf 'Cannot override %s/Cargo.lock with custom %s\n' "${lock_dir}" "${cargo_lock}"

  Why not? There can be situations where this is exactly what we want to do - 
e.g. there's a security issue in one of the dependencies, upstream hasn't 
updated yet, and we want to carry the update.

> +        exit 1
> +    fi >&2
> +    # When the package had no Cargo.lock, we need to
> +    # copy ours next to the top-most manifest.
> +    dir="${manifest}"
> +    while [ "${dir}" != "." ]; do
> +        dir="$(dirname "${dir}")"
> +        if [ -e "${dir}/Cargo.lock" ]; then
> +            lock_dir="${dir}"
> +        fi
> +    done

  Since we just checked that there's no Cargo.lock at all, doesn't that mean we 
end up putting the lock file in .?

  I think we should just put it next to the manifest. What happens if there's a 
lock file next to the manifest, and also another (inconsistent) lock file 
somewhere higher up?

  Regards,
  Arnout

> +    cp "${cargo_lock}" "${lock_dir}/Cargo.lock"
> +fi
> +
>   if [ -e "${lock_dir}/Cargo.lock" ] && ! ${locked}; then
>       printf 'Unlocked vendoring was requested, but source tree has %s/Cargo.lock\n' "${lock_dir}"
>       exit 1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
