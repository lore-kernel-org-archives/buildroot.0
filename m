Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B05C79FB7
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 01:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D63380E30;
	Thu, 10 Sep 2026 01:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJS2a3Cfuw-d; Thu, 10 Sep 2026 01:58:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 24C0680DFA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789005525;
	b=ZNQxsm/+GLuQx6z/qDGqCtphpGodWNlXe8PAnoAw1zx4kUdPgaWah3ET7jDGl78BOLxA
	 wkxRSvHq7tNQuwHkBSyEWQG8rgsPD218YLrxkSSx9crZAcEYfewV0hv3o8Twy7pMFdZzT
	 KF07ELkjrQoDsJRRWeERzcYw6fktyDIZ9zpcrtw2V/kGrZyzNZcZyCF+tKneVLW4wwt/r
	 Owng1Ywtvdi+HEiXi71G+xZdnZ2i7PjWWAsS0hLBsvi/fyAbT3/RamfdJk9JZaiHSjJvf
	 5pao7x6gl2N9joC8mEIHmaMiZIXVUmL8SDePUFVjsrAC5pRLr0HgK7s16+Mtbj1VEew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789005525;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EejBD1iBPyyEoOTb3UffHDdWNRK0stO0UO/ygWSuwhM=;
	b=GkVYz5wRQKRmzgqsN+4BwrWomQ8yXDgXq06YhfX1SLcDn9MdKFI273aM5KHAbq2JnvHq
	 ild+qwptTcEBsdd+Coo3iOnOkODeEOkKL/hJg6Ic+30ehr8v4CamQ6GghggWkeegDO8mZ
	 r8fh5FoemPDFjEI5WVQUjMc05fks9/giU2l+7D0B82O61Hzc54vVC78R8Mqdpuqd0OBDh
	 2yyrLG30QYnnVMn9iC5Jb4hrBHRDu8ZiFoSnPIA/dGZKDJ3MZpUJgmcfkbSt8Lr13CBCo
	 LmU6VXC7zEsTmM2KMMokaplHZfttGQizKyS5r06pVTBpoWdYYvOEnzKRi71xsbGWXGw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=none header.from=thewebers.ws;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RmlM7Ynt;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789005525;
	bh=EejBD1iBPyyEoOTb3UffHDdWNRK0stO0UO/ygWSuwhM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=maQYsBNeL7v00aQaljOA0WF478D8zfBEeYQ5JBuR/0RD1GbpYA7stYpveVo0SueUX
	 a5J8P+9s+CoZJH8sHqR+o8kTvrKlNSgJLUOoym7zzlVrycFUnmdXCrDT+TxkEXX0SN
	 eyKrxQbhNnENkP8fqt6+A+DRFOQMWpGqxyDK0fj1ZR3lId3oyZG5Ia4PFfzDr2Wp/g
	 CWe/5jawjTCBaJYkgzIUlnWnMQqMlBUsSef2IfnmYFBZ3B/QMXsScYlxAklJOH7Cfi
	 RnxR4lWw2CBRBqRajFkxvDZU211e57/p9bVC0JuaZmcL0aMJdtwtbT1TqO/Oya7JHy
	 MAatKRsj+iMZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24C0680DFA;
	Thu, 10 Sep 2026 01:58:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F336B14C
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 01:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E492280DFA
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 01:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GhlSU3QAwth for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 01:58:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E5BEA80DF5
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::236"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789005521;
 b=e122NYzD+oMAfEE3ya/mP9GJcEaaHN5SYYpWQ9arvYHqFE2k5LIhEgG7hnHgp/Jhfmtx
 aRyqFFNH5eF71GTILyHkvilPNAmE2xGEYfshdAhVHklFIkxvHQTM2XLmBWAljwvGtyrrc
 KobA+rc+USYTfn535x0PPfce8UfxjadNjW1R2A3vQME2l0lB/gh5Og80VLefHV/155pDO
 x2aWCuQBiy0yApC7YRdKVHnETeMCrlYuLvdHI360kv+6GMRHExVTI16BUFeTz2Kqj3Ym/
 MdVHdgCQfjf16ZPfmAhtRvQAHY9IGcMboKM9o0yc4CVY/nvV0qmrc74Q/m61qd4EY/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789005521;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:To:Cc:
 Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 bh=LH5lTXqJ+vnev5TTIiKMG7VEh7WjPkSIDGJBovN+R34=;
 b=S1JZBsQprOwl+6VStuEwhH7/5HonXwlLGZZAr+eckwKPeo84Gfp+I6o1g+YtglOAE9BJ
 2CngDF6pi41L8XvKtVwaq+tACH3BBlyyhwYMSMbiwiU3DALElApNPUXaOwOIcFSF32G++
 f7vU5fdejNIAGGCNKbIlDymPPe8PX/xyPbjF9qMuFUiyvGO9YlK5+rfG64SZsTgSrEfGu
 S8Wm9TVs9eBuQ93rITCy2/Ad3qIdUeSUQC2YkUsKVdWqWP6781/BZWwQ0C2wx2F24QJBD
 E6Ul6Ul/qaiTs1iwRFbI05idcc73EZZvqQHZtF9shYIl54Dm5j54hG3eLYMFGAkxcyA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=thewebers.ws; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=RmlM7Ynt; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::236"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=thewebers.ws
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=RmlM7Ynt
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5BEA80DF5
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 01:58:39 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-4c14d66d922so496372b6e.0
 for <buildroot@buildroot.org>; Wed, 09 Sep 2026 18:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789005518; x=1789610318; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=LH5lTXqJ+vnev5TTIiKMG7VEh7WjPkSIDGJBovN+R34=;
 b=RmlM7YntdiRDEG/cc1hzvytyQp/bxN8+EnFmSGMyo0SzdoDD8631ukcfysi6whgAze
 4uHp9OnrEfSQCKe2HPrLK/TcYe0Ldf6NWtxiI6rF4USt9baa/wfC8dFINpxFlPl5UUFd
 jkCdYRO3pYxCsE3wRsOTJRj3cux8c3qZhzoPoTXcgakNmHsn7lInaRMhx15KQzOUmOZ/
 q3GJpz8fT013l9D4xeOt/vAfOydDOmeLHYHvDUH8KOsjQDGvBdi9gelR3wvdBzcuj59A
 XNeBIaJ9tpof9m2C9NV8PxfB2/O3AEDWBQvY0+IvZlqms+JoQ2OKif7Fs9jZWDftEYgB
 D4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789005518; x=1789610318;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LH5lTXqJ+vnev5TTIiKMG7VEh7WjPkSIDGJBovN+R34=;
 b=sCWp358Hl1dYbOHmY+9AZ/0qN+fqtBKvmg1/Rl+bCdaWVz1C0of61Is29cW2xNqimO
 4DBR70WZfX0WlsaAho262bQOKn8jPD+y2pQr6i15ngrACH7Z1m5L6Wx58f0DTbnvDDXP
 gUTIjAOOwYZ4E0p+sPe5VmL78fV3u6dWHUQgbNzhFnVVQQSGSxldEqpvA0rnely/PoTk
 uo9JfkLZuaeJutP5VBVMbPrAc5aHFNOSAPsDwif5bVwdCGVxsfcNjgskAN8RJzxjoMEa
 5ymk706KlcQEzKcUWRNsJpoayFkZsTXOQpQNwdQnRDNK1XsIjyfp7y0krKmTnHtfXbEr
 XHTA==
X-Gm-Message-State: AFuF++l46eFDG0P3zLT0xxPDt7ebunVHOVpUeUzW1hNuho+YsJMBkNLG
 QGj7w3mSq9XoAEf6Cbud4wt0l63rA0fO2GqfXEd8HLuFFGj/Rq4tluMrgetIKw==
X-Gm-Gg: AYBFou0lnGMAWy4VZLBZ587zRoHmAjwjPEemK6E2YvFT5FFc5lTYtdsIFaN7t4LsbNu
 E5QAWJdcN92VN8r6D0auq6aEEcz5GNZ+Qxx9TInaVbNk31dpDZG5V1zmIWEQ0ktnlSaUmDoTlWP
 3FumQhNlpgTTQwekPa4XQXOILrs6kO1Q45sftm4YZK5JH2/B31KOlPMHPFZaQ/9e7Qs+8r83bIB
 776i+opapSiVTlj4TedTkiIEGQAZ9Y2jK9PNZ6oZb4wFFiYVfDHDuJ+hfULbl2oYlU0HjoOk+bK
 /vu5rJk0WBYXe/TdbbOnbF+KACXwe+AqLUOSMptod2inPB1Sv3WwMnpYPJfXEI3YkbNsYsgybp5
 mlf0LuSg8GZGFsxbFDzIuHsMqzykfKqXd+KoDVk2ceYKlBWhfT4AfYmEULdj0Hw+havx5+CLFfb
 bjpE8fG/7kggy++nZGtSQ4UtDbsu6KOVwc12TG2ZXU4OLCg+YnSyl1rvPsihDFlcXsSy4Zceyye
 ESctCE2MpAgm3aPZ3iuJ8IRPzG7c2P8X2sJHaIL
X-Received: by 2002:a05:6808:1988:b0:4b9:a88b:8887 with SMTP id
 5614622812f47-4b9a88b906fmr23062248b6e.29.1789005518009; 
 Wed, 09 Sep 2026 18:58:38 -0700 (PDT)
Received: from penguin.lxd (138-28-90-168.fttx.imoncommunications.net.
 [138.28.90.168]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4b96babc2c3sm19775897b6e.0.2026.09.09.18.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 18:58:37 -0700 (PDT)
From: Matthew Weber <matt@thewebers.ws>
To: buildroot@buildroot.org
Date: Wed,  9 Sep 2026 20:58:31 -0500
Message-Id: <20260910015832.17751-1-matt@thewebers.ws>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] docs: add agent guidance
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
Cc: ju.o@free.fr, Matthew Weber <matt@thewebers.ws>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Document Buildroot structure, documentation, build and validation
workflows, mailing-list submission, Patchwork usage, and AI-assisted
contribution requirements.

This file provides shared guidance for AI agents that recognize
AGENTS.md. Claude Code projects can load it by importing @AGENTS.md
from a root CLAUDE.md file.

Assisted-by: GitHub Copilot
Signed-off-by: Matthew Weber <matt@thewebers.ws>
---
Changes v2 -> v3:
	- add Docker, local validation, GitLab CI, runtime-test, and Patchwork
		guidance, including the current Patchwork URLs (suggested by Julien
		Olivain)
	- add a root CLAUDE.md import for Claude Code
		(suggested by Yegor Yefremov)

 AGENTS.md | 300 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 CLAUDE.md |   1 +
 2 files changed, 301 insertions(+)
 create mode 100644 AGENTS.md
 create mode 100644 CLAUDE.md

diff --git a/AGENTS.md b/AGENTS.md
new file mode 100644
index 0000000000..a4d11570fc
--- /dev/null
+++ b/AGENTS.md
@@ -0,0 +1,300 @@
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
+Host dependency problems can be avoided by using the Buildroot Docker
+reference image, by prefixing commands with:
+
+```sh
+utils/docker-run
+```
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
+- Check the validity of Kconfig `Config.in` files with:
+
+  ```sh
+  utils/check-symbols
+  ```
+
+  This check is also run by CI in
+  <https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08/support/misc/gitlab-ci.yml.in#L55>.
+
+- Build a package with several toolchain configurations using:
+
+  ```sh
+  utils/test-pkg -p <packagename>
+  ```
+
+- Build the affected defconfig, package, board, or test target.
+- Use the test infrastructure under `support/testing/` when the change
+  affects runtime behavior.
+
+Run runtime tests with:
+
+```sh
+utils/docker-run support/testing/run-tests -d dl -o output_folder <testname>
+```
+
+See the `using-the-runtime-tests-framework` section in
+<https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08/docs/manual/contribute.adoc#user-content-using-the-runtime-tests-framework>.
+
+Buildroot GitLab CI can also run runtime-test jobs; see the
+`runtime-tests-and-gitlab-ci` section in
+<https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08/docs/manual/contribute.adoc#user-content-runtime-tests-and-gitlab-ci>.
+
+- Generate documentation with `make manual-text` when changing the manual.
+
+Do not claim a change is tested unless the relevant command or build was run.
+
+If the public GitLab CI of the patch author is used, include the job link.
+This saves time for maintainers and provides evidence of the work. For
+example:
+
+- <https://patchwork.buildroot.org/project/buildroot/patch/20260906215252.499931-1-ju.o@free.fr/>
+- <https://patchwork.buildroot.org/project/buildroot/patch/20260907110454.1071513-1-bernd@kuhls.net/>
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
+  'https://patchwork.buildroot.org/project/buildroot/patch/<patch-id>/mbox/' |
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
+<https://patchwork.buildroot.org/project/buildroot/list/?series=<series-id>>
+
+Example individual-patch mbox:
+
+<https://patchwork.buildroot.org/project/buildroot/patch/<patch-id>/mbox/>
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
diff --git a/CLAUDE.md b/CLAUDE.md
new file mode 100644
index 0000000000..43c994c2d3
--- /dev/null
+++ b/CLAUDE.md
@@ -0,0 +1 @@
+@AGENTS.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
