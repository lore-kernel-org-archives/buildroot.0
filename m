Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E61CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CF3C60FFE;
	Fri, 16 Oct 2026 13:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJQIh8BMeeWc; Fri, 16 Oct 2026 13:10:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 549AD6100A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156244;
	b=k7tkL4ZcxL+93d2qkJlyXFdFvBcxSnpNBIykcskxO79vFbK5Bjz4PQt5j5DFvu3u/4qE
	 P/W0fyZuw8DLXxJu5N5EzIwSKEjs2dsCmjGrX7m0jPUK5OqRf7zcPftAp1JIndT1URCFL
	 Qdq/YU+ilpj8t52twl0oZPN3h5kZyQRjzYUKQaSMnye4gzVnr8raVklE0McoJgoqvSIxg
	 wFPErKMqbY0dgx4JOxvmerOXLjPKxLh7f0rpwZ7TcUwcEUXo5VS9h/0vD94vqii9vhW83
	 Nhhah0lC3MCU17OFt9jW/bENJ23IB6nVW0helWGMwqogerUuPC3lns6vt6eRRVSzvsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156244;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=JpxwsXTk5/5SkOQ8wQkbzhQfmD12pALQVi7NpL0pMbo=;
	b=QhoQvgalTSoGkPDxJOrXC5mwH7YGHiiomTQsyft67VOOMCNgwnD/VPn9ViAnHzvF2EPJ
	 3QelHLSVqUc7ElbsT1hs1X28L4XjjKnuWGmNTCzJ8g+VZ13gMTer3rhvFZNwQ/cOt4Xh1
	 SLAp3r/8jjTYjPApP+0JNF++tcGPv7FE0lwMa7xL56Z/NXA6RiQt9aD/ozSfHhEeWMAVx
	 zkPawwehZAwQOFhZZVX+aYX09u6SAompRN+5AogT9ExxI6QbeMEfZN9Eibdzn5Y+o0cqI
	 oZMVDv+fNrqiavpTRCfjaDwqQ8RmssQ8BnQnLDRQo5dQxaNOCL1VMkz/tyqgTcs5QpQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156244;
	bh=JpxwsXTk5/5SkOQ8wQkbzhQfmD12pALQVi7NpL0pMbo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fqlR2zPVDcZuCMoDE9zYzhjbNAJjI3au9d7cXlqJC5pnM6sv3btkx0sUjrdYoAphA
	 2KTigrvIFhZkloGGeMqXnnPxdBmN7tMw8HKNE3AkwPyXEgfWSX7Uaf5ZQt13oKym+X
	 R1ik8wSh/rf9mmf4MGz8EQ4e+PGFYkCyQoQb0NtmfJDEQjVKefo70qH5wFoYtpVov/
	 Ud4kmWF05kKYPuf3zYCJTZJoAaB3rwzxRMte+lnFiVziKQbxys0l+h3UuGTG7TdB0X
	 Sb0lA3x425hoqazJj3i+ccum22NNC4umqawCHrIyMSe7HAxizRtQ3zWM1q0zFn8VId
	 sQunsFFCzDrpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 549AD6100A;
	Fri, 16 Oct 2026 13:10:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32067769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18059814A0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vczB6xP9fpXA for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 19777814C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156109;
 b=cP6RumjQaKJpQXEAhpyhkHWvoxnYNImRiJb0BJyRguadc8tiowXTaJxFddAJXplhforN
 3knvkIF9lujofW8yW4RwwjRBsWtfIbr+QOO2gJxoG2gr1knF8pEF0Agx4SJ/SwpHb7Yfl
 tN+sJPx9j+W1r334Jj3Kj5Z6lNQVdV4EKKmEFCNhEjEceNgt5qZDAlcZh/rosDRSrsS+v
 xz+/k2idbx7ssQi9y1OiYsLVPKwxHfg7U5HN0mCAsqqZoYdTiAqvxVl0HQJ9rxR655OR2
 tQrbIC2NXcFT6Y8rhT1EsaKAvePrNq1Ba/5zM+TROpiw4QW2I8WYZSLx3GuYJY8koHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156109;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FpF7XbV1Deem3PC9HtLWMa9bAGQG+wRRRCJW7CHqFQA=;
 b=SLfTuDf3AIF8Nqs/ttrX5m/lgLXVauKBzCwhqqoK7p+wnp7wZ2E2R7MBluX3cf1tC/uc
 aEWWzB/qY/w99Ow3cFgfQ0NN1vyCunCCePGJa2A53McPdL6PmFlgIwNkgWhXGfOLzuP5B
 YN4Awj+WihrdhRHiiLbxoeJlQFLLRlswva7DfSSX+D6JQ9kJxgc4IoS64vA0CBGepGzpL
 bfJtCk9XUa9OkvH9luesSQkYQmAe9V3Q9ni0g3usffevLpr6x0B7i3pkIvHF48jYTw7Lb
 AV6TZvJ9kAyXhLdWEEHddwt+9/wTZKyfK969SHPMAt3cLfZvZSzwZ6m6zIoBB3+20uw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19777814C4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A2DA960D7; Fri, 16 Oct 2026 13:07:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3ef62296032b3696b83034cd0591d8f568e02c19
X-Git-Newrev: a2fdcaeb01264000a20716110a78bc961e8751e0
X-Patchwork-Hint: ignore
Message-Id: <20261016130708.0A2DA960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
 add comment to explain spec_version
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8654703795756666929=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8654703795756666929==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a2fdcaeb01264000a20716110a78bc961e8751e0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The commit [1] introduced the `cdx_spec_version` variable.
The reason for that variable is not immediately clear. Only the license
schema can use patch revision while the spec version should always
exclude the patch revision.

This commit adds a comment clarifying this.

[1] 504bb61bc6 utils/generate-cyclonedx: support custom schema version

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 319aa2b9ed30f542124a32efbd3b27e92261b4bb)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/generate-cyclonedx | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 9d3baa23f1..1fbf020a3d 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -562,6 +562,10 @@ def main():
     filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
                                if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
 
+    # Only keep the first two numbers of the 'cdx-version' argument.
+    # While the patch revision (e.g. 1.6.2) can be used for the license list,
+    # only the first two numbers (e.g. 1.6) are valid in the schema and the
+    # 'specVersion'.
     cdx_spec_version = ".".join(args.cdx_version.split(".")[:2])
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",

--===============8654703795756666929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8654703795756666929==--
