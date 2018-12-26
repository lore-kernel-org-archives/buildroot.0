From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 26 Dec 2018 19:33:59 +0100
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
Message-ID: <CAAXf6LVJ6-H-pBA8C9i8LJxmQ=8ufdvOC3uHG5-cqz-WPyt=sg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

El mi?., 26 dic. 2018 a las 18:34, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
>
> Hello,
>
> Arnout, Yann, see below some discussion where your input might be
> useful.
>
> On Thu, 6 Dec 2018 11:21:25 +0100, Andreas Naumann wrote:
>
> > Just to make sure I just did the above using your ppsh-v6 branch with
> > the wandboard_defconfig. The only additional change was to use the
> > external linaro toolchain. After 'make'
> >    $ readelf -d output/host/sbin/mkfs.ext3
> > shows
> >    0x000000000000001d (RUNPATH)            Bibliothek runpath:
> > [/local/gsrc/buildroot.upstream/output/per-package/host-e2fsprogs/host/lib]
> >
> > which is already unexpected, shouldn't it show .../output/host/lib?
> > After 'make prepare-sdk'
> >    $ readelf -d output/host/sbin/mkfs.ext3
> > shows
> >    0x000000000000001d (RUNPATH)            Bibliothek runpath: []
>
> OK, so I investigated this issue, and now I understand where it comes
> from, but I'm not yet sure how to fix it properly.
>
> Basically, *without* per-package directory enabled, the RPATH of
> binaries looks like this:
>
>   Library rpath: [/home/thomas/projets/buildroot/output/host/lib]
>
> then, support/scripts/fix-rpath calls patchelf with the following
> invocation:
>
>   /home/thomas/projets/buildroot/output/host/bin/patchelf --make-rpath-relative /home/thomas/projets/buildroot/output/host --relative-to-file /home/thomas/projets/buildroot/output/host/sbin/mke2fs
>
> This works fine, and causes the resulting binary to have the following
> RPATH:
>
>   Library runpath: [$ORIGIN/../lib]
>
> You can see that the original "Library rpath", which
> is /home/thomas/projets/buildroot/output/host/lib is located *inside*
> the ROOTDIR passed as the --make-rpath-relative
> option: /home/thomas/projets/buildroot/output/host.
>
> Now, with per-package directory enabled, the RPATH of binaries when
> building looks like this:
>
>   Library rpath: [/home/thomas/projets/buildroot/output/per-package/host-e2fsprogs/host/lib]
>
> So it is no longer within the ROOTDIR passed as patchelf's
> --make-rpath-relative argument.
>
> The logic used by patchelf is explained in
> package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch:
>
> ====
>
> RPATHDIR starts with "$ORIGIN":
>     The original build-system already took care of setting a relative
>     RPATH, resolve it and test if it's valid (does exist)
>
> RPATHDIR starts with ROOTDIR:
>     The original build-system added some absolute RPATH (absolute on
>     the build machine). Test if it's valid (does exist).
>
> ROOTDIR/RPATHDIR exists:
>     The original build-system already took care of setting an absolute
>     RPATH (absolute in the final rootfs), resolve it and test if it's
>     valid (does exist).
>
> RPATHDIR points somewhere else:
>     (can be anywhere: build trees, staging tree, host location,
>     non-existing location, etc.). Just discard such a path.
>
> ====
>
> So, without per-package directory, we fall in case (2) above.
>
> With per-package directory, we fall in case (4) above, and therefore
> the RPATH is discarded.
>
> At this point, I am not sure at which level and how the issue should be
> fixed. Needs some thought. Input/ideas welcome.
>

In a similar context I once had following problem:
http://lists.busybox.net/pipermail/buildroot/2018-August/226955.html
This was for target binaries, rather than host, but for the below
discussion it does not matter.

Looking back at this problem, taking into account the above comment
from the patchelf patch, I would say that my problem would have been
fixed if case (4) above would not discard the path.

If that change would be adopted, then it would also preserve the rpath
'/home/thomas/projets/buildroot/output/per-package/host-e2fsprogs/host/lib'.

Of course, in your case you might actually want a different final
rpath, i.e. rewrite it to the consolidated host directory. I think
that in this case it would be better to read the rpath via patchelf,
calculate the transformed rpath from our own script, then writing it
back via patchelf,  rather than adding more options into patchelf with
e.g. transformation rules.

Best regards,
Thomas
