From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 May 2012 00:07:44 +0200
Subject: [Buildroot] uemacs doesn't clear ixon termios flag?
In-Reply-To: <jn9ock$htn$1@dough.gmane.org> (Grant Edwards's message of "Wed, 
 25 Apr 2012 20:55:49 +0000 (UTC)")
References: <jn91fg$mt2$1@dough.gmane.org> <jn9ock$htn$1@dough.gmane.org>
Message-ID: <87lilbzhan.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

Hi,

 Grant> This appears to be bug in uemacs that's been known about for
 Grant> several years.  The fix below is from the busybox mailing list 3
 Grant> years ago
 Grant> http://lists.busybox.net/pipermail/busybox/2009-February/068304.html:

 Grant>   Or you could install this one:
 Grant>   ftp://ftp.kernel.org/pub/software/editors/uemacs/em-4.0.15-lt.tar.bz2
 Grant>   but beware that this version also has a problem with ^S/^Q because
 Grant>   it doesn't clear IXON.  You'll need the following patch before ^S/^Q
 Grant>   will work at all:

That's afaik the uemacs upstream we're using.

 Grant> --- posix.c     2009/02/01 13:31:09     1.1
 Grant> +++ posix.c     2009/02/01 13:32:12
 Grant> @@ -51,6 +51,7 @@
 Grant>         /* raw CR/NL etc input handling, but keep ISTRIP if we're on a 7-bit line */
 Grant>         ntermios.c_iflag &= ~(IGNBRK | BRKINT | IGNPAR | PARMRK
 Grant>                               | INPCK | INLCR | IGNCR | ICRNL);
 Grant> +       ntermios.c_iflag &= ~IXON;
 
 Grant>         /* raw CR/NR etc output handling */
 Grant>         ntermios.c_oflag &= ~(OPOST | ONLCR | OLCUC | OCRNL | ONOCR | ONLRET);


 Grant> If I submitted a patch and a modified uemacs.mk would it likely be
 Grant> accepted?

Sure! Notice that I recently converted the uemacs package to gentargets,
but it should be functionally equivalent.

-- 
Bye, Peter Korsgaard
