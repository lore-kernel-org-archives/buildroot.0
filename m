From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jun 2010 18:33:27 +0200
Subject: [Buildroot] Problems with NetSNMP
In-Reply-To: <AANLkTilp_3jWjiR3ow1hrfQ-wSPuVWJipvM34joybv-a@mail.gmail.com>
References: <AANLkTilp_3jWjiR3ow1hrfQ-wSPuVWJipvM34joybv-a@mail.gmail.com>
Message-ID: <20100628183327.067b06ec@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Jun 2010 11:39:05 -0400
Chris Kerios <ckerios@gmail.com> wrote:

> I am trying to get netsnmp package running on my Geode LX.
> Development host is x86 running Fedora 13.  Target is previously
> mentioned Geode.  Buildroot is the latest git pull as of this morning.
> 
> I did a fresh build of everything, toolchain, uLibC, kernel, rootfs, etc.
> 
> The build runs cleanly with no errors, including the netsnmp package
> build.  When run on the target the snmpd launch fails with the message
> that it can't load libc.so.6.  So I created a link of libc.so.6 to
> libuClibc-0.9.31.so and relaunched the snmpd.  This fails with a new
> error that it can't load libdl.so.2.  I create another link of
> libdl.so.2 to libdl-0.9.31.so and relaunch snmpd.

Unfortunately, this isn't going to work. Having netsnmp depend on
libc.so.6 means that it was linked against glibc, while Buildroot
generates uClibc toolchains.

> This fails with a new error of "Starting network management
> services:/usr/sbin/snmpd: can't resolve symbol '__xstat64' in lib
> '/usr/lib/libnetsnmpmibs.so.20'"
> 
> Now I'm really stuck.  I've reviewed the mailing lists and this
> problem appears to have cropped up previously a while ago regarding
> the libraries not being found and statements reflect that it was
> fixed.  There is a email this month regarding this problem but it was
> with an external toolchain.  None of the problems mention the
> unresolved reference to __xstat64.  Has the old problem reappeared?

The issue seems to be that netsnmp build procedure in Buildroot isn't
correct and somehow uses the host C library. If nobody does so in the
mean time, I'll try to have a look this week.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
