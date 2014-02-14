From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Feb 2014 09:53:30 +0100
Subject: [Buildroot] [PATCH 1/1] ncftp: fix cross-compilation issues
In-Reply-To: <1392342348-28066-1-git-send-email-romain.naour@openwide.fr>
References: <1392342348-28066-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140214095330.5b632ac0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 14 Feb 2014 02:45:48 +0100, Romain Naour wrote:
> ncftp is unable to find ncurses library installed by ncurses package.
> So ncftpbookmarks is not build and install fails.
> 
> If ncurses is installed on the host machine then ncftp find it
> and build ncftpbookmarks.
> 
> To avoid that, we need to remove the cross-compilation test in
> configure script and set ac_cv_prog_cc_cross=yes in ncftp.mk

Can you expand a bit on the relation between ac_cv_prog_cc_cross=yes,
and this story about ncurses? I don't quite see the connection between
the two.

That being said, I agree that the cross-compilation test is stupid: it
builds a program, and tries to run it. If it runs, then the configure
script concludes that we're doing native compilation, if it doesn't
run, we're doing cross-compilation. Except that of course when you're
building x86 or x86-64 on x86-64 and both the target and host use
glibc, the program may very well run.

Now, maybe we could simply patch the configure script to use something
like what all other configure scripts are doing:

cross_compiling=no

if test "x$host_alias" != x; then
  if test "x$build_alias" = x; then
    cross_compiling=maybe
    $as_echo "$as_me: WARNING: If you wanted to set the --build type, don't use --host.
    If a cross compiler is detected then cross compile mode will be used." >&2
  elif test "x$build_alias" != "x$host_alias"; then
    cross_compiling=yes
  fi
fi

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
