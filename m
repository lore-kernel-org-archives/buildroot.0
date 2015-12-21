From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Dec 2015 23:30:30 +0100
Subject: [Buildroot] [PATCH 0/8 RFC] core: install foo-config scripts
 early in the PATH (branch yem/foo-config-in-PATH)
In-Reply-To: <20151221232048.1218dd26@free-electrons.com>
References: <cover.1450712392.git.yann.morin.1998@free.fr>
 <20151221232048.1218dd26@free-electrons.com>
Message-ID: <20151221223030.GG3454@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-12-21 23:20 +0100, Thomas Petazzoni spake thusly:
> On Mon, 21 Dec 2015 16:56:55 +0100, Yann E. MORIN wrote:
> > This RFC series is an attempt at solving once and for all the problem we
> > encounter with foo-config scripts.
> > 
> > The foo-config scripts are usually installed in staging, so are out of
> > the PATH. However, most packages will just simply want to run them, and
> > most are not configurable in where to look for that script and just
> > expect to find them in the PATH.
> > 
> > Up until now, we used to patch those packages so that they accept an
> > environment variable.
> > 
> > Arnout has suggested [0] that we move all the target-related foo-config
> > scripts early in the PATH, so that they are found before the host ones
> > and before the system ones.
> > 
> > This would allow us to drop our local patches, and to no longer set the
> > custom FOO_CONFIG or the ac_cv_foo_config variables from our package
> > recipes.
> 
> Unfortunately, I believe it doesn't work completely, because there are
> some <foo>-config scripts that are not listed in <pkg>_CONFIG_SCRIPTS
> because they are for some reason not compatible with the fixup that we
> do. One example that comes to mind is python-*config (they are written
> in shell but don't follow the usual pattern).

And how do we handle them today? If we don't do anything about it, then
this series would indeed not solve those, but it would not break it
either, since it would already be broken today.

Unless we do have code to manually install them in $(HOST_DIR)/usr/bin ?

> I believe there might be
> other cases as well.

Again, what are we doing for those today?

> Also, this solution doesn't solve the (admittedly unlikely) case of a
> package calling /usr/bin/<foo>-config directly.

Indeed. But it is already broken today, and the series does not break it
any more.

> But I agree that it might solve many of the usual cases. I don't know
> if the additional complexity of yet another special mechanism really
> makes it worth it. I'd like to hear from Peter about this.

Yes, this series is really just an RFC. It was relatively easy to do
(even a bit easier than what I expected, aha!), so I just spun it on the
list just to "feel the temperature".

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
