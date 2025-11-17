Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAD7CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E0B1402DF;
	Mon, 17 Nov 2025 19:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i04Jf5SQak-C; Mon, 17 Nov 2025 19:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4AED407D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4AED407D3;
	Mon, 17 Nov 2025 19:56:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D69F1BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 131AD61279
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4pW1pNayJvt for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F5DD61408
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F5DD61408
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F5DD61408
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:56:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8442CB9798F4; Mon, 17 Nov 2025 20:56:15 +0100 (CET)
Message-ID: <c161e65c-e6e4-46e0-834d-f4dc8e8d03ba@rnout.be>
Date: Mon, 17 Nov 2025 20:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Cc: romain.gantois@bootlin.com,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
 <20251018194314.114284-2-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251018194314.114284-2-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409376; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=a91GWzUhG9/QUsYKquWUHxluX2coCrVBsjSph0roonc=;
 b=SZKNCZ/DsPkctQbGt/DVK4MueM3YoMT4zhtBFHwbhktDK8EV+OQLUvwrLXZpHY+9EbnCyD
 ypoepkuczxjzGwLUiVR2ogv6/Yk9+96oeE5CHvnxaf9CwVsyNhA69idUUWACE8TljI6J7m
 mGm0fBN7VLtoCQ+STIqw5bfJKMTCnO6v+xGsV41babzyEauxZMk2cW09uhSiCHSWqL9XGv
 NIcWVY6GGeV1CjIbSLoehVaxDi4sXnWiCpBmWK0heItTlUxK7nvoIY0ILtP4xXufXlwqcv
 wwHbg1BFDlmHXSypd3AvPvnziz9iSSyHgbgtt16kerP2wNP+bmdW3ZH/o5KACA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=SZKNCZ/D
Subject: Re: [Buildroot] [PATCH 01/11] support/testing/infra: improve
 run_cmd_on_host() to show stdout/stderr
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/10/2025 21:42, Thomas Petazzoni via buildroot wrote:
> When run_cmd_on_host() runs a command that fails, we only get an
> exception with no details to debug what happened. Let's improve that
> by catching the exception, and printing the command output. This
> requires redirecting stderr to stdout (instead of /dev/null) and
> asking to get the output in text format.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   support/testing/infra/__init__.py | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
> index 1f003f24c6..52308395a3 100644
> --- a/support/testing/infra/__init__.py
> +++ b/support/testing/infra/__init__.py
> @@ -59,11 +59,20 @@ def download(dldir, filename):
>   
>   def run_cmd_on_host(builddir, cmd):
>       """Call subprocess.check_output and return the text output."""
> -    out = subprocess.check_output(cmd,
> -                                  stderr=open(os.devnull, "w"),
> -                                  cwd=builddir,
> -                                  env={"LANG": "C"},
> -                                  universal_newlines=True)
> +    try:
> +        out = subprocess.check_output(cmd,
> +                                      cwd=builddir,
> +                                      env={"LANG": "C"},
> +                                      stderr=subprocess.STDOUT,
> +                                      text=True,
> +                                      universal_newlines=True)
> +    except subprocess.CalledProcessError as e:
> +        print(f"Command failed with return code {e.returncode}")
> +        print("=== STDOUT/STDERR ===")
> +        print(e.output)
> +        print("=====================")
> +        raise
> +
>       return out
>   
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
