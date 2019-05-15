From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 May 2019 16:05:30 +0200
Subject: [Buildroot] [PATCH 4/5] package/wpewebkit: bump to version
 2.24.1
In-Reply-To: <20190515145239.GB9191@momiji>
References: <20190514114111.20424-1-aperez@igalia.com>
 <20190514114111.20424-5-aperez@igalia.com>
 <CAB0FRstZPttVSDYzYGih2nfdTdZ7UKuipDGPKWSaBJf6h_LVSw@mail.gmail.com>
 <20190515145239.GB9191@momiji>
Message-ID: <20190515160530.234d9212@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Peter in Cc. I know he'll like it :-)

Adding Yann in Cc. I know he won't like it :-)

On Wed, 15 May 2019 14:52:39 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:


> > openjpeg is an optional dependency
> > 
> > ifeq ($(BR2_PACKAGE_OPENJPEG),y)
> > WPEWEBKIT_CONF_OPTS += -DUSE_OPENJPEG=ON
> > WPEWEBKIT_DEPENDENCIES += openjpeg
> > else
> > WPEWEBKIT_CONF_OPTS += -DUSE_OPENJPEG=OFF
> > endif  
> 
> While it is indeed possible to build without OpenJPEG, with my WebKit
> developer hat I have to strongly recommend to make it required: many websites
> will silently fail to show images without this enabled, and that's the reason
> why I have selected the dependency unconditionally.
> 
> For the record: I did a quick check and in my work system (x86_64) the
> ?libopenjp2.so? library is only 365 KiB, which is peanuts compared to the size
> of ?libWPEWebKit.so?. Moreover, the openjpeg package can be built in every
> platform where wpewebkit is supported, therefore I think it is worth it to
> leave the dependency unconditionally enabled.

Perhaps this is one situation where we could make good use of the
"imply" kconfig keyword ?

BR2_PACKAGE_WEBKIT would do an "imply BR2_PACKAGE_OPENJPEG". This way
by default OpenJPEG is automatically enabled by WPE Webkit, but we
still allow the user to disable OpenJPEG if he really wants it.

That allows to comply with the Buildroot principle of "make everything
optional really optional" while offering a good out-of-the-box
experience.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
