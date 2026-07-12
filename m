Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14104C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 09:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B06C7606BB;
	Sun, 12 Jul 2026 09:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qs54dkX4r0Zi; Sun, 12 Jul 2026 09:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45B446067A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783849969;
	bh=fnEsaFXbQI1FkzYaKNUcW4b8BvJ4xqJ4X98POE1o/08=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=MGu33EbMfYfojqlEF/nF4NkhywsqSVQc/1tMgaEKft5anS0azhv9tKszm3MDmH0iu
	 fNFJuamFhhc4HG3InPg48NoGwmhuMAP/NLfsUfL6qHwvJtcncvhqlrgDzZ0Xs0aqLa
	 0ZhiNXDHZDg2+eIOETP6q3gn1jJv36R8kX5l9AqGQewYuqzKIaeA7eDDHGOzc2uF8a
	 Eo1HjchGIfNwhV1OJ1mw0Apx7Lxe2i1Jc1cLQPyOJ3JY3NOvSbWMZmZuWPUVTkG/am
	 eUukfWCDRL6MvDnx2Yu5CHYq51jDe4xhcxDGpLrH7v2fGXjiGEk+WDqPbFsE7Dq0vX
	 UgCDRrhbVVTow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45B446067A;
	Sun, 12 Jul 2026 09:52:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D4252EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 09:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32ED940AFF
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 09:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FO0oWUu50LMY for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 09:52:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38F8440B01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38F8440B01
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38F8440B01
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 09:52:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d51.dip0.t-ipconnect.de [91.58.13.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 84EDCA4C2F17;
 Sun, 12 Jul 2026 11:52:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56338)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wiqrX-000000008KQ-3BxW;
 Sun, 12 Jul 2026 09:52:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Jul 2026 11:52:39 +0200
Message-ID: <20260712095239.1525717-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783849961;
 bh=573B+WdwoGIw0byQv/PtAlAZ+3dJEaLOz18e8O8eb6E=;
 h=From:To:Cc:Subject:Date:From;
 b=an+VNiz0K1ewpbTFOxgpWr1QvCg8zBK/S7VK+gp03CtJPYzGrHDeG1Flr/ksX5i8U
 AKulslFy7YatNZymkupaPuCR7GfmY0rp8IjcQS7GvituVziB245i35iSE+esl5GqSW
 aGgXmmWYWxuLrfOkbV/OzzxQEGWooFcEToXyaJ7395bSH4Wyl90PhF9GsO8GK5zrRU
 CRf4an4lX7pNRYq408C0K0f8NT86BOZDQYK9cld4PzeNM6HDqe7I8xvKlQ3AeskPFT
 c00msfotSx/pWABkBzcnUZmioD11u9v/g6A8D2WLB+o6OqzBpiLOZ18xHqlyJv/JhL
 OiCqeT5ScYQQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=an+VNiz0
Subject: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump version to 1.97.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret <david.pierret@smile.fr>,
 Danilo Bargen <mail@dbrgn.ch>, Graeme Smecher <gsmecher@threespeedlogic.com>,
 Torben Voltmer <mail@t-voltmer.net>,
 James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>,
 Alexander Shirokov <shirokovalexs@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Christopher Obbard <obbardc@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://blog.rust-lang.org/2026/07/09/Rust-1.97.0/

Rust received a change in Cargo's vendoring logic which produces
different vendor directory contents:

  Add $comment to .cargo-checksum.json to clarify this file is not
  a security mechanism.
  https://github.com/rust-lang/cargo/pull/16967

Therefore the hashes of all Cargo-fetched packages need to be
updated. This commit changes the suffix of Cargo packages from
-cargo5 to -cargo6, and updates all hashes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2670513410 (check-*)

https://gitlab.com/bkuhls/buildroot/-/pipelines/2670513495 (tests.*)
with the exception of tests.package.test_rust.TestRust.test_run due to
Gitlab error "No matching runner available".

 package/aardvark-dns/aardvark-dns.hash        |   2 +-
 package/aichat/aichat.hash                    |   2 +-
 package/bat/bat.hash                          |   2 +-
 package/broot/broot.hash                      |   2 +-
 package/dtui/dtui.hash                        |   2 +-
 package/dust/dust.hash                        |   2 +-
 package/espflash/espflash.hash                |   2 +-
 package/eza/eza.hash                          |   2 +-
 package/fd/fd.hash                            |   2 +-
 package/hyperfine/hyperfine.hash              |   2 +-
 package/kibi/kibi.hash                        |   2 +-
 package/kmon/kmon.hash                        |   2 +-
 package/libzenoh-c/libzenoh-c.hash            |   2 +-
 package/netavark/netavark.hash                |   2 +-
 package/nushell/nushell.hash                  |   2 +-
 package/parsec-tool/parsec-tool.hash          |   2 +-
 package/parsec/parsec.hash                    |   2 +-
 package/pkg-download.mk                       |   2 +-
 package/procs/procs.hash                      |   2 +-
 package/python-bcrypt/python-bcrypt.hash      |   2 +-
 .../python-cryptography.hash                  |   2 +-
 package/python-logbook/python-logbook.hash    |   2 +-
 package/python-maturin/python-maturin.hash    |   2 +-
 package/python-orjson/python-orjson.hash      |   2 +-
 .../python-pydantic-core.hash                 |   2 +-
 package/python-rpds-py/python-rpds-py.hash    |   2 +-
 package/python-rtoml/python-rtoml.hash        |   2 +-
 package/python-selenium/python-selenium.hash  |   2 +-
 package/ripgrep/ripgrep.hash                  |   2 +-
 package/rust-bin/rust-bin.hash                | 132 +++++++++---------
 package/rust-bin/rust-bin.mk                  |   2 +-
 package/rust-bindgen/rust-bindgen.hash        |   2 +-
 package/rust/rust.hash                        |   4 +-
 package/rust/rust.mk                          |   2 +-
 package/sentry-cli/sentry-cli.hash            |   2 +-
 package/tbtools/tbtools.hash                  |   2 +-
 package/tealdeer/tealdeer.hash                |   2 +-
 package/uefisettings/uefisettings.hash        |   2 +-
 package/zellij/zellij.hash                    |   2 +-
 package/zoxide/zoxide.hash                    |   2 +-
 40 files changed, 106 insertions(+), 106 deletions(-)

diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
index d0a42c2ca5..c01a46c02c 100644
--- a/package/aardvark-dns/aardvark-dns.hash
+++ b/package/aardvark-dns/aardvark-dns.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9742d4a31d2136028221f386cf21f377cbad129626a70813f2bedad1162174ad  aardvark-dns-v1.17.1-git4-cargo5.tar.gz
+sha256  4b22fb6586f84805b9170d5514b2070f3a090a88c0669a831c7e2a86dd150f17  aardvark-dns-v1.17.1-git4-cargo6.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/aichat/aichat.hash b/package/aichat/aichat.hash
index 09291a070f..f5e8486137 100644
--- a/package/aichat/aichat.hash
+++ b/package/aichat/aichat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  1e8643532ec5ad25aa227c36dd5fd3dee31afd1d2dc51acf25a68d12c3fd3980  aichat-0.30.0-cargo5.tar.gz
+sha256  7a6e5071ea05543d0022fa98d1a96625bfb6c1b094768d9cf0123057376129d1  aichat-0.30.0-cargo6.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  5af431a6a9869052e2be4e71ccd731c7efe45dca47eaca84d4d1fb38f134cb79  LICENSE-MIT
diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index 16dfd2c5ab..b6a6d43a76 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  688fe9a308dc6024f8d9516b33f6f8e293087023c0a75628ad36c8e04e36a824  bat-0.26.1-cargo5.tar.gz
+sha256  e090445aa321355571302ca78fc6c7d9a5ddbfa5fa876be06df8721302f92501  bat-0.26.1-cargo6.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index 629ce4bc66..d1f3dbbe6a 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  95f264433a7a6dee9ecbf95e62c7d62adc012149592314ebe4fb75d60fcef992  broot-1.57.0-cargo5.tar.gz
+sha256  26afe075d62fd64f608f07b867c568fa9ac9b9bce44b02ad573dfebd13d4cd1e  broot-1.57.0-cargo6.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/dtui/dtui.hash b/package/dtui/dtui.hash
index a1189ba0d1..e45f979934 100644
--- a/package/dtui/dtui.hash
+++ b/package/dtui/dtui.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  59d430ad546c7a0af3a1fce08aaf05dc17e9b295ba56dbfbd64ddb67e3525ba2  dtui-3.0.0-cargo5.tar.gz
+sha256  57bcf3a8b6681be2695762da17c20d2efb7c121131138868ba7a4485fa08c335  dtui-3.0.0-cargo6.tar.gz
 sha256  b7b3cd0d92fc6638f0a7bd2306d715c747d040c6d851ed821a45c5538663e57a  LICENSE
diff --git a/package/dust/dust.hash b/package/dust/dust.hash
index edb865fc0a..af963611f5 100644
--- a/package/dust/dust.hash
+++ b/package/dust/dust.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2ce1847c74a9ee1512c8ceca68c648b8dee1f7996cd5750ffbbd79a932edd129  dust-1.2.3-cargo5.tar.gz
+sha256  b0b3a217f6b90882777944ad4e7bd1f38daaf37ec2b66549503b201aba89d4b1  dust-1.2.3-cargo6.tar.gz
 sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
diff --git a/package/espflash/espflash.hash b/package/espflash/espflash.hash
index 317c84e56e..bcd24a0167 100644
--- a/package/espflash/espflash.hash
+++ b/package/espflash/espflash.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  3d750c05de3a44acaca67219a70360fc1d0e79776027fcc3a2298a7d2edb108f  espflash-4.0.1-cargo5.tar.gz
+sha256  10f2ed2db01359cbc7316cb694731a6a307a639d5698e14506b6b52483d36163  espflash-4.0.1-cargo6.tar.gz
 sha256  811f4d4d7ae8f88090dcd14cddf1982ca75cc30b5604e6ebb636693d9b885788  LICENSE-APACHE
 sha256  8daec6f7e829af4dfc7c99a251986648f718b90589aa819bc48be8ef82b0c12f  LICENSE-MIT
diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index a8e670527a..d303e129a0 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  921ea63ca5281c496a1a370f703de3f68e6147d22da21789c4bf44d222195148  eza-0.23.3-cargo5.tar.gz
+sha256  5df44637acd270bbd7dce76ab989db946ea79d969bfdd382400da39dc2b3e98d  eza-0.23.3-cargo6.tar.gz
 sha256  57fb42fbcd0b037ce528ed8f72f1ec095d67bc6825ecf1448ff39be1fe68a4b4  LICENSE.txt
diff --git a/package/fd/fd.hash b/package/fd/fd.hash
index 0dde7218ed..0134cf5d21 100644
--- a/package/fd/fd.hash
+++ b/package/fd/fd.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  adc1e51c35259f6ee393ae28df84faa02c5c320b4c391eabda6391d555f40bbf  fd-10.3.0-cargo5.tar.gz
+sha256  58af97d85e7ddb1601c172f15565521e7fb5ca2ed559774e4ce1443068d3e1c7  fd-10.3.0-cargo6.tar.gz
 sha256  73c83c60d817e7df1943cb3f0af81e4939a8352c9a96c2fd00451b1116fa635c  LICENSE-APACHE
 sha256  322cfc7aa0c774d0eca3b2610f1d414de3ddbd7d8dd4b9dea941a13a6eb07455  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index 13420dc0d0..0bd5a1b873 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  c119d7d85ea9d3141cc894ae9d0530e83f3456e220fb23c7642e7c8f73bc978b  hyperfine-1.20.0-cargo5.tar.gz
+sha256  10ef59c1ae8c368f3663cecff219f872ada90dd6bdd52d07e544bf9bdf777093  hyperfine-1.20.0-cargo6.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/kibi/kibi.hash b/package/kibi/kibi.hash
index b206b7742e..d56571e4d5 100644
--- a/package/kibi/kibi.hash
+++ b/package/kibi/kibi.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  1fb9203d4d45efd7e0645f5a1dbeb14604dc7817d9db35c6f2bd650053877e59  kibi-0.3.3-cargo5.tar.gz
+sha256  b1edddd4daf0a38d79673bb42f386f91a68fe7b2212defde5e531cbc93dc1bac  kibi-0.3.3-cargo6.tar.gz
 sha256  53cdcb17642e801f813712b4844293b037c23d4b482004b77c15ae2f36f551c3  LICENSE-MIT
 sha256  8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  LICENSE-APACHE
diff --git a/package/kmon/kmon.hash b/package/kmon/kmon.hash
index 1877e9ab31..cfd7824f75 100644
--- a/package/kmon/kmon.hash
+++ b/package/kmon/kmon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cd2ce6dec4d47b5ab1c4656be32d8eca71944731471b82a4e365d1312d70e578  kmon-1.7.1-cargo5.tar.gz
+sha256  e44c6d6b69dd606b1097183886f6d29680346738a1778d500becde6b94c313dc  kmon-1.7.1-cargo6.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index ed9013c3b8..d623a27d83 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c0c1c0b97a36ec189f70562927326fb68ae4e49c368003cb3194dbff5d94fda3  libzenoh-c-1.2.1-cargo5.tar.gz
+sha256  a741fbe80cb5f159b830100e145f2fbf02a8084f8cdd0658640dd282cd39635e  libzenoh-c-1.2.1-cargo6.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
index b53311c574..f86728e834 100644
--- a/package/netavark/netavark.hash
+++ b/package/netavark/netavark.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3bfc0d3bb40965ecd4908f9a03a4fcf59228bacfaf6a7b73736b5019181e8499  netavark-v1.17.1-git4-cargo5.tar.gz
+sha256  599fb6d2bb920025ebfef83856afa5bb9be5929806516e7b233ff36107a99b00  netavark-v1.17.1-git4-cargo6.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
index d70882e2ec..9f93792917 100644
--- a/package/nushell/nushell.hash
+++ b/package/nushell/nushell.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  a26769088250b7af721db9c27c3c8982923b6f0a0ef1cb1eb507669de472c0b7  nushell-0.108.0-cargo5.tar.gz
+sha256  7a0cfb4bee97a34c7d1883eaa72b07b25f24d4ccd96795704d235a9c6854c695  nushell-0.108.0-cargo6.tar.gz
 sha256  ff5dcaaba6140ec57cafdd4f707cd0d329e727477cf7d5b9ba7a244ec2678b79  LICENSE
diff --git a/package/parsec-tool/parsec-tool.hash b/package/parsec-tool/parsec-tool.hash
index 8ce1e1e123..fd98c9ecf2 100644
--- a/package/parsec-tool/parsec-tool.hash
+++ b/package/parsec-tool/parsec-tool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0ad62590274ba72bd1e02e5df234c33f7a24ee77f8d3316887e12d04b01469ea  parsec-tool-0.7.0-cargo5.tar.gz
+sha256  f63b9b677410ef25fc466830c437961b579086b5f9928c6000e0c3a97f5ba775  parsec-tool-0.7.0-cargo6.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/parsec/parsec.hash b/package/parsec/parsec.hash
index 66ef007c8c..e2a7b99fdf 100644
--- a/package/parsec/parsec.hash
+++ b/package/parsec/parsec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4c5f760f1f9c1c28ed93341c0e1416e8a229180eca4df32dd9f743d0f035531b  parsec-1.4.1-cargo5.tar.gz
+sha256  5ec0ea98d2270b17c3615931f6adb20bcd975614cd92ced9eb3513c55bc1f6e5  parsec-1.4.1-cargo6.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ce63ce9658..b38f0c7053 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -12,7 +12,7 @@
 BR_FMT_VERSION_git = -git4
 BR_FMT_VERSION_svn = -svn5
 BR_FMT_VERSION_go = -go2
-BR_FMT_VERSION_cargo = -cargo5
+BR_FMT_VERSION_cargo = -cargo6
 
 DL_WRAPPER = support/download/dl-wrapper
 
diff --git a/package/procs/procs.hash b/package/procs/procs.hash
index 516bc7e950..b44825409d 100644
--- a/package/procs/procs.hash
+++ b/package/procs/procs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  31337ff0a89d13b26d94971ae12b2ee92cf1a188491711e700d0bf03ecf7ba6a  procs-0.14.10-cargo5.tar.gz
+sha256  b90a367469c48eea133a3f44fa8969fd95c17d2542f703416a5b6378240acb53  procs-0.14.10-cargo6.tar.gz
 sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index 272bdbcf66..5e3ffb8a7f 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  c423e043342548dbe409b15e6cded27dba3a70376f36f6d91e1ed01d01ae116a  python-bcrypt-5.0.0-cargo5.tar.gz
+sha256  b8a767a0f37ecdacff1df6772aec8bd6d458a77a1a5b9ad6657c6c5d9657a9b0  python-bcrypt-5.0.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 4498dfd45d..02d199ac3b 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  99bb9d438282237d394309a95f1effa4f91ca1f64f7ad0a0cff0f35e294d07b4  python-cryptography-48.0.0-cargo5.tar.gz
+sha256  f4d6d4b4671ebaf2c86f2fa5ec4beac9056f30129fea17338c35c87eb25daf1b  python-cryptography-48.0.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index c630a82a42..ee812562ea 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  c4abf52044e756f64ed2beba8e7a10e0bf941de9946eb7a82b71abf90f109bc0  python-logbook-1.9.2-cargo5.tar.gz
+sha256  07d53ef8b7cb1f267862f72df81857c9d6665104535cc5309774de7966164c46  python-logbook-1.9.2-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index f255ba8261..117a2b9463 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  b7e5d7303140b6b67a11a40c11b61127d61b6d02d6e727f0a133e73bd78963c5  python-maturin-1.11.2-cargo5.tar.gz
+sha256  703e4542966258bc728916f99fc78e38b670a538339cbf7f0e1b3bc9f9ab166f  python-maturin-1.11.2-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 3f2cd0ad4c..f4443fcc9b 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  da89615d51a086912e7f6444027c14f1edd943aa0910ed498c6f3febdcfae271  python-orjson-3.11.5-cargo5.tar.gz
+sha256  cd415890f20e7f29055b5057d3ff5af7c673ffc3d7e659ec68e9377f13604065  python-orjson-3.11.5-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 53f354358c..92e97f6755 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  26c3aeb21c7cc215b360611ef01fec1072ce49e2ea710b1cf340848cb944f9fe  python-pydantic-core-2.46.3-cargo5.tar.gz
+sha256  a79f876fbf65e2568c30c9b8a5be0a2817bd314c2aa483b4aaeb80ba8443cc4d  python-pydantic-core-2.46.3-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index 4ce45941b8..32593a1f7c 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  5a1adf51bde76b4865ead196427d5d3ad74eb677186f0eed6b22a89578084822  python-rpds-py-0.30.0-cargo5.tar.gz
+sha256  9a3d3078a2fc34efd16e22b73c61f6a25ae61e26d5b3dc84d656cc0b716de4b1  python-rpds-py-0.30.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rtoml/python-rtoml.hash b/package/python-rtoml/python-rtoml.hash
index 506d3b93ac..9f40e2abdf 100644
--- a/package/python-rtoml/python-rtoml.hash
+++ b/package/python-rtoml/python-rtoml.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  8a489442beeb69a9a8bf24d7ccb6cee81afd287e0e45237c9d43aa16517500d1  python-rtoml-0.10.0-cargo5.tar.gz
+sha256  9c9cd121f893bf7e8360519df29088e97d5455cc437d9400d10757ac84846d17  python-rtoml-0.10.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  cd5ffde80e6d3286a2e2e5f02fb2cb07b823931ca368e7c735a6c5f5aebe7103  LICENSE
diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index 3b22e5c5a1..f2048092e3 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  6a614eb2cc8fff809f9cb10dae089eebad3af996dda49f9787bfed071fb5ac0c  python-selenium-4.39.0-cargo5.tar.gz
+sha256  fc578e57f98032ab4d89193bfdfed5dac965362d08aa436b8b713e182ea43f4c  python-selenium-4.39.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  1ee8454a0696ac46b0d5b67f85b2a0e3af2b7726e1b82cd182af60fd285bcba3  LICENSE
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 6ab8264605..287d350d6b 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  755b1ea52374d7a067a70ded10be04ddfc083d9333c6bb4f2c1e9a2493cd98c1  ripgrep-14.1.1-cargo5.tar.gz
+sha256  c3427fa1f0909263da4a43d73a9cf1a4fa3f37d09c938cc40cd923239f57770d  ripgrep-14.1.1-cargo6.tar.gz
 sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 2196ba3a74..dc8a824916 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,72 +1,72 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rust-1.96.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  3abcb9489d001d95f30e8cfe68118be85afb0adbf0a9b21438909719689c08fb  rust-1.96.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.96.1-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  68d2281feea295d94c41f4b1eaa379b7c2484e4a7f8e818e15cea54077db6dd7  rust-1.96.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.96.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  fb946ba296309d1a12a05fc1ed546aa0bed1c91a1e9db08204dfcd4c78462e57  rust-1.96.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.96.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  ca11fd1b7a18cae49e07f700c01290bbe94dcb0ce17ec15142a474487fc7764a  rust-1.96.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.96.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  0b67fc803e028110a98387da5b66323afb98a0e4f58a0fb09b05a180083f13d9  rust-1.96.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.96.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  107ebdaac6512820b1fdf55920317687a5ff0255602db23a006a982f90880cf6  rust-1.96.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.96.1-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  2696047c1f80a544283bee9f8bfb9cab2cbd2290501c21cf568943e0e3870dab  rust-1.96.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.96.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  d29ccb1559a177c4e72291f6e5f629de7fe8885e7521ca47802627544b121e95  rust-1.96.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  24bd362ff484421cae8be8c4d326fde143a086782e59e21fc7f353a5d04cd630  rust-std-1.96.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-aarch64-unknown-linux-musl.tar.xz.sha256
-sha256  47de864655e5c7b0843787828b52d24fa0aedf253cfa7ce9b02e7c812b53bf83  rust-std-1.96.1-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256  7d3ddc5703df16d05e108c21e8c663e2b2b6c0fb9d6bc2e6e8ffd9910e0b3e3f  rust-std-1.96.1-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  37dc4e8f833b592470282d3524e49cad5c88df24e0f5652c46a32bc33ab5a4a7  rust-std-1.96.1-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-arm-unknown-linux-musleabi.tar.xz.sha256
-sha256  13d159102bb770b80bde31315e3ecf99234cde718edc941c15b6e42e5e1f621d  rust-std-1.96.1-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-arm-unknown-linux-musleabihf.tar.xz.sha256
-sha256  e2aa342bf2f4f61ee41e8c1546585e0f630a0ca8bb26dd8ade51f23e07ee66ea  rust-std-1.96.1-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-sha256  df04af58135fcb014fb2fe5d133afffe1ff2442cb96fb0570c8b78939a1732e9  rust-std-1.96.1-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
-sha256  b82c8d3a369da6a7dbf3ad6e6a57d39ef1bb68709044ea86de7562b4681dbb97  rust-std-1.96.1-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
-sha256  903f359e8b54786333d8ea0b9d35a21e9e1e8c1336737ea3a90c2f63e8a973a7  rust-std-1.96.1-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  9e0a9663eb6a1856c46ff919056570277763d76153a08e042cc9e25a0c9092bf  rust-std-1.96.1-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-armv7-unknown-linux-musleabi.tar.xz.sha256
-sha256  bbc71f1f726c26154fb64315b6a4a56a82f798f13711375210a93712ba449113  rust-std-1.96.1-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
-sha256  9bb2f220ea42ec12e8934963084e46faa01aacc8cafd54716fcd9d08197c0186  rust-std-1.96.1-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-i586-unknown-linux-gnu.tar.xz.sha256
-sha256  5bd590947da28173b7410064b08dc826c69ac9a517b8763683cfa64f93fdadc1  rust-std-1.96.1-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-i586-unknown-linux-musl.tar.xz.sha256
-sha256  2b7c6fc7d4868959d69487333c2a2a73e4e7ecff78d7ff9028217e1a4e4c2063  rust-std-1.96.1-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  bc1f062cc2b3db1cb7314360ad5bd77c8b6d1719ce3199384fa8b6c2a28b20e1  rust-std-1.96.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-i686-unknown-linux-musl.tar.xz.sha256
-sha256  648c5c6021add04d498d960412c154eafe85f17cfec30032968140f1881499b0  rust-std-1.96.1-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  7e3ba910c711b79a26858bb742b56cff721d0265c60f333b75229be458e1f71a  rust-std-1.96.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  46a36ac40163a47b12b28e1b0e02fc8b391b7de47119723497f0fa1e39d8719f  rust-std-1.96.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  d102ecb4fefd0e0d9ee1ad7d8e6eaed0d95006c9a752cdecab452f4991868ab5  rust-std-1.96.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  e8a42534bc507e2ea4094f04516462bc2f2e21a2a14d227b728310b3bebad601  rust-std-1.96.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-riscv64gc-unknown-linux-musl.tar.xz.sha256
-sha256  7be3628e9cc73eec5e6d4ddfad5773d64a5c4707915ba0a045f28eb6cdadee52  rust-std-1.96.1-riscv64gc-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  00025930698ec4cafaa8ea4da59be13f3f6ff9b18ff2d8b9f8ebc458c3293845  rust-std-1.96.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-sparc64-unknown-linux-gnu.tar.xz.sha256
-sha256  ffb43d2cd2dd4baf9206a9f7a33941c72e285b0a46c3816ae4e161113c1962a3  rust-std-1.96.1-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  1bf4fde5048cca33e6ea00c7471281ed96d792f6923141e3db45072743a1afae  rust-std-1.96.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.96.1-x86_64-unknown-linux-musl.tar.xz.sha256
-sha256  94192fe7e10f11e8595f2a29ebda182da0f786797fe908f44fbf80213cd845ac  rust-std-1.96.1-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.97.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  4c88fe30a748a8853c19f4e8876a64b32005bc4cbcde48e93732d06a430e808a  rust-1.97.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.97.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  350e11f486d12e53849e267106a372d7f4e2da9e8996d05fc0a198b60260c723  rust-1.97.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.97.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  f5b3a24a8286e25dc89dd5fc2b7ddaa475fca213fafe914ca986a8254c091bb0  rust-1.97.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.97.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  ca3b47cd902b78920bc104cf77629c689031858843b71982bb7575a1e727ac53  rust-1.97.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.97.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  875963c3080f6c4ae005e8451d418e50f384452bded8cf22d80dc7a862f9d51f  rust-1.97.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.97.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  cad4079134783f9f429446733bdd0b3ea461a4445c633139cd7d5b57a4f5815e  rust-1.97.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.97.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  0ad9d9139f21daac91f0291e7b4bb0b764fc9b54e825a250167fdec39a4f4c35  rust-1.97.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.97.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  1cf17e4905b841d4c8e3f76467ac148d55fb3f54bf213c86f0d287a36471d904  rust-1.97.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  b6a90dab26527f17e7e395e24b2d79976e30432c41feb073fe920d3b26b709a0  rust-std-1.97.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  91b55028112e6a978386de46013820d921330f0a182d11900f117e9f0f4ef338  rust-std-1.97.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  beed3d3aee1d3e6ff33cd80f354ac16c7e910a48701f6698e8e1e6491865ebf6  rust-std-1.97.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  45cb88efb2c437b99a0cd8d984f4c8b74fec71fded4085c707d2104120a2d6ef  rust-std-1.97.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  625646781404fe867b072b3ff85b40afa5416597ce36751d61a9e08b31f12a11  rust-std-1.97.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  1a574e984ff99494c97c3c09ceec3f626648b5dd0a26a24d55b8ccd59f011e7d  rust-std-1.97.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  62a3080de4099cf82df182fd1a68cd2ea565a62b5c9318a77c6fbff513e71005  rust-std-1.97.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  eb74ec8d7ab2a5a945eb5fb880d4f97b1a9b2ba4d26249c548c31e0f0cc194fd  rust-std-1.97.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  ac88e7a716aefdeffab8b6a60d6209a966f7912ff842600b8db4aed1e54173fa  rust-std-1.97.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  b756f6494060af5be0aa6ef63cd6fe3136945a4bf56526ea266ac5558558f7c1  rust-std-1.97.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  3621d41c793a6c9ae7af618f3487bf437b649b82d51e7a27dca9d54fd0ab2a38  rust-std-1.97.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  c72fa99cb47e375005721965f52cdae0aec39469b47fc7b371f61062abdcccaf  rust-std-1.97.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  06ace8aed18f342fe401321ca388e56f53074f2a314173c6e52a010fcb924e10  rust-std-1.97.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-i586-unknown-linux-musl.tar.xz.sha256
+sha256  438a6ecca6d070f7477cd1be1ff30d3bda4f0aee710c6e7959db44ea597f7391  rust-std-1.97.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  d2f3b3dea7d37e39b2d4d765d95d9a41d8dc189c78fe93aadce6bb2b7a790e5b  rust-std-1.97.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-i686-unknown-linux-musl.tar.xz.sha256
+sha256  14db5d9d53d2d489583b9cabe0d03a8c360c70c72c8a69ff55d7f8df632d92db  rust-std-1.97.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  8639b66e2645296c60bd5984b96dbd11397bdede0866008bc70e77926395c827  rust-std-1.97.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  8d405b238bd4a0c5449853c7ec2aca6d7b7b3a3c72a4990a6b38672814d53ee5  rust-std-1.97.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  5243a1a6cd056a6ff573cdf2e025add2b5a0e302a8aaa078448c9015cd76ca38  rust-std-1.97.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  3f85d376cf088d69dd5c507cf10b4180d7e2cd9a23a175c6e8514302a08e94a2  rust-std-1.97.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-riscv64gc-unknown-linux-musl.tar.xz.sha256
+sha256  255b4b4b4cd4757081e945d1d5e1adc1040285f791af21a9b0614a573464e8e1  rust-std-1.97.0-riscv64gc-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  2e90dfd2ddda36357dbc29c77e82d5dba27c4bb03eff7a345574ea9d59f69339  rust-std-1.97.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  8a1832cda997f3937b10d44e76aed3f47cc10b3ac91425d02c9c102c35e98b09  rust-std-1.97.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  0c43618128a7a6b96b0b04c04cf7b28dd52fb0991a74c9615fbd1a684ff88712  rust-std-1.97.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.0-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  9744b43bed4a89db05e83dc8054d3e92e23ddb70a6c08c54ccde9a58d7b28627  rust-std-1.97.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 851a507dd3..cdcf731561 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.96.1
+RUST_BIN_VERSION = 1.97.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index 09f4b91f96..fecafcd4fd 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c4dc8c1a1414f139cf0625e538d861fe59802c86e615afef144165f236cdb9dc  rust-bindgen-0.72.1-cargo5.tar.gz
+sha256  8e5a0999c2f4f6ab1cdee508e913e2ffef5225fb313816a0151742cd2103576c  rust-bindgen-0.72.1-cargo6.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 7c5cd9494f..67fb0863f2 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.96.1-src.tar.xz.sha256
-sha256  77a6ff3003a4ad0cb00697b043c879e3e1a15d945b1a1f63818903bfc3fa8b98  rustc-1.96.1-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.97.0-src.tar.xz.sha256
+sha256  de002ee301c1b7422b0a7b09d7c4cb4924cd3224e6cfb24f065dad786dd3ed12  rustc-1.97.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index aa23da6ff2..08758884c6 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.96.1
+RUST_VERSION = 1.97.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
index de5982dfcb..0b1ef402e1 100644
--- a/package/sentry-cli/sentry-cli.hash
+++ b/package/sentry-cli/sentry-cli.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  1f03892772a944ff9fbe208ff92e15ec2a966337f1739a5162f3af7dc252b574  sentry-cli-2.20.3-cargo5.tar.gz
+sha256  19d62065788c0b72d54875e834462f444204fcae99fe76f69a836cc17a7a0935  sentry-cli-2.20.3-cargo6.tar.gz
 sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
index 60056f1fd2..832f5f13b4 100644
--- a/package/tbtools/tbtools.hash
+++ b/package/tbtools/tbtools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a45d11a0beca595c9e10cfa30f78945876ef4bd3ac0651d903f9f2bc14d05197  tbtools-0.8.0-cargo5.tar.gz
+sha256  a83b6413b20508632a2278b1e9311b2483a2ef2994bdd82e5089794a1270dfa8  tbtools-0.8.0-cargo6.tar.gz
 sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tealdeer/tealdeer.hash b/package/tealdeer/tealdeer.hash
index f9fba9b610..b54129dd1e 100644
--- a/package/tealdeer/tealdeer.hash
+++ b/package/tealdeer/tealdeer.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  233d220f1f917efccae0f7591ae619cb637862d959596a16afd1390a3203d44c  tealdeer-1.6.1-cargo5.tar.gz
+sha256  28b8fc80f1409476f8a093249b083995b2099a5283580815cad94c3b1cc46453  tealdeer-1.6.1-cargo6.tar.gz
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT
diff --git a/package/uefisettings/uefisettings.hash b/package/uefisettings/uefisettings.hash
index 0523d7b9b9..4e620ac8b8 100644
--- a/package/uefisettings/uefisettings.hash
+++ b/package/uefisettings/uefisettings.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d614106b2f9093dfdd24367a5fc131b1537580a0a1e563a82da294539e10ca4a  uefisettings-149bc92970949d44be641ae1e3e942220d7390e7-cargo5.tar.gz
+sha256  8be49ed7fe97a153e3f1470db54cb563090cdd431bef59a115266f1f724c1f14  uefisettings-149bc92970949d44be641ae1e3e942220d7390e7-cargo6.tar.gz
 sha256  acc0b83e151985bb943d35ac37e7522fef28d707af9a4829678e92baa409aaf1  LICENSE
diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index 635f5ff79a..90e3332dab 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  69a6209cb26ecba6cb9fa28d10abad328d82adaa7e79b2eb6c750e08a4500021  zellij-0.44.2-cargo5.tar.gz
+sha256  a246ad21d0317fb184d150feccea1bf6a24443c88b97ae32bbcd201ecd174a1b  zellij-0.44.2-cargo6.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zoxide/zoxide.hash b/package/zoxide/zoxide.hash
index da04d48e9f..196d682e2d 100644
--- a/package/zoxide/zoxide.hash
+++ b/package/zoxide/zoxide.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c86fb903f941d0470712f2e5b37121957a75bdd7e593980ddd8c14a05ec86b5c  zoxide-0.9.8-cargo5.tar.gz
+sha256  bf836b249e22a736e8b1b53d7f6d4f9d4616d4ab2c388839453e176bc6365bec  zoxide-0.9.8-cargo6.tar.gz
 sha256  23aa3b08366e4ed6050f3d9950070201802aadbe5675fa1c19f24f4de91cf294  LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
