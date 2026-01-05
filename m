Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E481CC2A062
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 07:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83B7580C48;
	Mon,  5 Jan 2026 07:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hByYQHLvzbjS; Mon,  5 Jan 2026 07:58:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E06CA80C49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767599898;
	bh=WeQP+8kXUd7e9JUfAjIrIs1KyboVAA6v1/IohbBOFMo=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gAFetX+9mGknljZBsLBHCST4Q9a3CoTR1YV0viMexIjKiOwpB3QLgEsHEcSmlBJYq
	 oWJWMipTfSkskp1cCoJcOKtVe63lOY+ZPodDx7pnlnZQnov5UTRb/qKoPVIIL0MABZ
	 JqMwhD2kcG76+qvJGeeZX+Gjp6zgbqghcRLMPqpIQJ+BdV17hawtdDc9wJlStqEcD7
	 SgGfEvkyezpxH0EdANme/PjKiQeRBGOz5pmFB/E1M1gO+RByKfA/3WHbdueAfnwPlS
	 20iDl0L0y0r0mWgi/Qf0TPU9sROMZljJ1q682d+AJtffVW13XO0Wk0YKGkLDOKjLcz
	 swUru3KbS6e1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E06CA80C49;
	Mon,  5 Jan 2026 07:58:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CEC9EE7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 07:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0CCF4016A
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 07:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2jy-6_9FhDY for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 07:58:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB21B40169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB21B40169
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB21B40169
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 07:58:14 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5957db5bdedso15839799e87.2
 for <buildroot@buildroot.org>; Sun, 04 Jan 2026 23:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767599892; x=1768204692;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vMjbGaMolnD7ZzLhJx5b0zIGlhf18mfqxjgzvkIhNr0=;
 b=t558NA0Blr/tQMLo/A3zX0AdYZb4VJ5//dp4oAuq0XxFL4q65lHyR4kpNvJAdGSwQb
 +ZEAjxCv86Asyx8wL2pi/IvGcGJUsUNF8TgdraBK90dBr3SFhZUku2m3hdLvQexto1Zl
 xGmVmfEB0e3kyAmjMC6djYk9AFCpkm6W6p0VdkzJatMWvecgRtLtSoJtsWnhDUFA0axY
 G9qHhWyO9mNS5bHVAqEuRdtt9sbGzDa8tYv4b33u2VbdnAE7ZmTtfktNqkYvPI0LRvnZ
 dUnKG+uq9i00NnbPaEUcdU6+6MDDkaCrikK/+G7Y689f4Hrw0AOwXyxHxz8VVdwo6yRt
 EZzQ==
X-Gm-Message-State: AOJu0YyZrXI9MwPp4Is2uKZtgkVOG69A2MsD97StaWn//E9WbqJh5one
 qGp+xYn5My2W4QADnijETiaCL/hw25GAWHW8SJrxCjYcUmyKnzpjLqY4YFTdK3DnaF/7cjNTTdH
 IcKusO/AVpq8OidpX8FTH9Dte3hSAZsZv0ESYt+xL2c6sIENOOx4xhnM=
X-Gm-Gg: AY/fxX6QlwiW02LSmsA1RImR7F/3BmA2swxIejV73xH3V2zm6kG/InZN8Ir1ajsTUb5
 iarrBXrgMFbAPYHki0qKaW/5zMYGecAb3Pv5TJ57npBP8WQec9dhMaNDdPSgCT5beR2NXyseojN
 rzDufXee1sXgNYLSspEimvodhau9hQOegzxcYvdqg+Vdh7CbicLR+RaSN7rahY5pItbXWIJt/ep
 zFZ+P9upcU9fdCDcVOiggxL8C9zloMIw0cAoo5/AslGcbOtVevCG6oVZq7emC++AmeB5KE3XOcG
 K+TtAoXA
X-Google-Smtp-Source: AGHT+IH0zlvwqWkgxNtApcHyrw7PXhSlCj/NozIRy/vsJLZMHyiOcrb93QmstHzBNRPpRapkCGPkYMQxBdKQzs3FAPI=
X-Received: by 2002:a05:6512:114f:b0:598:ef90:3e9b with SMTP id
 2adb3069b0e04-59a17d5dc24mr18109516e87.34.1767599891755; Sun, 04 Jan 2026
 23:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20260102150757.1480511-1-fabien.lehoussel@smile.fr>
 <20260102154840.708055-1-thomas.perale@mind.be>
In-Reply-To: <20260102154840.708055-1-thomas.perale@mind.be>
Date: Mon, 5 Jan 2026 08:58:00 +0100
X-Gm-Features: AQt7F2qVOiwE-8mUlGtkn7GRd1NK2sICJQtuux-e5Bc1a2V-ZU0YKWLbIGG6GI4
Message-ID: <CAKWtHtwtzi-ada7fq8DgzDyYqkSvhZfv0XpAZXJ61Jjbwuqn-Q@mail.gmail.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1767599892; x=1768204692; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vMjbGaMolnD7ZzLhJx5b0zIGlhf18mfqxjgzvkIhNr0=;
 b=DLaTpYTVJPu64M+2v1Ig7uM/34n5TjFRtyEq5riIIKeU4dWwZx73fEgCMzTHssNDYi
 HTTbIM/gVoC1dgOqI76GUyzq36gSPFxlCMxFBdMU2AFfI2OwneAOFEB21NPuCDHvzgZ+
 8PLZbJXyhvZMSvu/z9mE5TuOqclWgRftRFYaw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=DLaTpYTV
Subject: Re: [Buildroot] [PATCH 1/5] utils/generate-cyclonedx: update
 package filtering for SBOM generation
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
From: Fabien LEHOUSSEL via buildroot <buildroot@buildroot.org>
Reply-To: Fabien LEHOUSSEL <fabien.lehoussel@smile.fr>
Content-Type: multipart/mixed; boundary="===============2939513533665187780=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2939513533665187780==
Content-Type: multipart/alternative; boundary="000000000000a745f706479f6b60"

--000000000000a745f706479f6b60
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 2 janv. 2026 =C3=A0 16:48, Thomas Perale <thomas.perale@mind.be> a
=C3=A9crit :

> In reply of:
> > - Filter packages to include only those with external download sources
> (i.e., not bundled within Buildroot).
> > - Remove virtual package handling from dependency analysis.
> >
> > Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
>
> Hi Fabien,
>
> Thanks for your submissions.
>
> Regarding this change could you be more specific in the commit message on
> why
> this is needed. What are the packages that aren't in the final SBOM when
> applying this change and why we don't want them in the final SBOM ?
>
> I think you want to remove the 'skeleton' packages from the final SBOM
> right ?
>
>
Hi Thomas,

I added this filter to remove non "real packages", packages without real
sources and therefore not tracked with CPE or PURL.

For example, using the log function added in the next commit, this new
filter removes the following packages from my custom configuration:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Difference between original and filtered dictionary
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=F0=9F=93=8A Statistics:
  - Total original: 121 packages
  - Kept: 101 packages
  - Removed: 20 packages

=E2=9D=8C Removed packages (20):
    - host-gettext
    - host-makedevs
    - host-mkpasswd
    - host-openssl
    - host-rustc
    - host-skeleton
    - host-zlib
    - ifupdown-scripts
    - initscripts
    - openssl
    - rootfs-common
    - rootfs-cpio
    - rootfs-ext2
    - skeleton
    - skeleton-init-common
    - skeleton-init-sysv
    - toolchain
    - toolchain-external
    - udev
    - zlib

Test with entire Buildroot packages :

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Difference between original and filtered dictionary
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Statistics:
  - Total original: 3688 packages
  - Kept: 3626 packages
  - Removed: 62 packages

Removed packages (62):
  - at91bootstrap3
  - b43-firmware
  - cgroupfs-v2-mount
  - flutter-engine
  - getent
  - gettext
  - host-environment-setup
  - host-fakedate
  - host-gettext
  - host-go
  - host-luainterpreter
  - host-makedevs
  - host-mkpasswd
  - host-mkpimage
  - host-nodejs
  - host-openssl
  - host-rustc
  - host-skeleton
  - host-zlib
  - hwclock-initscript
  - ifupdown-scripts
  - initscripts
  - jpeg
  - libegl
  - libgbm
  - libgl
  - libgles
  - libopencl
  - libopenmax
  - libopenvg
  - linux-tools
  - luainterpreter
  - mcookie
  - nodejs
  - opensbi
  - openssl
  - optee-client
  - optee-examples
  - optee-test
  - powervr
  - rootfs-common
  - rootfs-cpio
  - rootfs-ext2
  - skeleton
  - skeleton-custom
  - skeleton-init-common
  - skeleton-init-none
  - skeleton-init-openrc
  - skeleton-init-systemd
  - skeleton-init-sysv
  - tinyinit
  - toolchain
  - toolchain-bare-metal-buildroot
  - toolchain-buildroot
  - toolchain-external
  - toolchain-external-bootlin
  - tz
  - udev
  - urandom-scripts
  - xilinx-embeddedsw
  - xilinx-prebuilt
  - zlib
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Fabien

You can provide a analysis over the entire Buildroot packages by changing a
> single line in `Makefile`:
>
> ```
> diff --git a/Makefile b/Makefile
> index d2257ed3a3..0735f39d68 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -920,7 +920,7 @@ show-info:
>         @:
>         $(info $(call clean-json, \
>                         { $(foreach p, \
> -                               $(sort $(foreach i,$(PACKAGES)
> $(TARGETS_ROOTFS), \
> +                               $(sort $(foreach i,$(PACKAGES_ALL)
> $(TARGETS_ROOTFS), \
>                                                 $(i) \
>                                                 $($(call
> UPPERCASE,$(i))_FINAL_RECURSIVE_DEPENDENCIES) \
>                                         ) \
> ```
>
> Regards,
> PERALE Thomas
>
> > ---
> >  utils/generate-cyclonedx | 23 +++++++++--------------
> >  1 file changed, 9 insertions(+), 14 deletions(-)
> >
> > diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> > index a103b7b707..29c73f3616 100755
> > --- a/utils/generate-cyclonedx
> > +++ b/utils/generate-cyclonedx
> > @@ -280,7 +280,7 @@ def cyclonedx_component(name, comp):
> >          **({
> >              "version": comp["version"],
> >              **(cyclonedx_licenses(comp["licenses"]) if "licenses" in
> comp else {}),
> > -        } if not comp["virtual"] else {}),
> > +        } if "version" in comp else {}),
> >          **({
> >              "cpe": comp["cpe-id"],
> >          } if "cpe-id" in comp else {}),
> > @@ -337,12 +337,10 @@ def cyclonedx_vulnerabilities(show_info_dict):
> >      } for cve, components in cves.items()]
> >
> >
> > -def br2_parse_deps_recursively(ref, show_info_dict, virtual=3DFalse,
> deps=3D[]):
> > +def br2_parse_deps_recursively(ref, show_info_dict, deps=3D[]):
> >      """Parse dependencies from the show-info output. This function wil=
l
> >      recursively collect all dependencies, and return a list where each
> dependency
> >      is stated at most once.
> > -    The dependency on virtual package will collect the final dependenc=
y
> without
> > -    including the virtual one.
> >
> >      Args:
> >          ref (str): The identifier of the package for which the
> dependencies have
> > @@ -359,9 +357,8 @@ def br2_parse_deps_recursively(ref, show_info_dict,
> virtual=3DFalse, deps=3D[]):
> >      """
> >      for dep in show_info_dict.get(ref, {}).get("dependencies", []):
> >          if dep not in deps:
> > -            if virtual or show_info_dict.get(dep, {}).get("virtual") i=
s
> False:
> > -                deps.append(dep)
> > -            br2_parse_deps_recursively(dep, show_info_dict, virtual,
> deps)
> > +            deps.append(dep)
> > +            br2_parse_deps_recursively(dep, show_info_dict, deps)
> >
> >      return deps
> >
> > @@ -376,8 +373,6 @@ def main():
> >                          default=3D(None if sys.stdin.isatty() else
> sys.stdin))
> >      parser.add_argument("-o", "--out-file", nargs=3D"?",
> type=3Dargparse.FileType("w"),
> >                          default=3Dsys.stdout)
> > -    parser.add_argument("--virtual", default=3DFalse, action=3D'store_=
true',
> > -                        help=3D"This option includes virtual packages =
to
> the CycloneDX output")
> >      parser.add_argument("--project-name", type=3Dstr, default=3D"build=
root",
> >                          help=3D"Specify the project name to use in the
> SBOM metadata (default:'buildroot')")
> >      parser.add_argument("--project-version", type=3Dstr,
> default=3Df"{BR2_VERSION_FULL}",
> > @@ -391,10 +386,10 @@ def main():
> >
> >      show_info_dict =3D json.load(args.in_file)
> >
> > -    # Remove rootfs and virtual packages if not explicitly included
> > -    # from the cli arguments
> > +    # Keep only packages with at least one download source defined
> > +    # (packages with _SITE variable in Buildroot makefile).
> >      filtered_show_info_dict =3D {k: v for k, v in show_info_dict.items=
()
> > -                               if ("rootfs" not in v["type"]) and
> (args.virtual or v["virtual"] is False)}
> > +                                if (len(v.get('downloads', [])) > 0)}
> >
> >      cyclonedx_dict =3D {
> >          "bomFormat": "CycloneDX",
> > @@ -429,10 +424,10 @@ def main():
> >          ],
> >          "dependencies": [
> >              cyclonedx_dependency("buildroot",
> list(filtered_show_info_dict)),
> > -            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref=
,
> show_info_dict, args.virtual))
> > +            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref=
,
> filtered_show_info_dict))
> >                for ref in filtered_show_info_dict],
> >          ],
> > -        "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
> > +        "vulnerabilities":
> cyclonedx_vulnerabilities(filtered_show_info_dict),
> >      }
> >
> >      args.out_file.write(json.dumps(cyclonedx_dict, indent=3D2))
> > --
> > 2.43.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000a745f706479f6b60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 2 =
janv. 2026 =C3=A0=C2=A016:48, Thomas Perale &lt;<a href=3D"mailto:thomas.pe=
rale@mind.be">thomas.perale@mind.be</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">In reply of:<br>
&gt; - Filter packages to include only those with external download sources=
 (i.e., not bundled within Buildroot).<br>
&gt; - Remove virtual package handling from dependency analysis.<br>
&gt; <br>
&gt; Signed-off-by: Fabien Lehoussel &lt;<a href=3D"mailto:fabien.lehoussel=
@smile.fr" target=3D"_blank">fabien.lehoussel@smile.fr</a>&gt;<br>
<br>
Hi Fabien,<br>
<br>
Thanks for your submissions.<br>
<br>
Regarding this change could you be more specific in the commit message on w=
hy<br>
this is needed. What are the packages that aren&#39;t in the final SBOM whe=
n<br>
applying this change and why we don&#39;t want them in the final SBOM ?<br>
<br>
I think you want to remove the &#39;skeleton&#39; packages from the final S=
BOM right ?<br>
<br></blockquote><div><br></div><div>Hi Thomas,=C2=A0</div><div><br></div><=
div>I added this filter to remove non &quot;real packages&quot;, packages w=
ithout real sources and therefore not tracked with CPE or PURL.</div><div><=
br></div><div>For example, using the log function added in the next commit,=
 this new filter removes the following packages from my custom configuratio=
n:</div><div><br></div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>Difference =
between original and filtered dictionary<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>=F0=9F=93=8A Statistics:<br>=C2=A0 - Total original: 121 packages<br>=
=C2=A0 - Kept: 101 packages<br>=C2=A0 - Removed: 20 packages<br><br></div><=
div>=E2=9D=8C Removed packages (20):<br>=C2=A0 =C2=A0 - host-gettext<br>=C2=
=A0 =C2=A0 - host-makedevs<br>=C2=A0 =C2=A0 - host-mkpasswd<br>=C2=A0 =C2=
=A0 - host-openssl<br>=C2=A0 =C2=A0 - host-rustc<br>=C2=A0 =C2=A0 - host-sk=
eleton<br>=C2=A0 =C2=A0 - host-zlib<br>=C2=A0 =C2=A0 - ifupdown-scripts<br>=
=C2=A0 =C2=A0 - initscripts<br>=C2=A0 =C2=A0 - openssl<br>=C2=A0 =C2=A0 - r=
ootfs-common<br>=C2=A0 =C2=A0 - rootfs-cpio<br>=C2=A0 =C2=A0 - rootfs-ext2<=
br>=C2=A0 =C2=A0 - skeleton<br>=C2=A0 =C2=A0 - skeleton-init-common<br>=C2=
=A0 =C2=A0 - skeleton-init-sysv<br>=C2=A0 =C2=A0 - toolchain<br>=C2=A0 =C2=
=A0 - toolchain-external<br>=C2=A0 =C2=A0 - udev<br>=C2=A0 =C2=A0 - zlib<br=
></div><div>=C2=A0</div><div>Test with entire Buildroot packages :=C2=A0</d=
iv><div><br></div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>Difference betwee=
n original and filtered dictionary<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>St=
atistics:<br>=C2=A0 - Total original: 3688 packages<br>=C2=A0 - Kept: 3626 =
packages<br>=C2=A0 - Removed: 62 packages<br><br>Removed packages (62):<br>=
=C2=A0 - at91bootstrap3<br>=C2=A0 - b43-firmware<br>=C2=A0 - cgroupfs-v2-mo=
unt<br>=C2=A0 - flutter-engine<br>=C2=A0 - getent<br>=C2=A0 - gettext<br>=
=C2=A0 - host-environment-setup<br>=C2=A0 - host-fakedate<br>=C2=A0 - host-=
gettext<br>=C2=A0 - host-go<br>=C2=A0 - host-luainterpreter<br>=C2=A0 - hos=
t-makedevs<br>=C2=A0 - host-mkpasswd<br>=C2=A0 - host-mkpimage<br>=C2=A0 - =
host-nodejs<br>=C2=A0 - host-openssl<br>=C2=A0 - host-rustc<br>=C2=A0 - hos=
t-skeleton<br>=C2=A0 - host-zlib<br>=C2=A0 - hwclock-initscript<br>=C2=A0 -=
 ifupdown-scripts<br>=C2=A0 - initscripts<br>=C2=A0 - jpeg<br>=C2=A0 - libe=
gl<br>=C2=A0 - libgbm<br>=C2=A0 - libgl<br>=C2=A0 - libgles<br>=C2=A0 - lib=
opencl<br>=C2=A0 - libopenmax<br>=C2=A0 - libopenvg<br>=C2=A0 - linux-tools=
<br>=C2=A0 - luainterpreter<br>=C2=A0 - mcookie<br>=C2=A0 - nodejs<br>=C2=
=A0 - opensbi<br>=C2=A0 - openssl<br>=C2=A0 - optee-client<br>=C2=A0 - opte=
e-examples<br>=C2=A0 - optee-test<br>=C2=A0 - powervr<br>=C2=A0 - rootfs-co=
mmon<br>=C2=A0 - rootfs-cpio<br>=C2=A0 - rootfs-ext2<br>=C2=A0 - skeleton<b=
r>=C2=A0 - skeleton-custom<br>=C2=A0 - skeleton-init-common<br>=C2=A0 - ske=
leton-init-none<br>=C2=A0 - skeleton-init-openrc<br>=C2=A0 - skeleton-init-=
systemd<br>=C2=A0 - skeleton-init-sysv<br>=C2=A0 - tinyinit<br>=C2=A0 - too=
lchain<br>=C2=A0 - toolchain-bare-metal-buildroot<br>=C2=A0 - toolchain-bui=
ldroot<br>=C2=A0 - toolchain-external<br>=C2=A0 - toolchain-external-bootli=
n<br>=C2=A0 - tz<br>=C2=A0 - udev<br>=C2=A0 - urandom-scripts<br>=C2=A0 - x=
ilinx-embeddedsw<br>=C2=A0 - xilinx-prebuilt<br>=C2=A0 - zlib<br>=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br></div><div><br></div><div>Fabien</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
You can provide a analysis over the entire Buildroot packages by changing a=
<br>
single line in `Makefile`:<br>
<br>
```<br>
diff --git a/Makefile b/Makefile<br>
index d2257ed3a3..0735f39d68 100644<br>
--- a/Makefile<br>
+++ b/Makefile<br>
@@ -920,7 +920,7 @@ show-info:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(info $(call clean-json, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 { $(foreach p, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(sort $(foreach i,$(PACKAGES) $(TARG=
ETS_ROOTFS), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(sort $(foreach i,$(PACKAGES_ALL) $(=
TARGETS_ROOTFS), \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 $(i) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 $($(call UPPERCASE,$(i))_FINAL_RECURSIVE_DEPENDENCIES)=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ) \<br>
```<br>
<br>
Regards,<br>
PERALE Thomas<br>
<br>
&gt; ---<br>
&gt;=C2=A0 utils/generate-cyclonedx | 23 +++++++++--------------<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 14 deletions(-)<br>
&gt; <br>
&gt; diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx<br>
&gt; index a103b7b707..29c73f3616 100755<br>
&gt; --- a/utils/generate-cyclonedx<br>
&gt; +++ b/utils/generate-cyclonedx<br>
&gt; @@ -280,7 +280,7 @@ def cyclonedx_component(name, comp):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 **({<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;version&quot;: c=
omp[&quot;version&quot;],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 **(cyclonedx_licenses(=
comp[&quot;licenses&quot;]) if &quot;licenses&quot; in comp else {}),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } if not comp[&quot;virtual&quot;] else {=
}),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } if &quot;version&quot; in comp else {})=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 **({<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cpe&quot;: comp[=
&quot;cpe-id&quot;],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } if &quot;cpe-id&quot; in comp else=
 {}),<br>
&gt; @@ -337,12 +337,10 @@ def cyclonedx_vulnerabilities(show_info_dict):<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 } for cve, components in cves.items()]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -def br2_parse_deps_recursively(ref, show_info_dict, virtual=3DFalse, =
deps=3D[]):<br>
&gt; +def br2_parse_deps_recursively(ref, show_info_dict, deps=3D[]):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Parse dependencies from the show=
-info output. This function will<br>
&gt;=C2=A0 =C2=A0 =C2=A0 recursively collect all dependencies, and return a=
 list where each dependency<br>
&gt;=C2=A0 =C2=A0 =C2=A0 is stated at most once.<br>
&gt; -=C2=A0 =C2=A0 The dependency on virtual package will collect the fina=
l dependency without<br>
&gt; -=C2=A0 =C2=A0 including the virtual one.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 Args:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ref (str): The identifier of the pac=
kage for which the dependencies have<br>
&gt; @@ -359,9 +357,8 @@ def br2_parse_deps_recursively(ref, show_info_dict=
, virtual=3DFalse, deps=3D[]):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for dep in show_info_dict.get(ref, {}).get(&quot;d=
ependencies&quot;, []):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dep not in deps:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if virtual or show_info_dic=
t.get(dep, {}).get(&quot;virtual&quot;) is False:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps.append(d=
ep)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 br2_parse_deps_recursively(=
dep, show_info_dict, virtual, deps)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps.append(dep)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 br2_parse_deps_recursively(=
dep, show_info_dict, deps)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 return deps<br>
&gt;=C2=A0 <br>
&gt; @@ -376,8 +373,6 @@ def main():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 default=3D(None if sys.stdin.isatty() else sys.stdin))=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 parser.add_argument(&quot;-o&quot;, &quot;--out-fi=
le&quot;, nargs=3D&quot;?&quot;, type=3Dargparse.FileType(&quot;w&quot;),<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 default=3Dsys.stdout)<br>
&gt; -=C2=A0 =C2=A0 parser.add_argument(&quot;--virtual&quot;, default=3DFa=
lse, action=3D&#39;store_true&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 help=3D&quot;This option includes virtual packages to the Cy=
cloneDX output&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 parser.add_argument(&quot;--project-name&quot;, ty=
pe=3Dstr, default=3D&quot;buildroot&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 help=3D&quot;Specify the project name to use in the SB=
OM metadata (default:&#39;buildroot&#39;)&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 parser.add_argument(&quot;--project-version&quot;,=
 type=3Dstr, default=3Df&quot;{BR2_VERSION_FULL}&quot;,<br>
&gt; @@ -391,10 +386,10 @@ def main():<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 show_info_dict =3D json.load(args.in_file)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 # Remove rootfs and virtual packages if not explicitly =
included<br>
&gt; -=C2=A0 =C2=A0 # from the cli arguments<br>
&gt; +=C2=A0 =C2=A0 # Keep only packages with at least one download source =
defined<br>
&gt; +=C2=A0 =C2=A0 # (packages with _SITE variable in Buildroot makefile).=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 filtered_show_info_dict =3D {k: v for k, v in show=
_info_dict.items()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (&quot;rootfs&quot; not in v[&=
quot;type&quot;]) and (args.virtual or v[&quot;virtual&quot;] is False)}<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len(v.get(&#39;downloads&#39=
;, [])) &gt; 0)}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 cyclonedx_dict =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;bomFormat&quot;: &quot;Cyclone=
DX&quot;,<br>
&gt; @@ -429,10 +424,10 @@ def main():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dependencies&quot;: [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cyclonedx_dependency(&=
quot;buildroot&quot;, list(filtered_show_info_dict)),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *[cyclonedx_dependency(ref,=
 br2_parse_deps_recursively(ref, show_info_dict, args.virtual))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *[cyclonedx_dependency(ref,=
 br2_parse_deps_recursively(ref, filtered_show_info_dict))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for ref in filt=
ered_show_info_dict],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;vulnerabilities&quot;: cyclonedx_vu=
lnerabilities(show_info_dict),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;vulnerabilities&quot;: cyclonedx_vu=
lnerabilities(filtered_show_info_dict),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 args.out_file.write(json.dumps(cyclonedx_dict, ind=
ent=3D2))<br>
&gt; -- <br>
&gt; 2.43.0<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div></div>

--000000000000a745f706479f6b60--

--===============2939513533665187780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2939513533665187780==--
