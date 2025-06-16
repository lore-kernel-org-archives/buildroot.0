Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B2DC71136
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 20:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0DAD608D5;
	Mon, 16 Jun 2025 20:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpjOD_Dh5MzX; Mon, 16 Jun 2025 20:21:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 127A4608D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 127A4608D6;
	Mon, 16 Jun 2025 20:21:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CBF516B
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EB0B404FC
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:21:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0zBIbDSfdgp for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 20:21:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0F5E403DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0F5E403DA
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0F5E403DA
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:21:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 47F911C05C0; Mon, 16 Jun 2025 22:21:31 +0200 (CEST)
Message-ID: <36673816-4270-483d-87f1-63066b514b51@rnout.be>
Date: Mon, 16 Jun 2025 22:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
 <20250613110559.2665663-5-fabien.lehoussel@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250613110559.2665663-5-fabien.lehoussel@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1750105291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5dcBoxN9E5ivLOuK6lhoUXps8sSSByGofWoIDr1NpAQ=;
 b=ZUs3M7oMPgz7zBmTRDQcChZ4lj6+2Esb7ZIX2sfGc7RKsD6BaZ8y4o+uE19Ig9RoBlz1w5
 VJg3znyV8jKQ1l04wz8FoOWb/tY8KJ+597HD+WiBY3QZ/zjwt37xVaAjXRy3yI/qJmR4Ga
 UaQ7OTABb8xLSombthpYKBel+c5R8H/S/8WCOCjwuK3/c9KuWMpjxR5wMteGFPRfur0Jmw
 3h9DvIIuoJsB35yfa4+xA5ayezYEwmVctLlK8tUsBCZdX7O1XwKNcizZZBFVuBe8w8BtiC
 k6Z5IHaw06uyLBQMxb3q+NOdQfK7uUynlBceWm3N76WhnlV6507N1/UcXgBZKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ZUs3M7oM
Subject: Re: [Buildroot] [PATCH 5/7] utils/generate-cyclonedx: add project
 name and version options
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



On 13/06/2025 13:05, Fabien Lehoussel via buildroot wrote:
> Adds command-line options to customize the project name and version
> in the generated SBOM metadata. This allows users to specify their
> own project identifiers rather than using the default Buildroot values.

  Yes! Excellent!


> Also sets Buildroot as a tool in the metadata section to properly
> identify the SBOM generation source.

  Ideally this would have been a separate patch, but not super important.

> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
> ---
>   utils/generate-cyclonedx | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 5a6a191606..1cbeca01ad 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -278,6 +278,12 @@ def main():
>                           default=(None if sys.stdin.isatty() else sys.stdin))
>       parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
>                           default=sys.stdout)
> +
> +    parser.add_argument("--project-name", type=str, default="buildroot",
> +                        help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
> +    parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
> +                        help="Specify the project version to use in the SBOM metadata (default: builroot version)")
> +
>       parser.add_argument("--virtual", default=False, action='store_true',
>                           help="This option includes virtual packages to the CycloneDX output")
>       parser.add_argument("--no-host-packages", default=False, action='store_true',
> @@ -305,11 +311,16 @@ def main():
>           "metadata": {
>               "timestamp": datetime.datetime.now().astimezone().isoformat(),
>               "component": {
> -                "bom-ref": "buildroot",

  Why did you remove the bom-ref? There is at the moment nothing referring to it 
of course, but if you want to e.g. add a vulnerability or a dependency to this 
component (in post-processing), then you need it.

  Maybe "buildroot" is not a great name for it, because this component is not 
actually Buildroot itself, but the (output resulting from the) specific 
configuration. But I think there should still be _some_ bom-ref.


> -                "name": "buildroot",
> -                "type": "firmware",
> -                "version": f"{BR2_VERSION_FULL}",
> +                "name": args.project_name,
> +                "version": args.project_version,
> +                "type": "operating-system",

  We choose "firmware" as the type because none of the options really fit, and 
"A special type of software that provides low-level control over a device's 
hardware." seemed to match most use cases (in particular, the term "special", 
the reference to "low-level" and "a device" - a Buildroot config is normally 
very specialised, typically contains largely low-level elements, and is 
typically specific for one device and not a general-purpose computer). It is 
AFAICS the only option that suggests it's something complete, i.e. operating 
system + platforms + frameworks/libraries + applications.

  For operating-system, the spec refers to Wikipedia, which (at the time I 
looked at it) defines it as "An operating system (OS) is system software that 
manages computer hardware and software resources, and provides common services 
for computer programs." A Buildroot-based component is typically the full 
system, so not just providing common services, so I don't think it's a better 
match than firmware.

  It could be an option to make this configurable as well, but honestly I think 
there is no option that matches in all cases and I don't think it's very 
important for most people. I would prefer to just drop the property entirely, 
but unfortunately this one _is_ required.


>               },
> +            "tools": [
> +                {
> +                    "name": "buildroot",
> +                    "version": f"{BR2_VERSION_FULL}",
> +                }

  This type of description of a tool is marked as deprecated in v1.6. It should 
instead be a list of components and a list of services. So I guess it should be 
something like:

	"tools": {
		"components": [
			{
				"type": "application",
				"name": "Buildroot generate-cyclonedx",
				"version": f"{BR2_VERSION_FULL}",
			},
		],
	}

  And because for this one we know it, we can easily throw in licenses (GPL-2.0) 
and copyright.

  Regards,
  Arnout
				


> +            ]
>           },
>           "components": [
>               cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
