Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16048C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 17:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F3D429B7;
	Fri,  7 Jan 2022 17:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dtCb3Di1wTOR; Fri,  7 Jan 2022 17:14:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BF414299E;
	Fri,  7 Jan 2022 17:14:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B9DEB1BF35F
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A17C74049E
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:13:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LgGRzdx-Be0J for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 17:13:33 +0000 (UTC)
X-Greylist: delayed 20:13:13 by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C90AE40192
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 17:13:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6E58E100010;
 Fri,  7 Jan 2022 17:13:30 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri,  7 Jan 2022 18:13:15 +0100
Message-Id: <20220107171318.1423075-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107171318.1423075-1-thomas.petazzoni@bootlin.com>
References: <20220107171318.1423075-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/7] support/download/cargo-post-process: make
 manifest path configurable
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In most pure Rust packages, the Cargo.toml manifest is at the root
directory, which is why we could call "cargo vendor" without
specifying the path of the manifest.

However, other packages, such as python-cryptography, which have parts
implemented in Rust, have their Cargo.toml located in a specific
subdirectory.

This commit extends the cargo-post-process download script to
understand a BR_CARGO_MANIFEST_PATH environment variable, which allows
a package to pass the location of the Cargo.toml file. If not passed,
"Cargo.toml" is used, preserving the existing behavior for other
packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/cargo-post-process | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index 25dbbedbfa..51d9dd24c1 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -22,7 +22,7 @@ post_process_unpack ${base_name} ${output}
 
 # Do the Cargo vendoring
 pushd ${base_name} > /dev/null
-cargo vendor --locked VENDOR
+cargo vendor --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} --locked VENDOR
 
 # Create the local .cargo/config with vendor info
 mkdir -p .cargo/
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
