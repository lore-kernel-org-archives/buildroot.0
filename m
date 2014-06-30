From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 30 Jun 2014 21:46:24 +0300
Subject: [Buildroot] [PATCH] dbus: use -pthread instead of -lpthread
In-Reply-To: <20140630200616.35edc9da@free-electrons.com>
References: <1404145692-47530-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140630164911.GI4425@tarshish> <53B19643.1010904@imgtec.com>
 <20140630200616.35edc9da@free-electrons.com>
Message-ID: <20140630184624.GK4425@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jun 30, 2014 at 08:06:16PM +0200, Thomas Petazzoni wrote:
> On Mon, 30 Jun 2014 17:54:27 +0100, Vicente Olivert Riera wrote:
> 
> > >>   ifeq ($(BR2_PREFER_STATIC_LIB),y)
> > >> -DBUS_CONF_OPT += LIBS='-lpthread'
> > >> +DBUS_CONF_OPT += LIBS='-pthread'
> > >
> > > Can you explain how this change solves the build failure?
> > 
> > Yes. When dnsmasq tries to link against dbus it checks the dbus 
> > pkgconfig file to obtain the LIBS that it need to pass to the linker. In 
> > the dbus .pc file you have "-ldbus-1 -lpthread" because you used 
> > -lpthread when building dbus. If you use -pthread when you build dbus, 
> > then you will have -pthread in the dbus .pc file as well.
> 
> I think it'd be good to have an updated version of the patch that gives
> this explanation + an explanation of the difference between -pthread
> and -lpthread and how this difference solves the problem.

Getting a definite answer on this (-lpthread vs -pthread) is not easy, it 
seems. According to 
http://stackoverflow.com/questions/23250863/difference-between-pthread-and-lpthread-while-compiling 
-pthread also defines _REENTRANT and __USE_REENTRANT. I guess that this is 
related to initialization of thread local storage (TLS) at glibc.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
