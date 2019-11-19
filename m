From: Trent Piepho <trent.piepho@synapse.com>
Date: Tue, 19 Nov 2019 19:50:45 +0000
Subject: [Buildroot] [PATCH] package/samba4: Do not force target python
In-Reply-To: <20191118225825.76579d11@windsurf.home>
References: <acf9214ffd0058cb896594d7c846a510a51dab86.camel@synapse.com>
 <20191118225825.76579d11@windsurf.home>
Message-ID: <b52c244bd498a96aed8d74bd73ff9d9312334d3a.camel@synapse.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2019-11-18 at 22:58 +0100, Thomas Petazzoni wrote:
> On Thu, 14 Nov 2019 17:48:51 +0000
> Trent Piepho <trent.piepho@synapse.com> wrote:
> 
> > Target python will no longer be selected by SAMBA4 and is instead
> > selected by the SAMBA4_AD_DC option.  Samba will be built with/without
> > python support based whether target python is enabled/disabled.  This is
> > the same as other optional samba features, which are only enabled when
> > the package they need is also enabled.
> 
> Well, there is a BR2_PACKAGE_SAMBA4_AD_DC condition in samba4.mk, which
> I think we should use.

I think there's a misunderstanding here.  I did this use existing
config, so that when it is on, it will force "select" a python, since
python is required for that feature.

But samba also has python support for reasons other than the domain
controller feature.  There is a samba python module that other packages
could use.

What I did, when the AD DC feature was not enable and python was not
force selected, was to enable samba's python support automatically
based on the existing status of target python.  A common pattern in
buildroot for things like optional readline or ncurses support in a
package.

But having looked at it more, samba's python support beyond the AD DC
feature might not be all that useful.  There is a python module, but
nothing in buildroot uses it.  Fedora 31 has only two (non-samba)
packages, freeipa and fleet-commander, that use it.  Neither is in
buildroot.

So perhaps I should just disable samba python support if AD DC is not
on, since it's likely that no one will use it.

I've also found that Fedora 31 has a requirement for the samba python
module from the samba test package that contains the smbtorture
program.  Buildroot has smbtorture has an optional samba feature
already.  So perhaps it should also require python?  Or perhaps this is
a mistake in the fedora packages?  Samba's build system certainly does
not require python for smbtorture to build and I don't see, yet, how
these programs would make any use of the samba python module.
