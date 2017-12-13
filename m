From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 14:33:18 +0100
Subject: [Buildroot] [PATCH 1/1] janus-gateway: add RTSP streaming
 support.
In-Reply-To: <CAFSsvmogEO-eW655ScQ+j6u6w0JYzZWGaw_-Rn_mK3MZe0BV0g@mail.gmail.com>
References: <20171205131005.31537-1-aduskett@gmail.com>
 <20171205184050.7oifghyqfbrhehdr@tarshish.tkos.co.il>
 <CAFSsvmogEO-eW655ScQ+j6u6w0JYzZWGaw_-Rn_mK3MZe0BV0g@mail.gmail.com>
Message-ID: <20171213143318.318cd6bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Dec 2017 06:30:42 -0500, Adam Duskett wrote:

> >>  comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
> >>       depends on BR2_USE_MMU
> >> diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
> >> index bf3e590ac5..be31c465f8 100644
> >> --- a/package/janus-gateway/janus-gateway.mk
> >> +++ b/package/janus-gateway/janus-gateway.mk
> >> @@ -58,6 +58,10 @@ else
> >>  JANUS_GATEWAY_CONF_OPTS += --disable-plugin-streaming
> >>  endif
> >>
> >> +ifeq ($(BR2_PACKAGE_JANUS_STREAMING_RTSP),y)
> >> +JANUS_GATEWAY_DEPENDENCIES += libcurl
> >> +endif  
> >
> > Is there a way to disable RTSP? If not, RTSP will be enabled whenever libcurl
> > happens to build before janus-gateway, right? So maybe having libcurl as a
> > usual optional dependency would be better.
> >
> > baruch
> >  
> There isn't a way to disable RTSP, however, I am not sure the best way
> to go about this.
> I like being able to just select an option and have it select the dependency.
> 
> What would you suggest? Just "if libcurl is selected depend on it" ?

Note: I agree with Baruch on this. If you have an option to enable RTSP
support, then RTSP support should be disabled if the option is
disabled. Since this is not possible with janus-gateway build system,
then you should simply add libcurl as a dependency if
BR2_PACKAGE_LIBCURL=y.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
