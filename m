From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 10:41:14 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-04-09
In-Reply-To: <2631847c-0767-a123-beb7-465c74843b21@smile.fr>
References: <20180410060022.4CF112071F@mail.bootlin.com>
 <c4f7202a-5609-9c3d-81b8-9209fe7497e4@smile.fr>
 <20180410102329.3109623f@windsurf>
 <2631847c-0767-a123-beb7-465c74843b21@smile.fr>
Message-ID: <20180410104114.3745c5d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Apr 2018 10:35:34 +0200, Valentin Korenblit wrote:

> > So while this will indeed cause a problem for llvm-config in the SDK
> > situation, I don't quite understand how you get this $ORIGIN/../lib
> > today, without running "make sdk".  
> 
> To be more precise, this is the RPATH:
> 
> (RPATH) Library rpath: [/home/vakor/buildroot/output/host/lib:$ORIGIN/../lib]
> 
> I haven't run make sdk.

Meh. Then either I no longer understand how Buildroot works, or it's
the LLVM build system that adds $ORIGIN/../lib in the RPATH.

But I believe your situation highlights a larger problem: we currently
use all <foo>-config scripts in STAGING_DIR because that's where
libraries install them, but that only works because all those programs
are scripts, and not compiled programs.

With compiled programs, it indeed doesn't work well to have host
binaries in STAGING_DIR, due to the RPATH issues. I'm not sure how to
solve this. Should we have all those <foo>-config programs in a
separate location ? But apparently, this llvm-config program behaves
different depending on its location, so if we move it elsewhere, it
won't return the right results anymore.

> > One possibility is to do like we do for postgresql: provide our own
> > minimal -config script. See package/postgresql/pg_config for an example.  
> 
> I'll take a look.

If the output returned by llvm-config is relatively simple, and it
doesn't have gazillion of options, then it is probably the easiest
solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
