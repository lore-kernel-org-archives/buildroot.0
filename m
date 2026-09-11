Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63052C88E4D
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 19:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E77336062B;
	Fri, 11 Sep 2026 19:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSQW6ALOfq89; Fri, 11 Sep 2026 19:14:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3050160614
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789154080;
	b=ZsJH3CLnwstWC3Psq3DCrlyoziVGAjD2QKfzphXMTk4DpVVj6JciFwczsF9VFh9jpIMD
	 NHg85nAf9kLm3xYf3vJXFTk2CCSFD5JJqdaP8/PdUUFOI2duGiJ/G8MR58WsAjPBPsO/x
	 Mzo5JSFiV2nBQjrVxeTFnHU2UlEbBJhPh36pfE7NfS8TMCHNDNo76Ed3unHJjoCq4g5aS
	 N2qhjppjyPZGiPQfSUTz9xdeQdHcdyO8U71uUiHN/VM2Zzi2PTSlimvBHm4Y47kUW3gsd
	 Nv+xpjj5FL05e+TIyg/XSnAHxeNg75dxxAslqtQEUsxqANBAfUVBi0uJPVNTN7fjSBw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789154080;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=QZpt/ZOaPi5l6qiW5bPe+uUoyhTIC1y+JzyF0dHcc8o=;
	b=cQDSebDGDBcGVvl+V1VA7yajPUAc+Y3BS59kq1zIyS2DK1Ef9m+9o63TCnIYVbsw4eta
	 LHRGLpLJAAhAgy2SXEweuS2+JBII6DYZDt/G22pgbxXGqwb05wFnkgiAFiZc1NcVfQHyH
	 Bb7xUtR6HXu6GMOvrvOY8cK9kzspaZIcNE71mKMdhlkBQWdj8rxtPeuENU6fmZlc9KC5y
	 rp8ubWk6wNX25v9AgTzHT2+Z1aWer/GcP54gqqg+ANo8LQEiR+iXGi5KfX6W8kWlVet0D
	 nTMMGXZ5w8NzOXhlAfQeZgek9t9ayn8XIQ3MOCMIBo4cUJ/+O2RTexYwmUygO0LirLQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789154080;
	bh=QZpt/ZOaPi5l6qiW5bPe+uUoyhTIC1y+JzyF0dHcc8o=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RXgi+8HUddGiwZVlnNAlf8DoYuwMfD5IQ1JfujWb/kJrwiWzW1q/bqFSOLqQBVLdp
	 VUy5VqXwgbgazJSNg10Ysw2JUH0memlyPDWn4iZS+mKmIkK53cQiQVSTkeCXiV1evn
	 K9u4Kb5rPZMBXdnqXxzx2ocD8FdMF44YrdrJFwg3Q5MnlxwQxklau4b1vUNJZQ895F
	 UmTqr3j7s4bWsLUAqtmTQWeXqyLFa26EozMoS5mGd1t8m/ojftk4IOVuFeFRlR8GPA
	 CrEH247Rhjr72GxSjx+u46Wyih2+5cicai+dicpd7eNRYXKDay/vpKvh1X1P2Vf1Eo
	 oamqUziNtsR3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3050160614;
	Fri, 11 Sep 2026 19:14:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C111D49D
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 19:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B33D2401F0
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 19:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nfdJOPIwJB7I for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 19:14:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7ADC640061
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789154077;
 b=b3fTIzFOI8ByPg0xTjFdYaqY/+/TnZxe6S/KVSLb7qDUjpwkcIbnlpC8qiaGVAJPgMVK
 3+/WJ8pfJOmbWjy9/D/wOh8WUVGdi8oY4dXiVT783X+rB2DwfQCcMyuOSytXPb4TmGvvb
 NuyJuG4wVLMi/d4O1Lb+iCxVNYdcHb4MSpRrQPYuz4DL+Jq6YDg3TrEIDzYTVzxe4xt1y
 NJaGqzO6PmBifi9T5gc6KaudcnrXYxkCDaNL5TSycB2Rs50tUL/yOusKTdiO00uGP7gYe
 cmdj7QGNU4Gej6FEhc4wgpVNPPIIrLJtTdiGU0LvEVFNgHOBBBz6VwaF8wNu7n+6/iA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789154077;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=f0AQ/c/RoxfNjtQerg9ePezg0itLbugU/QqrcwXkXHk=;
 b=slOS+J+02FX5HyEG3EQjVkTcW/O9RvNg43l6aFT+kkXtWMJetOtbm97NNB8R+hNbd0sn
 /5cdduP4fVxjWN6Hp8+fFprOBJETKH8VnKHIC19D2f4AtQZqPJ989D0s50eHnGkTLMP/q
 kJqQ9gjxrE26+BZRI9vx6ht/FTV0KTaImjZu3rQ8zcX2zWOuj51knBcwLEGjnh2fCvTfv
 Vn0tBGK47wMWSR+G+wNS0yU/1AmvfPNwVc/D/H50BZszc3askEAYkHXiVpkzw48vUEg5y
 Dudz0h/nJGZJlV2rpHwMai/6B22zxMdEoTcmKgAxerMZt6ogfvnRpjsG3hHc2DkOU4A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=V72Si4zv; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7ADC640061
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 19:14:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAwXr-1wypBe3bi5-009C4W; Fri, 11
 Sep 2026 21:14:32 +0200
Message-ID: <5a6e97f7-426c-4d40-b1a0-bc8d8d327c6f@gmx.de>
Date: Fri, 11 Sep 2026 21:14:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Weber <matt@thewebers.ws>, buildroot@buildroot.org
Cc: ju.o@free.fr
References: <20260910015832.17751-1-matt@thewebers.ws>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260910015832.17751-1-matt@thewebers.ws>
X-Provags-ID: V03:K1:wv+r+q7mgrXrAMG9STy9POUzv15FcZ2zSCuo0IgOZT/5G/+AwlY
 5Nb41ODzlG0GnzqtJNKKXsMAsjx2PP6fFBEFwAVJkzWFGWy7j6fz8F6KkWTCSr4s+tWA9Ga
 IPtgj1QeekIbiYFX2nnLF7PjkfajeiQEmbo7gAlGQ5twoAaHRvepWlEMAVSAqfA2aOaHpDm
 h7bUSFJVs2hnAKJO5iVZQ==
UI-OutboundReport: notjunk:1;M01:P0:Sy19PHlrxI4=;p0beb5S4Gohw29sY3p2MX1pqj/I
 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
Subject: Re: [Buildroot] [PATCH v3 1/1] docs: add agent guidance
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 10.09.26 um 03:58 schrieb Matthew Weber:
> Document Buildroot structure, documentation, build and validation
> workflows, mailing-list submission, Patchwork usage, and AI-assisted
> contribution requirements.
> 
> This file provides shared guidance for AI agents that recognize
> AGENTS.md. Claude Code projects can load it by importing @AGENTS.md
> from a root CLAUDE.md file.

I am strictly against merging this, or any other "AGENTS.md". Doing so 
would imply we (Buildroot/maintainers, which includes me) encourage 
LLM-generated patches. That is not acceptable to me.

Also, linking the Linux Foundation AI Policy under Further Reading would 
imply we adopt that, without having had any discussion about it. If we 
are going to adopt an AI policy, I propose the one used by Gentoo [1] 
(which comes with a nice concise rationale, too).

Best regards,
Fiona


[1] https://wiki.gentoo.org/wiki/Project:Council/AI_policy

> Assisted-by: GitHub Copilot
> Signed-off-by: Matthew Weber <matt@thewebers.ws>
> ---
> Changes v2 -> v3:
> 	- add Docker, local validation, GitLab CI, runtime-test, and Patchwork
> 		guidance, including the current Patchwork URLs (suggested by Julien
> 		Olivain)
> 	- add a root CLAUDE.md import for Claude Code
> 		(suggested by Yegor Yefremov)
> 
>   AGENTS.md | 300 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   CLAUDE.md |   1 +
>   2 files changed, 301 insertions(+)
>   create mode 100644 AGENTS.md
>   create mode 100644 CLAUDE.md
> 
> diff --git a/AGENTS.md b/AGENTS.md
> new file mode 100644
> index 0000000000..a4d11570fc
> --- /dev/null
> +++ b/AGENTS.md
> @@ -0,0 +1,300 @@
> +# AGENTS.md - Buildroot
> +
> +## Repository purpose
> +
> +Buildroot is a simple, efficient tool for generating embedded Linux systems
> +through cross-compilation.
> +
> +The repository contains:
> +
> +- `package/`: target and host package definitions
> +- `board/`: board-specific support files
> +- `configs/`: predefined board configurations
> +- `boot/`: bootloader and firmware support
> +- `linux/`: Linux kernel integration
> +- `system/`: target system configuration
> +- `toolchain/`: toolchain support
> +- `fs/`: root filesystem image generation
> +- `support/`: infrastructure, scripts, tests, and tooling
> +- `docs/`: the Buildroot user manual and website
> +- `DEVELOPERS`: file ownership and maintainer notification rules
> +
> +Read the relevant package, board, or infrastructure documentation before
> +changing its implementation.
> +
> +## Documentation
> +
> +The primary documentation is in `docs/manual/`.
> +
> +Useful entry points:
> +
> +- `docs/manual/manual.adoc`: manual index and build definition
> +- `docs/manual/quickstart.adoc`: first Buildroot build
> +- `docs/manual/common-usage.adoc`: common make targets and workflows
> +- `docs/manual/contribute.adoc`: contribution and patch-submission process
> +- `docs/manual/adding-packages.adoc`: adding packages
> +- `docs/manual/adding-board-support.adoc`: adding board support
> +- `docs/manual/developers.adoc`: `DEVELOPERS` and `get-developers`
> +- `docs/manual/resources.adoc`: community resources and Patchwork
> +- `docs/manual/prerequisite.adoc`: host requirements
> +
> +Generate the text manual with:
> +
> +```sh
> +make manual-text
> +```
> +
> +The generated text manual is written to `output/docs/manual/manual.text`.
> +Online documentation is available at <https://buildroot.org/docs.html>.
> +
> +## Building Buildroot
> +
> +Build as a normal user. From the repository root:
> +
> +```sh
> +make menuconfig
> +make
> +```
> +
> +The resulting kernel, bootloader, and root filesystem images are placed in
> +`output/images/`.
> +
> +Useful commands include:
> +
> +```sh
> +make list-defconfigs
> +make <boardname>_defconfig
> +make savedefconfig BR2_DEFCONFIG=<path>
> +make source
> +make legal-info
> +```
> +
> +Use `O=<output-directory>` for an out-of-tree output directory:
> +
> +```sh
> +make O=/path/to/output menuconfig
> +make O=/path/to/output
> +```
> +
> +Check `docs/manual/prerequisite.adoc` before diagnosing host dependency
> +problems. Buildroot requires GNU make 3.81 or newer and a Linux host.
> +
> +Host dependency problems can be avoided by using the Buildroot Docker
> +reference image, by prefixing commands with:
> +
> +```sh
> +utils/docker-run
> +```
> +
> +## Testing and validation
> +
> +Choose validation appropriate to the change:
> +
> +- Run `utils/check-package` on new or modified package files.
> +- Prefer the containerized check for patch preparation:
> +
> +  ```sh
> +  utils/docker-run make check-package
> +  ```
> +
> +- Validate `DEVELOPERS` changes with:
> +
> +  ```sh
> +  ./utils/get-developers -v
> +  ```
> +
> +- Check the validity of Kconfig `Config.in` files with:
> +
> +  ```sh
> +  utils/check-symbols
> +  ```
> +
> +  This check is also run by CI in
> +  <https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08/support/misc/gitlab-ci.yml.in#L55>.
> +
> +- Build a package with several toolchain configurations using:
> +
> +  ```sh
> +  utils/test-pkg -p <packagename>
> +  ```
> +
> +- Build the affected defconfig, package, board, or test target.
> +- Use the test infrastructure under `support/testing/` when the change
> +  affects runtime behavior.
> +
> +Run runtime tests with:
> +
> +```sh
> +utils/docker-run support/testing/run-tests -d dl -o output_folder <testname>
> +```
> +
> +See the `using-the-runtime-tests-framework` section in
> +<https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08/docs/manual/contribute.adoc#user-content-using-the-runtime-tests-framework>.
> +
> +Buildroot GitLab CI can also run runtime-test jobs; see the
> +`runtime-tests-and-gitlab-ci` section in
> +<https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08/docs/manual/contribute.adoc#user-content-runtime-tests-and-gitlab-ci>.
> +
> +- Generate documentation with `make manual-text` when changing the manual.
> +
> +Do not claim a change is tested unless the relevant command or build was run.
> +
> +If the public GitLab CI of the patch author is used, include the job link.
> +This saves time for maintainers and provides evidence of the work. For
> +example:
> +
> +- <https://patchwork.buildroot.org/project/buildroot/patch/20260906215252.499931-1-ju.o@free.fr/>
> +- <https://patchwork.buildroot.org/project/buildroot/patch/20260907110454.1071513-1-bernd@kuhls.net/>
> +
> +## Finding responsible developers
> +
> +`DEVELOPERS` lists developers associated with architectures, packages, boards,
> +and infrastructure. Use `utils/get-developers` to identify notification
> +recipients:
> +
> +```sh
> +./utils/get-developers <patch-files>
> +./utils/get-developers -e
> +./utils/get-developers -c
> +```
> +
> +When adding a new package, board, or significant functionality, update
> +`DEVELOPERS` in the same patch as described in `docs/manual/developers.adoc`.
> +
> +## Contribution workflow
> +
> +Buildroot uses the mailing list for discussion, review, and patch submission.
> +Patches are not submitted through the issue tracker.
> +
> +- Mailing list: `buildroot@buildroot.org`
> +- Subscription: <https://lists.buildroot.org/mailman/listinfo/buildroot>
> +- Archives: <https://lists.buildroot.org/pipermail/buildroot/>
> +- Searchable archives: <https://lore.kernel.org/buildroot/>
> +- Bug tracker: <https://gitlab.com/buildroot.org/buildroot/-/issues>
> +- IRC: `#buildroot` on OFTC
> +- Patchwork: <https://patchwork.buildroot.org/project/buildroot/list/>
> +
> +Read `docs/manual/contribute.adoc` before preparing a patch series.
> +
> +Keep patches focused and complete. Use the affected area as the commit-title
> +prefix, start the description with a lowercase word, explain why the change is
> +needed, and include a `Signed-off-by` line from the human contributor.
> +
> +Typical patch preparation:
> +
> +```sh
> +git fetch --all --tags
> +git rebase upstream/master
> +utils/docker-run make check-package
> +git format-patch -M -n -s -o outgoing upstream/master
> +./utils/get-developers outgoing/*
> +git send-email --to buildroot@buildroot.org --cc-cmd \
> +  './utils/get-developers -e' upstream/master
> +```
> +
> +Use `Tested-by`, `Reviewed-by`, and `Acked-by` only according to the meanings
> +documented in `docs/manual/contribute.adoc`.
> +
> +## Working with Patchwork
> +
> +Use Patchwork to inspect, test, and apply patches submitted to the mailing
> +list. Patchwork is not the submission mechanism.
> +
> +For an individual patch, download its mbox representation and apply it with
> +`git am`:
> +
> +```sh
> +git checkout -b test-patch
> +curl --fail --location \
> +  'https://patchwork.buildroot.org/project/buildroot/patch/<patch-id>/mbox/' |
> +  git am
> +```
> +
> +For a patch series, open the series listing in Patchwork and use the series
> +mbox link when available. Apply the complete series in one operation:
> +
> +```sh
> +git checkout -b test-series
> +curl --fail --location '<series-mbox-url>' | git am
> +```
> +
> +A series can also be applied by downloading each patch mbox in order, but the
> +series mbox or a Patchwork bundle is preferred because it preserves ordering
> +and commit metadata.
> +
> +Example series listing:
> +
> +<https://patchwork.buildroot.org/project/buildroot/list/?series=<series-id>>
> +
> +Example individual-patch mbox:
> +
> +<https://patchwork.buildroot.org/project/buildroot/patch/<patch-id>/mbox/>
> +
> +After applying a series, inspect the resulting commits and run validation for
> +the affected area:
> +
> +```sh
> +git log --oneline --decorate -n <number-of-patches>
> +make <affected-target>
> +utils/docker-run make check-package
> +```
> +
> +Patchwork's REST API may be used for searching or inspecting patch metadata,
> +but do not assume that API URLs provide an mbox download. Use the mbox link
> +provided by the Patchwork interface for applying patches, and verify the
> +downloaded content before running `git am`.
> +
> +## AI-assisted contributions
> +
> +AI tools may assist with code, documentation, analysis, and other meaningful
> +content.
> +
> +When AI-assisted work is committed or prepared for submission, follow the
> +commit-message and patch-formatting requirements in
> +[`docs/manual/contribute.adoc`](docs/manual/contribute.adoc#submitting-patches),
> +including the subject and body wrapping rules, required trailers, and human
> +sign-off.
> +
> +Meaningful AI-generated content must be attributed with an `Assisted-by` trailer
> +in the commit message:
> +
> +    Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
> +
> +Trivial completions, spelling corrections, and common boilerplate do not require
> +attribution. For substantial AI-generated content, summarize the relevant
> +prompts or session context in the commit message or patch description.
> +
> +AI tools must not add `Signed-off-by` trailers. The human contributor must:
> +
> +- review and understand all AI-assisted changes;
> +- run and assess appropriate validation;
> +- verify licensing and provenance;
> +- add their own `Signed-off-by` trailer;
> +- take responsibility for the submitted contribution.
> +
> +AI-assisted changes must not introduce license-incompatible material. Generated
> +content must be checked for factual correctness, appropriate attribution, and
> +compatibility with Buildroot and any affected package's license.
> +
> +AI-generated content should receive review proportional to its significance and
> +the degree of AI involvement. Do not submit generated output without human
> +understanding and validation.
> +
> +AI tools must not invoke `git send-email`, upload patches, or otherwise submit
> +patches on the contributor's behalf. When a patch is ready to submit, present
> +the proposed command sequence, including `git format-patch`,
> +`utils/get-developers`, and `git send-email`, for the contributor to review and
> +run themselves. Do not execute the sending or submission command.
> +
> +AI tools must not autonomously commit or push changes without explicit human
> +review and direction.
> +
> +### Local agent behavior
> +
> +Keep changes narrowly scoped to the requested behavior. Follow existing
> +Buildroot conventions and documentation. Preserve unrelated user changes.
> +Do not create commits or branches unless explicitly requested.
> +
> +### Further reading
> +
> +- [Linux Foundation Generative AI Policy](https://www.linuxfoundation.org/legal/generative-ai)
> diff --git a/CLAUDE.md b/CLAUDE.md
> new file mode 100644
> index 0000000000..43c994c2d3
> --- /dev/null
> +++ b/CLAUDE.md
> @@ -0,0 +1 @@
> +@AGENTS.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
