From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Fri, 7 Jul 2017 15:26:28 -0400
Subject: [Buildroot] [PATCH 1/3] rpi-userland: fix opengl library
	symlinks
In-Reply-To: <20170707005550.821-2-gael.portay@savoirfairelinux.com>
References: <20170707005550.821-1-gael.portay@savoirfairelinux.com>
 <20170707005550.821-2-gael.portay@savoirfairelinux.com>
Message-ID: <20170707192628.52izzwd7kgjusixx@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

My bad, I forgot to update this patch.

I have a new version that avoid to break existing compiled binaries, and which
satisfies the needs for qtwebengine.

I have replaved the following code

	set_target_properties(
		GLESv2 PROPERTIES
		VERSION "2.0.0"
		SOVERSION "2"
	)

	set_target_properties(
		EGL PROPERTIES
		VERSION "1.0.0"
		SOVERSION "1"
	)

into

	set(DESTDIR \$ENV{DESTDIR})
	include(GNUInstallDirs)
	install(CODE "execute_process(COMMAND ${CMAKE_COMMAND} -E create_symlink libEGL.so ${DESTDIR}/${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/libEGL.so.1)")
	install(CODE "execute_process(COMMAND ${CMAKE_COMMAND} -E create_symlink libGLESv2.so ${DESTDIR}/${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/libGLESv2.so.2)")

I will update this in v2.

Regards,
Ga?l
