From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 18:44:18 +0100
Subject: [Buildroot] [PATCH v3 2/2] wine: Add gettext dependency check
 for host-wine
In-Reply-To: <54FC8C44.2050907@dawncrow.de>
References: <54FC5B41.5050004@dawncrow.de>
 <20150308155730.11c74ecc@free-electrons.com>
 <54FC67E8.7010004@dawncrow.de>
 <20150308183122.308f9227@free-electrons.com>
 <54FC8C44.2050907@dawncrow.de>
Message-ID: <20150314174418.GD4009@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?, All,

On 2015-03-08 18:52 +0100, Andr? Hentschel spake thusly:
> Am 08.03.2015 um 18:31 schrieb Thomas Petazzoni:
> > Dear Andr? Hentschel,
> > 
> > On Sun, 08 Mar 2015 16:16:56 +0100, Andr? Hentschel wrote:
> > 
> >> Wine is built using host-wine, so i need gettext support in host-wines wrt.
> > 
> > In which cases do you need gettext support in host-wine?
> > 
> > Always ? Only when the target wine is going to be built with gettext
> > support (which your patch does not do) ?
> 
> When host-gettext is built, then we could use it, otherwise target wine will be english only.
> I don't think this diserves a hard dependency, do you?
> 
> > Why in the first place would we want to have gettext support in
> > host-wine ?
> 
> Wine has a tool called wrc which transforms dialogs/strings and such into a windows like resource file.
> With the help of the gettext library wrc merges the translations from wines po-files into that resource file.
> As the wrc tool from host-wine is used, we need the gettext support there.
> Further there are no runtime requirements, so in fact it doesn't matter to wine(or even host-wine) if the target
> gettext is built.

So, from what I understand:
  - we need the host gettext tools to be able to produce the resource
    files
  - the resource files are used at runtime, but that's handled by Wine
    itself, without the need for any help from gettext

If that is so, then all you need is to just depend on host-gettext:

HOST_WINE_DEPENDENCIES += host-gettext
HOST_WINE_CONF_OPTS += --with-gettext --with-gettextpo

That does not have to be condional on the package gettext at all.

What is maybe misleading is that there is no BR2_PACKAGE_HOST_GETTEXT to
depend on. That's not necessary to depend on a host package, whether
from a target package or another host package.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
