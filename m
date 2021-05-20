From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 12:33:41 +0200
Subject: [Buildroot] Spidermonkey bump version
In-Reply-To: <a59a82c3-0000-73ca-6c6d-7ac2aef7ff2e@benettiengineering.com>
References: <a59a82c3-0000-73ca-6c6d-7ac2aef7ff2e@benettiengineering.com>
Message-ID: <20210520103341.GZ2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2021-05-20 02:21 +0200, Giulio Benetti spake thusly:
> since I'm working on udisks bump version I've noticed its dependency
> spidermonkey that is pretty old. I've seen that download site points to a
> gentoo archive to save 200M of download without downloading entire Firefox.
> Would it make sense to change site back to [1] and bump it once 89.0 is
> released?

Here are my thoughts on that (mozjs == spidermonkey):

  - of course, it is a bigger archive, but that's not necessarily an
    issue in the grand scheme of things;

  - the version we currently have does not require rust, but newer
    versions do; if we update, it means less architectures we can run
    spidermonkey, and thus polkit and its dependees, on;

  - OE is still using mozjs 60.9.0:
        https://git.openembedded.org/meta-openembedded/tree/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb

  - polkit 0.116 (which we currently have) is the last to accept
    mozjs-60; later versions of polkit require more recent versions of
    mozjs: polkit0.117 requires mozjs-68, and 0.118, mozjs-78:
        https://gitlab.freedesktop.org/polkit/polkit/-/blob/0.116/configure.ac#L82
        https://gitlab.freedesktop.org/polkit/polkit/-/blob/0.117/configure.ac#L83
        https://gitlab.freedesktop.org/polkit/polkit/-/blob/0.118/configure.ac#L83

> The only packages that use it is polkit that in order is used by:
> - udisks
> and optionally by:
> - gvfs
> - brltty
> - systemd

So, I'm all meh... Maybe we'll have to bite the bullet and bump mozjs if
we want to bump polkit (probably a good idea to avoid security issues?
Although there is no known CVE for polkit 0.116:
https://nvd.nist.gov/vuln/search/results?form_type=Advanced&results_type=overview&seach_type=all&query=cpe:2.3:a:polkit_project:polkit:0.116:*:*:*:*:*:*:*
which does not mean there is no unknown issue either...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
