Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE99C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFC4340CF7;
	Fri, 10 Jul 2026 13:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vA5FN-shH3r1; Fri, 10 Jul 2026 13:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EA0240D13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691580;
	bh=mq3d6OAs/br+glA4PWW2lQMMLex3i++z4Bg6HPb6kUQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iH6SYfMtabELtKNSc4IK+XOQDiRSlY6EVigLHIpDIxcach5UcRI9qSUb54tQGdpmS
	 N/gFbWSRKxRBRjfKfarVkXh9ZNARoMT5CQR2M5shF+PzFsUzElMz5AivsrP7xno8YT
	 DbL4ZvTTS/5fIDmBSTXjIz4bt48x+oz0lmu+nGti0ngqwptm2fVAPWRfhKTbRmEYfI
	 0k5fU9T57aovHN7TW6W1vOJbYa6xdQ6Q4dd5ff7lTZUVryGh33cyJRTgMGx3Suz6Re
	 EGZXyo7ir2VO88sRcvBefrZzb/N7Cqfc4W2c06xYCf1x2n1/Q/To7Z14GdH6DuS9Dd
	 bAzhWp6T1NwVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EA0240D13;
	Fri, 10 Jul 2026 13:53:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F6ADA3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1593E606C6
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFN38PbHEh2K for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6840B606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6840B606B4
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6840B606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:55 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-47122683cf3so585768f8f.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691573; x=1784296373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qZwAm47QG5BWpV//g3pMv+49WRogdB8Eeic5p6eRbrk=;
 b=KtgTsUHF4aTOXBwanvVjhl0OuTlM39U2x/1hNj4wpNa0qaxdlIzNeW/smAVv1ExCix
 oQslMjeFrHayiQZOryoeKlBTshatrX1MMJV8f4v5z2zswoA2FpIRu70WzJ4e3Kz3Qtcb
 I1uLYhjSCTXk3voqokovwdVOnLFkD04b1BhV6bQO2KqKqxwDywiZW8s9PMg9qkJrMJcP
 /PJ+za4VNG3t3L1hC4ctC04Dq0A1kqSPZaTEepEHtSFV+OnFjFerXzpt8xpVE2QHysYy
 v2MZUEkac0v88cZYgGdWTm9ufyIz222/a9ZvzfmUE+/AFiAebQ5sdmh633jhz3yS0QTz
 J1lg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpkCzva4kImeqNpMp7kCZvGPobrHbYEgQpwVLuLWUmE9bA67edtFXuQdvbf1N/Az+ZbH5tvKMJ2vXg=@buildroot.org
X-Gm-Message-State: AOJu0YykS20bn7/v+9HAaF1qp03rhKhvXk8Mvq13yVorGU4bGhrVYFKk
 /TSPw5mZ/vFQuPuI014ydFnXJnpJReYapBJX5kIRjJJgXj998+NSnE6T4ruhit3uCeW+VfSUuDy
 tnPXJ
X-Gm-Gg: AfdE7ckfW66tc5CFo9GDUOECEC30XO1ZZ+2rXUObpmYpEg/rYJlVEBb2cPwb+6DzuH+
 BNm3wSGDM1KNG4YqEyYPj+fah2uSFjj/kys4HTF6EYVTUWdiEroJ+dpI9lP2VUCb5TRaSHHBLE4
 6hGk4bFYLS4Ez9/v1XXJmP7MAdMYT8hPRFoZdZfWL8btsrqQaLoJ0w9U9qHO0M50fSZW/a+C6ye
 36TpcAoydgDv7liX5Y1ZaSpe9sj37JuG0S6cbOKFyJ0wFp+YlBKcsKgBvjpTNvCw6z4VZTAc+kn
 0T3bD/UTu8wipD0khoZ7HDDyLBnduBDU+ogvfGWCjy/k8U6nGaNUSXZD1HschyoEzqPoYMDkYVK
 ZrQ+vGjkWrzckm99vvtr6esQESmOCYLjjTZgzcE1aNkom6vg6jB2ManIhf0IHGEbCLrGrKywKlP
 92kRHh9g==
X-Received: by 2002:a5d:5d0d:0:b0:478:2698:72f4 with SMTP id
 ffacd0b85a97d-47df07761aamr13256800f8f.45.1783691573244; 
 Fri, 10 Jul 2026 06:52:53 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e3e2702sm64998824f8f.9.2026.07.10.06.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:52 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:52 +0200
Message-ID: <20260710135252.761268-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260705115519.1127439-1-bernd@kuhls.net>
References: <20260705115519.1127439-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691573; x=1784296373; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qZwAm47QG5BWpV//g3pMv+49WRogdB8Eeic5p6eRbrk=;
 b=CbVix4DCQzy/bq/gQE9dwOqpwgn18DL+I0/EygjvpgzPp1q5t2Qe/91JRi2NFYRBI3
 cvACNCRJ9/H9Z67k67TZUnDT9u+WnzCcEz5hiLHzyKTEmrLfBGVaMvYegjOeSPfOpRiP
 cQl0n+ZhKITBDaJk9G2Xyxy7AADTS3TXs+o785LkS4uapBTgXKfaJ1TFr/2mlhPjgta4
 MOnFEo0uGT/NdMb8cSvvvUqM/SKA1WmSB5Cn2nIpqi3TaR/LpfKv+3rl6KWfl5vnnhZx
 7NtGfOUD3mLkXc+hetm1I+grqohhBvUVwdrrbcDxQpGvbYd7t3taDPzIcQeO5T7HJZBk
 s8dw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CbVix4DC
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: security bump to version 1.96.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://blog.rust-lang.org/2026/06/30/Rust-1.96.1/
> 
> Fixes CVE-2025-15661, CVE-2026-55199 & CVE-2026-55200.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/pipelines/2652750337 (check-*)
> 
> https://gitlab.com/bkuhls/buildroot/-/pipelines/2652754565 (tests.*)
> with the exception of tests.package.test_rust.TestRust.test_run due to
> Gitlab error "No matching runner available".
> 
>  package/rust-bin/rust-bin.hash | 132 ++++++++++++++++-----------------
>  package/rust-bin/rust-bin.mk   |   2 +-
>  package/rust/rust.hash         |   4 +-
>  package/rust/rust.mk           |   2 +-
>  4 files changed, 70 insertions(+), 70 deletions(-)
> 
> diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
> index a957d756e8..2196ba3a74 100644
> --- a/package/rust-bin/rust-bin.hash
> +++ b/package/rust-bin/rust-bin.hash
> @@ -1,72 +1,72 @@
>  # Generated with utils/update-rust
>  # Do not edit manually
>  
> -# From https://static.rust-lang.org/dist/rust-1.96.0-aarch64-unknown-linux-gnu.tar.xz.sha256
> -sha256  371eadcca97062219cbd8593628eb5d2802bc370515d085fedce1b56b2baed57  rust-1.96.0-aarch64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.96.0-i686-unknown-linux-gnu.tar.xz.sha256
> -sha256  9f1f65f624e4c5e41b45be61d1c7e6cd595b77001f66cb9b830ac0e502d2d301  rust-1.96.0-i686-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.96.0-powerpc-unknown-linux-gnu.tar.xz.sha256
> -sha256  491ad70cce1b874420ed93724871e968a03406433fee971a64bc5d253406f8bd  rust-1.96.0-powerpc-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.96.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
> -sha256  d356154ab4d25693c652e34ce14ddd0ca6d5df5ce9c97bab5077928837ad2c58  rust-1.96.0-powerpc64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.96.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> -sha256  fea8e9155c69740415f1c96fa8879e61b16238e26cfee62d15f4f93aa83cb8d5  rust-1.96.0-powerpc64le-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.96.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
> -sha256  74902bc33de609a6ac89782fa987f0e35b08bf32cc5e838eb7c542a18c7ec554  rust-1.96.0-riscv64gc-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.96.0-s390x-unknown-linux-gnu.tar.xz.sha256
> -sha256  fba86103d04611dcf342d84abc8b5ad31fc80c24fb80ca79a1584c0f52ed1324  rust-1.96.0-s390x-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.96.0-x86_64-unknown-linux-gnu.tar.xz.sha256
> -sha256  c295047583a56238ea06b43f849f4b877fa12bfd4c7103f8d9a74c94c9c4e108  rust-1.96.0-x86_64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-aarch64-unknown-linux-gnu.tar.xz.sha256
> -sha256  538e85452709687797d990579a491ff9b02f8bffba4a5d54cfa945e28868053e  rust-std-1.96.0-aarch64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-aarch64-unknown-linux-musl.tar.xz.sha256
> -sha256  e7d89a29abcc2cf2f31cfe3d898c1713fb12f395e788809d3b01b23fdd5813b4  rust-std-1.96.0-aarch64-unknown-linux-musl.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-arm-unknown-linux-gnueabi.tar.xz.sha256
> -sha256  2e4bca102be6c39e1a0bc3efe2cd5807eb66aa92ad994cc8e9f3a4ce53c8310c  rust-std-1.96.0-arm-unknown-linux-gnueabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
> -sha256  8921e7ce73fdaf42e277def64f87c37e22ed5b8059db63dc77a38f8143792138  rust-std-1.96.0-arm-unknown-linux-gnueabihf.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-arm-unknown-linux-musleabi.tar.xz.sha256
> -sha256  3a09829f19860e3fa85e8324e0349826f2f5243e7febeea15d44a08320f8ba7a  rust-std-1.96.0-arm-unknown-linux-musleabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-arm-unknown-linux-musleabihf.tar.xz.sha256
> -sha256  c69514c229fa42cd05ad145e1338b77c4c941b39585fad14268667cfe6ce8f33  rust-std-1.96.0-arm-unknown-linux-musleabihf.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
> -sha256  680de9708dde0f626e06725b2f2e4c798fff36f51facdc077f725e4736fe26b2  rust-std-1.96.0-armv5te-unknown-linux-gnueabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
> -sha256  258e9e6f41d583036e4b48a03a98eab2054437303ad18bc408ef1dbc7292c9c2  rust-std-1.96.0-armv5te-unknown-linux-musleabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
> -sha256  ee3afa3fc218741abe8d1c02359eabcf3b1ec1b808d2598856d9bbeb139e3e9c  rust-std-1.96.0-armv7-unknown-linux-gnueabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
> -sha256  460140e9be152e2b5a125d45a8cd11d9d956cb0e6cf8bc30c45ac009b4bfc896  rust-std-1.96.0-armv7-unknown-linux-gnueabihf.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-armv7-unknown-linux-musleabi.tar.xz.sha256
> -sha256  45b2fb049f37495eb3669936923b694720534d46f14ac1ad940ffcff5d65d428  rust-std-1.96.0-armv7-unknown-linux-musleabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
> -sha256  18a10d9a1a78d91eca8e378ed87e4d754704ec2f7d5a5bcaa878b629c0e426f8  rust-std-1.96.0-armv7-unknown-linux-musleabihf.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-i586-unknown-linux-gnu.tar.xz.sha256
> -sha256  3f42faca55ac0df4e94aa5ac3c6b86c4a4d5a623cfc084bb41b76674a7705d35  rust-std-1.96.0-i586-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-i586-unknown-linux-musl.tar.xz.sha256
> -sha256  6eea0bd0b88ce657b91ff3a710a7040d042d93194504fba78d1baf9fe0f9a62f  rust-std-1.96.0-i586-unknown-linux-musl.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-i686-unknown-linux-gnu.tar.xz.sha256
> -sha256  2d13b8c801c9ad1ff55dceacaf1d1777601e328bc56cd390c4209a2f61d76ce2  rust-std-1.96.0-i686-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-i686-unknown-linux-musl.tar.xz.sha256
> -sha256  c9b71e301ce9fc34fee2cb373924423472450497942e676ad7ef232ebefafc04  rust-std-1.96.0-i686-unknown-linux-musl.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-powerpc-unknown-linux-gnu.tar.xz.sha256
> -sha256  d434927909a92ec1298bd9ea51a3d251c1d5ef44c7ed334353cb832a7e124a7b  rust-std-1.96.0-powerpc-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
> -sha256  cf273029a7a8dba56fe4fd517ae4c8bd862a3e27c56369a8b9d6411c8d74085d  rust-std-1.96.0-powerpc64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> -sha256  347ff4e5dd463849f21391b9db90093dee33578d98f30b42bbb78b4777921747  rust-std-1.96.0-powerpc64le-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
> -sha256  595e4a980dccb7571441f330782cad6cd23d64f331ed453de57dd386665f5615  rust-std-1.96.0-riscv64gc-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-riscv64gc-unknown-linux-musl.tar.xz.sha256
> -sha256  c65e85287b948cd5f3a2c8a18f51d44a9768829d9ee13d99e81953eee440f500  rust-std-1.96.0-riscv64gc-unknown-linux-musl.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-s390x-unknown-linux-gnu.tar.xz.sha256
> -sha256  92e5a9dcd09892d399963ab0e8de121e0027f2213168f32e13014641c0bfb13b  rust-std-1.96.0-s390x-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-sparc64-unknown-linux-gnu.tar.xz.sha256
> -sha256  687a80cee4631d02b820e7a652bd4e30661772a684fa0ce2f936cdd932f31d51  rust-std-1.96.0-sparc64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-x86_64-unknown-linux-gnu.tar.xz.sha256
> -sha256  c09c7c646248f14f473f5f7a029af15ee57c3a9f9bc93dfa72d9621938586b82  rust-std-1.96.0-x86_64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.96.0-x86_64-unknown-linux-musl.tar.xz.sha256
> -sha256  4db24564076c243b377585bec0b938388638301ea5003d6245c4cbf9d86b11d0  rust-std-1.96.0-x86_64-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.96.1-aarch64-unknown-linux-gnu.tar.xz.sha256
> +sha256  3abcb9489d001d95f30e8cfe68118be85afb0adbf0a9b21438909719689c08fb  rust-1.96.1-aarch64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.96.1-i686-unknown-linux-gnu.tar.xz.sha256
> +sha256  68d2281feea295d94c41f4b1eaa379b7c2484e4a7f8e818e15cea54077db6dd7  rust-1.96.1-i686-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.96.1-powerpc-unknown-linux-gnu.tar.xz.sha256
> +sha256  fb946ba296309d1a12a05fc1ed546aa0bed1c91a1e9db08204dfcd4c78462e57  rust-1.96.1-powerpc-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.96.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
> +sha256  ca11fd1b7a18cae49e07f700c01290bbe94dcb0ce17ec15142a474487fc7764a  rust-1.96.1-powerpc64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.96.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> +sha256  0b67fc803e028110a98387da5b66323afb98a0e4f58a0fb09b05a180083f13d9  rust-1.96.1-powerpc64le-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.96.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
> +sha256  107ebdaac6512820b1fdf55920317687a5ff0255602db23a006a982f90880cf6  rust-1.96.1-riscv64gc-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.96.1-s390x-unknown-linux-gnu.tar.xz.sha256
> +sha256  2696047c1f80a544283bee9f8bfb9cab2cbd2290501c21cf568943e0e3870dab  rust-1.96.1-s390x-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.96.1-x86_64-unknown-linux-gnu.tar.xz.sha256
> +sha256  d29ccb1559a177c4e72291f6e5f629de7fe8885e7521ca47802627544b121e95  rust-1.96.1-x86_64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-aarch64-unknown-linux-gnu.tar.xz.sha256
> +sha256  24bd362ff484421cae8be8c4d326fde143a086782e59e21fc7f353a5d04cd630  rust-std-1.96.1-aarch64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-aarch64-unknown-linux-musl.tar.xz.sha256
> +sha256  47de864655e5c7b0843787828b52d24fa0aedf253cfa7ce9b02e7c812b53bf83  rust-std-1.96.1-aarch64-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-arm-unknown-linux-gnueabi.tar.xz.sha256
> +sha256  7d3ddc5703df16d05e108c21e8c663e2b2b6c0fb9d6bc2e6e8ffd9910e0b3e3f  rust-std-1.96.1-arm-unknown-linux-gnueabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
> +sha256  37dc4e8f833b592470282d3524e49cad5c88df24e0f5652c46a32bc33ab5a4a7  rust-std-1.96.1-arm-unknown-linux-gnueabihf.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-arm-unknown-linux-musleabi.tar.xz.sha256
> +sha256  13d159102bb770b80bde31315e3ecf99234cde718edc941c15b6e42e5e1f621d  rust-std-1.96.1-arm-unknown-linux-musleabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-arm-unknown-linux-musleabihf.tar.xz.sha256
> +sha256  e2aa342bf2f4f61ee41e8c1546585e0f630a0ca8bb26dd8ade51f23e07ee66ea  rust-std-1.96.1-arm-unknown-linux-musleabihf.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
> +sha256  df04af58135fcb014fb2fe5d133afffe1ff2442cb96fb0570c8b78939a1732e9  rust-std-1.96.1-armv5te-unknown-linux-gnueabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
> +sha256  b82c8d3a369da6a7dbf3ad6e6a57d39ef1bb68709044ea86de7562b4681dbb97  rust-std-1.96.1-armv5te-unknown-linux-musleabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
> +sha256  903f359e8b54786333d8ea0b9d35a21e9e1e8c1336737ea3a90c2f63e8a973a7  rust-std-1.96.1-armv7-unknown-linux-gnueabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
> +sha256  9e0a9663eb6a1856c46ff919056570277763d76153a08e042cc9e25a0c9092bf  rust-std-1.96.1-armv7-unknown-linux-gnueabihf.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-armv7-unknown-linux-musleabi.tar.xz.sha256
> +sha256  bbc71f1f726c26154fb64315b6a4a56a82f798f13711375210a93712ba449113  rust-std-1.96.1-armv7-unknown-linux-musleabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
> +sha256  9bb2f220ea42ec12e8934963084e46faa01aacc8cafd54716fcd9d08197c0186  rust-std-1.96.1-armv7-unknown-linux-musleabihf.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-i586-unknown-linux-gnu.tar.xz.sha256
> +sha256  5bd590947da28173b7410064b08dc826c69ac9a517b8763683cfa64f93fdadc1  rust-std-1.96.1-i586-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-i586-unknown-linux-musl.tar.xz.sha256
> +sha256  2b7c6fc7d4868959d69487333c2a2a73e4e7ecff78d7ff9028217e1a4e4c2063  rust-std-1.96.1-i586-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-i686-unknown-linux-gnu.tar.xz.sha256
> +sha256  bc1f062cc2b3db1cb7314360ad5bd77c8b6d1719ce3199384fa8b6c2a28b20e1  rust-std-1.96.1-i686-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-i686-unknown-linux-musl.tar.xz.sha256
> +sha256  648c5c6021add04d498d960412c154eafe85f17cfec30032968140f1881499b0  rust-std-1.96.1-i686-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-powerpc-unknown-linux-gnu.tar.xz.sha256
> +sha256  7e3ba910c711b79a26858bb742b56cff721d0265c60f333b75229be458e1f71a  rust-std-1.96.1-powerpc-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
> +sha256  46a36ac40163a47b12b28e1b0e02fc8b391b7de47119723497f0fa1e39d8719f  rust-std-1.96.1-powerpc64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> +sha256  d102ecb4fefd0e0d9ee1ad7d8e6eaed0d95006c9a752cdecab452f4991868ab5  rust-std-1.96.1-powerpc64le-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
> +sha256  e8a42534bc507e2ea4094f04516462bc2f2e21a2a14d227b728310b3bebad601  rust-std-1.96.1-riscv64gc-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-riscv64gc-unknown-linux-musl.tar.xz.sha256
> +sha256  7be3628e9cc73eec5e6d4ddfad5773d64a5c4707915ba0a045f28eb6cdadee52  rust-std-1.96.1-riscv64gc-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-s390x-unknown-linux-gnu.tar.xz.sha256
> +sha256  00025930698ec4cafaa8ea4da59be13f3f6ff9b18ff2d8b9f8ebc458c3293845  rust-std-1.96.1-s390x-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-sparc64-unknown-linux-gnu.tar.xz.sha256
> +sha256  ffb43d2cd2dd4baf9206a9f7a33941c72e285b0a46c3816ae4e161113c1962a3  rust-std-1.96.1-sparc64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-x86_64-unknown-linux-gnu.tar.xz.sha256
> +sha256  1bf4fde5048cca33e6ea00c7471281ed96d792f6923141e3db45072743a1afae  rust-std-1.96.1-x86_64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.96.1-x86_64-unknown-linux-musl.tar.xz.sha256
> +sha256  94192fe7e10f11e8595f2a29ebda182da0f786797fe908f44fbf80213cd845ac  rust-std-1.96.1-x86_64-unknown-linux-musl.tar.xz
>  # Locally generated
>  sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
>  sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
> diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
> index 8549d293d6..851a507dd3 100644
> --- a/package/rust-bin/rust-bin.mk
> +++ b/package/rust-bin/rust-bin.mk
> @@ -6,7 +6,7 @@
>  
>  # When updating this version, check whether support/download/cargo-post-process
>  # still generates the same archives.
> -RUST_BIN_VERSION = 1.96.0
> +RUST_BIN_VERSION = 1.96.1
>  RUST_BIN_SITE = https://static.rust-lang.org/dist
>  RUST_BIN_LICENSE = Apache-2.0 or MIT
>  RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> diff --git a/package/rust/rust.hash b/package/rust/rust.hash
> index fc505b9337..7c5cd9494f 100644
> --- a/package/rust/rust.hash
> +++ b/package/rust/rust.hash
> @@ -1,8 +1,8 @@
>  # Generated with utils/update-rust
>  # Do not edit manually
>  
> -# From https://static.rust-lang.org/dist/rustc-1.96.0-src.tar.xz.sha256
> -sha256  b99ce16cdf0ecfc761b585ac84d131b46733465a02f8ecd0ff2de9713c62ee09  rustc-1.96.0-src.tar.xz
> +# From https://static.rust-lang.org/dist/rustc-1.96.1-src.tar.xz.sha256
> +sha256  77a6ff3003a4ad0cb00697b043c879e3e1a15d945b1a1f63818903bfc3fa8b98  rustc-1.96.1-src.tar.xz
>  # Locally generated
>  sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
>  sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index c9129c2680..aa23da6ff2 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -6,7 +6,7 @@
>  
>  # When updating this version, check whether support/download/cargo-post-process
>  # still generates the same archives.
> -RUST_VERSION = 1.96.0
> +RUST_VERSION = 1.96.1
>  RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
>  RUST_SITE = https://static.rust-lang.org/dist
>  RUST_LICENSE = Apache-2.0 or MIT
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
