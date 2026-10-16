Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A70DCCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E317A60EE8;
	Fri, 16 Oct 2026 13:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffw9ARoYSULF; Fri, 16 Oct 2026 13:09:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BEAAB60EE3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156181;
	b=rbRH65CGqB7UjU7wflj4zJ9Hv6kq04CT4jDRPDeEM5OBiHciuxJoyoN6lrmVSKPcX28e
	 NiTQWds6hf6UuAsv5ibHxN1Lwcu2ldX0aKZ80gFvcvq3CIcg+iyKEXReB+Lg0GQjynmnC
	 ZGEd3NVja5dxKf9qgYcHyiHfW++o2f1kz5EL1D0pZnzIXH29qlAoU0ePjcRjVygal+Jl5
	 0hgoyVIENnpHnvbnulxkP4glYFoMiB0nstBfVKzapG9pIQarKzxLufR7pchZe87bqygKU
	 a8f7Xzph9d2iP+ysgNkNTqkjb0it/An4IlnZPAbsYgKsSyVvo6hF1GXeBmlTePXioRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156181;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wle5C9KKQ3GjXv9rjERv6DX0NVDaoIIC+qOIP7Ln4Ho=;
	b=Zx7Us7LVm7XvHws2kRq2wDFuo3MM8H0+lHR2h3gF+oVKcx029SxCd6GxiABSSXnLmJNI
	 aG3TSOoOWWPEGrNQCE2IuzZLdkgAOh3MNJGfeupnYNDRYahHXFq7Y1VPPTy9TkPOjJGC5
	 9+hBFkap95+7GEN3bS/2874wsuY1ch4h6N6ncUjk/BcFjX/5t6wHlqFnISFcop3xohBFN
	 FZOg2Q4AMROq0IVcrK/MIgyfurksOv3Nb/nW+Ab1dzrN/q79DdHvwujsLAOWjY14D3UMD
	 hzzS+4a9vp9wdALxEMyt4WDBXk4zKxkzeFamP4ioK2zVjVgIqh5GqHC8oxh6HL4Kmfg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156181;
	bh=wle5C9KKQ3GjXv9rjERv6DX0NVDaoIIC+qOIP7Ln4Ho=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DOYaCjfwgFlaWHJXlSL4AH1vTrP5tgcQulr3xbrftFBM2RxhIx40N5VpOP0KUmt9U
	 NmRuFbzNkaHRpKCcW+hStXQCPZoe7xQZj8zIvoKUwHpERIpI1A/JLiA6sl1GWeEUVF
	 DOuF4q1AqGqn9XCtNjJy2fUEpyf5G7oz5OxBdQ5F3X3fA5MW6qD2kWrrdTSWVJzAAZ
	 oOseD/HT9JGu5hbkOP9GjnnWFLzKMIq1Dh6Rp9rA0z8Em6OPNrhJofvSNSCj/JIQJ0
	 JYbUAw3Z00DYfWZfxKVQI1Gy6DKNZJx8tnPGKmrNUTioIRwPebDTfAeFuqZkrDDD7s
	 eIghnRsh9qhfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEAAB60EE3;
	Fri, 16 Oct 2026 13:09:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90988769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81633409F4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zS4bPkbbdIwM for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C7FFB40A0C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=M991Fn7cgfh0qKDundv+vrJ8FLOE7UG6S6YubUPzq0780nofU582wl7UxxVZTUPbVQRE
 ymaRNIigIVG1CIFa0lwV7l0wFgiumfq8Va1l17lGFsSgz9dNyM3Nsa8cylcdBK7Vv4VM/
 HuAlZgwtAm1U5eyPr8ay8+Zh7dL71vQB1hxqgGJ3twZxbUhPFdDVizPKR43151GuZUfGg
 tARA2dQyiUPc+D4mZOn/a+FpkBElD7lf2qt5W6CDMvteBxevOl8q5Kybt/j3FeBE6/hQa
 PSf4APzBqaaxWlslQfuBUkhb3lf/LhxbUccAjEmrgsZ4PuBTN1eJnNaGpVsmQP0r4gQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=W/0Jea3TZXErUZG6saYn0wBxcqaFsf7b1kgbdz4bYys=;
 b=CixAg586YSavFgEi6eH7le02VKt/C0EZ9XVx21/g6cNZFRtnO+aXiS/oMYrtWwUA+w/p
 LHNv8o42XVZLPKbp0UuBqgFCT5nXjkA2TZgDw26sOW1NnjRqSrn++/VdMED+bLx3M6jXj
 1wa2K0vSpXwmTkl4QPR0OR9XNodnvaeGj9/v4tuamJix7BcQdQ+veD9XjSrUr7lIWHpGx
 zxLQdk/KV+eeub9T5zEkwHKkWwBdk51C2S/qngFsEl5GqWkW1r6F80eDrG59lL7JxfsKe
 Eraf+ZyfA2IFbNUucUYTONn+9Usz8el9TAf9OioqklIl10bydWcUbozI65lg5id+OvA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7FFB40A0C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6AB6960D8; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f8292495ab493ccfe56dbf381223ac71bb04a99e
X-Git-Newrev: 2f044e5a034cea91187501d5b8361dbc5a4a09e0
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.B6AB6960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/docker/Dockerfile: make $HOME folder read-only
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
Content-Type: multipart/mixed; boundary="===============2316981382277035263=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2316981382277035263==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2f044e5a034cea91187501d5b8361dbc5a4a09e0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The $HOME folder of the br-user inside the container is currently
read-write for the br-user. However, practically speaking, it is only
read-write when the UID of the user running the container from the
host machine is 1000, equal to the UID of the br-user inside the
container. For any other UID on the host machine, the $HOME folder is
in fact already read-only.

Because we do not expect Buildroot to write into $HOME, and in order
to have a consistent behavior regardless of the UID of the user on the
host machine, we change our Docker image to make the $HOME folder of
the br-user entirely non-writable.

Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fac6d92a27925192b3cb8107449e7abfe01e2cf3)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 support/docker/Dockerfile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 687eee8110..75ff73f65c 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -95,6 +95,10 @@ RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
 RUN useradd -ms /bin/bash br-user && \
     chown -R br-user:br-user /home/br-user
 
+# Make the br-user home directory not writable, even for br-user
+# itself, to catch builds writing into $HOME
+RUN chmod 555 /home/br-user
+
 USER br-user
 WORKDIR /home/br-user
 ENV HOME=/home/br-user

--===============2316981382277035263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2316981382277035263==--
