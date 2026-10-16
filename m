Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8B1CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB89381694;
	Fri, 16 Oct 2026 15:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNF04SsiyT9K; Fri, 16 Oct 2026 15:28:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 23AE68168F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792164513;
	b=QdV4JvEn57omGHGh0P+5JpBhIf4WeUj+qh7eaqWZg5xS/HE4+3e2Mg06LWWJm4DcJJ7a
	 aeV/9DrtDAcuAfzcLqJYQvjdgkVj8i08dJ9NEPrPQgYXoVagyuqkH5w12oKnRmKmjMgVL
	 6LIS5zKupvsZVPLkGAPV6WHGT9/MQp/vX2WVwKcI855vs1W+EPqZtjgadrbS4NspxW6mm
	 vqJVTZLtWDUBJM8gEr4OIJMEJ3nF07/EXUPvTcYQqbNtieA0tqJzm3s731US7rhdtEY9M
	 76MYcKk/rVihZHr/lQKRql/Xyi4ccbOIydHlGQxfb2CDZH9LXsUTpmPTEqkMX2S8vgg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792164513;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gukwvADaFgmKKTm9edn8WGNOD/7WZnEKjbuK4uGiHJ8=;
	b=kKijUlqkzZyeGV04aDTDZhoR7quMx7U2I9jZWuyyuUxcEhyEVKSgoS9flsEwB7VrhJ2v
	 Px94L7E2tg9scfQ9jFxFc9LyvPXvz/I4N/VMIlsO8457KWnpr6AR0Gv37hbAhpTVLCbSc
	 4y9KbRbbsSMfAUU+cKy/hptoNXGAbSX+D8EJBgGFKX+yB3zPtfdicEWI4ozjwEVU0xZmS
	 tinptUJZCLf3thFMzdDw43gRGENVEU9zQzfOXNFrbAfxQx3BrR3+2IMfXaeQ0b/COjv3B
	 EyZmmm+TDZRN1ZTICl+k1C/IwAoLKWjgGCEHGspe8JECsKEK01fnCZmVjhld5HgnsGA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792164513;
	bh=gukwvADaFgmKKTm9edn8WGNOD/7WZnEKjbuK4uGiHJ8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SSClPOG0ELNh1Cx8DjaIHtxyuLl/AImjg9dLQqUCXOnIy8LYDF6tihl51ZrnE7R5D
	 BWsOtts3u6D1Nhy1Ylj1oK3hlNxB7vYGwVGQ/SntsxUVFY/wOAPGK5MJTH7oq5bpFL
	 8Pvk6MAAUJZpLkdkrIJR5jOy+CGx+BGtNy8ZY5+7Ma5Xmi5hnMqcLfmCbFs9yNXARY
	 j9DlR38+NU9ke2A2mdWsELOiqTWJG1XYcB8TbqvKn9EvqpcKgyfZmQgzsjAqhMP+0A
	 HwM/zSkt/98mVnlQnI/MZw353MtZa5N2MqGsRFMLNvzuw0w1OJcsJQPoEWGAMJoR53
	 2AD1lAJxnb/Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23AE68168F;
	Fri, 16 Oct 2026 15:28:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EDFCF1DE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D473940042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0sPR_bboJGDq for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:28:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 87C37403FB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792164510;
 b=bBWTn+EYU7wpK8jJhkaLGxw+zh6eza0gkC8/ScxxyE+WePr9sIJa5GCBjwiTsIytoM4C
 ZCTE6gK4dFa8StFlZI5n/qBs+YNEi+m1jFjyT4OTb/6fC50Owgdz/RL298tg5P/fK8tqH
 Sj8GR15CDzT65fQ0RyE1nGLIAM32eEGqQn3McRe2bLDZG3uRUKNM/x3NTtId2l/BqXqBs
 JBIXR6HW9s9D7CQt83sJreMfejC0gCWvdKcMiPkgZLpH0OwthOoJbjvno4p+g2Hn6sXsE
 aSM/l89MAC+BkKy7OXMzTUCjjX0f2hl33aOKkf9h7m93w1T2C9+GCQNYVzdDR6hge1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792164510;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=82GQ2fTQQOU09Rqf+PK3/nQkkU5RcEuZRKc8kfTeTLk=;
 b=fD03Q2RRiXw3XxcIV1epmLCr+pdiA8eGmsX1f5pxsa101aGjkaZsQhW9WTxcID/9uTYB
 dhrcJL2UrER49m27z0qUg5dmZG+zQYdLsq8bxSZpBPdq1ODaEORYtUor/LY743c7cih/0
 UP+MBPkKbnpHEHlA7RcWhPc/ZoHHQLHNXE+EDGMmOhsF9i7YMTrJ9CFTUMep2k2IVG1IF
 n++N8glJCMUr6mo+RbE2koefizLCmOTTjHDSsJsks0QL745CANzYAaIz4T9cNo/cbcJm7
 Qvt0KT+LGwrGiZeRp3rO9JUDXuY3fhF8FBzpPaBzjK9VBG0omYx7tTSCH9tvobKFH2w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=gw1pp15v; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87C37403FB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:28:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIdeX-1xNZPw3b77-00GVt5; Fri, 16
 Oct 2026 17:28:26 +0200
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri, 16 Oct 2026 17:28:11 +0200
Message-ID: <20261016152811.2817446-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016152811.2817446-1-fiona.klute@gmx.de>
References: <20261016152811.2817446-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:7I7wgETTkoZWA9kyrwdHybiEXt8VKaFcI2or9NDn86Ovsv77ae7
 YvVcKu7xQWdkb0pWhmr0lu8nycrmDUMbDdRwWehU1l2Bb5fG0SpsRGqgOFEeo7pE5o6sH/9
 hOWncqqDZM67wEIUI7Ph4ZtC62ro3iHLIC1NeTghDuGcMvzO9QEzkn04f1NPmZQiibz9Fb4
 6eZ/QIO3TzonmuIHAh84g==
UI-OutboundReport: notjunk:1;M01:P0:1JkZlHLX3XA=;TTYUbN7BPqAQArwAZtDsv7CbLnt
 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
Subject: [Buildroot] [PATCH 4/4]
 support/testing/tests/package/test_uboot_tools.py: test FIT signature on
 target
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Adapt the code added to the host test with
928cc5dc5cb82e6f2cb43f853488309eb806ef89 ("package/uboot-tools: fix
host FIT signature support") to run on the target.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 .../testing/tests/package/test_uboot_tools.py | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/support/testing/tests/package/test_uboot_tools.py b/support/testing/tests/package/test_uboot_tools.py
index 13f77c3379..7caff3e66c 100644
--- a/support/testing/tests/package/test_uboot_tools.py
+++ b/support/testing/tests/package/test_uboot_tools.py
@@ -38,7 +38,10 @@ class TestUbootTools(infra.basetest.BRTest):
         BR2_PACKAGE_UBOOT_TOOLS=y
         BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE=y
         BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT=y
+        BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT=y
+        BR2_PACKAGE_UBOOT_TOOLS_FIT_CHECK_SIGN=y
         BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE=y
+        BR2_PACKAGE_LIBOPENSSL_BIN=y
         BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
@@ -68,6 +71,65 @@ class TestUbootTools(infra.basetest.BRTest):
         # Python does not have built-in CRC16 support, just check it is present
         self.assertIn("crc16-ccitt", reported)
 
+        keydir = "/tmp/keys"
+        self.assertRunOk(f"mkdir {keydir}")
+        # We generate a public/private key pair to sign the image.
+        self.assertRunOk(
+            "openssl req -batch -new -x509 -nodes "
+            f"-newkey rsa:2048 -keyout {keydir}/dev.key "
+            f"-out {keydir}/dev.crt -subj '/CN=Buildroot FIT test'",
+            timeout=30)
+
+        # We compile the empty dtb that will be used to store the
+        # public key.
+        self.assertRunOk(
+            f"dtc -I dts -O dtb -p 0x1000 -o test-key.dtb /{KEY_DTS.name}")
+
+        # We sign the image and write the public key in our key
+        # storage dtb.
+        self.assertRunOk(
+            f"mkimage -f /{SIGNED_ITS.name} -k {keydir} -K test-key.dtb "
+            "-r signed.fit")
+
+        # We check there is a signature present in the FIT image.
+        out, exit_code = self.emulator.run(
+            "fdtget -t bx signed.fit "
+            "/configurations/config-1/signature-1 value",
+            -1)
+        self.assertEqual(
+            exit_code,
+            0,
+            "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
+        )
+        self.assertEqual(len(out[0].split()), 256)
+
+        # We check the key is marked as required for the configuration.
+        out, exit_code = self.emulator.run(
+            "fdtget -t s test-key.dtb /signature/key-dev required", -1)
+        self.assertEqual(
+            exit_code,
+            0,
+            "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
+        )
+        self.assertEqual(out[0], "conf")
+
+        # We actually check the signature is valid.
+        self.assertRunOk("fit_check_sign -f signed.fit -k test-key.dtb")
+
+        # We "corrupt" the signature, by setting it to zero.
+        self.assertRunOk(
+            "fdtput -t bx signed.fit "
+            "/configurations/config-1/signature-1 value 00")
+
+        # We check again the signature, and expect a failure.
+        out, exit_code = self.emulator.run(
+            "fit_check_sign -f signed.fit -k test-key.dtb", -1)
+        self.assertNotEqual(
+            exit_code,
+            0,
+            "\nfit_check_sign did not fail as expected: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
+        )
+
 
 class TestHostUbootTools(infra.basetest.BRHostPkgTest):
     hostpkgs = ["host-uboot-tools"]
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
