Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A09EC79FB6
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 12:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F60040721;
	Wed,  9 Sep 2026 12:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9i4W7Sc_KXw; Wed,  9 Sep 2026 12:44:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B5CC94071B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788957859;
	b=I1l91xArKMUOKjr6T3HUTaBZD4EtzdHKM5ZiqoWsvKr0Gnx8R+zwRIGOszKEH66IsF72
	 Cx38dWvgv9PwI7GyLCoIixf83msFdQztyofq+pJf92EyptAcOFseW547G+BuP/b8KO9JP
	 ohN1fyvn/3KLNzfuJaJscehhHnOnbwORW/GSZwdYFXVwDjpJG/CAyR11qeVPgL3DdR2zj
	 DNZc1JLcuJ90IW7PfogMnMZwNY3GepKWHSWyZGYiXP4Pusws/lyc0l8462vqFA6vuEGPA
	 HpaOhfp0Mc9uH7jsYzFqzTK6QfEEuDbt0mmn5xpxUtRcSCHflDXaL4Hy8kcV8oxIz5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788957859;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0mKoDo4EgGeDLkZnINaFERB4mppWYE7NfnKhbpgITW0=;
	b=WE68ovhoZNOKzEkjpfDpLquHkrseKjIPaF4RiG+HL3hduJndhROJe2tHPeG+/TMBK2Gm
	 4kL174AT5nkORE0E7vVIu2KJTPhYh9nq1ksenZJ7LrZKsSYP2N+KN9E27BJzITD2RCQ2/
	 qNeDyvqJgQGdDJ1y9vaBuUwzugrc2mziBEsUoXG5eyxqScV8iEaM6XzOll/17nK/lI8O9
	 gagClvdXYo1En8VV7dRlgMLaw3VRTfn4qmepkR5ffdoPF+QKZQtBsL27nQj9uyVETsGup
	 1k/r6erLIEiGbXTU8MGzwo6NCMhf+JMuY5eFDP7jZfdpIOzByymY9cnxV3PMSu+pC3A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788957859;
	bh=0mKoDo4EgGeDLkZnINaFERB4mppWYE7NfnKhbpgITW0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mVGjI2RZneh3BAHNK073q8gOotlB6NR8A1aVgowz5Ker4egt3wHAK0AL3/WthJnC0
	 6kvqKFjV4Q2QfzH/zC+xrOXQZ1u5In89ZEmd24fkh4n6/1MrNVasqAiQcJjcYwphPs
	 3slP3JdVvl0JeT0UKpKrHyrIQqaXq0aYmKAIu7rqpxR08yp5qdl7vuXyUkfU5O+Mjh
	 Xmzr1IpPcVPTyOruKgiTkwtiW2SRBoU9y0FLjbr/nGp1q4vm+FI5a6DRdF4iZBzUzK
	 igXZ+piRIiv6+Q0Zr5oGATtUb0mgR2dMcNgIVqLBEAmxNv90lGT9hRDE4mNfYhzDzH
	 ga+vcA0dmo0Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5CC94071B;
	Wed,  9 Sep 2026 12:44:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 758FF4CC
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 678C740085
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uROB9d_hUnZv for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 12:44:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org AAF0A40026
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788957857;
 b=BGheLHD/fXiWOW18DydLEA9liYzf55T+H/khjwqmGNw/fcRSXQmwKctM/QMX5Tbx9iAr
 hhO2M7/Z9AhjgswTWQNFwicc/YpizeYkpGFGL7M/p3tbbVt0NjBa1vLGHrTZ6ggmbz7Zx
 HCoy3AtQltec22KYYUJLpNEIB+BPiEs946PmYUHpfmKQVMmb/cmcEGv2kG3r6GeitGHH5
 fF58LTI8JYuy7I7O1DahL4b9S8x2gHKvnycMBStyrPK3aEYITCrgYFERCck4q10DF9EU8
 4kjzWJ7Zr7/ezLlowPcdOrVCMRYXGhQiZsY6Qvl+VoryhdYId/zt56Y/mxtvr+xVbyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788957857;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:To:Cc:
 Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 bh=AuSxQ2t5fGuOGPsrj3CPWBjAoMQkqxhM7BO4JkNteX0=;
 b=Y5taHJLsAj2nxIPLoaMtVtd8UYCg4zG9/h2lZ/Qul6BTUWRjAksbj5x02sxortZRAlw2
 ooBHP7qWqkUVnGCADSOD5t6sEIb8XdqslI3d+sd126A6rkWP4jgRabOYkqaenAGI5BwH4
 GqCJlay1HSEJpCywgtnSuvIX1aXIz+gMuYfqEE5Cq0Phvh5bPNrHpSKwo4avPZPx2eAYg
 9yk3sYdJwpASudqRCG/LMfjHtXLxx5qCnxxDnOTkL2B+P2Wq8FY2UnoBJjrAdrnrhCRiD
 yZRuKQIbZpDbLMLFM6eRoMSsUXxqFRA8PjTSfMvETr7VHGfWu539KofrZom9Auekc/w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=none header.from=thewebers.ws; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Om9RBZPu; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::f;
 helo=mail-oo2-x0f.google.com; envelope-from=matthew.l.weber@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=thewebers.ws
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Om9RBZPu
Received: from mail-oo2-x0f.google.com (mail-oo2-x0f.google.com
 [IPv6:2607:f8b0:4864:31::f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAF0A40026
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 12:44:16 +0000 (UTC)
Received: by mail-oo2-x0f.google.com with SMTP id
 46e09a7af769-7f4f0de6ec8so424875a34.1
 for <buildroot@buildroot.org>; Wed, 09 Sep 2026 05:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788957855; x=1789562655; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=AuSxQ2t5fGuOGPsrj3CPWBjAoMQkqxhM7BO4JkNteX0=;
 b=Om9RBZPucIj7sbfD8v0u8h2oC5cdXRBMIuGgisMT4ncoh5ULwR1mQrYrvq+Pd7Nc9/
 BEHUaMh1SeOn/eW8w94dulMGqbt0RDy3nqXl6oDmXo5IADajJMWA+N9gf9S3oDd+YFRs
 PX0ybVHS2CWrdkLMsxB5AI5r8fBXkWl6U38wMiclGnp3YdwbpCsEcvufY/pm4ifPDnk/
 9ZfsvXv2oCIqVQcDeul9lggDbim9Vvh8D39vipzIdvebTjb9IAt1eWRCW9tBxhRqAq/p
 gwNp+vU09Dxi/NJh/1uYdH9TMlT1KMeaJ4roc4XOuXJM8/TL/d+aZHGT5DW1bLr/tEad
 0eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788957855; x=1789562655;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AuSxQ2t5fGuOGPsrj3CPWBjAoMQkqxhM7BO4JkNteX0=;
 b=TJgMKH5po3xYjAgk8HS1eXNIPBXY3wiSPhbWwMtZFmYRTVRlGdBBKfJ3aBZpnEbifE
 RD58GcBAl+aUK8WtxqlYSw/E1ZeDt2EHstv9zfnTb2lzx37974O1djBvi5Dk0kACiixF
 wnk0areufO33MjY+CCOrj40zfLIEfJKbFZOpnjSGQl69BLjFHt+icHcn3mHjChg6iB6D
 3TuUlTd76MHEg5KffiMyV1UKO3/vd8M/F07fbNs2RisB6fqXg3rpRUC8RX2Zm3dumQFM
 T11UZ/jwcarnjZ4d/jc+AfYg7FC5vNRD3n8P2uCKoJgfPDhw3NxAYkbcvNa5KDdQSDCb
 i1mg==
X-Gm-Message-State: AFuF++nwbNuBJQz8Zn1F+FYMG7WidT7ZM/0c6fg+D27ri1uKVwnVWT/U
 BjuEDc+K5fM6atc5bQzhlAjtbbvnhk9w4BmN4D7vsWogFXE5OhmWmZjJpf03IQ==
X-Gm-Gg: AYBFou25Ivhmv4nWmOXdwSlFp8/Kba8nDyRhs33qL7XT7A7NIK6leENmS7CLQlAWwGQ
 CCrvqN3/yrvoSlE3y4M0+nZ2nPlZhj9XZiSp+FaxYFPsEDSS6e0T0j+7SaxVyolio/T9lnWNcC0
 r7KAZIKOzoDVVYj8hcVDk2foc7KrfZQlAt6vAm41miygjZ7JTgATIoq00frSxAsMghafwsyASIi
 F7e8Ksy3X/bXY+9comn3/SfRiy0UpqI5VCKEoFkXQ9IaZmKX6jb7ZXwwsadgVPCLtZabnDuQPS4
 3OOVPc34XtCBmG5PMxJYSUaZwWzzd3yE8nbz83cUtxU6mFnuqAZGNBnJDI3aotvAeiPC5PJM2j5
 j81a+alY3ePrlZJS1NKAlNrx+dC3Ro+V2I/uXH7gxwa60KOKSMsL8wE63dJEbq/DBJSNqWJZuOk
 M3cssaXOFhMD2ZEuaAt4i2ZqkfhHP3m9LsR5x+1GvIsok3nNi7olI5vVafg9ZKDOHA7agswQfLK
 SKX1/n37sDdzz0EulgJGbb3kRUyxSdXXDiKkp59izK7E8mjtGk=
X-Received: by 2002:a05:6830:4389:b0:7f9:555:1ded with SMTP id
 46e09a7af769-7ff49a43759mr5830801a34.9.1788957854963; 
 Wed, 09 Sep 2026 05:44:14 -0700 (PDT)
Received: from penguin.lxd (138-28-90-168.fttx.imoncommunications.net.
 [138.28.90.168]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7f9f6daa20bsm17842153a34.14.2026.09.09.05.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 05:44:13 -0700 (PDT)
From: Matthew Weber <matt@thewebers.ws>
To: buildroot@buildroot.org
Cc: Matthew Weber <matt@thewebers.ws>
Date: Wed,  9 Sep 2026 07:43:54 -0500
Message-Id: <20260909124355.32121-1-matt@thewebers.ws>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] docs: add agent guidance
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

Document Buildroot structure, documentation, build and validation
workflows, mailing-list submission, Patchwork usage, and AI-assisted
contribution requirements.

This specific file was added as most AI will look for it.

Assisted-by: GitHub Copilot
Signed-off-by: Matthew Weber <matt@thewebers.ws>

---

v1 -> v2 : I messed up the additional info section and patchwork didn't
           pick the series up

This is modeled after similar work I did on another project. I
tried to keep this simple to start and there are more refs in the
pull request. https://github.com/elisa-tech/wg-aerospace/pull/234/changes

 AGENTS.md | 257 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 257 insertions(+)
 create mode 100644 AGENTS.md

diff --git a/AGENTS.md b/AGENTS.md
new file mode 100644
index 0000000000..e05c87f4fc
--- /dev/null
+++ b/AGENTS.md
@@ -0,0 +1,257 @@
+# AGENTS.md - Buildroot
+
+## Repository purpose
+
+Buildroot is a simple, efficient tool for generating embedded Linux systems
+through cross-compilation.
+
+The repository contains:
+
+- `package/`: target and host package definitions
+- `board/`: board-specific support files
+- `configs/`: predefined board configurations
+- `boot/`: bootloader and firmware support
+- `linux/`: Linux kernel integration
+- `system/`: target system configuration
+- `toolchain/`: toolchain support
+- `fs/`: root filesystem image generation
+- `support/`: infrastructure, scripts, tests, and tooling
+- `docs/`: the Buildroot user manual and website
+- `DEVELOPERS`: file ownership and maintainer notification rules
+
+Read the relevant package, board, or infrastructure documentation before
+changing its implementation.
+
+## Documentation
+
+The primary documentation is in `docs/manual/`.
+
+Useful entry points:
+
+- `docs/manual/manual.adoc`: manual index and build definition
+- `docs/manual/quickstart.adoc`: first Buildroot build
+- `docs/manual/common-usage.adoc`: common make targets and workflows
+- `docs/manual/contribute.adoc`: contribution and patch-submission process
+- `docs/manual/adding-packages.adoc`: adding packages
+- `docs/manual/adding-board-support.adoc`: adding board support
+- `docs/manual/developers.adoc`: `DEVELOPERS` and `get-developers`
+- `docs/manual/resources.adoc`: community resources and Patchwork
+- `docs/manual/prerequisite.adoc`: host requirements
+
+Generate the text manual with:
+
+```sh
+make manual-text
+```
+
+The generated text manual is written to `output/docs/manual/manual.text`.
+Online documentation is available at <https://buildroot.org/docs.html>.
+
+## Building Buildroot
+
+Build as a normal user. From the repository root:
+
+```sh
+make menuconfig
+make
+```
+
+The resulting kernel, bootloader, and root filesystem images are placed in
+`output/images/`.
+
+Useful commands include:
+
+```sh
+make list-defconfigs
+make <boardname>_defconfig
+make savedefconfig BR2_DEFCONFIG=<path>
+make source
+make legal-info
+```
+
+Use `O=<output-directory>` for an out-of-tree output directory:
+
+```sh
+make O=/path/to/output menuconfig
+make O=/path/to/output
+```
+
+Check `docs/manual/prerequisite.adoc` before diagnosing host dependency
+problems. Buildroot requires GNU make 3.81 or newer and a Linux host.
+
+## Testing and validation
+
+Choose validation appropriate to the change:
+
+- Run `utils/check-package` on new or modified package files.
+- Prefer the containerized check for patch preparation:
+
+  ```sh
+  utils/docker-run make check-package
+  ```
+
+- Validate `DEVELOPERS` changes with:
+
+  ```sh
+  ./utils/get-developers -v
+  ```
+
+- Build the affected defconfig, package, board, or test target.
+- Use the test infrastructure under `support/testing/` when the change
+  affects runtime behavior.
+- Generate documentation with `make manual-text` when changing the manual.
+
+Do not claim a change is tested unless the relevant command or build was run.
+
+## Finding responsible developers
+
+`DEVELOPERS` lists developers associated with architectures, packages, boards,
+and infrastructure. Use `utils/get-developers` to identify notification
+recipients:
+
+```sh
+./utils/get-developers <patch-files>
+./utils/get-developers -e
+./utils/get-developers -c
+```
+
+When adding a new package, board, or significant functionality, update
+`DEVELOPERS` in the same patch as described in `docs/manual/developers.adoc`.
+
+## Contribution workflow
+
+Buildroot uses the mailing list for discussion, review, and patch submission.
+Patches are not submitted through the issue tracker.
+
+- Mailing list: `buildroot@buildroot.org`
+- Subscription: <https://lists.buildroot.org/mailman/listinfo/buildroot>
+- Archives: <https://lists.buildroot.org/pipermail/buildroot/>
+- Searchable archives: <https://lore.kernel.org/buildroot/>
+- Bug tracker: <https://gitlab.com/buildroot.org/buildroot/-/issues>
+- IRC: `#buildroot` on OFTC
+- Patchwork: <https://patchwork.buildroot.org/project/buildroot/list/>
+
+Read `docs/manual/contribute.adoc` before preparing a patch series.
+
+Keep patches focused and complete. Use the affected area as the commit-title
+prefix, start the description with a lowercase word, explain why the change is
+needed, and include a `Signed-off-by` line from the human contributor.
+
+Typical patch preparation:
+
+```sh
+git fetch --all --tags
+git rebase upstream/master
+utils/docker-run make check-package
+git format-patch -M -n -s -o outgoing upstream/master
+./utils/get-developers outgoing/*
+git send-email --to buildroot@buildroot.org --cc-cmd \
+  './utils/get-developers -e' upstream/master
+```
+
+Use `Tested-by`, `Reviewed-by`, and `Acked-by` only according to the meanings
+documented in `docs/manual/contribute.adoc`.
+
+## Working with Patchwork
+
+Use Patchwork to inspect, test, and apply patches submitted to the mailing
+list. Patchwork is not the submission mechanism.
+
+For an individual patch, download its mbox representation and apply it with
+`git am`:
+
+```sh
+git checkout -b test-patch
+curl --fail --location \
+  'https://patchwork.ozlabs.org/project/buildroot/patch/<patch-id>/mbox/' |
+  git am
+```
+
+For a patch series, open the series listing in Patchwork and use the series
+mbox link when available. Apply the complete series in one operation:
+
+```sh
+git checkout -b test-series
+curl --fail --location '<series-mbox-url>' | git am
+```
+
+A series can also be applied by downloading each patch mbox in order, but the
+series mbox or a Patchwork bundle is preferred because it preserves ordering
+and commit metadata.
+
+Example series listing:
+
+<https://patchwork.ozlabs.org/project/buildroot/list/?series=<series-id>>
+
+Example individual-patch mbox:
+
+<https://patchwork.ozlabs.org/project/buildroot/patch/<patch-id>/mbox/>
+
+After applying a series, inspect the resulting commits and run validation for
+the affected area:
+
+```sh
+git log --oneline --decorate -n <number-of-patches>
+make <affected-target>
+utils/docker-run make check-package
+```
+
+Patchwork's REST API may be used for searching or inspecting patch metadata,
+but do not assume that API URLs provide an mbox download. Use the mbox link
+provided by the Patchwork interface for applying patches, and verify the
+downloaded content before running `git am`.
+
+## AI-assisted contributions
+
+AI tools may assist with code, documentation, analysis, and other meaningful
+content.
+
+When AI-assisted work is committed or prepared for submission, follow the
+commit-message and patch-formatting requirements in
+[`docs/manual/contribute.adoc`](docs/manual/contribute.adoc#submitting-patches),
+including the subject and body wrapping rules, required trailers, and human
+sign-off.
+
+Meaningful AI-generated content must be attributed with an `Assisted-by` trailer
+in the commit message:
+
+    Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
+
+Trivial completions, spelling corrections, and common boilerplate do not require
+attribution. For substantial AI-generated content, summarize the relevant
+prompts or session context in the commit message or patch description.
+
+AI tools must not add `Signed-off-by` trailers. The human contributor must:
+
+- review and understand all AI-assisted changes;
+- run and assess appropriate validation;
+- verify licensing and provenance;
+- add their own `Signed-off-by` trailer;
+- take responsibility for the submitted contribution.
+
+AI-assisted changes must not introduce license-incompatible material. Generated
+content must be checked for factual correctness, appropriate attribution, and
+compatibility with Buildroot and any affected package's license.
+
+AI-generated content should receive review proportional to its significance and
+the degree of AI involvement. Do not submit generated output without human
+understanding and validation.
+
+AI tools must not invoke `git send-email`, upload patches, or otherwise submit
+patches on the contributor's behalf. When a patch is ready to submit, present
+the proposed command sequence, including `git format-patch`,
+`utils/get-developers`, and `git send-email`, for the contributor to review and
+run themselves. Do not execute the sending or submission command.
+
+AI tools must not autonomously commit or push changes without explicit human
+review and direction.
+
+### Local agent behavior
+
+Keep changes narrowly scoped to the requested behavior. Follow existing
+Buildroot conventions and documentation. Preserve unrelated user changes.
+Do not create commits or branches unless explicitly requested.
+
+### Further reading
+
+- [Linux Foundation Generative AI Policy](https://www.linuxfoundation.org/legal/generative-ai)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
