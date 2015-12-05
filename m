From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Dec 2015 18:39:00 +0100
Subject: [Buildroot] [PATCH 1/1] ncurses: generate libtermcap
In-Reply-To: <565ECA64.3070503@6wind.com>
References: <1429880066-7743-1-git-send-email-pascal.mazon@6wind.com>
 <20151130233049.3ad42bd1@free-electrons.com>
 <565ECA64.3070503@6wind.com>
Message-ID: <20151205173900.GC3666@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pascal, All,

On 2015-12-02 11:39 +0100, Pascal Mazon spake thusly:
> On 11/30/2015 11:30 PM, Thomas Petazzoni wrote:
> > On Fri, 24 Apr 2015 14:54:26 +0200, Pascal Mazon wrote:
> >> There is no libtermcap package in buildroot, but ncurses implements
> termcap
> >> natively. Furthermore, ncurses already provides the termcap.h header
> file.
> >>
> >> With this patch, we fix an issue encountered with some external
> toolchains
> >> that include a libtermcap.a (typically the GNU libtermcap version) in
> their
> >> sysroot folder.
> >> Bash, for instance, would be linking with this libtermcap while using
> >> headers from ncurses.
> >>
> >> In order to be consistent, let's make sure there is only the ncurses'
> >> termcap library. To that effect, we:
> >> - remove any libtermcap.* in the staging dir,
> >> - install a link to libncurses static and/or shared in staging and target
> >>    dirs.
> >>
> >> Signed-off-by: Pascal Mazon <pascal.mazon@6wind.com>
> >
> > We finally took a bit of time on IRC today to discuss your patch. From
> > our point of view, the fact that your toolchain provides libtermcap.a
> > is a bug of the toolchain. From Buildroot's point of view, a toolchain
> > should not provide in its sysroot anything but the C library and its
> > headers, and the kernel headers.
> >
> > If we start doing hacks in packages to cope with toolchain sysroot
> > already shipped with some libraries, it's going to be an endless fight
> > against those toolchains. You have the problem with libtermcap.a, but
> > the next person will have it with libz.a, and then lib<something>, and
> > again.
> >
> > Our suggestion is that you fix your toolchain either by asking your
> > toolchain vendor, or by doing a quick hack to remove libtermcap.a
> > before using the toolchain with Buildroot. If you add this toolchain as
> > a known Buildroot profile, you can even automate this and make it part
> > of the build process.
> >
> > Best regards,
> >
> > Thomas
> >
> 
> I understand buildroot's point of view.
> Indeed, it does not look like the best solution to hack in packages for a
> problem from the toolchain.
> 
> I will try your suggestion.
> Maybe we can modify copy_toolchain_sysroot in toolchain/helpers.mk to add a
> custom "--exclude" when rsync-ing (with values taken from an newly added
> option)?

Like a patch I submitted a while ago and was rejected?
    https://patchwork.ozlabs.org/patch/535404/

Thomas, Peter, it seems we now have a valid use-case for that patch.
Should I respin it, now?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
