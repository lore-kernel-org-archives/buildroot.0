From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 28 Jun 2017 06:16:56 +0300
Subject: [Buildroot] [PATCH] squid: uClibc workaround no longer required
In-Reply-To: <7636aa0c-a897-ea70-5dd2-6f7ec435a2b4@mind.be>
References: <20170627190629.GA1589@waldemar-brodkorb.de>
 <7636aa0c-a897-ea70-5dd2-6f7ec435a2b4@mind.be>
Message-ID: <20170628031656.5sm73m5wtw66vgef@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tue, Jun 27, 2017 at 10:24:40PM +0200, Arnout Vandecappelle wrote:
> On 27-06-17 21:06, Waldemar Brodkorb wrote:
> > As all librt and libpthread functions are integrated into
> > libc for a while, workaround no longer required.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  package/squid/squid.mk | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> > diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> > index 976ce6d..bcb3744 100644
> > --- a/package/squid/squid.mk
> > +++ b/package/squid/squid.mk
> > @@ -50,11 +50,6 @@ else
> >  SQUID_CONF_ENV += squid_cv_gnu_atomics=no
> >  endif
> >  
> > -# On uClibc librt needs libpthread
> > -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
> > -SQUID_CONF_ENV += ac_cv_search_shm_open="-lrt -lpthread"
> > -endif
> 
>  In [1], Baruch wrote:
> 
> B> package/squid/squid.mk
> B>
> B>   Needed for shm_open().
> 
>  But indeed, the -lrt is added by the configure script, this workaround was only
> needed for uClibc which used pthread functions from librt so needed to be linked
> with libpthread as well.
> 
>  Adding Baruch in Cc to double-check. Baruch, can you confirm that this can
> indeed be removed?

Yes. I missed the uClibc condition when I wrote that. I have now checked with 
a current uClibc-ng toolchain, and indeed all former librt symbols are in the 
main libc. librt.a is empty.

Thanks Waldemar and Arnout for double checking.

>  For me:
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Baruch Siach <baruch@tkos.co.il>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
