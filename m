From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Jul 2018 23:21:46 +0200
Subject: [Buildroot] [PATCH 1/1] boost: correctly disable icu in locale
 if needed
In-Reply-To: <CAPi7W83kqXy00ntbKnMWjXDLNDfNOFWY+kXXsx+QTh-0JKT+gA@mail.gmail.com>
References: <20180713174247.4005-1-fontaine.fabrice@gmail.com>
 <20180714224100.2bc87253@windsurf>
 <CAPi7W83kqXy00ntbKnMWjXDLNDfNOFWY+kXXsx+QTh-0JKT+gA@mail.gmail.com>
Message-ID: <20180714232146.0050882d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 Jul 2018 23:04:59 +0200, Fabrice Fontaine wrote:

> > First, if --without-icu has no effect, why isn't your patch removing
> > it ?
> >  
> I don't fully understand yet what --without-icu does in the other boost
> libraries so I didn't want to remove it.
> From my current understanding, icu should also (at least) be used by regex.

--without-icu apparently has the effect that ICU_PATH is not defined,
which has an impact in libs/locale/build/Jamfile.v2, but the syntax of
those .v2 files is really weird, so I don't get what's happening
afterwards.

> > Second, why are you introducing another BR2_PACKAGE_ICU conditional,
> > even if there's already one ?
> >  
> Because there was already a BR2_PACKAGE_BOOST_LOCALE conditional and it
> seems strange to set boost.locale.icu if locale is not enabled. But I can
> move it if you think it's better.

I think it would be good to understand the interaction with
--without-icu to have a clean solution.

> > Third, what is the problem with libboost_locale linking with icu if
> > found in the staging directory ?
> >  
> Because, if it links with icu, boost will also build chrono and thread. To
> avoid always selecting these two libraries, I sent a patch to select them
> only if BR2_PACKAGE_ICU is set (see http://patchwork.ozlabs.org/patch/943753).

Indeed, boost_locale will build boost_thread if ICU is enabled:

        if $(found-icu)
        {
            ICU_SOURCES = 
                boundary
                codecvt
                collator
                conversion
                date_time
                formatter
                icu_backend
                numeric
                time_zone
                ;
            
            result += <source>icu/$(ICU_SOURCES).cpp 
                      <library>../../thread/build//boost_thread 
                      ;
        }

However, I don't see this happening for chrono.

> My patch won't always work if boost links with icu when BR2_PACKAGE_ICU is
> not set (for example if the user changes his configuration between two
> builds). Perhaps, I should sent a patch serie with these two patches to
> better reflect the dependencies between them?

If patches have dependencies/interactions, then yes sending them as a
series makes it clear they are related.

However, I still don't see the relation here. We indeed recommend in
Buildroot to explicitly enable/disable features using configuration
options when possible, mainly to avoid target packages incorrectly
detecting some host library and trying to use it. So I'm still confused
by what this patch is *fixing*. That it makes things more correct is
OK, but that it is fixing something, I'm not sure.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
