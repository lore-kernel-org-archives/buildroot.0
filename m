From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 6 Apr 2010 18:42:53 +0200
Subject: [Buildroot] External toolchain built by buildroot no longer
	supported.
In-Reply-To: <hpfj6c$mpa$1@dough.gmane.org>
References: <hpfh61$drp$1@dough.gmane.org> <87y6h0r5e9.fsf@macbook.be.48ers.dk>
	<hpfj6c$mpa$1@dough.gmane.org>
Message-ID: <201004061842.53138.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grant,

On Tuesday 06 April 2010 17:15:25 Grant Edwards wrote:
> On 2010-04-06, Peter Korsgaard <jacmet@uclibc.org> wrote:
> >>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:
> >
> > Grant> As of this commit
> > Grant>   http://git.buildroot.org/buildroot/commit/?id=3b7aee23f2ab732f06b8a090ca002fb102d547ee
> >
> > Grant> use of of external toolchains built by buildroot is no longer
> > Grant> possible.

We've discussed the issue on IRC yesterday evening, and I'm looking
if I can make a quick fix (something in between a proper fix and a
nice hack), but I'm not close to that yet.

> > With that said, I would very much like to support BR toolchains as
> > external toolchains if it's possible without too many dirty hacks
> > (sorry, haven't been following the recent discussion about it).
> AFAICT, the recent commit relies on the assumption that both --prefix
> and --sysroot values are correct and that the "prefix" is a child of
> "sysroot".

No, the other way around: prefix is a parent of sysroot (directory-wise).

> That's not the case for buildroot toolchains.  They have a prefix of
> "/usr" and a sysroot pointing to the output/staging directory.  I'm

Yes, that's because buildroot plays trick with those values. The code dates
back June 2007, and the exact reason for doing so is not yet known.

I'm trying to bring buildroot toolchains more in sync with a /standard/
way of handling paths, but I have to check regressions.

Anyway, I think that 'old' toolchains build prior the change I'm doing
will not work.

> guessing that setting the buildroot toolchain's --prefix value to
> output/staging/usr should fix the problem,

More complex than that, unfortunately... :-( I tried, and it does not
work so far (a few other things to change as well, eg. binutils).

> but I'm still a bit fuzzy on how the recently committed change works.

As I said earlier:
- get the configured prefix   -> CFG_PREFIX_DIR
- get the configured sysroot  -> CFG_SYSROOT_DIR
- subtract configured prefix from configured sysroot, gives relative sysroot
  -> REL_SYSROOT_DIR
- add current prefix to front of relative sysroot  -> SYSROOT_DIR

Yes, it works only for toolchains where sysroot is below prefix.
Yes, it breaks external toolchains build with buildroot.
Yes, I'm trying to fix this. But I won't invest to much time on that code...

> > Besides the advantages you listed there's also the fact that it will
> > make migration easier in the future - E.G.:
> > BR with internal toolchain -> BR with external BR toolchain -> BR with
> > crosstool-NG toolchain.

Well, there are two cases here:
- toolchain built externally: you have the same issues with all toolchain
  'generators': BR, CT-NG, others...
- toolchain built with CT-NG, but *driven* by BR: it's not an external
  toolchain really.

So I'm not sure that is a transition...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
