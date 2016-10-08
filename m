From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Oct 2016 14:24:34 +0200
Subject: [Buildroot] [PATCH v2 04/20] python3: make it exclusive from
 python
In-Reply-To: <20161005213018.7a5567da@free-electrons.com>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <8nrfcdx2pk.ln2@ID-313208.user.individual.net>
 <20161005213018.7a5567da@free-electrons.com>
Message-ID: <20161008122434.GA3802@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Bernd, All,

On 2016-10-05 21:30 +0200, Thomas Petazzoni spake thusly:
> On Wed, 05 Oct 2016 20:00:40 +0200, Bernd Kuhls wrote:
> > sorry for warming up this old commit but I would like to ask whether it 
> > is possible at all to allow python2 and python3 together on the target?
> 
> No, this is not possible, because we have no way in kconfig to say
> which Python modules should be installed for python2, and which Python
> modules should be installed for python3.
> 
> So while having both interpreters and the Python standard library
> side-by-side would work, it doesn't work for all the external Python
> modules we have.

For what is worth, I've also been thinking on how we could solve this in
Buildroot. We've discussed this on IRC (with Romain or Samuel, I can't
remember). Here's what we came up with...

First, as Thomas said, we'd need to have the kcofnig-side sorted out.
When looking only at external python modules for themselves, it is not
very complex: we already have some modules depend on either python xor
python3 for those modules that have an explicit dependency.

Where it gets more complex is when a package needs a modules that works
only with python and another module that works only with python3. I
don't know if this situation is realistic, but we have to at least take
it in consideration.

Then, there is the problem of building modules for either or both of the
pythons, when those modules need compiling (e.g. are not written
entirely in python, but use C or whatever that needs compiling).

When a module is only python xor python3, this is realtively easy; we just
need to do a single build of that module. It does not change much from
what we currently have for that module.

But then, when the module is compatible with both python and python3,
then we need to build it twice, which is currently not supported by our
python-package infra, and is definitely not trivial to do.

Finally, comes the installation phase. Again, modules that are python
xor python3, this is mostly status-quo with what we currently have.

Modules that are compatible with both python and python3 would need to
be installed for both. Again, our python-package infra does not support
that, and it is far from trivial to do.

I've started looking into this, but I have absolutely no code to show. I
think it *might* be possible to come up with something, but that may
probably add quite a bit of complexity and uglyness in the python-package
infra. I'm not sure it would be worth the effort... :-/

> > I need python2 for Kodi, afaics[1] there are no current plans to support 
> > python3.
> 
> I think that's the main problem. Staying on python2 only is really not
> a wise choice.

Yes, this is a real pain... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
