From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Jan 2015 19:35:15 +0100
Subject: [Buildroot] [PATCH v2] linux: make custom versions and patches
 exclusive
In-Reply-To: <CANxTyt4spLPozy+88j5rgcA_JKjL7W2gmD8UOC6pLj3f80SJjw@mail.gmail.com>
References: <1420583119-30111-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <CANxTyt4spLPozy+88j5rgcA_JKjL7W2gmD8UOC6pLj3f80SJjw@mail.gmail.com>
Message-ID: <20150107183515.GA4249@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2015-01-06 20:43 -0500, Danomi Manchego spake thusly:
> On Tue, Jan 6, 2015 at 5:25 PM, Vivien Didelot
> <vivien.didelot@savoirfairelinux.com> wrote:
> > When using a custom kernel (custom tarball, repository or local tree),
> > we're using the OVERRIDE_SRCDIR internally, which means we do not apply
> > patches. Since this is the expected behavior, show the
> > LINUX_KERNEL_PATCH option only when using a vanilla kernel.
> 
> Forgive me if I'm missing something obvious, but - when I look at
> linux.mk, I see the LINUX_SITE_METHOD set to "local" only when
> BR2_LINUX_KERNEL_CUSTOM_LOCAL is set.  Aren't the custom git and
> custom hg selections setting the method to "git" and "hg"
> respectively?  Patches can't be applied to the results of a tarball
> gotten from somewhere other than kernel.org?

Well, using a patch to a custom kernel does not really make sense.

I'll try to summraise the discussion we had with Vivien on IRC
yesterday, which ended up with this patch (sorry, it is a bit long..)

See, using a local tree or a custom git or mercurial tree, is really a
case of telling Buildroot: "look, I have my custom kernel, which has my
very customisation with what I need".

The key word here is "custom": you went to great length for having such
a kernel in the first place, so further customising with another patch
is not really meaningfull; you could just as well add that patch to your
custom linux kernel to start with.

So, that's the reasoning behind this patch: cutom tree? Apply any
supplemental patch to that custom tree, and be done with it.

Now, the issue Vivien encountered is that pointing Buildroot to a local
linux tree *and* an additional patch was not working: the patch was not
applied.

The technical reason is that, when using a local linux tree, we
internally use the same mechanism as is used for _OVERRIDE_SRCDIR.
_OVERRIDE_SRCDIR is meant for people hacking on their package (linux or
any other) and hijack Buildroot to use that instead of downloading the
package from upstream. This is to be used during the development of said
package, to avoid having to manually patch the package in output/build/
and loose all on a 'make clean'; that way, the sources you're working on
are outdside Buildroot.

Now, because this is to be used during development, we consider the user
has all the code he actually wants to be used in that _OVERRIDE_SRCDIR
tree, patches already applied if needed. Furthermore, when the user is
working on a modified version of the package, there is zero guarantee
our bundled patches would still apply; chances are even that they will
no longer.

Then the local linux tree is just a shortcut in the menuconfig for
telling Buildroot to look for an _OVERRIDE_SRCDIR, instead of having to
provide a local.mk that defines that very _OVERRIDE_SRCDIR. It is just a
courtesy to the user (and IMHO we should just completely get rid of it,
as we can not guarantee reproducible builds from such a .config file).

For all these reasons, using a cutom kernel tree (local or git or Hg) is
just not compatible with applying patches.

Hence Vivien's patch, and me hacking it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
