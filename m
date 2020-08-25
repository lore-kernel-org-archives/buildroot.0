From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 25 Aug 2020 16:14:18 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-pycups: new package
In-Reply-To: <CALFsTFXyj-Ta7eEtUQou8Dscw-+ZHaMf0m_W6fKmnsGJTc=wBg@mail.gmail.com>
References: <20200824214857.4090659-1-joseph.kogut@gmail.com>
 <CALFsTFUuBM9uJKo9Gz4jx2PV3TwwuJs5gcKySrTJih21ZHyt7Q@mail.gmail.com>
 <20200825100821.49937320@windsurf.home>
 <CALFsTFUeh=PjLmkpjGQYjS8QQQ38hqcakBA=TXf_Gaxsk8Qo7A@mail.gmail.com>
 <20200825130711.35b70f7a@windsurf.home>
 <CALFsTFXyj-Ta7eEtUQou8Dscw-+ZHaMf0m_W6fKmnsGJTc=wBg@mail.gmail.com>
Message-ID: <CAMWSM7hPSsqQ-fu=VLvMV_xKfhq5f+TH4ych11ezYDwKa+9vCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 25, 2020 at 4:29 AM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Hello,
>
> On Tue, Aug 25, 2020 at 2:07 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > On Tue, 25 Aug 2020 13:55:36 +0300
> > Asaf Kahlon <asafka7@gmail.com> wrote:
> >
> > > On the other hand:
> > > * Differently from other packages that duplicate the "depends on",
> > > here we show nothing in case BR2_PACKAGE_CUPS isn't selected, so we
> > > should at least add a comment.
> >
> > We don't always add a comment when the dependency is obvious. For
> > example, all python-<foo> packages don't have a comment that says
> > "python-<foo> needs python", because it's obvious if you want a Python
> > module that you need to enable Python.
> >
> > > * In my opinion, even if the user knows that python-pycups needs cups,
> > > he wouldn't want to select it on his own and expect it to be selected
> > > when choosing python-pycups.
> > > But I agree that in some cases it's not so critical.
> >
> > I think we agree that there is no clear cut line when it comes to using
> > "depends on" vs. "select" in this sort of situation.
> >
> > What I believe is true is:
> >
> >  - We want to use "select" when the dependency is non-obvious, like
> >    package "baz" depending on libxml2, openssl and libzorglub. We
> >    cannot expect the user to easily figure out those dependencies.
> >
> >  - We want to use "depends on" for architecture
> >    dependencies/limitations, obviously.
> >
> >  - We want to use "depends on" when the user has to be aware of the
> >    dependency, or when the dependency cannot easily be lifted. For
> >    example dependency on toolchain features: glibc/uclibc/musl,
> >    threads, etc.
> Absolutely agree.
>
> >
> > For the other cases, there's no clear cut strategy. But for example
> > cups-filters has a "depends on BR2_PACKAGE_CUPS", with no comment about
> > this because we assume this is obvious. However, all other dependencies
> > of cups-filters are properly enabled using "select" as they are
> > non-obvious. Same for the hplip or gutenprint packages.

Cups is standalone, cups-filters extends cups with additional
functionality, and cups-filters appears in Kconfig menus immediately
after cups, making it easy to select at the same time as cups.
"Depends on" makes sense here, even without a comment.

A Python module wrapping and exposing a C library is a little
different. It's in a separate menu from cups, making selection a less
obvious process. Some packages such as dbus-python allow a Python API
to be built for another package/library by enabling an option next to
that package, but my understanding is that these are canonical Python
bindings developed and maintained by the parent package's authors.
This isn't the case with pycups.

I agree with Asaf, If I have an application that depends on pycups, I
probably want to just select pycups and all of its dependencies,
rather than select cups first, then navigate to a different menu to
enable pycups. Cups is implied, as least to the extent that it enables
pycups to be built.

On the other hand, if I'm building an application that uses a
module/library such as pycups, I'd probably write a buildroot package
for it that selects the dependencies it needs, rather than navigate
through Kconfig menus to select its dependencies. At this point,
Buildroot will make it rather obvious that I need to also select cups.

When I wrote this package, I hadn't thought that deeply about this. I
think both approaches are acceptable, but I'm leaning towards "select"
over "depends on" now for this particular package for the reasons
stated above.


> I generally agree with the idea, thanks.
> By the way, there are packages that state the "depends on" part in a
> comment, like conman-gtk.
> I personally think it's clearer and doesn't harm, but as you said,
> there's no clear cut here.
>
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> Asaf.
