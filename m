From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Jul 2017 10:25:41 +0200
Subject: [Buildroot] [PATCH v2 05/13] package/minetest: add gettext
 optional dependency
In-Reply-To: <e1ed833d-77ef-745e-8206-992846efcd04@gmail.com>
References: <20170612205410.20230-1-romain.naour@gmail.com>
 <20170612205410.20230-5-romain.naour@gmail.com>
 <20170624172028.58c971c4@windsurf.home>
 <e1ed833d-77ef-745e-8206-992846efcd04@gmail.com>
Message-ID: <20170713102541.276b68d0@windsurf.orange-hotspot.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jul 2017 18:43:01 +0200, Romain Naour wrote:

> > On Mon, 12 Jun 2017 22:54:02 +0200, Romain Naour wrote:
> >   
> >>  MINETEST_CONF_OPTS = \
> >>  	-DDEFAULT_RUN_IN_PLACE=OFF \
> >> -	-DENABLE_GETTEXT=OFF \
> >>  	-DENABLE_SOUND=OFF \
> >>  	-DENABLE_GLES=OFF \
> >>  	-DENABLE_FREETYPE=OFF \
> >> @@ -40,6 +39,13 @@ else
> >>  MINETEST_CONF_OPTS += -DBUILD_SERVER=OFF
> >>  endif
> >>  
> >> +ifeq ($(BR2_PACKAGE_GETTEXT),y)
> >> +MINETEST_DEPENDENCIES += gettext
> >> +MINETEST_CONF_OPTS += -DENABLE_GETTEXT=ON
> >> +else
> >> +MINETEST_CONF_OPTS += -DENABLE_GETTEXT=OFF
> >> +endif  
> > 
> > What is this ENABLE_GETTEXT=ON/OFF option doing exactly?  
> 
> It allows using translations.
> 
> When enabled msgfmt tool is used to create *.mo files etc...
> 
> https://github.com/minetest/minetest/blob/master/README.txt#L180

Then simply do:

MINETEST_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)

ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 pass -DENABLE_GETTEXT=ON
else
 pass -DENABLE_GETTEXT=OFF
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
