From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Nov 2014 16:48:22 +0100
Subject: [Buildroot] [PATCH v3 2/2] elfutils: bump version to 0.160
In-Reply-To: <5461F7A0.2030107@mind.be>
References: <1415703637-11831-1-git-send-email-Vincent.Riera@imgtec.com>
 <1415703637-11831-3-git-send-email-Vincent.Riera@imgtec.com>
 <5461F7A0.2030107@mind.be>
Message-ID: <20141111154822.GJ4240@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Vicente, All,

On 2014-11-11 12:48 +0100, Arnout Vandecappelle spake thusly:
> On 11/11/14 12:00, Vicente Olivert Riera wrote:
> > - Bump version to 0.160
> > - Add a hash file
> > - Adapt patches to the new version
> > - Add a new patch to really make -Werror conditional to BUILD_WERROR
> > 
> > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> [snip]
> 
> > diff --git a/package/elfutils/0006-really-make-werror-conditional-to-build-werror.patch b/package/elfutils/0006-really-make-werror-conditional-to-build-werror.patch
> > new file mode 100644
> > index 0000000..59aae5e
> > --- /dev/null
> > +++ b/package/elfutils/0006-really-make-werror-conditional-to-build-werror.patch
> > @@ -0,0 +1,24 @@
> > +Really make -Werror conditional to BUILD_WERROR
> 
>  This subject is wrong, since it's not conditional on BUILD_WERROR (and
> BUILD_WERROR isn't even defined by the configure script). So it should just be
> "Remove -Werror from build" or something similar.

Well, if you look a few lines further in config/eu.am you'll see:

    if BUILD_WERROR
    AM_CFLAGS += $(if $($(*F)_no_Werror),,-Werror)
    endif

So, this patch remove the duplicate setting of -Werror in the place
where it is not wanted, because it is already conditional to
BUILD_WERROR, even though it should be BUILD_WERROR_TRUE that should be
tested.

But the real automake conditional is really called BUILD_WERROR:

    ./configure.ac:AM_CONDITIONAL(BUILD_WERROR, test "$enable_werror" = yes)

So, IU still believe the patch title is correct, except upstream messed
up their conditional test.

Regards,
Yann E. MORIN.

> > diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
> > new file mode 100644
> > index 0000000..f0f4598
> > --- /dev/null
> > +++ b/package/elfutils/elfutils.hash
> > @@ -0,0 +1,3 @@
> > +# Locally calculated
> > +sha256  741b556863c069ceab2d81eb54aeda8c34f46728859704eaf9baef8503e9a9d1  elfutils-0.160.tar.bz2
> > +sha256  feb307acf472598ea7af4e4b439251613a8f5d81e804b4abf9aeca195a5d4254  elfutils-portability.patch
> 
>  This one triggers an interesting bug in our download infrastructure. The
> elfutils-portability.patch file has the same name as in the previous version,
> but it has a different hash (of course). So when building with a pre-populated
> download directory, it will fail the first time.

Yup, it failed for me the first time, and I really wondered what
hapenned... I fired the download again, and that time it worked...

>  The ideal solution would be if we would force the version number into all
> downloaded files. But since we have the hashes now, a much simpler solution (at
> least conceptually, could be tricky to implement) would be to retry the download
> once if the hash check has failed. Or alternatively, check the hash before _and_
> after the download.

Yes, befiore the download, we check if the hashes match (if already
present, of course). If not, we remove the file, but do not fail, so we
can download.

After the download, we re-check the hash. If it does not match, we
remove the file, and fail as done today.

Thoughts?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
