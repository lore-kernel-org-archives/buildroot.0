Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237C6C28B2F
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 19:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 929E06082F;
	Sat, 15 Mar 2025 19:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MxzjPj36tRXG; Sat, 15 Mar 2025 19:57:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F58660802
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F58660802;
	Sat, 15 Mar 2025 19:57:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 501CC12C
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FA6A83B2B
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jl-3tJeWo9G5 for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 19:57:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D306F83AB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D306F83AB9
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D306F83AB9
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:19 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3913d45a148so2659719f8f.3
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742068638; x=1742673438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2S2uVpI2w/sIYOaP8hh7RDOWKDvKynEdIueFjovoDwY=;
 b=JdnvNOcFGSZEXC7lECDin7Wt8VgJYglqVJkmaFaxpzBar8NtZSDOa+NtWXRBojdStm
 8x3olrmqyvA61Ahp8gP5PlgjyMeNZ21h3OzmSDNB9hoB+QGLMR87PM2y8l5ujdbw9ftz
 2SqWM7Qj34WdWkX1AAtGlZS9ixW0gEbuFAGBgcho60Bx1oBLQeSvzKAmDMEuWQcP+X04
 5UsytfoxqrQtqHVY8UqzMYejyOJZThRw7G7de7akMzmbiZKMyl6gYPyyQtn8qPuz7EuQ
 1juqG7V3Yb7kog3LgNFfdIjuRri3Aw5ZsBx1EVzTjL3m/dwIfA2aZy+5LTq/n1/soYQ7
 XJDA==
X-Gm-Message-State: AOJu0YxoaAAEfH9DIehxR0G8bkgI/NQIPshY14JrrpVW2/F3WcE3S4Jr
 GqR+yPoRuxlqaOpqws/PlNqm62kgyQIIAoKBu2zgmuPbIm9hHa4SQKvIXA==
X-Gm-Gg: ASbGncvbcac0G3omIYNcgMcNDDym3fY6M25H7mkbefItgI+LiqPOxq7izBu5OP1OaEN
 IFV0Y1lxDM/w78uApylYMRGWaHpJfWPcp0KU5jVSqnwrR2XQq57QhH731Mio8NLzXfA498OofBu
 7QPZ5PuIbWVPJh7N1HUGKZiP9vOSnOtq37UW28HGbYjyYc5HpZJZFAeCLrX+ymaD4x1K1gp17Aj
 0b0WTSMfcXxUEhYOGpd9ycZLOcCzeimMgTS2XctMvUc2SEvv3Cgp/fILhYW2TV22c6XF+c0GPd+
 1PLMpR3Y7UPkfxuklaj0xwjn1f6vzewdAczOVzmYpY+wGy3phUS8vTI=
X-Google-Smtp-Source: AGHT+IE6jlYdPQfcnRnMtUUo76nDfnx0d+Yd/DfibItbQZYe7svz6KeiP0wzDoTswUBQWWUBv1I1uQ==
X-Received: by 2002:a5d:47c9:0:b0:390:e311:a8c7 with SMTP id
 ffacd0b85a97d-3971cd57eb0mr8151103f8f.5.1742068637611; 
 Sat, 15 Mar 2025 12:57:17 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975afesm9756836f8f.47.2025.03.15.12.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 12:57:17 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sat, 15 Mar 2025 20:57:09 +0100
Message-ID: <bb4767df1bc167b91e7a4420fa2157154831091d.1742068624.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1742068624.git.yann.morin.1998@free.fr>
References: <cover.1742068624.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742068638; x=1742673438; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2S2uVpI2w/sIYOaP8hh7RDOWKDvKynEdIueFjovoDwY=;
 b=E9dCMuQ6iMVKn0GWWgv/6C7+m06gVtNrkzLBpmP0sFbto1pBkrMVSkyfRh4H+Rl4BL
 2MDm5zS5RN6c5bDP830ys6kiOM2WPMH/ZZIfoRCrWyI6ogPVKzB+PBoM1WJI5Xh71w7r
 lVV0ZTRBlLVF0D+EPwBhNx+979xlyze0oeLtHMtCzG2juiIHfQ+jtY4QJD9itb1Mc1Lf
 032E9m/BYHk3Q7pb35utgjYV0ZN2KeiBjXaYHL0EiagYICdDixjVg0qMBcvhVA4M4Wew
 vsrol5L6dTnM2W33iQD7wO8QO8EWXHniIicbvdEX7XsPp3DJ9Kj3qZnPybrqjxaSzvxK
 0c/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E9dCMuQ6
Subject: [Buildroot] [PATCH 11/14 v4] package/aardvark-dns: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aardvark-dns is needed by netavark to provide cross-container DNS
resolving with Podman.

It is to be noted that netavark and aardvark-dns have to be udated in
lock-step [0].

Update the podman runtime test to validate this is working.

[0] https://github.com/containers/podman/blob/main/DISTRO_PACKAGE.md#networking-tools-netavark-aardvark-dns-passt

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                            |  1 +
 package/aardvark-dns/Config.in               |  9 +++++
 package/aardvark-dns/aardvark-dns.hash       |  3 ++
 package/aardvark-dns/aardvark-dns.mk         | 15 ++++++++
 package/netavark/Config.in                   |  1 +
 package/netavark/netavark.mk                 |  1 +
 package/podman/podman.mk                     |  1 +
 support/testing/tests/package/test_podman.py | 38 ++++++++++++++++++++
 8 files changed, 69 insertions(+)
 create mode 100644 package/aardvark-dns/Config.in
 create mode 100644 package/aardvark-dns/aardvark-dns.hash
 create mode 100644 package/aardvark-dns/aardvark-dns.mk

diff --git a/package/Config.in b/package/Config.in
index 7e98256cdf..4297903fd8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2411,6 +2411,7 @@ menu "Miscellaneous"
 endmenu
 
 menu "Networking applications"
+	source "package/aardvark-dns/Config.in"
 	source "package/aircrack-ng/Config.in"
 	source "package/alfred/Config.in"
 	source "package/aoetools/Config.in"
diff --git a/package/aardvark-dns/Config.in b/package/aardvark-dns/Config.in
new file mode 100644
index 0000000000..83ef5a16f9
--- /dev/null
+++ b/package/aardvark-dns/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_AARDVARK_DNS
+	bool "aardvark-dns"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  Authoritative dns server for A/AAAA container records.
+	  Forwards other request to host's /etc/resolv.conf
+
+	  https://github.com/containers/aardvark-dns/
diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
new file mode 100644
index 0000000000..5327a38b7e
--- /dev/null
+++ b/package/aardvark-dns/aardvark-dns.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  bbd4a0b0bdf6788c09266f1f944d5c5397b6db4f1da0735a1d42738a6e074249  aardvark-dns-v1.14.0-git4-cargo2.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/aardvark-dns/aardvark-dns.mk b/package/aardvark-dns/aardvark-dns.mk
new file mode 100644
index 0000000000..a2e74a72bf
--- /dev/null
+++ b/package/aardvark-dns/aardvark-dns.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# aardvark-dns
+#
+################################################################################
+
+# When updating the version here, also update netavark in lockstep
+AARDVARK_DNS_VERSION = v1.14.0
+AARDVARK_DNS_SITE = https://github.com/containers/aardvark-dns
+AARDVARK_DNS_SITE_METHOD = git
+
+AARDVARK_DNS_LICENSE = Apache-2.0
+AARDVARK_DNS_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
diff --git a/package/netavark/Config.in b/package/netavark/Config.in
index cf7b731141..c78e57556f 100644
--- a/package/netavark/Config.in
+++ b/package/netavark/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_NETAVARK
 	bool "netavark"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_HOST_RUSTC
+	select BR2_PACKAGE_AARDVARK_DNS  # runtime
 	select BR2_PACKAGE_IPTABLES if !BR2_PACKAGE_NFTABLES  # runtime
 	select BR2_PACKAGE_NFTABLES_JSON if BR2_PACKAGE_NFTABLES && !BR2_PACKAGE_IPTABLES
 	help
diff --git a/package/netavark/netavark.mk b/package/netavark/netavark.mk
index c96912ef5a..31d0b28b74 100644
--- a/package/netavark/netavark.mk
+++ b/package/netavark/netavark.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When updating the version here, also update aardvark-dns in lockstep
 NETAVARK_VERSION = v1.14.0
 NETAVARK_SITE = https://github.com/containers/netavark
 NETAVARK_SITE_METHOD = git
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index 48b4cd9b27..29c5591a0a 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -101,6 +101,7 @@ PODMAN_POST_INSTALL_TARGET_HOOKS += PODMAN_CONFIG
 
 define PODMAN_HELPERS
 	$(Q)mkdir -p $(TARGET_DIR)/usr/libexec/podman
+	$(Q)ln -sf ../../bin/aardvark-dns $(TARGET_DIR)/usr/libexec/podman/aardvark-dns
 	$(Q)ln -sf ../../bin/netavark $(TARGET_DIR)/usr/libexec/podman/netavark
 	$(Q)ln -sf ../../bin/slirp4netns $(TARGET_DIR)/usr/libexec/podman/slirp4netns
 	$(PODMAN_HELPER_INIT)
diff --git a/support/testing/tests/package/test_podman.py b/support/testing/tests/package/test_podman.py
index e2b0598961..44211b438e 100644
--- a/support/testing/tests/package/test_podman.py
+++ b/support/testing/tests/package/test_podman.py
@@ -166,6 +166,44 @@ class PodmanBase(infra.basetest.BRTest):
         output, _ = self.emulator.run('echo ${br_container}')
         self.assertEqual(output[0], "", "Still in a container")
 
+        # Test networking between two containers
+        self.assertRunOk("podman network create buz")
+        self.assertRunOk(
+            "podman container run --rm -ti --name pod007 --network buz --detach busybox:1.37.0",
+        )
+        self.assertRunOk(
+            "podman container run --rm -ti --name pod006 --network buz --detach busybox:1.37.0",
+        )
+        # Ensure each pod can resolv itself and the other
+        # (not using itertools.matrix() just for those trivial combinations)
+        for pod1, pod2 in [
+            ("pod006", "pod006"),
+            ("pod006", "pod007"),
+            ("pod007", "pod007"),
+            ("pod007", "pod006"),
+        ]:
+            output, exit_code = self.emulator.run(
+                f"podman container exec {pod1} nslookup {pod2}",
+            )
+            self.assertEqual(exit_code, 0)
+            self.assertTrue(output[0].startswith("Server:"))
+            self.assertTrue(output[1].startswith("Address:"))
+            # Busybox' nslookup emits one "Non-authoritative answer" per
+            # supported address familly: IPv4 and IPv6.
+            self.assertEqual(
+                len([line for line in output[2:] if line == "Non-authoritative answer:"]),
+                2,
+            )
+            # But only IPv4 is available on this network
+            self.assertEqual(
+                len([line for line in output[2:] if line.startswith("Address:")]),
+                1,
+            )
+        self.assertRunOk("podman container kill --all")
+        output, _ = self.emulator.run("podman container ls --format '{{ json }}'")
+        pod_info = json.loads("".join(output))
+        self.assertEqual(len(pod_info), 0, f"{len(pod_info)} container(s) still present, expecting 0")
+
         # Remove the offical image
         self.assertRunOk('podman image rm busybox:1.37.0')
         output, _ = self.emulator.run("podman image ls --format '{{ json }}'")
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
