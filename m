From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 10:51:32 +0200
Subject: [Buildroot] [PATCH] linux: workaround make-4.1 bug
In-Reply-To: <20200826113759.27193-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Wed, 26 Aug 2020 13:37:59 +0200")
References: <20200826113759.27193-1-yann.morin.1998@free.fr>
Message-ID: <87h7slkf6z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > On Ubuntu 18.04, make-4.1 emits spurious, incorrect "entering/leaving"
 > messages, which end up in the LINUX_VERSION_PROBED variable:

 >     printf 'probed linux version: "%s"\n' "$(LINUX_VERSION_PROBED)"
 >     probed linux version: "make[1]: Entering directory '/home/buildroot'
 >     4.19.78-linux4sam-6.2
 >     make[1]: Leaving directory '/home/buildroot/output/build/linux-linux4sam_6.2'"

 > First, the messages are displayed even though we do explicitly pass
 > --no-print-directory -s.

 > Second, the entering and leaving messages are not about the same
 > directory!

 > This *only* occurs in the following conditions:

 >   - the user has the correct 0022 umask,
 >   - top-level parallel is used (with or without PPD),
 >   - initial -C is specified as well.

 >     $ umask 0022
 >     $ make -j16 -C $(pwd)
 >     [...]
 >     depmod: ERROR: Bad version passed make[1]:
 >     [...]

 > (yes, 'make[1]:' is the string depmod is trying, and fails, to parse as
 > a version string).

 > If any of the three conditions above is removed, the problem no longer
 > occurs. Here's a table of the MAKEFLAGS:

 >                 |                   0002                         |          0022            |
 >     ----+-------+------------------------------------------------+--------------------------+
 >         | no-j  | --no-print-directory --                        |                          |
 >     noC |       +------------------------------------------------+--------------------------+
 >         | -j16  | -j --jobserver-fds=3,4 --no-print-directory -- | -j --jobserver-fds=3,4   |
 >     ----+-------+------------------------------------------------+--------------------------+
 >         | no-j  | --no-print-directory --                        | w                        |
 >     -C  |       +------------------------------------------------+--------------------------+
 >         | -j16  | -j --jobserver-fds=3,4 --no-print-directory -- | w -j --jobserver-fds=3,4 |
 >     ----+-------+------------------------------------------------+--------------------------+

 >     0002: umask == 0002
 >     0022: umask == 0022

 >     no-j: no -j flag
 >     -j16: -j16 flag

 >     noC: no -C flag
 >     -C : -C /path/of/buildroot/

 > Only the bottom-right-most case fails...

 > This behaviour goes against what is documented:

 >     https://www.gnu.org/software/make/manual/make.html#g_t_002dw-Option

 >     5.7.4 The ?--print-directory? Option
 >     [...]
 >     you do not need to specify this option because ?make? does it for
 >     you: ?-w? is turned on automatically when you use the ?-C? option,
 >     and in sub-makes. make will not automatically turn on ?-w? if you
 >     also use ?-s?, which says to be silent, or if you use
 >     ?--no-print-directory? to explicitly disable it.

 > So this exactly describes our situation; yet 'w' is added to MAKEFLAGS.

 > Getting rid of the 'w' flag makes the build succeed again, so that's
 > what we do here (bleark, icky)...

 > Furthermore, the documented way to override MAKEFLAGS is to do so as a
 > make parameter:

 >     https://www.gnu.org/software/make/manual/make.html#Options_002fRecursion

 >     5.7.3 Communicating Options to a Sub-make
 >     [...]
 >     If you do not want to pass the other flags down, you must change the
 >     value of MAKEFLAGS, like this:

 >         subsystem:
 >             cd subdir && $(MAKE) MAKEFLAGS=

 > However, doing so does not fix the issue. So we resort to pass the
 > modified MAKEFLAGS via the environment (bleark, icky)...

 > Fixes: #13141

 > Reported-by: Laurent <laurent@neko-labs.eu>
 > Reported-by: Asaf Kahlon <asafka7@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
