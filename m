From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Sep 2015 23:05:32 +0200
Subject: [Buildroot] [PATCHv2] package/kodi: needs .py modules
In-Reply-To: <55F88517.9050306@mind.be>
References: <1442178783-27567-1-git-send-email-yann.morin.1998@free.fr>
 <55F8493C.2030804@mind.be> <20150915200353.GB3650@free.fr>
 <55F88517.9050306@mind.be>
Message-ID: <20150915210532.GF3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-09-15 22:52 +0200, Arnout Vandecappelle spake thusly:
> On 15-09-15 22:03, Yann E. MORIN wrote:
> > On 2015-09-15 18:37 +0200, Arnout Vandecappelle spake thusly:
> >> On 13-09-15 23:13, Yann E. MORIN wrote:
> >>> Kodi segfaults as soon as it tries to load a python module:
> >>>
> >>>     Could not find platform independent libraries <prefix>
> >>>     Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
> >>>     ImportError: No module named site
> >>>     Segmentation fault
> >>>
> >>> Turns out that keeping .py modules (with or without .pyc) fixes the
> >>> issue.
> >>>
> >>> Currently, Kodi selects python, but since the format of modules is a
> >>> choice, we can not select it.
> >>
> >>  I think it's a lot more user-friendly to do
> >>
> >> 	select BR2_PACKAGE_PYTHON_PY_PYC
> > 
> > Two problems with that option:
> >   - first, it is not acceptable; one must *not* select a symbol that is
> >     part of a choice
> >   - Kconfig won't even act on that select, in fact:
> 
>  I guess 1 is a result of 2, right? Stupid Kconfig.

Well, not really. If you allow a symbol of a choice to be selected, then
how would you handle this case;

    config FOO
        bool "foo"
        select BUZ_A

    config BAR
        bool "bar"
        select BUZ_B

    choice
        bool "buz"

    config BUZ_A
        bool "buz-a"

    config BUZ_B
        bool "buz-b"

    endchoice

That's basicaly unsolvable.

Hence, selecting a choice entry does not make sense to start with.

>  In that case, there really is no alternative except what you propose. The
> ugliness of BR2_PACKAGE_PYTHON_WANTS_PY is too horrible to even consider.

Yes, _WANTS_PY is ugly.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
