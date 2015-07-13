From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2015 12:37:35 +0200
Subject: [Buildroot] [PATCH 1/2 v4] core/skeleton: drop /etc/securetty
In-Reply-To: <20150713094433.GL2451@tarshish>
References: <cover.1436778228.git.yann.morin.1998@free.fr>
 <51509ea07660728b4f5aa519d67b6577bd4c9dd4.1436778228.git.yann.morin.1998@free.fr>
 <20150713092051.GK2451@tarshish> <20150713093552.GH4008@free.fr>
 <20150713094433.GL2451@tarshish>
Message-ID: <20150713103735.GI4008@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-07-13 12:44 +0300, Baruch Siach spake thusly:
> On Mon, Jul 13, 2015 at 11:35:52AM +0200, Yann E. MORIN wrote:
> > On 2015-07-13 12:20 +0300, Baruch Siach spake thusly:
> > > On Mon, Jul 13, 2015 at 11:05:35AM +0200, Yann E. MORIN wrote:
> > > > securetty is supposed to restrict the terminals root is allowed to
> > > > login from. As it happens, login from busybox (w/ securetty support)
> > > > is actually enforcing use of securetty, while login from util-linux
> > > > is completely ignoring securetty altogether.
> > > > 
> > > > Remove securetty from our skeleton altogether and stop worrying about
> > > > it.
> > > 
> > > But CONFIG_FEATURE_SECURETTY=y is still there in current 
> > > package/busybox/busybox.config. Shouldn't we disable it first?
> > 
> > Indeed, it is still present, but that does not prevent root login to
> > work when /etc/securetty is missing.
> > 
> > So, I decided to leave it as-is.
> 
> It would still break overlays with /etc/securetty (maybe locally modified). 
> Why not just disable Busybox FEATURE_SECURETTY?

After discussing this with Thomas, we've decided to keep it, especially
to keep the case you mention (custom securetty from overlay) is still
working as expected.

The reasoning is that a user which installs a custom /etc/securetty will
obviously have it contain the ttys he wants root to log in from, so he'd
still be able to log in as root from those ttys.

But if we were to remove FEATURE_SECURETTY, then he'd still be able to
log in as root from those ttys, but *also* from *any other* tty, and
would probably not notice that change as this is a silent change.

So, we've concluded that we should keep FEATURE_SECURETTY since it works
for our new use-case, and works for existing use-cases.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
