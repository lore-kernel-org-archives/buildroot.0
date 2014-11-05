From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 5 Nov 2014 09:22:14 +0200
Subject: [Buildroot] [PATCH] wireshark: remove RPATH tag
In-Reply-To: <20141105081555.5aca83e2@free-electrons.com>
References: <0dae86e37516236d337e8433c63047504f1576f9.1415126141.git.baruch@tkos.co.il>
 <20141105081555.5aca83e2@free-electrons.com>
Message-ID: <20141105072214.GL2358@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Nov 05, 2014 at 08:15:55AM +0100, Thomas Petazzoni wrote:
> On Tue,  4 Nov 2014 20:35:41 +0200, Baruch Siach wrote:
> > Edit libtool to remove RPATH from generated binaries. This is similar to
> > upstream commit making the same change when buiding RPMs.
> > https://code.wireshark.org/review/gitweb?p=wireshark.git;a=commitdiff;h=a4a624e4c5
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/wireshark/wireshark.mk | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> > index ccf5a56f1f23..6c7c3920e7af 100644
> > --- a/package/wireshark/wireshark.mk
> > +++ b/package/wireshark/wireshark.mk
> > @@ -15,6 +15,12 @@ WIRESHARK_AUTORECONF = YES
> >  WIRESHARK_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
> >  			ac_cv_path_PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
> >  
> > +define WIRESHARK_REMOVE_RPATH
> > +	$(SED) 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' $(@D)/libtool
> > +	$(SED) 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' $(@D)/libtool
> > +endef
> > +WIRESHARK_POST_CONFIGURE_HOOKS += WIRESHARK_REMOVE_RPATH
> 
> Isn't this problem potentially identical in many packages that use
> libtool? What leads the wireshark libtool to have this specifically?

Probably. The Buildorot speex package does an almost identical edit to its own 
libtool. Do you think we should enable this for all libtool users? We'll only 
know if anything breaks at run time.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
