From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 Dec 2013 12:22:20 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-12-09
In-Reply-To: <20131211071643.GF1217@tarshish>
References: <20131210073007.6A2C4100850@stock.ovh.net>
 <20131211043812.GA1217@tarshish>
 <ad79e2e1-bce2-4354-8b64-7b2bc5082d0e@email.android.com>
 <20131211071643.GF1217@tarshish>
Message-ID: <20131219102220.GD4148@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Dec 11, 2013 at 09:16:44AM +0200, Baruch Siach wrote:
> On Wed, Dec 11, 2013 at 07:28:35AM +0100, Thomas De Schampheleire wrote:
> > Baruch Siach <baruch@tkos.co.il> wrote:
> > >On Tue, Dec 10, 2013 at 08:30:07AM +0100, Thomas Petazzoni wrote:
> > >>     xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/0b9b3bb1791bbc9f902a23360c4540d90a0e05ca/
> > >>     xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/ffda6f3f64c612da999229226f699c01ccebe4c2/
> > >
> > >I'm struggling with this one. The configure script test for posix_spawn build 
> > >fails because it lacks '-lrt'. This causes m4 to use an internal 
> > >implementation that fails at build time for some other reason (haven't found 
> > >the reason for that yet).
> > >
> > >How can I add -lrt to the build test command line?
> > 
> > Isn't this by adding/setting the LIBS variable before
> > calling the macro that executes the test? 
> 
> Thanks, I'll try that. This macro seems to be called from m4/spawn_h.m4. This 
> failures seems to be xtensa specific. I wonder how other archs handle this.

Well, this check seems to come from gnulib. How can I fix it then?

BTW, coreutils shows the same problem 
(http://autobuild.buildroot.net/results/514/5147d4962bf486c91c314eda4894140f31ea1b44/).

I still don't understand why the autobuilder doesn't fail on other archs. I 
can reproduce this failure on ARM with the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_M4=y

Thomas P, is there a way to see the config.log file from a successful build of 
m4 on the autobuilder?

These successes are quite hard to find, it seems. Of the latest 50 autobuilds, 
the m4 package is selected in only 3 configs with the following results:

Same failure on arc
http://autobuild.buildroot.net/results/ebf/ebf731271dc74d8b17304df3de8eb34220ce371e/

Failure for other reason on x86_64
http://autobuild.buildroot.net/results/dbd/dbd7030f9a04d6aaf19b60ae04a2359228dda926/

Success on sh4a, apparently using glibc newer than 2.16 that moved posix_spawn 
into the main libc.so
http://autobuild.buildroot.net/results/0a2/0a29c9c8cc268a2d2468c6d2bccf27a77caefebf/

baurch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
