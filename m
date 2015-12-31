From: Oli Vogt <oli.vogt.pub01@gmail.com>
Date: Thu, 31 Dec 2015 20:20:17 +1300
Subject: [Buildroot] [PATCH 3/5] python-cffi: add host variant
In-Reply-To: <CAGm1_ksbwjCkjEXFDS7qVe0GFBUxvVxsPNJh4cPM7EipyGUQcQ@mail.gmail.com>
References: <1450992641-8618-1-git-send-email-yegorslists@googlemail.com>
 <1450992641-8618-3-git-send-email-yegorslists@googlemail.com>
 <20151224214645.GA3738@free.fr>
 <CAGm1_kvud8TAWddmadKqMi+=Mpcfzx=XJ3KMgt2yB-otDq-DpQ@mail.gmail.com>
 <20151225200059.48ac8dd7@free-electrons.com>
 <20151225191207.GA3878@free.fr>
 <CAGm1_kvTT4GX63oEHPoD7e2P5SQaoMqU8pAjR0Cqaf0erFnHtA@mail.gmail.com>
 <20151225214436.GB3878@free.fr>
 <CAGm1_ksbwjCkjEXFDS7qVe0GFBUxvVxsPNJh4cPM7EipyGUQcQ@mail.gmail.com>
Message-ID: <CAAwwcmQCH5U3yK0CeSZza-AUgZcW79EU0V=ZexMyTTR1o47ksg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27 December 2015 at 11:54, Yegor Yefremov <yegorslists@googlemail.com>
wrote:

> On Fri, Dec 25, 2015 at 10:44 PM, Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
> > Yegor, All,
> >
> > On 2015-12-25 20:58 +0100, Yegor Yefremov spake thusly:
> >> On Fri, Dec 25, 2015 at 8:12 PM, Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
> >> > On 2015-12-25 20:00 +0100, Thomas Petazzoni spake thusly:
> >> >> On Thu, 24 Dec 2015 23:12:49 +0100, Yegor Yefremov wrote:
> >> >> > Target variant doesn't need pycparser. cffi's setup.py seems to
> >> >> > distinguish, if we install real package or cross-compiled one:
> >> >> >
> >> >> >         install_requires=[
> >> >> >             'pycparser',
> >> >> >         ] if cpython else [],
> >> >>
> >> >> I don't understand how this "if cpython" is relevant to make the
> >> >> different between the native (host) variant or the cross-compiled
> >> >> (target) variant. cpython is defined as is:
> >> >>
> >> >>     cpython = ('_cffi_backend' not in sys.builtin_module_names)
> >> >>
> >> >> Can you give some more details?
> >> >
> >> > Yegor and I briefly discussed this on IRC yesterday, but I'm not
> really
> >> > convinced by this reply either. I forgot to reply yesterday...
> >> >
> >> > What I understand, however, is that they want to differentiate between
> >> > cpython (the 'ofiicial' native Python interpreter), and PyPy (the
> Python
> >> > interpreter written in Python).
> >> >
> >> > Of course, I don't see how this all works. It seems in
> >> > cross-compilation. there differentiation criterai beliveves it is
> >> > running under PyPy amd thus they do not need pycparser.
> >> >
> >> > But thtat's just incorrect, because we may have a host-python with
> >> > cffi_backend at one point, and thus the check above will eventually
> >> > differentiate toward cpython, and we'd nreak again.
> >> >
> >> > So, two things:
> >> >   - their check is wrong,
> >> >   - we probably need host-pycparser
> >> >
> >> > At least, that's what I understood...
> >>
> >> We have host-pycparser: http://patchwork.ozlabs.org/patch/560970/
> >
> > Well, I meant that we should need host-pycparser as a dependency of
> > python-cffi.
> >
> > But anyway, there is more to this: we really need to understand what is
> > going on...
>
> I still don't really understand the difference between host and target
> cffi requirements, but at least I can now shed some light on cpython
> definition. Below is sys.builtin_module_names() description:
>
> "A tuple of strings giving the names of all modules that are compiled
> into this Python interpreter."
>
> So our host-python version won't show '_cffi_backend' even if it is
> installed on the system, because it is not built-in. But PyPy
> (http://pypy.org/) comes with this backend out of the box.
>
> Will debug further.
>
> @Oli: what are you using cffi for?
>
> Yegor
>
?
Hello Yegor, All

 It's been some time since I worked with buildroot. At the time I was
trying to include smbus-cffi <https://pypi.python.org/pypi/smbus-cffi> into
buildroot's python modules and this needs cffi. I wanted to try an
alternative module to pysmbus which did not integrate right away.
 Meanwhile the module pysmbus <https://pypi.python.org/pypi/pysmbus/0.1>
has been included in buildroot, thank you.

Happy New Year, oli

?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151231/7e018050/attachment.html>
