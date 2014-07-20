From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 12:52:51 +0200
Subject: [Buildroot] Help : Blackfin - Target Binary Format (FDPIC/FLAT)
 and BR2_PREFER_STATIC_LIB option dependency
In-Reply-To: <C89D20716E201D428CB114157FC1F4E380F18E6A@BLR-SJP-MBX-1.wipro.com>
References: <C89D20716E201D428CB114157FC1F4E380F18E6A@BLR-SJP-MBX-1.wipro.com>
Message-ID: <20140720125251.723da24a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Could you configure your e-mail client to wrap lines to a reasonable
length.

On Sat, 19 Jul 2014 17:44:11 +0000, yuvaraj.patil at wipro.com wrote:

> For below packages (and few more packages) building failure is
> reported on Blackfin.
> 
> 1.       Prboom-2.5.0
> (http://autobuild.buildroot.net/results/c3ea501d2ba5e17ccb3f88c0588ddf00fd0a4649/<http://autobuild.buildroot.net/results/c3ea501d2ba5e17ccb3f88c0588ddf00fd0a4649>)
> 
> 2.       Gnuplot-4.6.2
> (http://autobuild.buildroot.net/results/14846b8d1a054409d1cee9f3ce1413f08b4c3634/<http://autobuild.buildroot.net/results/14846b8d1a054409d1cee9f3ce1413f08b4c3634>)
> 
> In the config files provided at the above autobuild log links, "FLAT"
> binary format is selected and BR2_PREFER_STATIC_LIB option gets
> selected by default. I tried to build these packages with few
> combinations for target binary format on Blackfin and my observation
> is as below.
> 
> a.       If "FLAT" binary format is selected, BR2_PREFER_STATIC_LIB
> option gets selected by default and the package fails to build.
> 
> b.      If "FDPIC" is selected and BR2_PREFER_STATIC_LIB  option is
> selected, the package fails to build
> 
> c.       If "FDPIC" is selected and BR2_PREFER_STATIC_LIB  is NOT
> selected, the package builds successfully.
> 
> So looks like static linking is not supported on Blackfin for these
> packages.

It's not so much that it's not supported, it's rather that it's buggy.
For the case of gnuplot for example, it's due to the fact that gnuplot
isn't aware that libgd needs to link against libpthread. When doing
dynamic linking this is done automatically: since libgd.so has a NEEDED
entry to libpthread.so, gnuplot doesn't have to be aware of this
dependency on libpthread. However, with static linking, this does not
occur.

So, we need to make sure that when gnuplot is linked, it passes the
-lpthread argument. There are two approaches to that:

 * The quick and easy one is to pass LIBS="-lpthread" in the
   environment of the gnuplot configure script, when the support for gd
   is enabled.

 * The nicer way is to make sure the libgd-config script that gnuplot
   uses to know how to link to gd that it reports the pthread
   dependency.

Regarding the prboom case, I don't know exactly what's happening, but I
suspect it's kind of similar, just with different libraries.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
