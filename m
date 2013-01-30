From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Jan 2013 23:43:21 +0100
Subject: [Buildroot] [PATCH 2/7] package/pmake: add host pmake
In-Reply-To: <20130130233222.54f9173e@skate>
References: <cover.1359498504.git.yann.morin.1998@free.fr>
 <5109509F.50404@mind.be> <20130130233222.54f9173e@skate>
Message-ID: <201301302343.22202.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On Wednesday 30 January 2013 Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Wed, 30 Jan 2013 17:55:59 +0100, Arnout Vandecappelle wrote:
> 
> >   Doesn't it?  It seems to work for liblockfile...
> 
> Does it really work properly?
> 
> In the past, a tarball was directly fed into patch, which was finding
> some patch contents and that's it. Since then, the apply-patches.sh
> script has been reworked to properly apply the patches within a
> tarball, but I don't think it applies patches that are contained in
> a debian/patches/ directory.

Ah, I missed that. Indeed it works.

What happens (eek! apply-patches.sh is hard to read) is that, if a patch
is neamd like a tarball, it is extracted in a temp dir, and that temp dir
is scanned as if it was passed as arg to apply-patches.sh:

---8<---
elif echo "$i" | grep -q -E "\.tar(\..*)?$|\.tbz2?$|\.tgz$" ; then
    unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
    rm -rf "$unpackedarchivedir" 2> /dev/null
    mkdir "$unpackedarchivedir"
    tar -C "$unpackedarchivedir" -xaf "${path}/$i"
    scan_patchdir "$unpackedarchivedir"
---8<---

So, yes, it works. Yet, I still find it a bit ugly (but less so than I
initially suspected). And it is not documented.

Should this be considered a feature? Can we rely on it?

If so, then I'll update the doc accordingly.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
