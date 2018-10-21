From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 21 Oct 2018 19:48:45 +0200
Subject: [Buildroot] [PATCH] meson: bump version to 0.48.1
In-Reply-To: <8dadf2d9-2f53-97cf-0d7f-4d1c323cc2f2@mind.be>
References: <20181018204431.29117-1-eric.le.bihan.dev@free.fr>
 <20181019203050.5cdf56e0@gmx.net> <20181019203746.77ca985b@gmx.net>
 <20181019211039.GA14986@itchy>
 <f6178cb2-5035-a8b7-6a8c-428195fb1eda@mind.be>
 <8dadf2d9-2f53-97cf-0d7f-4d1c323cc2f2@mind.be>
Message-ID: <20181021174845.GB7056@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 2018-10-20 15:00, Arnout Vandecappelle wrote:
>
>
> On 20/10/2018 13:57, Arnout Vandecappelle wrote:
> >  Hi Eric,
> >
> > On 19/10/2018 22:10, Eric Le Bihan wrote:
> >> Hi!
> >>
> >> On 2018-10-19 20:37, Peter Seiderer wrote:
> >>> On Fri, 19 Oct 2018 20:30:50 +0200, Peter Seiderer <ps.report@gmx.net> wrote:
> > [snip]
> >>>> With the patch applied I get the following error:
> >>>>
> >>>>>>> host-meson 0.48.1 Building
> >>>> (cd .../build/host-meson-0.48.1//; PATH=".../host/bin:.../host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/lib/mit/sbin" PYTHONNOUSERSITE=1  .../host/bin/python3 setup.py build  )
> >>>> Traceback (most recent call last):
> >>>>   File "setup.py", line 26, in <module>
> >>>>     from setuptools import setup
> >>>> ModuleNotFoundError: No module named 'setuptools'>>>
> >>>> 	$ ls -d build/host-python*
> >>>> build/host-python-2.7.15
> >>>> build/host-python3-3.7.0
> >>>> build/host-python-setuptools-40.0.0
> >>> graph-depends.pdf shows the following host-meson dependencies:
> >>>
> >>> - host-meson --> host-python3
> >>> - host-meson --> host-python-setuptools --> host-python
> >>> - host-meson --> host-ninja --> host-python
> >>>
> >>> Maybe host-python-setuptools are build for the wrong python version (python2 instead of python3)?
> >  That is correct. When target python or python3 is selected, then the
> > corresponding host python is also selected, and *all* host python packages are
> > built for that specific python version. But if only target python is selected,
> > then you will get host-python as well, but you can also still depend on
> > host-python3. In that case, however, all the host python packages will be built
> > only for python2, not for python3. Hence the breakage.
> >
> >  I'm surprised though that we don't see this in the autobuilders... Your patch
> > doesn't change anything there, does it?
>
> ?It actually does... meson 0.47.1 still had a fallback on distutils if
> setuptools wasn't available, but 0.48.1 removed that fallback.

Indeed, upstream commit 86298f2109d215ad6b26d3462af7b685d52d0dd7 does
it. I'll try to revert it and see how Meson behaves.

Regards,

--
ELB
