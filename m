Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E10CD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2764840998;
	Wed,  7 Jan 2026 17:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UadhK3-rw6e; Wed,  7 Jan 2026 17:54:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D22F40FF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808449;
	bh=3wxZ40Cjf2HvysMMTykjAv25e6z1TmbSEZfwr/rSkME=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pcOTTmrtc9SO5bZJeEhi4h9P3Bn5AkFikhfI4u6syVF5pL37Sod9vq/PQTjy8Q/o5
	 TtwDMU/exqPcojxV76oENZTk16JnIXkNF0Ykwz1ka569qes7fr1aVpZcwpPx7H26Ae
	 poGt1XHMQUFkpjbwF+qxshasGol9aY9iNgmLwlAXReHtNOHUrWppytT2R01kalgM7M
	 /vRiiAhzDXCzbTcf5nYFDMXwwHgd/5Sa02EbKUb5IfKh0v17BJcC7fFm2BtiQl+Uf4
	 J066vnG9YcycF/U02v/euf+GA2ofpUBfUgghidFPlTc3r+l0wZvv8CmF2Wxjfnwj+b
	 8aQC7ELetHiRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D22F40FF1;
	Wed,  7 Jan 2026 17:54:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A215A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ED4E60667
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tnENE0UPqE15 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:54:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E10160661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E10160661
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E10160661
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 22619B97A704; Wed,  7 Jan 2026 18:54:04 +0100 (CET)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:54:00 +0100
Message-ID: <20260107175400.229150-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251116202053.3276072-2-fiona.klute@gmx.de>
References: <20251116202053.3276072-2-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808445; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=wwkbuKgJpuYaq3ruAasH3lAlktPCluyOF+2HJTjv780=;
 b=aOemWNzQDh5UfO8TGpbPjUJ0nslY+6owCEu4lJMksCwxktK2da18hV6BPY/qK8LrlZc967
 gN3VMuEyV+QTc8+d3Qhrb9aZBgAMsbTTNhPwD03EomdKVcg01SRmTRYfktytSkyjmQ+xSM
 wCntSFST34lR3NTV+qrbwUIy/TECVfoOYqS/GmQY4XYlsczuqL9G+TiBu/2rbZE/wYvFXM
 md/krcYZNR+HH7cx0EZY1LyzHyseuyQvW+W7meJjLI5FDGRIsmZgsmHyvK4q0blg8B1ohF
 EUMNfrJb/NND6rfi0fbl1iYG9Jy9YLWGcVDTr/lPYZjE23QSvAlTdcwxlXIOIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=aOemWNzQ
Subject: Re: [Buildroot] [PATCH 2/3] support/testing: infra: add host bin
 dir to PATH when running host command
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Some host commands need to call other host commands: For example,
> "mkimage" from host-uboot-tools needs to run "dtc". This would fail or
> call system commands without adding the host bin dir to PATH.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x. Thanks

> ---
> I guess this could be configurable, but I don't see why you wouldn't
> want PATH to include the host bin dir when running a host command.
> 
>  support/testing/infra/__init__.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
> index 52308395a3..9edbc8ff2b 100644
> --- a/support/testing/infra/__init__.py
> +++ b/support/testing/infra/__init__.py
> @@ -62,7 +62,11 @@ def run_cmd_on_host(builddir, cmd):
>      try:
>          out = subprocess.check_output(cmd,
>                                        cwd=builddir,
> -                                      env={"LANG": "C"},
> +                                      env={
> +                                          "LANG": "C",
> +                                          "PATH": "{}/host/bin:{}".format(
> +                                              builddir, os.environ["PATH"]),
> +                                      },
>                                        stderr=subprocess.STDOUT,
>                                        text=True,
>                                        universal_newlines=True)
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
