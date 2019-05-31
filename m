From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 16:40:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/i2pd: fix static build with
 atomic
In-Reply-To: <20190530213022.3878-1-fontaine.fabrice@gmail.com>
References: <20190530213022.3878-1-fontaine.fabrice@gmail.com>
Message-ID: <20190531164042.49667958@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 30 May 2019 23:30:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -I2PD_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
> +I2PD_CONF_OPTS += -DCMAKE_REQUIRED_LIBRARIES=-latomic
>  endif

Can we settle on what is the right way to add -latomic for CMake-based
packages ? We already have a mix of CMAKE_CXX_FLAGS and
CMAKE_EXE_LINKER_FLAGS:

$ git grep "CMAKE.*atomic"
package/cutelyst/cutelyst.mk:CUTELYST_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
package/gerbera/gerbera.mk:GERBERA_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
package/gnuradio/gnuradio.mk:GNURADIO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
package/gqrx/gqrx.mk:GQRX_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
package/grpc/grpc.mk:GRPC_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
package/i2pd/i2pd.mk:I2PD_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk:KF5_MODEMMANAGER_QT_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
package/libcpprestsdk/libcpprestsdk.mk:LIBCPPRESTSDK_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
package/wampcc/wampcc.mk:WAMPCC_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"

It would be nice to not introduce a third way of doing the same
thing :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
