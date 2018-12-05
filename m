From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 5 Dec 2018 23:20:58 +0100
Subject: [Buildroot] [RFC PATCH] host-localedef: Compile against glibc
In-Reply-To: <20180801083938.23914da0@windsurf>
References: <20180730053936.26460-1-sam@mendozajonas.com>
 <20180731225540.3cd9fcd8@windsurf>
 <8e693163a5a63640325889d8a100b9fe01a2a9f1.camel@mendozajonas.com>
 <20180801083938.23914da0@windsurf>
Message-ID: <20181205232058.7ce7d457@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Wed, 1 Aug 2018 08:39:38 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Wed, 01 Aug 2018 11:31:16 +1000, Samuel Mendoza-Jonas wrote:
> 
> > I think it's a bit of both; 2.27 introduces new locale descriptions which
> > localedef can't handle, eg:
> > 
> > Generating locale ru_RU.UTF-8
> > /scratch/jenkins-workspace/op-build-upstream/output/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/share/i18n/locales/ru_RU:125: LC_TIME:syntax error
> > /scratch/jenkins-workspace/op-build-upstream/output/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/share/i18n/locales/ru_RU:149: LC_TIME:syntax error  
> 
> Ah, so I guess this update of localedef is going to fix
> https://bugs.busybox.net/show_bug.cgi?id=11096.
> 
> > And we fall back to the C locale at runtime (at least in my environment).
> > I'll stare at the glibc release notes / bug report a bit more and see if
> > I can make a more legible explanation.  
> 
> Would be nice, though it generally makes sense to have a localedef
> implementation that is in sync with glibc.
> 
> > > See how they are doing it in PTXdist:
> > > https://git.pengutronix.de/cgit/ptxdist/tree/rules/host-localedef.make.
> > > Most likely using the locale/others make target will help cut the build
> > > time significantly.    
> > 
> > Yes this is the contentious part, we're building a whole glibc. Unfortunately
> > if we want to build just the locale/others target like PTXdist we also need
> > their bonus patch to glibc:
> > https://git.pengutronix.de/cgit/ptxdist/tree/patches/localedef-glibc-2.27/0001-HACK-only-build-and-install-localedef.patch
> > 
> > Otherwise the build fails with, for example:
> > 
> > make[4]: *** No rule to make target '/scratch/builds/locales/build/host-localedef-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e/build/elf/soinit.os', needed by '/scratch/builds/locales/build/host-localedef-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e/build/libc.so'.  Stop.
> > Makefile:215: recipe for target 'locale/others' failed
> > make[3]: *** [locale/others] Error 2
> > Makefile:9: recipe for target 'locale/others' failed
> > make[2]: *** [locale/others] Error 2
> > 
> > So the tradeoff is adding a few minutes of extra build time versus carrying
> > a bit of a hack to enable just the localedef/others target.  
> 
> Their patch is not that crazy IMO, it should be too complicated to
> maintain. Perhaps we could even improve it a bit further to make it
> acceptable upstream ?
> 
> Best regards,
> l
> Thomas

Just stumbled over the same (or similar) locale problem with buildroot-2018.11/glibc-2.28,
fixed by the suggested patch. Just send out a follow up RFC patch with various comments addressed,
fixes and updates, see [1]...

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/1008473/
