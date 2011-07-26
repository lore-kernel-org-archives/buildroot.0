From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Jul 2011 17:00:59 +0200
Subject: [Buildroot] [PATCH] toolchain: add user defined target LDFLAGS
	options
In-Reply-To: <20110726131049.GA2881@sapphire.tkos.co.il> (Baruch Siach's
 message of "Tue, 26 Jul 2011 16:10:50 +0300")
References: <b4ad3d880f9c9e43b70d43bf527593487f3b1035.1308820722.git.baruch@tkos.co.il>
 <87y5zmuauq.fsf@macbook.be.48ers.dk>
 <20110725071001.GA13998@sapphire.tkos.co.il>
 <87tyaau8xo.fsf@macbook.be.48ers.dk>
 <1311628740.1973.20.camel@matias-lnx-host>
 <20110726131049.GA2881@sapphire.tkos.co.il>
Message-ID: <87d3gx3x3o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 >> Ah, that's something I hadn't considered. Thanks for the feedback. I was
 >> assuming one could pass something like "-fee -fi -fo -fum" in the text
 >> block, and this would be passed on to the wrapper.

 Baruch> Well, this string will be passed to the wrapper, but the whole
 Baruch> string will get stored in the same args[] entry. This means
 Baruch> that the compiler sees it as one long argument, not one
 Baruch> argument per word as should be.

 Baruch> A possible solution might be to split this string with strtok()
 Baruch> at run-time, but it looks inefficient, since we have all the
 Baruch> information we need at compile time.

I think it would be simpler to generate an include file containing

"arg1", "arg2", ... "argn"

instead and then simply #include that from ext-toolchain-wrapper.c
instead of passing all these options on the compiler cmdline.

This list could be created with something like:

$(patsubst %,\"%\"$(comma),$(CFLAGS))

-- 
Bye, Peter Korsgaard
