From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 May 2014 17:44:21 +0200
Subject: [Buildroot] CMake requires ncurses
In-Reply-To: <CAHkwnC_7GBG+a4oh1aLSc7QeaEsC-N0qROcaNuGSE+Wp0=z34g@mail.gmail.com>
References: <CAHkwnC-kaMHjsD9GjPiDLdx5vda2CKAnDVXPX-qAUx+r01MCAQ@mail.gmail.com>
 <20140507164753.48c13d65@free-electrons.com>
 <CAHkwnC_7GBG+a4oh1aLSc7QeaEsC-N0qROcaNuGSE+Wp0=z34g@mail.gmail.com>
Message-ID: <20140507174421.04e3c2f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Wed, 7 May 2014 17:32:38 +0200, Fabio Porcedda wrote:

> Are you sure that In your system there isn't installed the ncurses
> development package?
> 
> On my ubuntu distribution if i uninstall the libncurses5-dev package i got:
> 
> make defconfig && make allyespackageconfig
> 
> make host-cmake

Well, right. On my system, libncurses-dev is definitely installed, but
I was thinking that on the autobuilders chroot it is not. But in fact
it is, for a simple reason: libncurses-dev is needed for 'make
menuconfig'.

So I believe you're maybe using 'make xconfig' or 'make gconfig', and
therefore you don't need to have the libncurses development files
installed.

However, there is some conditional code in the main CMakeLists.txt to
decide whether or not to build the ncurses stuff. I would rather prefer
to fix that, and not have to build host-ncurses everytime we need to
build host-cmake. Have a look at:

  #---------------------------------------------------------------------
  # Use curses?
  if (UNIX)
    # there is a bug in the Syllable libraries which makes linking ccmake fail, Alex
    if(NOT "${CMAKE_SYSTEM_NAME}" MATCHES syllable)
      set(CURSES_NEED_NCURSES TRUE)
      find_package(Curses QUIET)
      if (CURSES_LIBRARY)
        option(BUILD_CursesDialog "Build the CMake Curses Dialog ccmake" ON)
      else ()
        message("Curses libraries were not found. Curses GUI for CMake will not be built.")
        set(BUILD_CursesDialog 0)
      endif ()
    else()
      set(BUILD_CursesDialog 0)
    endif()
  else ()
    set(BUILD_CursesDialog 0)
  endif ()
  if(BUILD_CursesDialog)
    add_subdirectory(Source/CursesDialog/form)
  endif()

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
