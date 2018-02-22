From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Feb 2018 10:41:46 +0100
Subject: [Buildroot] [PATCH-FOR-NEXT v1 3/6] pkgconf: add
 host-pkg-config wrapper
In-Reply-To: <0e296fe2-3359-581f-6d3d-d3bc3cac06eb@mind.be>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
 <20180221142801.28997-4-gael.portay@savoirfairelinux.com>
 <20180221225010.4b4228aa@windsurf.lan>
 <0e296fe2-3359-581f-6d3d-d3bc3cac06eb@mind.be>
Message-ID: <20180222104146.5d4efe6e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for the feedback!

On Thu, 22 Feb 2018 10:27:13 +0100, Arnout Vandecappelle wrote:

> > I've been thinking about this for a while, and I remember having a
> > discussion about this with some other Buildroot developer a while ago.
> > I think the most correct thing to do would be:
> > 
> >  $(HOST_DIR)/bin/pkg-config returns results valid for native compilation
> > 
> >  $(HOST_DIR)/bin/<tuple>-pkg-config returns results valid for cross-compilation  
> 
>  This sounds like a good idea, but as you note below, could lead to breakage as
> well.

Yes.

> 
>  An alternative would be (IIRC this idea was launched by ThomasDS (added in Cc)):
> 
> $(HOST_DIR)/bin/ contains binaries valid for native compilation (i.e. no
> cross-compiler, cross-pkg-config, ...)
> 
> $(HOST_DIR)/<tuple>/bin contains binaries valid for cross-compilation

Changing this will also lead to a lot of breakage. All our users who
have scripts doing $(HOST_DIR)/bin/<tuple>-gcc will be broken. I would
even qualify it as an even more radical change, breaking even more
stuff.

And more importantly, the result is not great. I think the most correct
result is to have a single HOST_DIR/bin, with both native and cross
compilation tools, with cross-compilation tools prefixed by <tuple>.

> > I.e, the current pkg-config wrapper should be renamed
> > <tuple>-pkg-config, and pkg-config should behave like a normal native
> > pkg-config, except that it provides results for libraries located in
> > $(HOST_DIR).
> > 
> > The autoconf PKG_CHECK_MODULES() macro uses PKG_PROG_PKG_CONFIG(),
> > which internally uses AC_PATH_TOOL(). And AC_PATH_TOOL() will first
> > search for the program with the host machine tuple, and warn if the
> > program cannot be found with this tuple. From
> > https://www.gnu.org/software/autoconf/manual/autoconf-2.68/html_node/Generic-Programs.html:
> > 
> > """
> > When cross-compiling, this macro will issue a warning if no program
> > prefixed with the host type could be found. For more information, see
> > Specifying Target Triplets.   
> 
>  Weird, I checked a couple of log files and I could see no such warning. Ah,
> that's because we pass PKG_CONFIG=... in the environment.

Yes, I believe it is because we pass PKG_CONFIG=.

> Is it the idea to remove that from the environment then?

Not necessarily, because PKG_CONFIG may be used by non-autoconf based
packages. Some non-autotools packages do:

	FOO=`$PKG_CONFIG ...`

>  Anyway, the PATH-based alternative will not remove this warning, but that
> shouldn't be different from the current situation.
> 
> > """
> > 
> > I know this change will:
> > 
> >  - Potentially break a number of packages we have in Buildroot, which
> >    directly use pkg-config without first trying to use
> >    <tuple>-pkg-config  
> 
>  I.e. anything not using autotools? Well, most will probably heed the
> PKG_CONFIG=... in the environment.

Most yes, but not all. Some of them do:

	FOO=`pkg-config ...`

which currently works because PATH contains $(HOST_DIR)/bin, and
pkg-config returns correct results thanks to us injecting the proper
PKG_CONFIG_LIBDIR and PKG_CONFIG_SYSROOT_DIR depending on whether we're
building a host or target package.

>  The PATH-based alternative doesn't have this potential breakage.
> 
> 
> >  - Potentially break a number of downstream users who are using
> >    pkg-config.  
> 
>  The PATH-based alternative reduces this problem, downstream users just have to
> add $(HOST_DIR)/tuple/bin to their path (and Buildroot will do this for post-xxx
> scripts).

Well, they still have to change to $(HOST_DIR)/tuple/bin, which means
it breaks stuff for them anyway.

> > However:
> > 
> >  - It would solve that once you add $(HOST_DIR)/bin to your PATH, you
> >    cannot anymore do native builds because "pkg-config" returns results
> >    that are not relevant for native builds. I already saw a number of
> >    people affected by this.  
> 
>  The PATH-based alternative solves this as well.
> 
>  Note BTW that neither alternative solves the problem when building a host-tool
> during a target build (and yes, we have seen this problem already in some
> packages). AFAICS, autotools will also for host builds use the PKG_CONFIG passed
> in the environment or discovered through the tuple. Same for CMake.

Potentially autotools could be taught about PKG_CONFIG_FOR_BUILD, just
like it does for CC_FOR_BUILD and al. But that's obviously not
supported by packages today.

> >  - It would comply with the standard autoconf expectations.  
> 
>  With the PATH-based alternative, it might make sense to have the cross-stuff
> both in $(HOST_DIR)/bin with the tuple prefix, and in $(HOST_DIR)/tuple/bin
> without the prefix. That way, we get the advantages of both: comply with
> autoconf expectations, and avoid breaking packages or downstream users.

I'm still not convinced about changing the HOST_DIR/ organization. It's
a massive change, affecting everything, and not just pkg-config, and
the outcome is less nice than what we have today, for my perspective.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
