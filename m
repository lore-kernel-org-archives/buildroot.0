From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Mar 2012 17:55:30 +0100
Subject: [Buildroot] Can I use the toolchain build with buildroot,
 as an external toolchain ?
In-Reply-To: <jkfl6r$bev$1@dough.gmane.org>
References: <1531E53627F1F749B4FE809BF2A4EB6703136FE8@WETMEX10.loepfe.com>
 <jkfl6r$bev$1@dough.gmane.org>
Message-ID: <20120322175530.1f14a73a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Thu, 22 Mar 2012 16:49:31 +0000 (UTC),
Grant Edwards <grant.b.edwards@gmail.com> a ?crit :

> > Q: Can I use a toolchain that has been build with buildroot (before)
> > as an external toolchain ?
> 
> Yes.  I used to do that.  After a few weeks, I gave up on it and built
> an external toolchain using crosstool-ng.
> 
> > Q: Is this explained somewhere, on how to do this?
> 
> No, because it's much simpler to just build an external toolchain
> using crosstool-ng, and then configure Buildroot use that.

Yes, I agree.

If you want to do that anyway, here are the steps. From a pristine
Buildroot configuration:

 * Select your architecture
 * Select your architecture variant
 * In Build options, set the host dir to /opt/your-toolchain-name where
   your-toolchain-name would typically be arm-linux-uclibcgnueabi or
   something like that (but it can also be anything else)
 * In Toolchain, use the Buildroot internal backend, and configure
   everything (gcc version, binutils version, etc.)
 * In Packages, disable Busybox (i.e no packages at all should be
   selected)
 * In target filesystems, disable the tarball (i.e no filesystems at
   all should be selected)

Then, build with make. You have your toolchain
in /opt/your-toolchain-name. You can erase your Buildroot build and
configuration now.

Now, you can do a second Buildroot to build your system itself,
re-using the toolchain you have created.

In the toolchain menu, select external toolchain, and then Custom
external toolchain. In the toolchain path,
set /opt/your-toolchain-name/usr/, and adjust the
IPv6/RPC/locale/wide-char options to the ones you have used when
building your toolchain. Don't worry if you're not sure here: Buildroot
will check at the beginning of the build all those options and will
abort if anything is incorrect.

Regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
