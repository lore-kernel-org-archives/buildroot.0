From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2012 14:01:55 +0100
Subject: [Buildroot] External Toolchain: Calculation of SYSROOT_DIR in
 toolchain/toolchain-external/ext-tool.mk wrong?
In-Reply-To: <4666169C600DD24C84F509DC90790D5007629FD4B9@DEMCHP99E75MSX.ww902.siemens.net>
References: <4666169C600DD24C84F509DC90790D5007629FD2B5@DEMCHP99E75MSX.ww902.siemens.net>
 <20120201103842.546e6eb8@skate>
 <4666169C600DD24C84F509DC90790D5007629FD42D@DEMCHP99E75MSX.ww902.siemens.net>
 <20120201123447.71e90bc2@skate>
 <4666169C600DD24C84F509DC90790D5007629FD4B9@DEMCHP99E75MSX.ww902.siemens.net>
Message-ID: <20120201140155.67edc41c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 1 Feb 2012 13:30:01 +0100,
"Warlich, Christof" <christof.warlich@siemens.com> a ?crit :

> I fully agree with you, but when I talked about the amount of effort, I
> was referring to the effort that it would take me to convince management
> to give away that code. I know from earlier experience how much (useless)
> energy that may take.

Ok. Do your management realize that a toolchain is mostly composed of
gcc, binutils, uClibc and gdb, that all of these are distributed under
GPL or LGPL licenses, and therefore you have to keep the source code
open for those components in order to comply with their licenses?

> Considering the hard and good work that you guys are offering for free,
> all I can do for now is to sincerely apologize. I would however certainly
> be willing to discuss and test any more generic patch if you are still
> Interested to put further work into the issue despite the unpleasent
> circunstances.
> 
> Again, sorry for not being as helpful as I would like to be,

Can you try:

	sed -r -e 's:(usr/)?lib/libc\.a::'

This will make the usr/ part at the beginning optional. It seems to do
the job here:

thomas at skate:~$ echo "foo/bar/test/lib/libc.a" | sed -r -e 's:(usr/)?lib/libc\.a::'
foo/bar/test/
thomas at skate:~$ echo "foo/bar/test/usr/lib/libc.a" | sed -r -e 's:(usr/)?lib/libc\.a::'
foo/bar/test/

If you just make that change, does all the rest of the external
toolchain logic works for you?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
