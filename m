From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 14:57:34 +0200
Subject: [Buildroot] [PATCH v2 3/6] support/gnuconfig: update to
 2019-05-28
In-Reply-To: <87y32o2jel.fsf@dell.be.48ers.dk>
References: <20190528203416.32261-1-thomas.petazzoni@bootlin.com>
 <20190528203416.32261-4-thomas.petazzoni@bootlin.com>
 <877ea844ag.fsf@dell.be.48ers.dk>
 <20190530143805.39abac31@windsurf>
 <87y32o2jel.fsf@dell.be.48ers.dk>
Message-ID: <20190531145734.280f09b8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 May 2019 14:53:22 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Did you get any further with moving all of this to package/gnuconfig and
> downloading it, or is that for later?

So, I tried to do this:

  https://github.com/tpetazzoni/buildroot/commits/gnuconfig

It's not that simple/straightforward though:

 - host-gnuconfig needs host-tar because host-gnuconfig fetches from
   Git so we create/extract a tarball. But host-tar is an autotools
   package, so it ends up depending on host-gnuconfig, creating a
   circular dependency.

   As discussed on IRC, I see three options to solve this:

   (1) Do not overwrite config.guess/config.sub for host packages. This
       will be an issue if we have some very old package that has an old
       config.guess/config.sub, and someone tries to build on a fairly
       "new" architecture, say ARM64.

   (2) Same as (1), but only for host-tar. Host-tar has some reasonably
       frequent releases, so hopefully the problem described in (1) doesn't
       happen.

   (3) Change the gnuconfig package so that it doesn't fetch from Git,
       but directly using wget the two individual files it needs.

 - removing --build=$(GNU_HOST_NAME) from all autotools packages
   doesn't really work well. For example Python 2.x at least then fails
   to build with: "configure: error: Cross compiling required
   --host=HOST-TUPLE and --build=ARCH". We could of course live with
   --build=$(GNU_HOST_NAME), with GNU_HOST_NAME being a recursively
   expanded variable, like my patch series does for libnspr and moarvm.

Overall, I am no longer so sure of the benefits vs. complexity
trade-off here. The above issues can be resolved for sure, but is it
worth it, compared to just having those two files in our tree ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
