From: Ben Boeckel <mathstuf@gmail.com>
Date: Tue, 9 Aug 2016 10:15:06 -0400
Subject: [Buildroot] Analysis of build results for 2016-08-05
In-Reply-To: <CAHXCMM+xOgCuMNHMSqj4tOP2jMGP7OPOLD1_x0_8HCgXb_h21g@mail.gmail.com>
References: <20160806063028.356101023A1@stock.ovh.net>
 <20160807112654.7b520594@free-electrons.com>
 <CAHXCMM+xOgCuMNHMSqj4tOP2jMGP7OPOLD1_x0_8HCgXb_h21g@mail.gmail.com>
Message-ID: <20160809141506.GA28979@megas.kitware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 07, 2016 at 17:48:46 +0200, Samuel Martin wrote:
> It seems to be another error due to "-isystem
> $(STAGING_DIR)/usr/include" passed to g++ [1].
> 
> AFAICS, this is done by CMake when generating the flags.make files.
> Note that removing it from the CXX_INCLUDES variables in all generated
> flags.make prevent from triggering this error.
> 
> It is not clear to me whether it is a gcc-6.x bug or a CMake one.
> According to fedora developers, this is not a gcc-6 bug [2].
> Ben, do you have any idea?

It might be that CMake is having trouble determining the paths that the
compiler uses by default? It should exclude any such directories from
the -I setup (though -isystem may change this behavior). CMake builds up
this variable:

    https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_IMPLICIT_INCLUDE_DIRECTORIES.html

based on the platform. It prefixes these with the value of CMAKE_SYSROOT
to create the list of implicit directories it ignores when building up
-I lines. Is CMAKE_SYSROOT not set properly?

> Ben, I have not opened any ticket yet, nor checked if a similar one is
> already opened. Do you need more details?

Building with VERBOSE=1 would help since it would show the actual
command lines being used. It may also help to move over to the
cmake-developers list to reach more CMake developers:

    https://cmake.org/mailman/listinfo/cmake-developers

--Ben
