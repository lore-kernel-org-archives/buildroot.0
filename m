From: Antoine Tenart <antoine.tenart@free-electrons.com>
Date: Wed, 4 Nov 2015 11:00:34 +0100
Subject: [Buildroot] [PATCH] wf111: fix overwriting module files during
 install
In-Reply-To: <64CA5C49A43E314D9F7DAE05370E2F7B06771305@hed-dc01.hed.local>
References: <1446569533-25368-1-git-send-email-antoine.tenart@free-electrons.com>
 <20151103183410.0e80264e@free-electrons.com>
 <64CA5C49A43E314D9F7DAE05370E2F7B06771305@hed-dc01.hed.local>
Message-ID: <20151104100034.GB24888@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 03, 2015 at 11:38:35AM -0600, Matthew Starr wrote:
> 
> The problem with this is the wf111 package depends on the manufacturer's
> build and install method through their makefile included in the binary
> file they
> provide as an input to the wf111 package.  This is a single step build
> and install
> process.  You could make a new set of steps to build and install in the
> wf111.mk file, but then any manufacturer changes in future versions of
> the
> software could and most likely will break the wf111.mk file.

I agree with Matthew, it is not possible to separate the build task from
the install one using the wf111 top Makefile as is. I see 3 solutions
here:

- We keep it this way, it's not the best solution from a Buildroot point
  of view but the package maintenance is easier.
- We make a patch to modify the top Makefile, separating properly the
  step phase from the install one.
- We explicitly do the compilation and installation in the wf111.mk
  file, by copying what is done in the Makefile (the install_static
  target calls other Makefile, and performs some actions to copy some
  files to destdir).

What do you recommend?

Thanks,

Antoine

-- 
Antoine T?nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
