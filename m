From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Jan 2013 23:47:18 +0100
Subject: [Buildroot] [PATCH 2/7] package/pmake: add host pmake
In-Reply-To: <201301302343.22202.yann.morin.1998@free.fr>
References: <cover.1359498504.git.yann.morin.1998@free.fr>
 <5109509F.50404@mind.be> <20130130233222.54f9173e@skate>
 <201301302343.22202.yann.morin.1998@free.fr>
Message-ID: <5109A2F6.5090106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/01/13 23:43, Yann E. MORIN wrote:
> Thomas, Arnout, All,
>
> On Wednesday 30 January 2013 Thomas Petazzoni wrote:
>> Dear Arnout Vandecappelle,
>>
>> On Wed, 30 Jan 2013 17:55:59 +0100, Arnout Vandecappelle wrote:
>>
>>>    Doesn't it?  It seems to work for liblockfile...
>>
>> Does it really work properly?
>>
>> In the past, a tarball was directly fed into patch, which was finding
>> some patch contents and that's it. Since then, the apply-patches.sh
>> script has been reworked to properly apply the patches within a
>> tarball, but I don't think it applies patches that are contained in
>> a debian/patches/ directory.
>
> Ah, I missed that. Indeed it works.
>
> What happens (eek! apply-patches.sh is hard to read) is that, if a patch
> is neamd like a tarball, it is extracted in a temp dir, and that temp dir
> is scanned as if it was passed as arg to apply-patches.sh:

  It's scanned recursively, even.

  And it uses the series file, if present.

>
> ---8<---
> elif echo "$i" | grep -q -E "\.tar(\..*)?$|\.tbz2?$|\.tgz$" ; then
>      unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
>      rm -rf "$unpackedarchivedir" 2> /dev/null
>      mkdir "$unpackedarchivedir"
>      tar -C "$unpackedarchivedir" -xaf "${path}/$i"
>      scan_patchdir "$unpackedarchivedir"
> ---8<---
>
> So, yes, it works. Yet, I still find it a bit ugly (but less so than I
> initially suspected). And it is not documented.
>
> Should this be considered a feature? Can we rely on it?
>
> If so, then I'll update the doc accordingly.

  I seem to remember that support for tar and a series file was added for 
exactly this purpose.

  In terms of ugliness: is there an alternative? Except not relying on 
Debian patches, of course... I was going to say: you could try the Gentoo 
version, but that one is actually using the Debian patches too :-)

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
