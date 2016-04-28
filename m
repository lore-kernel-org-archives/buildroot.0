From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Apr 2016 23:58:22 +0200
Subject: [Buildroot] [PATCH 2/2] python3: bump to 3.5.1
In-Reply-To: <568AF3C0.2070602@mind.be>
References: <1451931809-24511-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1451931809-24511-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <568AF3C0.2070602@mind.be>
Message-ID: <20160428235822.62dafb17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Jan 2016 23:35:44 +0100, Arnout Vandecappelle wrote:

>  You forgot to remove the --disable-pyo-build from python3.mk.

Will be in v2.

>  However, I don't understand why it is necessary to do this. It is still
> relevant to disable at least some of the compiled versions, otherwise you end up
> with three copies on the target... We currently always disable the pyo files so
> we should preserve that behaviour (could be improved in a later patch). IMHO of
> course :-)

I'm not sure what you mean here. Python 3.5 no longer has the concept
of .pyc vs .pyo. It only builds .pyc files, in three variants:

 foo.pyc
 foo.opt-1.pyc
 foo.opt-2.pyc

If you have only foo.pyc on your target, everything works fine.
However, if you have only foo.opt-1.pyc or foo.opt-2.pyc without the
corresponding foo.pyc, then it simply doesn't work.

Since keeping both foo.pyc and foo.opt-<X>.pyc means doubling the
filesystem size, in the v2 of my patch, I've decided to unconditionally
remove the foo.opt-<X>.pyc files. This way, we preserve the existing
behavior:

 PY_ONLY : only the .py files
 PYC_ONLY : only the non-optimized .pyc files
 PY_PYC : both of them

> >  - The PEP3147 disabling patch had to be significantly reworked due to
> >    the code having changed heavily. The code was moved into a
> >    _bootstrap_external.py, which is a "frozen" Python module, i.e a
> >    module generated into a .h file at compile time using the
> >    _freeze_importlib program.
> 
>  Ideally, we should work with upstream to try and find a better solution for
> this. The PEP3147 handling is really hacky.
> 
>  Actually, are none of our 30 patches upstreamable?

I honestly tried to upstream some of them, but it's difficult to work
with the Python community. Not many of the Python developers understand
what cross-compilation is and are really interested.

I started by trying to upstream the patches that to me were not
directly cross-compilation related and that were easy: the ones making
parts of the Python standard library optional (patches above 0027 in
the current python3 package).

See https://bugs.python.org/issue20210 for the feedback.

Or https://bugs.python.org/issue20211, opened in January 2014, still
not merged, despite having a positive review.

So, I gave up.

> but as I mentioned the current behaviour is to keep only the non-optimized pyc
> so we should keep that.

See above, that's what I've done in v2.

>  I think long term we should have an additional config option to select opt-1 or
> opt-2. opt-2 removes the doc strings, and I think there can be use cases where
> you really want to keep the doc strings on the target (e.g. they could be used
> as help text in an interactive shell).

Agreed. But the fact that you need both the non-optimized .pyc and its
corresponding optimized version doubles the installation size of Python
modules for no real reason.

> > diff --git a/package/python3/0003-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0003-Make-the-build-of-pyc-files-conditional.patch
> > new file mode 100644
> 
>  If you post a v2, perhaps add -M40.

I'll try to remember to pass this flag to git format-patch. Though I
have to say, I tend to just "git send-email HEAD~<ncommits>" without
even looking at the generated patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
