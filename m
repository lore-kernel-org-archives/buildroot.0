Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EDFC5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 21:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6646C4012B;
	Mon,  9 Jan 2023 21:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6646C4012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dcTblKjnDxuU; Mon,  9 Jan 2023 21:55:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9199E4010C;
	Mon,  9 Jan 2023 21:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9199E4010C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C94C31BF3FF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 21:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A40BF81DFF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 21:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A40BF81DFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IHIKMglKkCnG for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 21:55:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4231F81DFE
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4231F81DFE
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 21:55:32 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-15b9c93848dso1963246fac.1
 for <buildroot@buildroot.org>; Mon, 09 Jan 2023 13:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A9b7YF3EKwuCaUTcpi5u88aCGB3aXOB2hUvrqeZI4sE=;
 b=YpDod+eOnyZGqEWcwG+b7CQxnhyselakQECJfqhPrlXS/+17XZEaFe9jppeSdTeI+S
 ds/Xf1m4AB87pWAEHbnucgLGRk7O25BZH3EFJCcm6hHH+qKXl68dGymfgs8Jf3s1vMFV
 t0YmsOg1SosuSd+9K0H9uveOYiSUIknNBlJdCr2xzWjc//i0/d0EOZ4Q3//6s2lHbsuT
 JFEcVXk1LfJb9vZrnWI47o6rynr8SNd3YsbmVYZAoMf3/ou8q0aQKJEsPZ6mexqeYYrz
 XRLhleyYUjjVI0NQ8e/jhovBnTO17BDpZ77vkXU4ceSnTSbIcKf8nwS8FxFzr54Ei43w
 YkgQ==
X-Gm-Message-State: AFqh2kqJpuNB/w8oTC4IC/I1GZKC2+lpKy7On2KLfgavqXWvIjkc3kng
 /p/Gt0zUmrBscf4JidDYbHKYo9kWcZeSbhCNwJVjdaE2iFDVDLE7
X-Google-Smtp-Source: AMrXdXsTCM5GZv06WZKpALxLig/KDD4NCneTjomC+cFtpR7Sn5jy4CoTPggeomJ4W6zLG4+oNKY07d0m718omoEMjf4=
X-Received: by 2002:a05:6870:8304:b0:144:9744:2be3 with SMTP id
 p4-20020a056870830400b0014497442be3mr3244240oae.93.1673301331095; Mon, 09 Jan
 2023 13:55:31 -0800 (PST)
MIME-Version: 1.0
References: <20230109163017.1260911-1-yann.morin.1998@free.fr>
In-Reply-To: <20230109163017.1260911-1-yann.morin.1998@free.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 9 Jan 2023 14:55:19 -0700
Message-ID: <CADvTj4rWRCKw0igQF4p7fn_ZWV7vTvDdma9i_43aqwVTa7rFCw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A9b7YF3EKwuCaUTcpi5u88aCGB3aXOB2hUvrqeZI4sE=;
 b=LI4b618NULFjH31Jt6uLtbodsDdyodXRvBMnhoHHOkase7RvJQVGd46hEMTy/5sXew
 4jhgBDdyONt/8om3SAsjL9uS1H62rrps9J7pdACxrVUkoefHi9gpSBHFvU9C262bxBWK
 dih4NHzMQROfS3oPKKe9U4VtrbMSjWkyDjWyPs63X4EjWSXSTnjkfaHppDcAj6FJpeo1
 Q25nl9F26LChrO5gagtkI7fY73y1uPKKJt7dBnwLdJG0rQRTgf+LErITDlO0RdWPuO+w
 J/ghiqW496uaQnRktTouESciYoLq47yXeH9C16yrR0Q1FezPm6aOSubIKt1r7prVaUBq
 d9jw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LI4b618N
Subject: Re: [Buildroot] [PATCH] support/download: fix cargo vendoring
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Simon Richter <simon.richter@ptwdosimetry.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jan 9, 2023 at 9:30 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Commit de4cf253752d (package/{rust, rust-bin}: bump to version 1.66.0)
> forgot, despite the big comment above the version strings, to confirm
> that the vendoring was still working.
>
> Previously, we were adding the vendoring equivalence manually, but in
> commit 04154a651729 (support/download/cargo-post-process: cargo output
> for vendor config), we switched to using the output of "vargo vendor"
> (on stdout) to support caxses were the vendoring equivalence would be
> more complex (e.g. when using crates not hosted on crates.io).
>
> With rust until and including 1.65.0, "cargo vendor" would output (for
> crates.io crates) the same output as our manual fixups, except it was
> preceded by an empty line. So, to avoid recompting all our hashes, we
> added a tweak to strip away the leading empty line in 04154a651729.
>
> But rust 1.66.0 includes [0] which changes the output (on stdout) of
> "cargo vendor", where the first empty line is no longer emitted.
>
> This means that our tweak for rust 1.65.0 now strips out an important
> part of the cargo vendor output, which renders the archives invalid, and
> thus generates different archives, which fail to validate against our
> hashes.
>
> Fix this by doing what the comment in the post-process helper states,
> and just keep the whole output of "cargo vendor", byt just removing the
> "tail --lines=+2". Since that comment is no longer meaningful, we drop
> it too.
>
> Now, all our 6 cargo-based packages can be vendored again, without
> changing our hashes, but most importantly, with valid archives.
>
> Still, we keep the comment above the versions strings, in the hope that
> a future bumper will notice and be more careful at validating the
> vendoring.
>
> [0] https://github.com/rust-lang/cargo/pull/11273
>
> Fixes:
>     http://autobuild.buildroot.org/results/bea/beac7674bbc9fd2f8777b5861f65afee9c485753/  (bat)
>     http://autobuild.buildroot.org/results/d1e/d1ec1ebbde115628a4b8b9099544347242a97c1c/  (dust)
>     http://autobuild.buildroot.org/results/f96/f968be895be9ca98b314fdd688ef8d3bdf4e5dfb/  (hyerfine)
>     http://autobuild.buildroot.org/results/a0c/a0cdb6cc9493f5248d98f98b13da854e12adc2be/  (ripgrep)
>     ... and so many others...
>
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
> Cc: Simon Richter <simon.richter@ptwdosimetry.com>
> ---
>  support/download/cargo-post-process | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
>
> diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
> index 186e9eb69b..21a6be8dbe 100755
> --- a/support/download/cargo-post-process
> +++ b/support/download/cargo-post-process
> @@ -25,25 +25,11 @@ post_process_unpack "${base_name}" "${output}"
>  pushd "${base_name}" > /dev/null
>
>  # Create the local .cargo/config with vendor info
> -#
> -# The first line of the output to stdout is empty.
> -# So skip it to have the file start with the vendoring
> -# configuration (`tail --lines=+2`).
> -#
> -# NOTE:
> -#   There is  a patch for cargo to remove the first empty line:
> -#   See: https://github.com/rust-lang/cargo/pull/11273
> -#
> -#   The patch already landed in +nightly and will end up
> -#   in +stable soon.
> -#
> -# ->  When updating rust/cargo, the call to `tail` must be removed.
> -#
>  mkdir -p .cargo/
>  cargo vendor \
>      --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
>      --locked VENDOR \
> -    | tail --lines=+2 | tee .cargo/config
> +    | tee .cargo/config
>
>  popd > /dev/null
>
> --
> 2.25.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
