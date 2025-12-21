Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3BBE67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 11:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CECFB81D16;
	Sun, 21 Dec 2025 11:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSIYUq38qz8D; Sun, 21 Dec 2025 11:54:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 228D08144E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766318093;
	bh=W9B+7g9LGV0lyJTTeItnLVbnny/E7tY5l5GdAA1/sz8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jnIOZQV63hG4GVaFc5tjEcuSgGiLMjzJEbT6OuKU5RsRBYs9uLvK8upwvdT2nhImv
	 mnVl47K+eYYtzFIutaoGox9dKT65lBbQa96j3KTe4/fbDiXLKbe1Kp1Ra4mr+JYh/G
	 WsbR8Q5kIiAB3pjrb0kQ+xiyVNCtbWWDQEXmBtK9aJ9MtLuckrS8yh+mEKS2OqKA8T
	 /Bq5WxMlXqn0hi0wiSD8K5m6lD1lwDHVmi3KBRb3qo/kH/cfLKtwjVxJ02QnH9+dFZ
	 KzusqpNGntWjWySKXpVhghZeC56yNH0/BSZfCrcx5MKa8FIplF3kUR/yFf4KkBAwko
	 6twmMpt8qm81w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 228D08144E;
	Sun, 21 Dec 2025 11:54:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 839D3195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 11:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75F5C8144E
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 11:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_Varfgnmqrw for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 11:54:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD88B813AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD88B813AD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD88B813AD
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 11:54:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8C9E313F861;
 Sun, 21 Dec 2025 12:54:15 +0100 (CET)
Received: from 2a0d:e487:412e:ace1:8cb:5573:7181:a54f
 via 2a0d:e487:412e:ace1:8cb:5573:7181:a54f by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Dec 2025 12:54:15 +0100
MIME-Version: 1.0
Date: Sun, 21 Dec 2025 12:54:15 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret
 <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>, Graeme Smecher
 <gsmecher@threespeedlogic.com>, Torben Voltmer <mail@t-voltmer.net>, James
 Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Alexander Shirokov <shirokovalexs@gmail.com>, Saeed Kazemi
 <kazemi.ms@gmail.com>, Alex Michel <alex.michel@wiedemann-group.com>, Leo
 Yu-Chi Liang <ycliang@andestech.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20251218222527.3861751-1-bernd@kuhls.net>
References: <20251218222527.3861751-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <425d6ac7a2e18addf28096a29a611d1a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766318087;
 bh=vCi5nOey15U36T40jSvG9C9Q5MAZTuzZWU5hsbGYdUQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZLV6qSzuRup09sFnpnD73LgmTNt6uaVor6nEM4PzKqmmN0BtPyfIoBfdUbeF7mfFg
 6e6iLcWUPVjDG6JKpsQrDJG/rlpAAl56Zr6xs7PbqzCZwsFyQe5RVzbRqj30sUv34x
 JYX2xhrCa5VRv0HOjALdw15i110u4zbBTGoSlpMO/GAV6PzbcMDvEqkAwcf+mch/Ky
 MerhYUVanA9jjT3aNSyau2oWjJ1kSt8LEmsPC/pzqPKrVSHDalqvLy6o+U0u5SnWPc
 8UaPGv1NiJD3LVS4rhh1hYQZ83ZzcT8C+F668nNAL4z7cp24EcbUuZ6PJ6ybaQRBHb
 OI8GU7GLSMuTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZLV6qSzu
Subject: Re: [Buildroot] [PATCH v3 1/3] package/rust: bump version to 1.92.0
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

Hi Bernd,

Thanks for the updated patch.

On 18/12/2025 23:25, Bernd Kuhls wrote:
> https://blog.rust-lang.org/2025/12/11/Rust-1.92.0/
> https://blog.rust-lang.org/2025/11/10/Rust-1.91.1/
> https://blog.rust-lang.org/2025/10/30/Rust-1.91.0/
> https://blog.rust-lang.org/2025/09/18/Rust-1.90.0/
> https://blog.rust-lang.org/2025/08/07/Rust-1.89.0/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v3: no changes
> v2: no changes
[...]
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 9999475c35..f9889e3931 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -6,7 +6,7 @@
> 
>  # When updating this version, check whether 
> support/download/cargo-post-process
>  # still generates the same archives.
> -RUST_VERSION = 1.88.0
> +RUST_VERSION = 1.92.0

With this new version, I was able to compile all rust/cargo
packages using host-rust-bin. However, when trying to bootstrap
host-rust from source it fails with the error:

error[E0463]: can't find crate for `std`
error[E0463]: can't find crate for `core`

You can reproduce the issue with the test:

utils/docker-run support/testing/run-tests \
     -k -d dl -o output_folder tests.package.test_rust

Or with the commands:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_HOST_RUST=y
BR2_PACKAGE_RIPGREP=y
EOF
make olddefconfig
make ripgrep

Could you have a look please?

>  RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
>  RUST_SITE = https://static.rust-lang.org/dist
>  RUST_LICENSE = Apache-2.0 or MIT
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
