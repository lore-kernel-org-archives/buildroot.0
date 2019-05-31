From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 31 May 2019 16:54:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/i2pd: fix static build with
 atomic
In-Reply-To: <20190531164042.49667958@windsurf>
References: <20190530213022.3878-1-fontaine.fabrice@gmail.com>
 <20190531164042.49667958@windsurf>
Message-ID: <CAPi7W81OFgz-a8_Fjdvi_LrfwgkWs3KnO6MV=SAVpGjpXdjaSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le ven. 31 mai 2019 ? 16:41, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Thu, 30 May 2019 23:30:22 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> > -I2PD_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
> > +I2PD_CONF_OPTS += -DCMAKE_REQUIRED_LIBRARIES=-latomic
> >  endif
>
> Can we settle on what is the right way to add -latomic for CMake-based
> packages ? We already have a mix of CMAKE_CXX_FLAGS and
> CMAKE_EXE_LINKER_FLAGS:
>
> $ git grep "CMAKE.*atomic"
> package/cutelyst/cutelyst.mk:CUTELYST_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
> package/gerbera/gerbera.mk:GERBERA_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
> package/gnuradio/gnuradio.mk:GNURADIO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
> package/gqrx/gqrx.mk:GQRX_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
> package/grpc/grpc.mk:GRPC_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
> package/i2pd/i2pd.mk:I2PD_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
> package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk:KF5_MODEMMANAGER_QT_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
> package/libcpprestsdk/libcpprestsdk.mk:LIBCPPRESTSDK_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
> package/wampcc/wampcc.mk:WAMPCC_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
>
> It would be nice to not introduce a third way of doing the same
> thing :-)
I know but in this case, this is the only solution that does not
impact upstream.
upstream choose to link through
target_link_libraries( "${PROJECT_NAME}" libi2pd libi2pdclient
${DL_LIB} ${Boost_LIBRARIES} ${OPENSSL_LIBRARIES} ${ZLIB_LIBRARY}
${CMAKE_THREAD_LIBS_INIT} ${MINGW_EXTRA} ${DL_LIB}
${CMAKE_REQUIRED_LIBRARIES})

Because of this, if we pass -latomic through CMAKE_EXE_LINKER_FLAGS or
CMAKE_CXX_FLAGS, it'll always be placed before Boost_Libraries and all
the other dependencies.
I can try to find a way to fix this but I didn't take time to do so as
it was quicker to just use CMAKE_REQUIRED_LIBRARIES.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
