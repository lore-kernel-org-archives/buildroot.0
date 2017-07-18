From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Jul 2017 21:24:05 +0200
Subject: [Buildroot] [PATCH 1/2] uclibc-ng: enable fts in default config
 file.
In-Reply-To: <20170716164353.GI1482@waldemar-brodkorb.de>
References: <20170713142549.28078-1-aduskett@gmail.com>
 <20170715114432.0b01a373@windsurf> <87d191afyw.fsf@dell.be.48ers.dk>
 <20170715214809.2158c3e2@windsurf> <87inis8jjj.fsf@dell.be.48ers.dk>
 <20170716164353.GI1482@waldemar-brodkorb.de>
Message-ID: <246b2393-ffd3-99e5-5de9-db52d73488bb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-07-17 18:43, Waldemar Brodkorb wrote:
> Hi Peter, Thomas,
> Peter Korsgaard wrote,
[snip]
>> Ok, agreed. Adam, sorry but we prefer to keep things as they
>> are. It should be fairly easy for uClibc-ng users wanting to enable
>> selinux to notice that they need to change to glibc instead based on the
>> comment:
>>
>> comment "libselinux needs a glibc toolchain w/ threads, dynamic library"
> 
> But this is not the case, they don't need to switch to glibc.
> The decision makes me sad, as it goes the opposite way I try to
> develop in Buildroot.

 I'm with you on this one. If a package can work with uClibc, we really should
allow it.

 However, I don't think the solution is to bloat our default uClibc config with
features that are not useful for 99.82% of our packages. fts.h is not something
like IPv6 that is useful for a large number of packages.

 I also don't think we should add more options like BR2_ENABLE_LOCALE that copy
the uClibc config options.

 Perhaps the way to go is to have a BR2_TOOLCHAIN_UCLIBC_BLOAT_CONFIG option
that a user can set to indicate he wants to see packages that will not work with
our default uClibc config. That option could give a nice warning that this
configuration is not tested and YMMV.


> I added a lot of stuff f.e. to uClibc-ng to
> allow to build and use systemd. The required systemd patches are
> upstream. I regulary try to enable packages which are disabled for no
> good reason for uClibc users. AutoFS next version will contain the
> patch allowing to use uClibc-ng and libtirpc instead of Glibc.

 Patching packages so they work with uClibc is important too, but not relevant
to this discussion. Although indeed possibly the better option would be to patch
those four packages to avoid fts.h. But as written earlier: that's not so trivial.


> And what about the people using an architecture which is not supported
> by glibc? Like Sparc, ARC, Xtensa and Or1k? Or the no-MMU
> architectures? 
> 
> We enabled Wordexp recently and I would really love to see this
> enabled, too. Could you rethink about your decision?

 wordexp is different because it's actually POSIX. IMO our default uClibc config
should cover all of POSIX.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
