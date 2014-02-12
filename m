From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Feb 2014 09:03:24 +0100
Subject: [Buildroot] Supporting multiple versions of toolchain
	components?
In-Reply-To: <52FA5AD8.4040506@mind.be>
References: <1392054226-20285-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <52F936C7.4040300@mind.be> <20140210234117.352533a5@skate>
 <52F9D9D0.8090409@mind.be> <20140211093221.28248844@skate>
 <52FA5AD8.4040506@mind.be>
Message-ID: <20140212090324.4cb9fe84@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 11 Feb 2014 18:16:08 +0100, Arnout Vandecappelle wrote:

> > That is indeed true, but I'm pretty sure some advanced users test the
> > latest versions of the various components.
> 
>  Do you sometimes do run-time tests of internal glibc toolchain builds?

Obviously before sending the patch that adds 2.19, I did do a run-time
test of a minimal ARM glibc+Busybox system in Qemu. The amount of
testing is minimal, but at least it boots all the way to userspace.

> >>  No, I don't think we have a reason to keep multiple versions for
> >> binutils, gdb, and also busybox BTW.
> > 
> > Having multiple versions of busybox seems clearly useless to me. For
> > the other ones, my opinion is more balanced.
> 
>  So you do see a reason to use an older binutils or gdb?

I believe it's just extra caution. Toolchain components tend to be more
delicate than other packages. That's why we almost never default to the
latest version of gcc, binutils and gdb in Buildroot.

> >>  Having multiple versions also means that you need:
> >>
> >> - multiple autobuilder instances (preferably for all architectures) to
> >> cover both versions;
> > 
> > That's not true. A single autobuilder instance can work on as many
> > toolchain configurations as you want. My autobuilder instance chooses
> > randomly between the configurations at
> > http://autobuild.buildroot.org/toolchains/configs/free-electrons/.
> 
>  What I mean is: you need to multiply the number of configurations, and
> therefore to get the same coverage you need to multiply the number of
> autobuilder instances.
> 
>  But I didn't realize that the autobuilder test package configurations,
> not glibc issues, and the packages will fail with either version of
> glibc. So you're right, this point is moot.

Your point is not entirely moot. C library headers will be different
between glibc 2.18 and 2.19, so you could imagine having package build
failures specific to a given version of glibc. This is typically what
we have with uClibc (and which was discussed at length during the
latest meeting), where we have multiple versions of uClibc that don't
behave the same as they don't offer the same features. However, the
amount of application-visible changes between glibc 2.18 and 2.19 is
probably a lot smaller, but maybe not inexistent.

>  So it's just the additional complexity of having the choice, duplicating
> the patches (none for glibc 2.19), and carrying the legacy. I guess
> that's not too bad.

Yes.

> > Again, I believe what you're proposing is a fairly radical move from
> > the Buildroot tradition. So we need to get some consensus or decision
> > here.
> 
>  Note that I'm not immediately advocating for removing the multiple
> version support where we have it already. Rather, I propose to not add
> more multiversion packages.

I certainly agree with you on this. I would propose to:

 1/ Remove the multiversion selection on Busybox, because I don't
    really see why we have this specifically for Busybox.

 2/ Keep a maximum number of three gcc, binutils, gdb and C library
    versions. Like: the latest one, the N-1 (default), and the N-2.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
