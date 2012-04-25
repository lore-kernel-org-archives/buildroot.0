From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 25 Apr 2012 20:55:49 +0000 (UTC)
Subject: [Buildroot] uemacs doesn't clear ixon termios flag?
References: <jn91fg$mt2$1@dough.gmane.org>
Message-ID: <jn9ock$htn$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-25, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> I've enabled the uemacs package. It builds fine, but it doesn't seem
> to work unless you manually clear the termios ixon flag before running
> it.  If you don't do that, the Ctrl-S keystroke isn't seen by uemacs
> -- instead it's intercepted by the tty layer and stops terminal
> output until you hit Ctrl-Q.

This appears to be bug in uemacs that's been known about for several
years.  The fix below is from the busybox mailing list 3 years ago
http://lists.busybox.net/pipermail/busybox/2009-February/068304.html:

  Or you could install this one:
  ftp://ftp.kernel.org/pub/software/editors/uemacs/em-4.0.15-lt.tar.bz2
  but beware that this version also has a problem with ^S/^Q because
  it doesn't clear IXON.  You'll need the following patch before ^S/^Q
  will work at all:

--- posix.c     2009/02/01 13:31:09     1.1
+++ posix.c     2009/02/01 13:32:12
@@ -51,6 +51,7 @@
        /* raw CR/NL etc input handling, but keep ISTRIP if we're on a 7-bit line */
        ntermios.c_iflag &= ~(IGNBRK | BRKINT | IGNPAR | PARMRK
                              | INPCK | INLCR | IGNCR | ICRNL);
+       ntermios.c_iflag &= ~IXON;
 
        /* raw CR/NR etc output handling */
        ntermios.c_oflag &= ~(OPOST | ONLCR | OLCUC | OCRNL | ONOCR | ONLRET);


If I submitted a patch and a modified uemacs.mk would it likely be
accepted?

-- 
Grant Edwards               grant.b.edwards        Yow! HELLO, everybody,
                                  at               I'm a HUMAN!!
                              gmail.com            
