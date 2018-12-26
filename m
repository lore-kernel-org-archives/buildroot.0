From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Dec 2018 19:58:52 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <20181226183422.76c6ff6c@windsurf.home>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
 <1f520844-5501-a60b-cf66-5bae57b9f420@andin.de>
 <20181205173103.1eb30a7b@windsurf>
 <672791f3-4383-cad2-f31c-5362b94b94fb@andin.de>
 <8a886731-26ee-ba33-f303-81d5bd0e7954@andin.de>
 <20181226183422.76c6ff6c@windsurf.home>
Message-ID: <20181226185852.GI14286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-12-26 18:34 +0100, Thomas Petazzoni spake thusly:
> On Thu, 6 Dec 2018 11:21:25 +0100, Andreas Naumann wrote:
> > Just to make sure I just did the above using your ppsh-v6 branch with 
> > the wandboard_defconfig. The only additional change was to use the 
> > external linaro toolchain. After 'make'
> >    $ readelf -d output/host/sbin/mkfs.ext3
> > shows
> >    0x000000000000001d (RUNPATH)            Bibliothek runpath: 
> > [/local/gsrc/buildroot.upstream/output/per-package/host-e2fsprogs/host/lib]
[--SNIP--]
> OK, so I investigated this issue, and now I understand where it comes
> from, but I'm not yet sure how to fix it properly.
[--SNIP--]
> Now, with per-package directory enabled, the RPATH of binaries when
> building looks like this:
>   Library rpath: [/home/thomas/projets/buildroot/output/per-package/host-e2fsprogs/host/lib]
> 
> So it is no longer within the ROOTDIR passed as patchelf's
> --make-rpath-relative argument.
[--SNIP--]
> At this point, I am not sure at which level and how the issue should be
> fixed. Needs some thought. Input/ideas welcome.

Well, one obvious suggestion would be to run patchelf after the
installation of each package, and scan the package-file-0list to limit
ourselves to the files the current package just installed (to avoid
re-patchelf-ing what has already been patchelf-ed).

That way, we know at that time what the host dir is, and we can tweak it
appropriately.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
