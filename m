From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 13:56:16 +0100
Subject: [Buildroot] alsa lib problem
In-Reply-To: <497F0263.80302@carallon.com> (Will Wagner's message of "Tue\,
	27 Jan 2009 12\:47\:31 +0000")
References: <497E0B14.8040801@carallon.com>
	<87ocxt2t8g.fsf@macbook.be.48ers.dk> <497EFEDC.3040606@carallon.com>
	<20090127134408.2c74b516@hcegtvedt> <497F0263.80302@carallon.com>
Message-ID: <87mydc29hr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 >> Make a patch for alsa, and send it upstream to the alsa maintainers.
 >> They need to fix broken code like this anyway.

 Will> Happy to prepare a patch for upstream. However can someone explain to
 Will> me what is broken in alsa? Looking at the code the declaration of the
 Will> struct is identical in the kernel code and the copy of the header in
 Will> alsa. How is it that the size of off_t is different?

Without largefile enabled off_t is a 32bit type (on 32bit archs), but
with largefile enabled it's a 64bit type. The kernel only accepts a
32bit type, so things break.

Looking closer at it, off_t in the kernel is a typedef of
__kernel_off_t, which seems to be a long on all archs.

In other words, the fix seems to be a simple s/off_t/long/

You are welcome to CC me on the mail to the alsa list.

-- 
Bye, Peter Korsgaard
