From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 8 May 2020 10:03:42 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/ncurses: bump to version
 6.2
In-Reply-To: <20200423081648.4cc1b73e@windsurf.home>
References: <20200229232016.4174325-1-aduskett@gmail.com>
 <20200421232618.18245478@windsurf.home>
 <CAAXf6LUZr9SxjoQeTrfxmOqOEKqFtBh1o+AprOSQeuoHOKEDRQ@mail.gmail.com>
 <20200423081648.4cc1b73e@windsurf.home>
Message-ID: <CAAXf6LXiiJjLVKtyART5AmZvm=DmKPXmo+2TKkiM9iUt=QmX0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Seems I hadn't replied to this mail yet, sorry...

El jue., 23 abr. 2020 a las 8:16, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:

...

>
> It is worth noting that ftp://ftp.invisible-island.net/ncurses/current/
> has complete tarballs for each of the "updated" 6.2 versions.
> Unfortunately the name of the folder, current/ and the fact that the
> 6.1 tarballs are not there makes me think such tarballs might disappear
> over time from this location.

Yes exactly, I don't think these links are stable and they will be
removed later.
The FAQ gives an insight on the process used (even though this line is
about development patches, not the tarballs you mentioned):
https://invisible-island.net/ncurses/ncurses.faq.html#applying_patches

"After providing a rollup patch, I remove the development patches to
reduce clutter. Beginning in May 2013, I modified the process to
provide all of the development patches since the release in
"dev-patches.zip". "


>
> However using those tarballs would allow us to use 6.2-20200418 as the
> version, which would match what release-monitoring.org has:
> https://release-monitoring.org/project/2057/.
>
> Otherwise, we can also do something like this:
>
> NCURSES_BASE_VERSION = 6.2
> NCURSES_PATCH_VERSIONS = \
>         20200215 \
>         20200222 \
>         20200229 \
>         20200301 \
>         20200308 \
>         20200314 \
>         20200321 \
>         20200328 \
>         20200404 \
>         20200411 \
>         20200418
> NCURSES_SOURCE = ncurses-$(NCURSES_BASE_VERSION).tar.gz
> NCURSES_PATCH = \
>         $(patsubst %,https://invisible-mirror.net/archives/ncurses/$(NCURSES_BASE_VERSION)/ncurses-$(NCURSES_BASE_VERSION)-%.patch.gz,$(NCURSES_PATCH_VERSIONS))
> NCURSES_VERSION = $(NCURSES_BASE_VERSION)-$(lastword $(NCURSES_PATCH_VERSIONS))

In the 6.1 case, we first had to apply a .sh.bz2 file and then on top
of that a list of .gz patches.

NCURSES_PATCH = \
    $(addprefix
https://invisible-mirror.net/archives/ncurses/$(NCURSES_VERSION)/, \
        ncurses-6.1-20190609-patch.sh.bz2 \
        ncurses-6.1-20190615.patch.gz \
        ncurses-6.1-20190623.patch.gz \

so if reducing the list to only dates, then this could not be
achieved.  From Buildroot commit
10fae9624b3c58e00e5406e8b489c4674d680380:

    Ncurses upstream uses a fairly special way of releasing (security) bugfixes.
    Approximately once a week an incremental .patch.gz is released, and once in
    a while these incremental patches are bundled up to a bigger patch relative
    to the current release in .patch.sh.bz2 format (a bzip2 compressed patch
    with a small shell script prepended, luckily apply-patches can handle that),
    and the relative patch files deleted.

    For details of this process, see the upstream FAQ:
    https://invisible-island.net/ncurses/ncurses.faq.html#applying_patches

    Apply the latest .patch.sh.bz2 and incremental patches up to 20200118 to fix
    a number of (security) issues.  Notice that these patch files are NOT
    available on the GNU mirrors.


Best regards,
Thomas
