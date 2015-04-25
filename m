From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2015 23:14:57 +0200
Subject: [Buildroot] [PATCHv3 16/18] Makefile: add BR_BUILDING variable
In-Reply-To: <20150425202649.GS4275@free.fr>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-17-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150425202649.GS4275@free.fr>
Message-ID: <20150425211457.GU4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,All,

On 2015-04-25 22:26 +0200, Yann E. MORIN spake thusly:
> On 2015-04-25 16:43 +0200, Thomas Petazzoni spake thusly:
> > Some packages do some sanity checks on their configuration, for
> > example linux checks that the defconfig string is not empty when a
> > defconfig is used. Such checks are currently always performed, except
> > when the 'source' target is part of make goals.
> > 
> > This is problematic for two reasons:
> > 
> >  - Other targets such as 'source-check', 'external-deps' or
> >    'legal-info', that do not consist in doing a build, cannot be
> >    executed in such situations.
> > 
> >  - The current code removes the check as soon as one of the targets is
> >    source. But if there are other non-source targets called at the
> >    same time, the checks are ignored.
> > 
> > This commit therefore introduces an internal variable called
> > BR_BUILDING, which tells packages if we are actually building or
> > not. A variable nobuild_targets indicates the targets that we do not
> > consider as being build targets.
> > 
> > For the moment, nobuild_targets only contains 'source', to be
> > completely iso-functional.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> I'm not too fond of the variable name, but I can't find a better one...
> 
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I maintian my ack, but I have a deeper concern about not doing those
checks in the first place.

So, what does it mean not to have a config/board/... name to start with?

It means the specific configuration is not complete, and that the
package will fail to configure or build. So it does not make sense to
accept a configuration where such config name are missing.

Furthermore, what about a package that needs the config name to decide
what tarball to download? In that case, we can't do the check at all,
and we must fail as soon as the config name is empty.

As such, I'd prefer we do not condition the check on whether we'r
ebuilding or not, but that we do it always, fo all packages.

However, I can see one reason where we would still want the checks to be
conditional: make rand*config && make source-check . And that is a
tricky case to solve.

We could do it by always defining defaults (in the Config.in) to such
config names; those defaults could be conditional, of course. But coming
up with sane defaults is not easy either...

Thoughts?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
