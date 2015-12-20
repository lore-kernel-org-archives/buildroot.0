From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Dec 2015 13:49:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/wireshark: Fix libpcap detection
In-Reply-To: <566DDC20.5000104@mind.be>
References: <1449998185-15082-1-git-send-email-bernd.kuhls@t-online.de>
 <566DDC20.5000104@mind.be>
Message-ID: <20151220124957.GA3677@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-12-13 21:59 +0100, Arnout Vandecappelle spake thusly:
> On 13-12-15 10:16, Bernd Kuhls wrote:
> > To reproduce the build error I had to install libpcap0.8-dev on my host
> > system, then wireshark configure picks up
> > 
> > checking for pcap-config... /usr/bin/pcap-config
> 
>  To fundamentally avoid this type of issue (we have a bunch of fixes like this),
> I think we should add an additional directory that is put in the _beginning_ of
> the path in TARGET_MAKE_ENV. This directory could then be populated through the
> _CONFIG_SCRIPTS mechanism.
> 
>  What do the others think?

I'v estarted having a look at your suggestion. The basic idea is
relatively trivial to do, and I now have a FOO_CONFIG_DIR location
where I put those scripts.

However, I'm not facing a wall: we use the same PATH for both the target
and the host packages, set in BR_PATH. But of course, we do not want the
host variants to find those foo-config scripts, since they are for the
target; we really want host packages to find the host variants, whether
the ones we install as part of our host packages, or the ones from the
system.

So, we'd need to split the PATH for host and target variants.

I wonder if that would be acceptable.

>  It will be a bit of work to revert all these fixes again :-)

Indeed. I've already tried to hunt down all our "fixes" for this, and I
have identified two cases:

  - packages already accept a FOO_CONFIG environement variable; for
    those we just need to unset it;

  - we patch the package to replace a hard-coded cal to foo-config with
    a construct like ${FOO_CONFIG:-foo-config}, for those, we need to
    alse unpatch the package.

My grep-fuu must still be asleep today, since I could only identify wine
in the second category, although I'm pretty sure we have at least a few
other packages that we do patch for that.

The packages in the first category are reltively rare: only about 50 of
them I could identify, so it should be pretty easy to fix.

I'll work on this a bit mor elater today...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
