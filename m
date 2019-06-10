From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Jun 2019 00:25:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/taglib: add upstream patch to
 fix taglib-config
In-Reply-To: <20190610212023.9483-2-joerg.krause@embedded.rocks>
References: <20190610212023.9483-1-joerg.krause@embedded.rocks>
 <20190610212023.9483-2-joerg.krause@embedded.rocks>
Message-ID: <3a548d14-a85d-76c7-18c0-1037ac1ad5a9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/06/2019 23:20, J?rg Krause wrote:
> +-prefix=${CMAKE_INSTALL_PREFIX}
> +-exec_prefix=${CMAKE_INSTALL_PREFIX}
> +-libdir=${LIB_INSTALL_DIR}
> +-includedir=${INCLUDE_INSTALL_DIR}
> ++prefix=@CMAKE_SYSROOT@@CMAKE_INSTALL_PREFIX@
> ++exec_prefix=@CMAKE_SYSROOT@@CMAKE_INSTALL_PREFIX@

 I believe it is wrong to include CMAKE_SYSROOT here. In general, this is not
necessarily the place where the package will be installed. We happen to do that
now, but for example both OpenWrt and OpenEmbedded install with a different
DESTDIR, and dependent packages see a different sysroot.

 We have the TAGLIB_CONFIG_SCRIPT infra to handle this situation. It will add
the appropriate sysroot to the _prefix variables.

 Regards,
 Arnout

> ++libdir=${exec_prefix}/lib
> ++includedir=${prefix}/include
