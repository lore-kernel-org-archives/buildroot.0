From: Ben Boeckel <mathstuf@gmail.com>
Date: Thu, 4 Aug 2016 23:17:16 -0400
Subject: [Buildroot] [PATCH v2 1/1] taskd: support linking against
 static gnutls and uuid
In-Reply-To: <CAHXCMMLNt6bBoyxMTRLZaFx2CYU1xpqtR9=DWY0D_Q=eveVtCg@mail.gmail.com>
References: <20160617020836.9765-1-mathstuf@gmail.com>
 <20160622021946.30144-1-mathstuf@gmail.com>
 <CAHXCMMLNt6bBoyxMTRLZaFx2CYU1xpqtR9=DWY0D_Q=eveVtCg@mail.gmail.com>
Message-ID: <20160805031716.GA18292@bronto-burt.dev.benboeckel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[ So it seems that my original message never made it to the list; not
  sure why. Resending. ]

On Sun, Jul 03, 2016 at 18:51:18 +0200, Samuel Martin wrote:
> I would have done 2 distinct patches, one for pthread since it may be
> not-static-build specific (though it could be triggered more easily on
> static-build), and a second one fixing the missing dependencies for
> gnutls and uuid in case of static-build.

See below.

> > +-  set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${GNUTLS_LIBRARIES})
> > ++  set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${PC_GNUTLS_STATIC_LIBRARIES})
> This fortunately works because FindGnuTLS.cmake provided by CMake use
> pkg_check_modules on non-windows platform to find GNU-TLS [1], but
> this is a bit... hackish.

Acknowledged :) .

> A cleaner way would be to explicitly (re-)call pkg_check_modules in
> this if-block.

I need to fix FindGnuTLS upstream (on my list, but not high on it :/ ).
There's further problems that even with the pkg_check_modules call, it
still won't be fully correct due to full paths in the --libs output:

    https://gitlab.kitware.com/cmake/cmake/issues/16154

FindGnuTLS then needs to tell whether the found library is static or not
and set GNUTLS_LIBRARIES using the right variable.

I also have a task here to write a proper FindUUID for taskd (and I
suppose the rest of their suite) to use.

> [2] https://github.com/taskwarrior/taskd/blob/s1.1.0/CMakeLists.txt#L62
> [3] https://github.com/taskwarrior/taskd/blob/s1.1.0/src/Thread.h#L31

This code has changed in 1.2.0 and is actually gone. I think the threads
missing might actually be fallout from gnutls' use of a full pthread
path from pkg-config (which CMake misses due to the issue linked above).

--Ben
