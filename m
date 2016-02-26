From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 26 Feb 2016 07:20:24 +0000
Subject: [Buildroot] [PATCH 2/2] host-m4: fix build when -std=gnu99 and
 inline functions are used
In-Reply-To: <56CF7CA0.7080801@mind.be>
References: <1456400230-4187-1-git-send-email-ltrimas@synopsys.com>
 <1456400230-4187-3-git-send-email-ltrimas@synopsys.com>
 <20160225135436.18a8385c@free-electrons.com>
 <1456405085.2312.2.camel@synopsys.com>
 <20160225142622.47b2841a@free-electrons.com>
 <1456414403.4586.63.camel@synopsys.com> <56CF7CA0.7080801@mind.be>
Message-ID: <1456471224.28645.10.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, 2016-02-25 at 23:13 +0100, Arnout Vandecappelle wrote:
> On 02/25/16 16:33, Alexey Brodkin wrote:
> > Hi Thomas,
> > 
> > On Thu, 2016-02-25 at 14:26 +0100, Thomas Petazzoni wrote:
> > > Hello,
> > > 
> > > On Thu, 25 Feb 2016 12:58:05 +0000, Lada Trimasova wrote:
> > > 
> > > > I used CentOS 5.7, gcc 4.9.2, glibc 2.5.
> [snip explanation of why this combination of gcc 4.9 with glibc 2.5 is broken]
> > That's why with older host glibc we need to pass "-fgnu89-inline"
> > flag to compiler.
> 
> ?I think you can basically say your host toolchain is broken: it fails to
> compile valid programs, because glibc doesn't satisfy the -std=gnu99 option.

That's very true. But it looks like on RedHat/CentOS 5.x (which are still
in use here and there) discussed problem exists.

Given default gcc in RHEL 5 is 4.1 (though 3.4 and 4.4 are available via
compat-gcc-34 and gcc44 correspondingly) ad it fails to compile host tar and m4
in current Buildroot I would still look for a permanent solution in vanilla
Buildroot instead of work-around on per machine basis.

> > And now I think we may even consider adding it
> > to the top-level HOST_CFLAGS instead of fixing problem on per-package
> > basis.
> 
> ?Since this is an issue with your toolchain, I think you should fix it globally
> (not just for buildroot) by setting CFLAGS_FOR_BUILD=-fgnu89-inline in your
> environment.
> 
> 
> ?Note: installing your own glibc (somewhere outside of /usr/lib) is possible,
> but awkward.

Indeed almost all is doable but we're talking here about "true enterprise"
approach when user has no admin privileges and what's more may have no
knowledge about stuff he uses. That's why I'd like to make sure Buildroot
just works on almost all sane setups today.

-Alexey
