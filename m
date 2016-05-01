From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 21:29:33 +0200
Subject: [Buildroot] [PATCH v2 0/4] Bump to Python 3.5 and pyc
 compilation improvements
In-Reply-To: <CAHXCMMJ+01WoVug=55dYer2175Wsvdvfo4GTBfTQhi6j-2Ge+w@mail.gmail.com>
References: <1462020471-29986-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMLdTCD5CgsNwaCZRXWa4EXcuHpm18JjuWyLh_TBVx1k4Q@mail.gmail.com>
 <20160501152642.3f888793@free-electrons.com>
 <CAHXCMMJ+01WoVug=55dYer2175Wsvdvfo4GTBfTQhi6j-2Ge+w@mail.gmail.com>
Message-ID: <20160501212933.4c423ee5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 1 May 2016 15:51:30 +0200, Samuel Martin wrote:

> > From your feedback, I believe patches 1 and 2 could be applied, but not
> > patch 3 and 4. Is this correct?  
> Exactly.

Ok, good. In fact, I will shortly resend a patch series with the
additional fixes.


> > Or should we simply say that the packages that install Python stuff
> > outside of usr/lib/pythonX.Y are responsible for doing their own stuff?  
> I tend to prefer this second approach.
> Doing things can have undesired side-effects.

Agreed.

> > What do you suggest to handle this one? It seems to be an intentional
> > failure.  
> Yes it is intentional. Removing this file (that contains nothing but a
> syntax error...) in post-install hook is ok.

I've fixed it by adding a patch that removes the syntax error, and I've
reported the problem upstream:

  https://github.com/crossbario/crossbar/issues/750.

> >>   - python-pyftpdlib [4]  
> >
> > This one is clearly a python 3 compatibility problem, which is trivial
> > to fix. But the package is said by upstream to support Python 3, so
> > it's a bit weird.

I've fixed that one as well. However, one weird thing is that the
offending file (splice.py) is in the tarball provided on pypi.org, but
not in the project official Github repository, in its 1.5.0 tag.

I am not sure where this splice.py is coming from...

> >>   - python-pygame [5,6]  
> >
> > Same here, those are trivial Python 3 issues. Why do we mark the
> > package as available for Python 3 if it doesn't actually build ? :-)

This one has been fixed upstream, by
https://bitbucket.org/pygame/pygame/diff/examples/macosx/aliens_app_example/aliens.py?diff2=22efec0b44da&at=default,
I will either backport the patch, or bump the package version.

> > Is it broken install rules, or something that's purely intentional?
> > Also, note that those are not Python modules, there is no __init__.py
> > in those directories. Which probably means they would anyway not be
> > compiled as .pyc anyway.  
> This package needs further investigations, I did not notice the same
> behavior with python2.

OK. But since it's outside usr/lib/pythonX.Y, I don't think we care too
much at this point.

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
