From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 22:42:50 +0200
Subject: [Buildroot] Spidermonkey bump version
In-Reply-To: <0231243a-bd17-2c0a-7486-80a28fd662c4@benettiengineering.com>
References: <a59a82c3-0000-73ca-6c6d-7ac2aef7ff2e@benettiengineering.com>
 <20210520103341.GZ2268078@scaer>
 <0231243a-bd17-2c0a-7486-80a28fd662c4@benettiengineering.com>
Message-ID: <20210522204250.GK3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2021-05-22 00:31 +0200, Giulio Benetti spake thusly:
> On 5/20/21 12:33 PM, Yann E. MORIN wrote:
> >On 2021-05-20 02:21 +0200, Giulio Benetti spake thusly:
> >>since I'm working on udisks bump version I've noticed its dependency
> >>spidermonkey that is pretty old. I've seen that download site points to a
> >>gentoo archive to save 200M of download without downloading entire Firefox.
> >>Would it make sense to change site back to [1] and bump it once 89.0 is
> >>released?
> >   - the version we currently have does not require rust, but newer
> >     versions do; if we update, it means less architectures we can run
> >     spidermonkey, and thus polkit and its dependees, on;
> >
> >   - OE is still using mozjs 60.9.0:
> >         https://git.openembedded.org/meta-openembedded/tree/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
> >
> >   - polkit 0.116 (which we currently have) is the last to accept
> >     mozjs-60; later versions of polkit require more recent versions of
> >     mozjs: polkit0.117 requires mozjs-68, and 0.118, mozjs-78:
> >         https://gitlab.freedesktop.org/polkit/polkit/-/blob/0.116/configure.ac#L82
> >         https://gitlab.freedesktop.org/polkit/polkit/-/blob/0.117/configure.ac#L83
> >         https://gitlab.freedesktop.org/polkit/polkit/-/blob/0.118/configure.ac#L83
> >
> >>The only packages that use it is polkit that in order is used by:
> >>- udisks
> >>and optionally by:
> >>- gvfs
> >>- brltty
> >>- systemd
> >
> >So, I'm all meh... Maybe we'll have to bite the bullet and bump mozjs if
> >we want to bump polkit (probably a good idea to avoid security issues?
> >Although there is no known CVE for polkit 0.116:
> >https://nvd.nist.gov/vuln/search/results?form_type=Advanced&results_type=overview&seach_type=all&query=cpe:2.3:a:polkit_project:polkit:0.116:*:*:*:*:*:*:*
> >which does not mean there is no unknown issue either...)
> 
> I'm giving a try and I've seen that until mozjs-78 configure file is already
> present while on latest version firefox-89.0 there is not and the whole
> build system changed.

In mozjs-60.5.2, there is both configure and configure.in, which are the
exact same file, except the former is +x and the latter is -x.

In firefox 89.0, there is indeed no 'configure', but there is still
'configure.in'. If you just chmod +x it, it runs fine. Well, it runs as
long as it can find its depndencies... After all, that script is only a
thin wrapper above their custom buildsystem., as it were in 60.5.2
anyway...

> Since we need spidermonkey 78 for polkit 0.118 I would go for bumping
> spidermonkey to 0.78 if it's not too difficult.

Well, it is not going to be easy: the package has switched over to rust,
so there will be some work to do. We have no package infra for rust, so
you'll have to look at other packages how they handle things...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
