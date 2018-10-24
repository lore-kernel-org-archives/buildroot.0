From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 24 Oct 2018 21:58:30 +0300
Subject: [Buildroot] [PATCH v2,
 1/1] bdwgc: add optional cplusplus support
In-Reply-To: <CAPi7W83mdM4C5XjaXH1kqyUPhBC0+ozpAJvnrnZ3wtHykpeWMA@mail.gmail.com>
References: <20181023210405.31753-1-fontaine.fabrice@gmail.com>
 <20181024041215.o37yjufysqt4eilt@sapphire.tkos.co.il>
 <CAPi7W83mdM4C5XjaXH1kqyUPhBC0+ozpAJvnrnZ3wtHykpeWMA@mail.gmail.com>
Message-ID: <87r2gf6ujt.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Fabrice Fontaine writes:
> Le mer. 24 oct. 2018 ? 06:12, Baruch Siach <baruch@tkos.co.il> a ?crit :
>> On Tue, Oct 23, 2018 at 11:04:05PM +0200, Fabrice Fontaine wrote:
>> > Use CFLAGS_EXTRA to pass C and C++ flags in a single variable
>> >
>> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> > ---
>> > Changes v1 -> v2 (after review of Arnout Vandecappelle and Baruch
>> > Siach):
>> >  - Use CFLAGS_EXTRA to pass C and C++ flags in a single variable instead
>> >    of using CFLAGS and CPPFLAGS
>> >
>> >  package/bdwgc/bdwgc.mk | 10 +++++++++-
>> >  1 file changed, 9 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
>> > index 5603df8d9d..1d8d7284f8 100644
>> > --- a/package/bdwgc/bdwgc.mk
>> > +++ b/package/bdwgc/bdwgc.mk
>> > @@ -27,9 +27,17 @@ ifeq ($(BR2_STATIC_LIBS),y)
>> >  BDWGC_CFLAGS += -DGC_NO_DLOPEN
>> >  endif
>> >
>> > +BDWGC_CONF_OPTS = CFLAGS_EXTRA="$(BDWGC_CFLAGS)"
>>
>> I think you can just drop BDWGC_CFLAGS. Instead use CFLAGS_EXTRA alone in
>> BDWGC_CONF_OPTS.
> I'm already just using CFLAGS_EXTRA in BDGWC_CONF_OPTS.
> Do you suggest that I rename BDWGC_CFLAGS into BDWGC_CFLAGS_EXTRA to
> avoid any confusion?

Yes, that's what I meant.

baruch

>> > +
>> >  # Ensure we use the system libatomic_ops, and not the internal one.
>> > -BDWGC_CONF_OPTS = --with-libatomic-ops=yes CFLAGS="$(BDWGC_CFLAGS)"
>> > +BDWGC_CONF_OPTS += --with-libatomic-ops=yes
>> >  HOST_BDWGC_CONF_OPTS = --with-libatomic-ops=yes
>> >
>> > +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
>> > +BDWGC_CONF_OPTS += --enable-cplusplus
>> > +else
>> > +BDWGC_CONF_OPTS += --disable-cplusplus
>> > +endif
>> > +
>> >  $(eval $(autotools-package))
>> >  $(eval $(host-autotools-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
