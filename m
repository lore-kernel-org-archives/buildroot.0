From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Jul 2013 22:55:05 +0200
Subject: [Buildroot] uClibc toolchain building issue
In-Reply-To: <20130707202939.GB5429@localhost> (Ezequiel Garcia's message of
 "Sun, 7 Jul 2013 17:29:40 -0300")
References: <20130707202939.GB5429@localhost>
Message-ID: <87ip0mgkeu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel.garcia@free-electrons.com> writes:

 Ezequiel> Hello,
 Ezequiel> I'm using today's origin/master HEAD to build my uClibc toolchain
 Ezequiel> with the below config, and I found this error message:

 Ezequiel>   cp -f toolchain/uClibc/uClibc-0.9.33.config /home/zeta/buildroot/buildroot/output/build/uclibc-0.9.32.1/.config
 Ezequiel>   cp: cannot stat ?toolchain/uClibc/uClibc-0.9.33.config?: No such file or directory
 Ezequiel>   make: *** [/home/zeta/buildroot/buildroot/output/build/uclibc-0.9.32.1/.stamp_configured] Error 1

 Ezequiel> But a quick find tells me that the uClibc config is not in toolchain,
 Ezequiel> but in package/uclibc, right?

 Ezequiel>   $ find . -name "uClibc*"
 Ezequiel>   ./package/uclibc/uClibc-0.9.33.config
 Ezequiel>   ./package/uclibc/uClibc-snapshot.config
 Ezequiel>   ./package/uclibc/uClibc-0.9.32.config

Indeed, it recently got moved.

 Ezequiel> So, am I doing anything wrong or is this a bug?

I'm not sure I would call it a bug in buildroot. The problem is that the
uClibc configuration file is given as a kconfig string variable, which
defaults to the "standard" configuration file shipped with Buildroot.

The problem is that kconfig writes this value to the .config file, even
though the user hasn't actively changed it, so if we move files around
(and change the default for the string option), old .config files are
not automatically updated and the build will fail.

Minimal config files (as output by make savedefconfig) don't have this
problem as they only contain the lines that are changed from the
default, which is why we recommend people use them (and use them
ourselves for the defconfigs).

-- 
Bye, Peter Korsgaard
