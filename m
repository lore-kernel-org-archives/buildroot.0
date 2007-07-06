From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 6 Jul 2007 17:26:43 +0200
Subject: [Buildroot] What is the proper procedure to commit a patch?
In-Reply-To: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
References: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
Message-ID: <20070706152642.GA13765@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 06, 2007 at 02:35:32PM +0200, Ulf Samuelsson wrote:
>Now, when I have access, I would like to understand the proper
>procedure to add patches.
>
>After checking out and applying a patch, I can do:

- apply
- test
- check (svn diff)
- commit (svn ci this/file that/file; or everything svn ci). You're
  prompted for a message (my distry spawns $EDITOR, like usual).
>
>svn commit -F <file> 
>with <file> containing a log message.
>or 
>svn commit -m "log message" 
>
>I tried a real simple patch first and after the commit,
>the svn server automatically sent out a mail with the change,
>adding the log message.
>
>The patches I'd like to add are mainly:
>* BSP patch ,discussed and approved by Eric.
>* moving package/customize to topdir and rename "local", also discussed before
>* Support for AT91 boot monitors 
>        Dataflashboot
>        AT91-Bootstrap
>        U-boot
>        Generate U-Boot initialization scripts
>* Add AVR32 support.
>* A few extra packages.
>* Update mtdutils (which is really old)
>* Clean up the linux support (move into a separate dir in package)

I object to this. Can we please have _one_ linux.mk
If we cannot have it, then please explain to me why you think we should
duplicate this all over the place.
(see buildroot/target/device/mips/* for an example on how you can use
The One linux.mk).
A sane thing to do is to
$ svn rm $(find ./ -name linux.mk)
and _not_ to add to the lot of cruft. As said, please elaborate.

>* Bump versions on a number of packages which has disappeared from their download location.
>        (dash, rmp, l2tp, mpfr,mrouted, openntpd, portage, pppd,udev)
>* Add TARGET_CFLAGS to all packages not having this
>        Would like to know if they lack TARGET_CFLAGS for a reason.
>        (acpid,berkleydb, hdparm, iostat,ltp-testsuite,memtester,netkitbase,
>         procps, python, sysklogd, tinyx,udhcp)

Packages that do not use autoconf'ed configure scripts should IMO also
use
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(THAT_DIR) whatever
where possible. This approach makes maintenance way simpler since you do
not have to touch gazillions of files if you choose to add another var.

>* Introduce concept of distributions  (did not do any work there yet though)
>--------------
>        Both the version bump and TARGET_CFLAGS lists are a month old, so 
>        maybe the svn already is updated.
>
>        Is it OK to bump version if something disappears from internet, or do we need a review.
>        Sometimes you find new versions of a package, Is it OK to bump the version
>        without previous review by peers?

Check that the package does what it is supposed to do, i.e. actually use
the piece of updated software for a few days, ideally interactively for
daily use.
>
>        Anything else to think about (except golden rule: do not break the build)?

Yeah, try not to break stuff too badly. Don't introduce complexity
without real, apparent benefit. If you want to add complexity (like your
BSP stuff), then discuss it (like e.g. i did with the sysroot stuff, or,
at least i warned for a long time, got no feedback and it's obviously
correct and useful). I still don't like the concept and  implementation
of that BSP stuff, fwiw.

hope at least some hunks from the above helps; cheers,
