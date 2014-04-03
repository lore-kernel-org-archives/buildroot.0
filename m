From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 Apr 2014 16:13:29 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-03-28
In-Reply-To: <20140330051113.GA4579@tarshish>
References: <20140329073011.D16F2101349@stock.ovh.net>
 <20140329175452.5c711852@skate> <20140330051113.GA4579@tarshish>
Message-ID: <20140403131329.GJ4579@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Sun, Mar 30, 2014 at 08:11:13AM +0300, Baruch Siach wrote:
> On Sat, Mar 29, 2014 at 05:54:52PM +0100, Thomas Petazzoni wrote:
> > >       i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/849a7167241f4fd4ea8bab1085c8fc3db5e4495d/
> > >       i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/6526c2392eba1b3f6193ec6c3e87af548dbbf8b0/
> > >       i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/23237d2f90d8ec0584a9eb4de8b9b785089053ac/
> > 
> > These problems exist since AUTORECONF has been enabled on wget, by
> > commit 84bf8f04c68074e7a3acee4018f2ddd63733b52e from Baruch.
> > 
> > Baruch, can you have a look?
> 
> I'll take a look in a few days.

The direct cause of this build failure is the gettext version check at 
po/Makefile.in.in:

check-macro-version:
        @test "$(GETTEXT_MACRO_VERSION)" = "@GETTEXT_MACRO_VERSION@"

Since commit 84bf8f04c6807 (wget: fix build against uclibc snapshot) we 
autoreconf wget. When host-gettext is built before wget, the generated 
aclocal.m4 file includes the gettext version of gettext.m4 instead of wget own 
version of this file which is older. The reason for that seems to be that the 
gettext gettext.m4 is copied to $(HOST_DIR)/usr/share/aclocal which is added 
to aclocal search path with its -I parameter. The newer gettext.m4 defines 
GETTEXT_MACRO_VERSION as 0.18, while po/Makefile.in.in expects 0.17.

My questions is: how can we avoid getting the wrong gettext.m4 version used?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
