From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Jun 2014 08:13:27 +0200
Subject: [Buildroot] autoconf caching
In-Reply-To: <CAE9DZURmNL1iOcY4UR4CrDkg5DOT46-yy-e1+Ftax1_W0faing@mail.gmail.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
 <20140605224222.0184a9b7@free-electrons.com>
 <CAE9DZURmNL1iOcY4UR4CrDkg5DOT46-yy-e1+Ftax1_W0faing@mail.gmail.com>
Message-ID: <20140606081327.7336a6a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dallas Clement,

On Thu, 5 Jun 2014 17:06:48 -0500, Dallas Clement wrote:

> You bet.  Please see attached.  I'm in the process of fully upgrading over
> to latest buildroot / master from 2012.08 so there is probably still some
> deprecated stuff in my .config.

I didn't spot anything really wrong in there. host-gdb looks a bit
useless since most likely your external toolchain already has a
cross-debugger integrated. Other than that, it appears that:

 * Your configuration has a fairly large number of packages, some of
   them being fairly big stuff (mysql, perl, etc.)

 * The build time of perl is really large. Maybe there's something that
   could be done to improve this. Looking at perl.mk in Buildroot, I
   see that it uses $(MAKE1), so the build of this package is not
   parallelized.

 * The installation time of host-mysql seems quite large as well, I
   don't really see why, especially since the mysql host install
   commands copy just one file in Buildroot.

Really, other than these little details, I believe you're simply
affected by the size of your configuration in terms of the number of
packages.

> My build machine is a HP server with 8 core Intel(R) Xeon(R) CPU E5-2637 v2
> @ 3.50GHz.  The OS is RHEL 6.4 64 bit.  No virtual machine and no NFS.

Seems a fairly decent setup. You have enough RAM, and a good storage
system (ideally based on SSDs) ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
