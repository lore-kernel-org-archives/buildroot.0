Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769E1CD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 11:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41E7581220;
	Thu,  4 Apr 2024 11:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lxwXBCcT0vV; Thu,  4 Apr 2024 11:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31F51820CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31F51820CC;
	Thu,  4 Apr 2024 11:09:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 128F81BF3C8
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 11:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3D7840B61
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 11:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OIAfRlLK6hlG for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 11:09:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com;
 envelope-from=jarubio2001@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1BBEF400E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BBEF400E7
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BBEF400E7
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 11:09:28 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-61461580403so9331127b3.2
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 04:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712228968; x=1712833768;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LOhE+kKGfiHBIglWwflfyju77UiUA17IDIsMWhuw+7c=;
 b=SfZHB37JMTlyifKuef/T6uWn/oCgaKTWc+szzvpHBrgHUDb2R14Q2c7yh1hJ2+y8YA
 fRxFHoNN3Ioi4RdKxtN9LTcx+9hDMuJ/quIUcXfkrrqImZEe288kTbgaYGtTS0X5rbFR
 WE5TryfcNnqkSijRDE0GZLeFGSIkEaQ/g/25g3lZ+Rw2Y9EOXIf00y4esfs4NZxE6BDA
 8+3c9jr4lVuC+oD/IlNG+ob6ngS4VSwUrI/yhA7meSL969FKACdPjAO/o+/nKp/4nASv
 hzIYQLkuoauheYt/PpB9VIWVu8I+NvM009q4xXNcALD3Fx09XBgSExkjxYVxaab52pY5
 2RMA==
X-Gm-Message-State: AOJu0YzciBcyGc4w9jHF93atDy3rVFOooQoN8BBHi0PYX38+ppVlFVnQ
 5K7Rq9NUmniWNme3q7kZXxk+XHGg156eWRk/gusbhWReMqb4vqoQsgxccW3ogEPyRgtE1N/farX
 Kd4eovyq56y/dKZjSBNO01gYX2Fo3Dxm5RJZUo9VR
X-Google-Smtp-Source: AGHT+IE2bdRfOiNpCyOmG5W0GKd/IEPbLec8mR3PMSSGmy3t4CBF6ilz45BWKigaudYvqy7VkinqBtQYZ9aE1Qkpluc=
X-Received: by 2002:a5b:bce:0:b0:dc6:bd4c:b119 with SMTP id
 c14-20020a5b0bce000000b00dc6bd4cb119mr1984765ybr.55.1712228967564; Thu, 04
 Apr 2024 04:09:27 -0700 (PDT)
MIME-Version: 1.0
From: "Juan A. Rubio" <jarubio2001@gmail.com>
Date: Thu, 4 Apr 2024 13:09:16 +0200
Message-ID: <CAE58QoNe6FQ-1DwAw-XdY62a_9CgbdVik759bMP0dTKD-haxjA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712228968; x=1712833768; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LOhE+kKGfiHBIglWwflfyju77UiUA17IDIsMWhuw+7c=;
 b=bizq6xpRacCHmIuD3kAalT2xmaPNEKZVMT3jQIr8MTpI/TgERkNM0qQ8j1NOuE15R/
 gZHSd5ZTclDbC/mcEccZtjqMIhkmdYDKBQOzfYuCiKbtYtxBwEAiZCMhgbqB7qmwZN4i
 P20byE04x5UYU1yK6BvyLrWqUoHr3aUjYrBgR7YWcOD/+Dhz7FF1y1esMBuzET7Wyule
 voG4NwghDH4KHF7qEO6nXcI/QzZ8TKcaCTEj4V4pQxmCvrgunwesjvquljEdm8SNY07N
 7bQ9xYG3EfipnFf1/m8z+PgCxLPeVibe8R772SGEug83q0W2JUZh0jwnrUhsQNygjaXF
 K9zQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bizq6xpR
Subject: [Buildroot] Problem with flutter packages
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I've been meaning to try the recently added Flutter packages but my
builds fail with both master and 2024.02.x branches.

My defconfig fails to build the image when the following flutter
packages are included.

BR2_PACKAGE_FLUTTER_PI=y
BR2_PACKAGE_FLUTTER_PI_RAW_KEYBOARD_PLUGIN=y
BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN=y
BR2_PACKAGE_FLUTTER_PACKAGES=y
BR2_PACKAGE_FLUTTER_MARKDOWN_EXAMPLE=y
BR2_PACKAGE_FLUTTER_ENGINE=y

Without the FLUTTER packages above, my builds are successful.

'host-systemd' is what breaks the builds when the flutter packages are included:

s -Wl,-z,now -Wl,-z,relro -Wl,--warn-common -Wl,--gc-sections
-Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro -Wl,--warn-common
-Wl,--gc-sections -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro
-Wl,--warn-common -Wl,--gc-sections -Wl,--fatal-warnings -Wl,-z,now
-Wl,-z,relro -Wl,--warn-common -Wl,--gc-sections
/usr/bin/ld: src/shared/libsystemd-shared-254.a.p/creds-util.c.o: in
function `sha256_hash_host_and_tpm2_key.constprop.0':
creds-util.c:(.text.sha256_hash_host_and_tpm2_key.constprop.0+0x11c):
undefined reference to `EVP_MD_size'
/usr/bin/ld: src/shared/libsystemd-shared-254.a.p/creds-util.c.o: in
function `encrypt_credential_and_warn':
creds-util.c:(.text.encrypt_credential_and_warn+0x4fc): undefined
reference to `EVP_CIPHER_key_length'
/usr/bin/ld: creds-util.c:(.text.encrypt_credential_and_warn+0x50d):
undefined reference to `EVP_CIPHER_block_size'
/usr/bin/ld: creds-util.c:(.text.encrypt_credential_and_warn+0x52a):
undefined reference to `EVP_CIPHER_iv_length'
/usr/bin/ld: src/shared/libsystemd-shared-254.a.p/creds-util.c.o: in
function `decrypt_credential_and_warn':
creds-util.c:(.text.decrypt_credential_and_warn+0x6b0): undefined
reference to `EVP_CIPHER_key_length'
/usr/bin/ld: creds-util.c:(.text.decrypt_credential_and_warn+0x7d5):
undefined reference to `EVP_CIPHER_block_size'
/usr/bin/ld: src/shared/libsystemd-shared-254.a.p/openssl-util.c.o: in
function `rsa_pkey_to_suitable_key_size':
openssl-util.c:(.text.rsa_pkey_to_suitable_key_size+0x23): undefined
reference to `EVP_PKEY_base_id'
/usr/bin/ld: openssl-util.c:(.text.rsa_pkey_to_suitable_key_size+0x54):
undefined reference to `EVP_PKEY_bits'
/usr/bin/ld: src/shared/libsystemd-shared-254.a.p/openssl-util.c.o: in
function `pubkey_fingerprint':
openssl-util.c:(.text.pubkey_fingerprint+0x249): undefined reference
to `EVP_MD_type'
/usr/bin/ld: openssl-util.c:(.text.pubkey_fingerprint+0x33c):
undefined reference to `EVP_MD_size'
/usr/bin/ld: openssl-util.c:(.text.pubkey_fingerprint+0x3e4):
undefined reference to `EVP_MD_type'
/usr/bin/ld: src/shared/libsystemd-shared-254.a.p/openssl-util.c.o: in
function `string_hashsum':
openssl-util.c:(.text.string_hashsum+0x32): undefined reference to `EVP_MD_size'
collect2: error: ld returned 1 exit status
[553/825] Compiling C object src/journal/libjournal-core.a.p/journald-kmsg.c.o
[554/825] Compiling C object src/journal/libjournal-core.a.p/journald-stream.c.o
[555/825] Compiling C object src/journal/libjournal-core.a.p/journald-server.c.o
[556/825] Compiling C object
src/journal/libjournal-core.a.p/journald-rate-limit.c.o
[557/825] Compiling C object src/journal/libjournal-core.a.p/journald-syslog.c.o
ninja: build stopped: subcommand failed.
make[1]: *** [package/pkg-generic.mk:283:
/home/vagrant/work/starfish/bsp-output/build/host-systemd-254.9/.stamp_built]
Error 1

Any ideas on how to proceed?

Thanks in advance,
Juan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
