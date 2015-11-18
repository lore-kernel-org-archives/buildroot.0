From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 18 Nov 2015 06:50:51 +0200
Subject: [Buildroot] [PATCH] hidapi: new package
In-Reply-To: <564AFD4E.2000301@imgtec.com>
References: <1447692852-21669-1-git-send-email-Vincent.Riera@imgtec.com>
 <20151116180724.GK9908@tarshish> <564AFD4E.2000301@imgtec.com>
Message-ID: <20151118045051.GO9908@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Tue, Nov 17, 2015 at 10:11:26AM +0000, Vicente Olivert Riera wrote:
> On 11/16/2015 06:07 PM, Baruch Siach wrote:
> > On Mon, Nov 16, 2015 at 04:54:12PM +0000, Vicente Olivert Riera wrote:
> >> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> > 
> > [...]
> > 
> >> +HIDAPI_DEPENDENCIES = libusb
> >> +# When eudev is used as the udev provider, libgudev is automatically
> >> +# provided as it is part of eudev. However, when systemd is used as the
> >> +# udev provider, libgudev is not provided, and needs to be built
> >> +# separately. This is why we select the libgudev package only if systemd
> >> +# is used.
> >> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> > 
> > Should be 'ifeq ($(BR2_PACKAGE_LIBGUDEV),y)', in think, since all we need is 
> > to have libgudev built before this package, regardless of systemd. With this 
> > change the comment becomes redundant. The comment in Config.in should be 
> > enough.
> 
> we need libgudev only if we are going to use systemd. Otherwise it will
> be provided by eudev.
> 
> Of course we could use ifeq ($(BR2_PACKAGE_LIBGUDEV),y) here, but, for
> consistency with Config.in, I use ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> instead. See for instance the udisks package.

I think this is wrong. First, consistency with Config.in calls for using 
BR2_PACKAGE_LIBGUDEV like we do with all other selects. But more importantly, 
IMO, we only use the <pkg>_DEPENDENCIES variable to set the build order which 
is conceptually independent of the underlying reason we need this dependency, 
systemd in this case. I think that all the other packages that Thomas 
mentioned should also test for BR2_PACKAGE_LIBGUDEV when setting 
<pkg>_DEPENDENCIES.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
