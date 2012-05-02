From: Stijn Souffriau <stijn.souffriau@essensium.com>
Date: Wed, 02 May 2012 21:23:10 +0200
Subject: [Buildroot] buildroot Digest, Vol 71, Issue 9
In-Reply-To: <mailman.5.1335960002.505.buildroot@busybox.net>
References: <mailman.5.1335960002.505.buildroot@busybox.net>
Message-ID: <4FA1899E.1050408@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

I can fix all the minor issues, no problem. For me, the only two bigger 
issues are:

  - uClibc support: glibc specific headers seemed to be needed in order 
to build. Maybe I can remedy that but I'm not sure. Can't you ignore 
this for now so that I or somebody else can add uClibc support later? If 
it's a problem I'll look into it but my time is limited.
  - host-gnupg: I needed it to sign file system images (useful for 
remote upgrades). I'm not sure if buildroot will always build host-gnupg 
and if this is a problem for you, if so I can always make it optional it 
with yet another config option.

Thanks for the feedback,

Stijn

-- 
Stijn Souffriau
Embedded Software Developer - Mind Embedded Software Division

ESSENSIUM nv
Mind - Embedded Software Division
Gaston Geenslaan 9 - B-3001 Leuven
email : stijn.souffriau at essensium.com
Web: www.essensium.com   /   www.mind.be
BE 872 984 063 RPR Leuven



On 05/02/2012 02:00 PM, buildroot-request at busybox.net wrote:
> Date: Wed, 2 May 2012 09:34:37 +0200
> From: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> To:buildroot at busybox.net
> Subject: Re: [Buildroot] gnupg patch
> Message-ID:<20120502093437.0194efcb@skate>
> Content-Type: text/plain; charset=UTF-8
>
> Hello Stijn,
>
> Le Tue, 01 May 2012 22:15:47 +0200,
> Stijn Souffriau<stijn.souffriau@essensium.com>  a ?crit :
>
>> >  I've attached a patch that adds packages for gnupg and some related
>> >  libraries. I thought this might be useful for other people. Feel free to
>> >  merge it or send me feedback.
> Thanks, this looks generally quite good, though I have a number of
> comments about your patch:
>
>   *) It should be split in several patches, one patch per package you're
>      adding.
>
>   *) The patches should be sent inline and not as attachment, in order
>      to ease the review process. See
>      http://elinux.org/Buildroot_how_to_contribute  for a few details on
>      a suggested workflow to send Buildroot patches.
>
> Now the comments themselves:
>
>   *) In package/gnupg/Config.in, why do you need to depend on a GLIBC
>   external toolchain? The indentation of this depends line is wrong, it
>   should be one tab. The indentation of the help text is wrong, it
>   should be one tab + two spaces, and there should be one empty line
>   between the help text and the upstream URL.
>
>   *) In package/gnupg/gnupg.mk, you should prefer '=' over ':='. The
>   HOST_GNUPG_DEPENDENCIES line is useless, because the host dependencies
>   are automatically derived from target dependencies (if they are
>   equivalent, of course, which apparently is the case here). But in the
>   first place, why do you need to build gnupg for the host here? What is
>   the use case? In the same file, there is a small indentation problem
>   in GNUPG_CONF_OPT (spaces instead of tabs on the first two lines)
>
>   *) package/libassuan/Config.in lacks an upstream URL.
>
>   *) package/libassuan/libassuan.mk. Copy/paste error in the comment at
>   the beginning of the file. Same comment as gnupg for host dependencies
>   derived automatically from target dependencies.
>
>   *) libgcrypt/libgpg-error: you need to add the host variant for
>   host-gnupg, but why do you need host-gnupg?
>
>   *) package/libksba/COnfig.in: missing upstream URL
>
>   *) package/libksba/libksba.mk: copy/paste error in comment. Same
>   comment as before: do we really need the host variant?
>
>   *) package/libpth/Config.in: the help text is missing.
>
>   *) The second patch of package/libpth needs a bit more explanations.
>   "Changed Makefile" is not an useful commit log:)
>
>   *) In libpth.mk, same copy/paste error, and same question about the
>   host variant.
>
> Otherwise, looks like a really good starting point.
>
> Apparently, you have only tested this against glibc (per your
> dependency). In order to get these patches merged, you should also
> build them against uClibc, which also to check whether locale support
> is needed, or largefile support, or some other toolchain option that
> Buildroot makes optional when building an uClibc toolchain.
>
> Thanks again!
>
> Thomas
> -- Thomas Petazzoni, Free Electrons Kernel, drivers, real-time and 
> embedded Linux development, consulting, training and support. 
> http://free-electrons.com
