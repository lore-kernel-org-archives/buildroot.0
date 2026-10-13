Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4169ACC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F119B80C72;
	Tue, 13 Oct 2026 21:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLuJlMWgvyzl; Tue, 13 Oct 2026 21:03:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 16D8080C23
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925419;
	b=UruuftAPQRUfBSKWOimPDiTxpasmD8GG92JJxbgVOZnOvRGEWv8DrLU9qHGDU85yNoko
	 LLctqz/+tc4uSBXFHfT+J/v1yokMjzhGdoRJaRrwdtfoORGbc33Z3fPEySZJMyPNCCNyf
	 +9Y609hfV6W9zUUzEmeUcQmO0vWcYZTmHjfJDaPRizv9TC4S28SQ3uRrtYjYvQ547Z0gY
	 snBdibazztlEgQICNcVYplKHrrrRDDZcs4YTQix1CWkT1sf97tFK1UuM9tJu8DDxCSOZs
	 oPIp6Nho1W95KJDTKHcpfOaiHlrViHjwmMjduVKoVhrdJfMXiU2Mgl08Q9YV2lnF0dg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925419;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=A2E2Dnwq6BC8UBuCwvAcTNlTEYGPyBwKbrNJNGkGHMw=;
	b=tGQIx1WFage34TYWgjr4lScSmkuE4+v1c9TGMC3uVN+64NWecKDoLrATv7iBcjPRfm4G
	 nW2CvwSwsFwGKHphHCcR/+frJyRdNe6jKVG67gzj91QCFPpA0rqrmX1ZwHop4OwtDyg3q
	 HNnUbPDUj5QzsxGT4NjpYmFAYdpPXE68cjHjjALRIXgAaHujlDZ9uKqCdPkUwZdTEP+qi
	 UtMiyl5ETevs++Wk2UZoUJhuqeyXXCVrH2MIHkgqbAaswVwHYrXRZ4LXXMOjkAn0HK4ey
	 refn4INtqEJtQkCSVGiVXXBMaqbYAhLVjzJm43vBRvif/TqMTRAE2Rzitwq5L9Mu+IQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925419;
	bh=A2E2Dnwq6BC8UBuCwvAcTNlTEYGPyBwKbrNJNGkGHMw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l9KQCTtX2Xf8mfDJlp2nm7uSljKWGLWVd8wKGCcigD1QNjXuO8idI8np9RI/q8RKF
	 f7tgV2Kx6wGPVLTemIeDlW2DopadyI4mFDgLy5N1ezlJ+TCgYqdhJkFsPQxzNy4s9G
	 tG1Rudfgw/rr5yaw4LkD5ZAWUseB62/rGp61ndH0aRW1iNxy6KIaxjznoO19zAy+PH
	 57f3086LWuT/YdBJYOcR+z7JgLt/HQDkh9KHhnN25jZj+/mW3+LHJnN4gaDkc+sn69
	 pxLXatgACfb53/y78UMQOoqrbrBHsJBCQhi4zxUjKsq3qkFUynsA8yEqcWt/ASBerJ
	 sQIrClRr3F4yQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16D8080C23;
	Tue, 13 Oct 2026 21:03:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 044762AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA725406E2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OW2STYOEzNT2 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:03:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3CBBD406E0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925417;
 b=PDbEcG272CU1aoE6TKFgUSR45h8NbR+1TX9lTCUmLwJrEVI/Z24fkckGQn9pSGJWAE1x
 thDSPjURPbQ4AKrUj/CwAgELVJtJhnhf+FukrMjE9yYqDywB32tXymFuVt1VzfTwa9lSv
 oPbhEGipFim451PsT/qytbUL4qRTg656Z9WI6dlunJD//R4x9+yo8x/hV3Hm1DUVbFeNt
 ELWwA8RcCUdZZ6iOV/s6iO+X0jGaTfrj+BOGsSHKs81kU5NMncfaG8uOlpuU5XuLpCRL8
 d+Z8Xlei7ibvsPfUzwr2a0+6zzoAELwv5U6meoMzK0Q5rCGxBej6d+tcNTukHuvmJzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925417;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=e8+rrgmJvlfgRK6EXroM3GzH/TyQbfM2c97deyavIq4=;
 b=Jrt70CnoyiYl2sniK/+Njq7qXyI1BqvCNdwtKC1WZofAHPT3PcM4Qwk849NVnoaarIka
 eLevrHZOzfK0dWzpCjKyOWDYYpYeNwVTJ+ahH71D36whimnK0xeurzkORzHSYvQC3VRLP
 krEdlslkxjtKgwf1k5Y2ozKgzGyOQZGcvfq6FteE/4nv80WjS+ejGhHoci8iZQldXBiA9
 NRpDkeAwlIMPGE+KwZS75tqNx8HAlTWma3vPR4G+gAvykmspqwzDXGo8DLUgI6qptcGmg
 jzx99maZEnG/ZB6Kvw5GLf6x2j+DI8JoOVQUk1CLymmY7FRPbGLrR8TKpbquX/WtNSA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CBBD406E0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:03:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7342F95B70; Tue, 13 Oct 2026 21:02:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 23:02:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aaafd2d6d9822121af5430c48f6e272bb5c333ce
X-Git-Newrev: ce34b0b208fc189268778483dede95d0b3109ee9
X-Patchwork-Hint: ignore
Message-Id: <20261013210217.7342F95B70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: perf: explicitily
 disable rust
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce34b0b208fc189268778483dede95d0b3109ee9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since kernel v7.0, perf uses `rustc --version` to know whether or not
rust is available. If rust is installed on the host, this `rustc
--version` works fine but then the perf build fails with following error
(on aarch64) if host-rust isn't selected:

rustc  /home/bastien/embedded-linux-imx93-frdm-labs/integration/buildroot/output/build/linux-7.1.3/tools/perf/tests/workloads/code_with_type.a
error[E0463]: can't find crate for `std`
  |
  = note: the `aarch64-unknown-linux-gnu` target may not be installed
  = help: consider downloading the target with `rustup target add aarch64-unknown-linux-gnu`

error: aborting due to 1 previous error

In perf, rust is only used by one file of the test suite
(tools/perf/tests/workloads/code_with_type.rs) so we can safely disable
it.

Always use the NO_RUST flag to build perf.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 3238948d76..8c91c2cc6b 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -29,6 +29,7 @@ PERF_MAKE_FLAGS = \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
 	NO_LIBBIONIC=1 \
+	NO_RUST=1 \
 	NO_SHELLCHECK=1
 
 # We need to pass an argument to ld for setting the emulation when
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
