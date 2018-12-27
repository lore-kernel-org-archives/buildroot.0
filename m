From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Dec 2018 15:34:23 +0200
Subject: [Buildroot] [PATCH 1/3] lm-sensors: remove redundant
 BUILD_STATIC_LIB build parameter
In-Reply-To: <ae471095-2be7-3ccd-569d-b94e0f9a7e9b@gmail.com>
References: <6592ba5b855eb8d5f79c6d883a45bdf02f1bfb49.1545905628.git.baruch@tkos.co.il>
 <ae471095-2be7-3ccd-569d-b94e0f9a7e9b@gmail.com>
Message-ID: <20181227133423.5itzxzs66gar3zjl@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Thu, Dec 27, 2018 at 12:34:31PM +0100, Romain Naour wrote:
> Le 27/12/2018 ? 11:13, Baruch Siach a ?crit?:
> > Commit 3e05efd76636 ("package/lm-sensors: disable static library for
> > shared-only build") added BUILD_STATIC_LIB to LM_SENSORS_MAKE_OPTS with
> > value that depends on BR2_SHARED_LIBS, but forgot to remove it from the
> > common LM_SENSORS_MAKE_OPTS. Fix that.
> 
> IIRC, this patch was part of a series fixing packages that build a static
> library when BR2_SHARED_LIBS is set. I had a special hook checking if a package
> install a *.a file to STAGING_DIR.
> But this effort was stopped since there is some corner case where a .a file is
> needed:
> 
> http://lists.busybox.net/pipermail/buildroot/2015-January/116736.html
> 
> But, we still have a case where a package A install a shared and a static
> library and a package B that depend on package A can choose to link against the
> shared or the static library.
> 
> Acked-by: Romain Naour <romain.naour@gmail.com>

Thanks.

I should have probably mentioned that this patch makes no functional change. 
The BUILD_STATIC_LIB assignment below overrides this one. So this is only 
about removing the redundancy.

baruch

> > Cc: Romain Naour <romain.naour@openwide.fr>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/lm-sensors/lm-sensors.mk | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
> > index 6fc7ce4981c9..778a355b0f7a 100644
> > --- a/package/lm-sensors/lm-sensors.mk
> > +++ b/package/lm-sensors/lm-sensors.mk
> > @@ -21,7 +21,6 @@ LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_PWMCONFIG) += sbin/pwmconfig
> >  LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_SENSORS_DETECT) += sbin/sensors-detect
> >  
> >  LM_SENSORS_MAKE_OPTS = \
> > -	BUILD_STATIC_LIB=1 \
> >  	MACHINE=$(KERNEL_ARCH) \
> >  	PREFIX=/usr

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
