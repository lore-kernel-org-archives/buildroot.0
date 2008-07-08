From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2008 10:16:58 +0200
Subject: [Buildroot] query about change to $(MAKE) definition
In-Reply-To: <20080708071048.GA23482@cloud.net.au> (Hamish Moffatt's message
	of "Tue\, 8 Jul 2008 17\:10\:48 +1000")
References: <20080708071048.GA23482@cloud.net.au>
Message-ID: <87abgsu6x1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 Hamish> Peter,
 Hamish> Can you explain the rationale behind the following change to
 Hamish> package/Makefile.in you made last week?

Sure.

 Hamish> It's causing my kernel builds to be very noisy now. I have a
 Hamish> custom makefile for my kernel build, and I'm now getting a
 Hamish> ton of

 Hamish> make[5]: warning: -jN forced in submake: disabling jobserver mode.

Strange, I haven't seen that before.

 Hamish> warnings from it, because $(MAKE) has changed from
 Hamish> '/usr/bin/make -j2' to: '/usr/bin/make MAKE=/usr/bin/make -j2'.
 Hamish> So now -j2 is passed to every submake instance, rather than
 Hamish> letting make itself do the right thing. I'm guessing other
 Hamish> builds that do anything tricky might also suffer.

Yeah, I wanted to propagate the HOSTMAKE setting to the sub makes and
get -j and -s correct.

But now reading the make manual in details
(http://www.gnu.org/software/make/manual/html_node/Options_002fRecursion.html#Options_002fRecursion)
it seems like -s and -j are handled automatically, and from a quick
test it indeed seems to be the case for -s. Strange, that's afaik no
what I was seing before, hence the extra code.

The easiest would actually be if would get rid of the BR2_JLEVEL stuff
completely and just let people use -j<whatever> on the top level make
instead, then make should handle it all automatically. Why don't we do
it like that? Is something in the toplevel makefile broken for
parallel builds? (I know lots of other buildroot stuff is broken for
parallel). Then we could also get rid of the HOSTMAKE thing and it
would all boil down to:

MAKE1=$(MAKE) -j1

What do you say?

-- 
Bye, Peter Korsgaard
