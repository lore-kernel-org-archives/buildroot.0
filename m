Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC108CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 21:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF29960DF9;
	Fri,  2 Oct 2026 21:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAfG83q_Qq0x; Fri,  2 Oct 2026 21:39:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D576360DEB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790977143;
	b=fWEnu7Y0Rml3y2HoKM4McvPLD42zBt+8nl+nvFwn7mKJR1eu83RU1Isk9xrnxneYJ4r0
	 S0+P2KzGun+dGpSC3SqRpATH4hrzurqrxGaEZvZTUq+jXbdSWQfNw+gReK0wWUEpa04Ky
	 6SmgWB48SWcubQcOirn1CZkY1aNUT7u9OBKvKoWf+NW1dUYp+yzJBWrpBqoKYq+g7rnni
	 naH36ZqbRwutOcQIUUfl7lGVJXkm7oJGwxS2ugcCk7xYOuB0ul2eUNXYClyNVhAVQHmXX
	 VvkeuU3jiFVvugTfdAAQqA7lxXIDkKkOkxr3x0r8/lraP6Yeq1AkocGy0snOnGqR6cw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790977143;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AeWponiC9jAj3dfKEH5RNKFTgTPUiG/mHyGofXOAXN4=;
	b=OeZ17MDGNAFig5Z7uS2GsStiofQVXE12mxFx3hTjSsF7eJ1V2T5Qde+WrKg+LOi0jeKu
	 7H2K064xLSuS4ybUQ4c3j1UZL9+gsEo2rWSfiLd4mNDkk32FyJ130u5GeUnZfDFEraDkj
	 dv53nlgOqOJbkRYwNArFsYRrDfrCoffhX1h5wrHmuqC2FIgnRqbpxgsDFmrxS4Kc+sD4W
	 vXuvHvUdZHn9V88jkVJL7YA0TlLCCzB4mZiB338JIW7e6B5s8oyc3GwU9d2qXAkdDwPl2
	 Mnife/d7rL9f8VddeZWPafxfCoHsSrPqaSwQCWUB9mi9Av+JZFgGaIXvtYqicucou7A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790977142;
	bh=AeWponiC9jAj3dfKEH5RNKFTgTPUiG/mHyGofXOAXN4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qNFks0otwGoPxQAmMKBNp5LKjQIKA5L9hUQrsBV/LX03/b8IdVZMvM80WFGt1kTh/
	 qCELZILt9/ZZ3T9zxq6nGj/uXWQao1aYFGxttPVH8cKMIXjexPYWgKyqAsYcxkjLEH
	 OID6UKwd7PZsrVIIoInTYLEvrKRfFsqSVyCMbEpp6bolJ3KLrOlv+3ygVzCEBcwvG6
	 itPKLG4oEvhEOtuV8/ownuAypu6+6hMv9i18SIYOs9g8iiQOOV6Any4ytgG/JNEHP3
	 0fdml1i2vvw5R5Rs5oUN9Wz48VMFvzFObgpN5X96DNMZC4n0LgZwNuabLP8Bal2gBF
	 EqiwyU3SFrPxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D576360DEB;
	Fri,  2 Oct 2026 21:39:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BB5334E
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2268A81412
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIBFQpxNGUwy for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 21:38:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1D30D81420
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790977139;
 b=Grbmk7KcyckInBxYme3R8SzgsgZR6J73zBrqonqKSxFsfbtHJR2TMq3UYmxuVBgGNjUI
 6ljN6/jixv8vsRqnZJGeTfLVQZXgTHJyGRp/TahAD4VeVOIC64c/MD/TT6HqFh39uW9fM
 WcfnKnk827SeCXnSdpLBF2YhLGJpZO5NoVeTJxq3L4beXOuZXo2HxHRLSAW+EFDd6D6mu
 k2R/AFCBLngWwLdCD6xGup8o92h2HAC4iE31urzjH377eIycN7X4hfjYeZycEAsbyq3pH
 FZwrzl+5bpo9oHjlaEo5ei4SSXige0X3u3Dnzvd2TPUdh2ry2HaOZRa1jBm64lyHJ4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790977139;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LX26Qw6BuU9uxmSyPqumHKFnfnXO7Y68eQ/l1Bbuafs=;
 b=hBcKg7O5kMB5ecmz4pdMScxbdulqgnde0FwDFpViTxafqMN6bcEFiF+X6FFflQWX0Lqx
 J7jNtJZZV4Xoc0dmH4xvoAEejzPd32Q1g73KHcKNNoLVrtEr5L6w2UnxROMAWHGbnCvRN
 kVhsMKXubFwsZJlHXIgW7R4PLG3XprYcsZM76FmwQu7dt8B3OtWStrTLE6aG8IRSZxHFt
 qMC1wkDE4sSDF0mIQjs47LiDBcUzgjDcOMGR2hgwLPJJRF+61f/SZgDaFGlkKIDO9W6bS
 SD1vNKtUHiUClxmpyomco1oKfDC2QBoF1B8gB/+D7NPuu1kWgUoMx946oRTOFmoY91Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D30D81420
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:38:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAD60886C4; Fri,  2 Oct 2026 21:37:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 23:07:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbb77fc03fcd505a02459a3833f0a8d2af4440d0
X-Git-Newrev: 97e7c6d82fadd52e88ea9db8f19f714a627cd942
X-Patchwork-Hint: ignore
Message-Id: <20261002213744.AAD60886C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ca-certificates: Replace c_rehash
 with openssl rehash
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/97e7c6d82fadd52e88ea9db8f19f714a627cd942
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The upcoming bump of libopenssl to 4.0.2 removes the c_rehash script:

https://openssl-library.org/post/2026-04-14-openssl-40-final-release/
https://github.com/openssl/openssl/blob/openssl-4.0.2/CHANGES.md#openssl-40

"* Removed `c_rehash` script tool.  Use `openssl rehash` instead."

Note that c_rehash was already described as obsolete in the release
notes for OpenSSL 3.0.2 and 3.0.3.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Martin Bark <martin@barkynet.com>
[Fiona: add note about how long c_rehash has been considered obsolete]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/ca-certificates/ca-certificates.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index f5675b754d..0f88df3eec 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -36,7 +36,7 @@ define CA_CERTIFICATES_GEN_BUNDLE
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(TARGET_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
@@ -65,7 +65,7 @@ define HOST_CA_CERTIFICATES_INSTALL_CMDS
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(HOST_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(HOST_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
