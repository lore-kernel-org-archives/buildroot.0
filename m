From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 May 2021 14:56:02 +0200
Subject: [Buildroot] [PATCHv2 2/7] core: enable 'NDEBUG' unless
 BR2_ENABLE_RUNTIME_DEBUG is set
In-Reply-To: <CAAXf6LWYt05UAWcg1Hnyg0rSxvhHHD6NG73BC3-9k8NvGTJqLQ@mail.gmail.com>
References: <20210212135451.22786-1-patrickdepinguin@gmail.com>
 <20210212135451.22786-3-patrickdepinguin@gmail.com>
 <20210213225610.3f1839af@windsurf.home>
 <CAAXf6LWYt05UAWcg1Hnyg0rSxvhHHD6NG73BC3-9k8NvGTJqLQ@mail.gmail.com>
Message-ID: <CAAXf6LX9ejcu=zdaMusxZ-qH7iDpZS+fzXseQfnKdKatwK9Q_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

El lun, 15 feb 2021 a las 10:11, Thomas De Schampheleire
(<patrickdepinguin@gmail.com>) escribi?:
>
> Hi Thomas,
>
> El s?b, 13 feb 2021 a las 22:56, Thomas Petazzoni
> (<thomas.petazzoni@bootlin.com>) escribi?:
> >
> > On Fri, 12 Feb 2021 14:54:45 +0100
> > Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
> >
> > > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > >
> > > A common way to disable runtime assertions is by honoring the 'NDEBUG'
> > > preprocessor flag. Set it when BR2_ENABLE_RUNTIME_DEBUG is disabled (the
> > > default case).
> >
> > How "common" is that? It feels a pretty "random" definition to me. I'm
> > not sure we want to randomly pass -DNDEBUG to all our packages, without
> > knowing what the meaning of NDEBUG is for all those packages.
>
> 'Originally', NDEBUG is the macro used by assert() to decide whether
> or not assertions actually do anything.
> See https://www.man7.org/linux/man-pages/man3/assert.3.html
>
> cmake links this parameter to the CMAKE_BUILD_TYPE, setting NDEBUG for
> 'Release', and not setting it for 'Debug'.
>
> Based on these two elements, I find NDEBUG a fairly standard mechanism.
>
> But it is indeed possible that some package uses this in an unexpected
> way. For this reason I would not merge this series for 2021.02 but
> instead opt for -next so we have some more time to catch any problems.
>
> For the severe performance degradation we observed in gRPC/libabseil,
> the patch changing the cmake build system would be sufficient.
> But since the problem is generic, I opted to also make this patch for
> other packages.

I wanted to come back to this patch and clarify that I removed it internally.
By passing -NDEBUG in TARGET_DEBUGGING, it will be passed to the
compiler wrapper, which means it is in place also for compilations of
project-specific applications.
As explained, the 'assert' function provided by glibc will remove
assertions if NDEBUG is specified.
Aside from the fact that you may not want that for your
project-specific applications, it may also trigger compilation
failures like "variable X is not used" if X is only used in context of
the assertion. These may be solvable problems but in any case it means
this is not a transparent change.

I will send a v3.

/Thomas
