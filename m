From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 23:32:27 +0200
Subject: [Buildroot] [PATCH] package/systemd: importd broken on Sourcery
 CodeBench ARM 2014.05
In-Reply-To: <20160711171630.GD3734@free.fr>
References: <1468187781-7497-1-git-send-email-yann.morin.1998@free.fr>
 <20160711110225.19dfaa5f@free-electrons.com>
 <20160711171630.GD3734@free.fr>
Message-ID: <20160827233227.27f54621@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jul 2016 19:16:30 +0200, Yann E. MORIN wrote:

> > So is the problem a kernel headers problem, or a glibc version problem ?  
> 
> Both. O_TMPFILE was introduced in Linux 3.11, so we need at least those
> headers. Also, glibc-2.18 did not provide it in fcntl.h; it only
> appeared in glibc-2.19.

I'm still not sure to understand why both are needed.

In any case, this fix is not correct, since the issue appears with
other toolchains as well:

 http://autobuild.buildroot.net/results/e6f/e6f8189029487155a784b4e664178adfd92f8884/build-end.log

 This one is an ARM toolchain, that uses 3.12 kernel headers, so most
 likely it's a glibc version issue.

 http://autobuild.buildroot.net/results/339/33912eebb5f4ee3f73be078ba2035f48d76a6a46/build-end.log

 This one is a PowerPC toolchain.

I see two possibilities only:

 * Introduce some glibc version dependency config knobs.

 * Add a workaround in the systemd code to define O_TMPFILE to the
   proper value when not provided by the C library.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
