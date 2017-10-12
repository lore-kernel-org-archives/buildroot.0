From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 12 Oct 2017 01:06:32 +0000
Subject: [Buildroot] [PATCH 1/2] uclibc-ng: enable fts in default config
	file.
In-Reply-To: <20170718210704.GO1482@waldemar-brodkorb.de>
References: <20170713142549.28078-1-aduskett@gmail.com>
 <20170715114432.0b01a373@windsurf> <87d191afyw.fsf@dell.be.48ers.dk>
 <20170715214809.2158c3e2@windsurf> <87inis8jjj.fsf@dell.be.48ers.dk>
 <20170716164353.GI1482@waldemar-brodkorb.de>
 <246b2393-ffd3-99e5-5de9-db52d73488bb@mind.be>
 <20170718230641.479308e9@windsurf>
 <20170718210704.GO1482@waldemar-brodkorb.de>
Message-ID: <1507770391.3839.67.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Waldemar, Arnout, all,

On Tue, 2017-07-18 at 23:07 +0200, Waldemar Brodkorb wrote:
> Hi,
> Thomas Petazzoni wrote,
> 
> > 
> > Hello,
> > 
> > On Tue, 18 Jul 2017 21:24:05 +0200, Arnout Vandecappelle wrote:
> > 
> > > 
> > > ?I'm with you on this one. If a package can work with uClibc, we really should
> > > allow it.
> > > 
> > > ?However, I don't think the solution is to bloat our default uClibc config with
> > > features that are not useful for 99.82% of our packages. fts.h is not something
> > > like IPv6 that is useful for a large number of packages.
> > > 
> > > ?I also don't think we should add more options like BR2_ENABLE_LOCALE that copy
> > > the uClibc config options.
> > > 
> > > ?Perhaps the way to go is to have a BR2_TOOLCHAIN_UCLIBC_BLOAT_CONFIG option
> > > that a user can set to indicate he wants to see packages that will not work with
> > > our default uClibc config. That option could give a nice warning that this
> > > configuration is not tested and YMMV.
> > 
> > I have to say I don't like this. If we have an option, it should work,
> > and therefore be tested. It's the worst thing for users to simply tick
> > an option, and discover build failures here and there. If you have an
> > option that explicitly allows to do something, then that something
> > should work.
> 
> I still don't get it.
> We are not trying to disable fts in glibc, so it is available there.
> Why we can't enable it for uClibc-ng to get more compatibility?
> Just because of the bigger size?
> 
> If someone needs a really small system, there is always the
> possibilty to use a really small uClibc-ng config.

Sorry for bumping that stale thread - unintentionally bumped into it
so here're my 2 cents.

1. As a representative of those minorities who's been living without glibc
? ?I'm a bit disappointed to see those packages that "depends on *GLIBC*"
? ?especially if that's just a matter of config option in some tool.
? ?BTW it's not very obvious that "make uclibc-menucofig" may help here,
? ?also inevitably user will need to patch Buildroot removing
? ?"depends on BR2_TOOLCHAIN_USES_GLIBC" to get desired stuff built.
? ?That said for an experienced people like we are it's a piece of cake
? ?while for newcomers who only expect to toggle options in Buildroot's
? ?xconfig (i.e. with mouse in nice GUI) it will be a roadblock.

2. Speaking about bloating of default uClibc config in Buildroot I think
? ?we saw movements from both sides but in the same direction:
? ? - uClibc's options get removed or become enabled by default to make it
? ? ? simpler, cleaner and more robust tool but that inevitable adds a couple
? ? ? of hundred bytes here and there. I haven't done comparison of uClibc
? ? ? sizes from release to release, but might be Waldemar has some data here.
? ? - Buildroot's add-ons to uClibc's defaults also were adding more and more
? ? ? things [and some unconditionally]. For example IPv6 is always on now while
? ? ? I guess this option adds quite a bit of size.

? ? So I think yet another minor option being enabled won't be a problem.

3. Regarding purity of standards I may agree that we as more knowledgeable
? ?engineers need to educate our users and resist temptation to return to
? ?deprecated things. But as an advocate of my users I'd say that usability
? ?and support of wider packages might be even more important.
? ?In the end glibc developers and users couldn't care less about users of
? ?musl and uClibc if glibc legacy causes issues to named minorities as well
? ?as they are not?courageously getting rid of that legacy knowing it will
? ?really break applications used by many-many people.

-Alexey
