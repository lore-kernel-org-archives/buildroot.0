From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 May 2014 23:18:58 +0200
Subject: [Buildroot] [PATCH v2 1/1] Rebuild packages when their external
 config is updated
In-Reply-To: <1400253776-21759-2-git-send-email-sojka@merica.cz>
References: <1400253776-21759-1-git-send-email-sojka@merica.cz>
 <1400253776-21759-2-git-send-email-sojka@merica.cz>
Message-ID: <20140516211858.GD3466@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michal, All,

On 2014-05-16 17:22 +0200, Michal Sojka spake thusly:
> Packages like busybox, Linux kernel or uclibc can "import" their
> configuration files from external location specified either in
> buildroot's .config or in an environment variable. Currently, this
> import happens only when the package is built for the first time. When
> the external config changes later, the package is not rebuilt with the
> updated configuration until the corresponding .stamp_configured file
> is manually deleted. This patch changes this to automatically rebuild
> the package, when its external configuration files is newer than
> .stamp_configured.

I think this is still too far-reaching.

If you were to change a source file of your package, then you are
supposed to tell Buildroot that it has to rebiuild the package with
either of:
    make PKG-reconfigure
    make PKG-rebuild

The same goes if you modify the package's .mk file in Buildroot, or
changing an option of the package in Buildroot's own .config.

I don't see how different changing a .config is from changing a source
file, changing the .mk of the package, or changing an option in the
Buildroot's menuconfig.

Changing the .config is like if you were changing the package source
tree, and telling Buildroot to use that with _OVERRIDE_SRCDIR, and we
explicitly state that this should be handled with either 'reconfigure'
or 'rebuild'.

Really, the .config is part of the sources of a package.

If we were to automatically rebuild a package because its .config did
change, then I don.t see why we would not do it when a source file, its
.mk or an option did change as well. And surely we do not want to go
that route, or it would be a mess, and pratically impossible to detect
correctly.

And as Gustavo pointed out, this would even break a system in the case
of uClibc anyway, since reconfiguring uClibc is most probably an ABI
breakage, and would require much more than only rebuilding uClibc alone.

So, I'm still not convinced by this change.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
