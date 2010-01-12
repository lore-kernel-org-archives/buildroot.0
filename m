From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 12 Jan 2010 23:09:41 +0100
Subject: [Buildroot] Issue for the integration of Codesourcery external
	toolchains
In-Reply-To: <20100112115228.6f81f471@surf>
References: <20100104162422.5b7e7bf6@surf>
	<1262647415.23193.99.camel@coalu.atr>
	<20100112115228.6f81f471@surf>
Message-ID: <201001122309.41946.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,
All,

On Tuesday 12 January 2010 11:52:28 Thomas Petazzoni wrote:
> So maybe our solution of using --sysroot is ugly and we should fall
> back to the solution where the toolchain sysroot is kept in its
> original location and we just use -L/-I to indicate where our staging
> directory is (solution which has proved in the past to be fairly
> difficult to stabilize).

Well, for what it's worth, here's an (embrio of an) idea:

1) do not copy the sysroot to staging, trust gcc to find it properly
2) add a kind of wrapper to gcc (et al.) that basically does the following:

---8<---
#!/bin/sh
exec real-gcc -L "${STAGING_DIR}"{,/usr}/lib    \
                  -I "${STAGING_DIR}"/usr/include   \
                  "$@"
---8<---

That way, we always have out staging/lib and staging/usr/lib in the library
search path; ditto for the include search path.

It should work with whatever toolchain we're using, internaly-built or
external. And that means a single way of handling things.

Finally, when the staging is full, we can /overlay/ with a copy of the
original sysroot libs we get from gcc --print-sysroot

Of course, that's far from being complete!

HTH...

Regards,
Yann E. MORIN.
-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
`------------------------------^-------^------------------^--------------------'
