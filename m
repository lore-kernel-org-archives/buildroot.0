From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 23 Jun 2010 00:45:22 +0200
Subject: [Buildroot] Host libraries - status
Message-ID: <201006230045.23043.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

To sum up our discussion on IRC yesterday.

- we are building libraries to run on the host (the machine we build on)

- those libraries get installed in a non-standard place, so the dynaminc
  linker (ld.so) can not find them

- we do not want our executables to runtime-link with standard libraries
  when we have our own versions

The issue is not at link-time, but at runtime.

Some plans were devised to overcome this issue:

- use LD_LIBRARY_PATH to point the linker to the proper place where to find
  our own libraries. Using LD_LIBRARY_PATH has the advantage that the libs
  are searched for in there before the linker attempts the standard places.
  But LD_LIBRARY_PATH breaks mkfontscale (used to build fonts for X)

- use the linker arg -rpath. rpath adds the search dir directly into the
  executable in an attribute of the .dynamic section. Passing -rpath in
  the CFLAGS breaks binutils. Passing it in the LDFLAGS breaks fakeroot.

We still have some options:

- statically build all host libraries. That would surely fix this issue,
  but could be considered ugly, as *all* dependable libraries would have
  to be specified in the LDFLAGS (Thomas on IRC). Plus the fact that we
  should take care to avoid linking with shared versions of those libs
  if they are present in the standard places (the linker prefers .so
  to .a libs).

- fix fakeroot, so it works with rpath. Might require a huge amount of
  work.

- a third solution would be to craft a simple wrapper for all host
  executables we install. That wrapper would be responsible for exporting
  LD_LIBRARY_PATH. That way, LD_LIBRARY_PATH is set only when running
  those executables, for those executables (and their children), and
  whatever calls them does not have to care about it, nor be mislead.
  For the records, I'va had to do that in crosstool-NG, and it has
  worked pretty nicely. I have a shell script version [1] and also a
  C program [2] that implement such a wrapper.

- anything else I missed ?

Regards,
Yann E. MORIN.

[1] http://ymorin.is-a-geek.org/hg/crosstool-ng/file/eebcaff6626f/scripts/wrapper.in
[2] http://ymorin.is-a-geek.org/hg/crosstool-ng/file/eebcaff6626f/scripts/wrapper.c

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
