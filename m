Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DC8C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 14:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 739A440B3C;
	Sun, 23 Feb 2025 14:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDRn4pakxM2y; Sun, 23 Feb 2025 14:00:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75D6D40B3D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75D6D40B3D;
	Sun, 23 Feb 2025 14:00:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C53D7B88
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 14:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B516E40B3D
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 14:00:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a01NvY7GuRP9 for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 14:00:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B33F740B24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B33F740B24
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B33F740B24
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 14:00:55 +0000 (UTC)
Received: from [10.125.41.222] (unknown [37.174.185.162])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 90D63780383;
 Sun, 23 Feb 2025 15:00:47 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>,
 Thomas Perale <thomas.perale@mind.be>, <buildroot@buildroot.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matthias Swiggers <matthias.swiggers@mind.be>
Date: Sun, 23 Feb 2025 15:00:47 +0100
Message-ID: <19532fcc448.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
In-Reply-To: <7b1f278b-9e9a-4bdc-ba0e-532809936aa0@mind.be>
References: <20250206180614.984105-1-thomas.perale@mind.be>
 <7b1f278b-9e9a-4bdc-ba0e-532809936aa0@mind.be>
User-Agent: AquaMail/1.54.1 (build: 105401536)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740319252;
 bh=DK8yYRXmjE5rcA4fFEIYSQ+4pfkKuBZkxiSKK0SAiI4=;
 h=From:To:CC:Date:In-Reply-To:References:Subject:From;
 b=XsxInsjQQ/YRelna0JqoIDInpREbtfCRyiCyne+vswAm//rfZI1zbl58GMYCwcteB
 4SNp9JLWRqAEqFbBypMpLnK5uhjVdHBUXDF6uhm/t4owrbj6WjWsQUOZZ9xZWYdBQ1
 nG00+ZF0X/ngCSqlskzFfQ9B6GKkom/Y4QPn1LhauKztmXZOHxejA25nRcf5RdKpW0
 n/u4YXbGfZYr1tvTL+If/uHdQYQk3uspWzrvvU3ucQlHSa6LEkm185FI0OQ3md+88u
 IFzSY6/Zsu65o8buwMTrx9avy+7+7b/I6kypkIIyB0nLrLA8UAdqr5RKhcGV8XsX8w
 3YFC4D6QeIiAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XsxInsjQ
Subject: Re: [Buildroot] [v3,RFC,PATCH 0/2] Support CycloneDX SBOM
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
Content-Type: multipart/mixed; boundary="===============2751072746533281303=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============2751072746533281303==
Content-Type: multipart/alternative; boundary="195331c4e7f30c0285676fc7f5"

This is a multi-part message in MIME format.
--195331c4e7f30c0285676fc7f5
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Great. Thanks. It is a nice path for handling SBOM and having CVE tracking 
on releases.

Le 22 février 2025 18:40:11 Arnout Vandecappelle <arnout@mind.be> a écrit :

> Hi Thomas,
>
> On 06/02/2025 19:06, Thomas Perale wrote:
>> This series is the sequel of a patch series sent in April 2024
>> https://lore.kernel.org/buildroot/Zhb8vKs-ltd8ghUR@landeda/T/
>> from which it was agreed to parse the content of the `show-info` JSON
>> output with a python script instead of generating the SBOM from the makefile.
>>
>> The DependencyTrack instance is still available at 
>> https://dependencytrack-lqgs7zhwmq-ew.a.run.app/
>> for you to test CycloneDX and see the possibility.
>> Login with username `buildroot` and password `buildroot`.
>>
>> To generate a CycloneDX SBOM you can run the following command:
>>
>> ```
>> make show-info | utils/generate-cyclonedx.py | jq '.'
>> ```
>>
>> ## Changes from v2
>>
>> * show-info: removed the absolute path for the patches. Similar to the
>>    `staging_dir`, etc .. properties.
>> * Python: bug fixes
>> * Python: code retrieve the final of virtual package in the dependency without
>>    adding the virtual package to it.
>> * Python: In the vulnerabilities property is should be stated that it has been
>>    excluded by buildroot
>> * pkg-utils: Doesn't rely on `.applied_patches_list`, and instead returns a
>>    consistant list of patches. For now we will ignore the corner cases that rely
>>    on patching during the pre/post hooks.
>> * pkg-utils: Use the `pkg-patches-dir` function during the `.stamp_patched` 
>> step
>>    and the `<pkg>_HASH_FILE` variable in `pkg-generic.mk`.
>>    * This change would need special attention. The logic of the
>>      variable changed a bit, the previous implementation would only pick the
>>      hash/patch file in the version subdirectory if present if a hash/patch file
>>      also exist in the package directory it will also be applied.
>>      I don't think there is a case where where an hash file is present in
>>      the `<pkg>/<version/*.hash` directory as well as in `<pkg>/*.hash`
>>      directory. For instance the 'lua', 'openjdk-bin' package has hash files
>>      only in version sub-directory.
>
>  I finally applied the series but with quite a few changes.
>
>  First of all, I split the first patch into two commits: the first one just
> does the refactoring, and the second one adds the patches to show-info.
>
>  While testing, I discovered that the behaviour of hash files and patches is
> actually quite different: patches use only the version directory if it exists,
> while hashes use both the version dir and the base dir. In-tree, the behaviour
> for hashes _is_ actually used like that. For patches it is not, but there 
> may be
> externals that rely on it, so I didn't want to change that behaviour. 
> Therefore,
> the patches and hashes are not fully refactored. Look at the code to see what I
> ended up with.
>
>  There were a few more details as well:
>
>      - don't fully factor with _HASH_FILES because version is treaded
>        differently;
>      - introduce pkg-patch-hash-dirs;
>      - retain the RAWNAME comment, but move it to pkg-patch-hash-dirs;
>      - use foreach instead of shell loop, and $(seq) instead of exit 1;
>
> and on the generate-cyclonedx.py patch:
>
>      - alphabetically order imports;
>      - use endswith instead if 'in' to check suffix;
>      - add usage to help text;
>      - remove .py suffix.
>
>
>  Regards,
>  Arnout
>
>
>> Thomas Perale (2):
>>    package/pkg-utils.mk: add patches to show-info json
>>    support/scripts/generate-cyclonedx.py: add script to generate
>>      CycloneDX-style SBOM
>>
>>   package/pkg-utils.mk        |  20 +++
>>   utils/generate-cyclonedx.py | 307 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 327 insertions(+)
>>   create mode 100755 utils/generate-cyclonedx.py
>>


--195331c4e7f30c0285676fc7f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">Great. Thanks. It is a nice path for handling SBOM and ha=
ving CVE tracking on releases.</div><div dir=3D'auto'><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">Le 22 f=C3=A9vrier 2025 18:40:11 Arnout Vandecappelle &lt=
;arnout@mind.be&gt; a =C3=A9crit :</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Hi Thomas,</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On 06/02/2025 19:06, Thomas Perale wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">This series is the sequel of a patch series sent in April=
 2024</div>
<div dir=3D"auto">https://lore.kernel.org/buildroot/Zhb8vKs-ltd8ghUR@landed=
a/T/</div>
<div dir=3D"auto">from which it was agreed to parse the content of the `sho=
w-info` JSON</div>
<div dir=3D"auto">output with a python script instead of generating the SBO=
M from the makefile.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">The DependencyTrack instance is still available at https:=
//dependencytrack-lqgs7zhwmq-ew.a.run.app/</div>
<div dir=3D"auto">for you to test CycloneDX and see the possibility.</div>
<div dir=3D"auto">Login with username `buildroot` and password `buildroot`.=
</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">To generate a CycloneDX SBOM you can run the following co=
mmand:</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">```</div>
<div dir=3D"auto">make show-info | utils/generate-cyclonedx.py | jq '.'</di=
v>
<div dir=3D"auto">```</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">## Changes from v2</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">* show-info: removed the absolute path for the patches. S=
imilar to the</div>
<div dir=3D"auto">`staging_dir`, etc .. properties.</div>
<div dir=3D"auto">* Python: bug fixes</div>
<div dir=3D"auto">* Python: code retrieve the final of virtual package in t=
he dependency without</div>
<div dir=3D"auto">adding the virtual package to it.</div>
<div dir=3D"auto">* Python: In the vulnerabilities property is should be st=
ated that it has been</div>
<div dir=3D"auto">excluded by buildroot</div>
<div dir=3D"auto">* pkg-utils: Doesn't rely on `.applied_patches_list`, and=
 instead returns a</div>
<div dir=3D"auto">consistant list of patches. For now we will ignore the co=
rner cases that rely</div>
<div dir=3D"auto">on patching during the pre/post hooks.</div>
<div dir=3D"auto">* pkg-utils: Use the `pkg-patches-dir` function during th=
e `.stamp_patched` step</div>
<div dir=3D"auto">and the `&lt;pkg&gt;_HASH_FILE` variable in `pkg-generic.=
mk`.</div>
<div dir=3D"auto">* This change would need special attention. The logic of =
the</div>
<div dir=3D"auto">variable changed a bit, the previous implementation would=
 only pick the</div>
<div dir=3D"auto">hash/patch file in the version subdirectory if present if=
 a hash/patch file</div>
<div dir=3D"auto">also exist in the package directory it will also be appli=
ed.</div>
<div dir=3D"auto">I don't think there is a case where where an hash file is=
 present in</div>
<div dir=3D"auto">the `&lt;pkg&gt;/&lt;version/*.hash` directory as well as=
 in `&lt;pkg&gt;/*.hash`</div>
<div dir=3D"auto">directory. For instance the 'lua', 'openjdk-bin' package =
has hash files</div>
<div dir=3D"auto">only in version sub-directory.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&nbsp; I finally applied the series but with quite a few =
changes.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&nbsp; First of all, I split the first patch into two com=
mits: the first one just&nbsp;</div>
<div dir=3D"auto">does the refactoring, and the second one adds the patches=
 to show-info.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&nbsp; While testing, I discovered that the behaviour of =
hash files and patches is&nbsp;</div>
<div dir=3D"auto">actually quite different: patches use only the version di=
rectory if it exists,&nbsp;</div>
<div dir=3D"auto">while hashes use both the version dir and the base dir. I=
n-tree, the behaviour&nbsp;</div>
<div dir=3D"auto">for hashes _is_ actually used like that. For patches it i=
s not, but there may be&nbsp;</div>
<div dir=3D"auto">externals that rely on it, so I didn't want to change tha=
t behaviour. Therefore,&nbsp;</div>
<div dir=3D"auto">the patches and hashes are not fully refactored. Look at =
the code to see what I&nbsp;</div>
<div dir=3D"auto">ended up with.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&nbsp; There were a few more details as well:</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; - don't fully factor with _HASH_FILE=
S because version is treaded</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; differently;</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; - introduce pkg-patch-hash-dirs;</di=
v>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; - retain the RAWNAME comment, but mo=
ve it to pkg-patch-hash-dirs;</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; - use foreach instead of shell loop,=
 and $(seq) instead of exit 1;</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">and on the generate-cyclonedx.py patch:</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; - alphabetically order imports;</div=
>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; - use endswith instead if 'in' to ch=
eck suffix;</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; - add usage to help text;</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; - remove .py suffix.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&nbsp; Regards,</div>
<div dir=3D"auto">&nbsp; Arnout</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">Thomas Perale (2):</div>
<div dir=3D"auto">package/pkg-utils.mk: add patches to show-info json</div>
<div dir=3D"auto">support/scripts/generate-cyclonedx.py: add script to gene=
rate</div>
<div dir=3D"auto">CycloneDX-style SBOM</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">package/pkg-utils.mk &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;2=
0 +++</div>
<div dir=3D"auto">utils/generate-cyclonedx.py | 307 +++++++++++++++++++++++=
+++++++++++++</div>
<div dir=3D"auto">2 files changed, 327 insertions(+)</div>
<div dir=3D"auto">create mode 100755 utils/generate-cyclonedx.py</div>
<div dir=3D"auto"><br></div>
</blockquote>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--195331c4e7f30c0285676fc7f5--


--===============2751072746533281303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2751072746533281303==--

