From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Mon, 07 Sep 2015 16:08:38 +0200
Subject: [Buildroot] [PATCH] Handle verbosity in infrastructures
In-Reply-To: <55ED7E62.6080806@mind.be>
References: <1441487237-10040-1-git-send-email-cedric.marie@openmailbox.org>
 <55ECB52C.3070806@mind.be>
 <e7d3e11a111e0f1a4da139146991a588@openmailbox.org>
 <55ED7E62.6080806@mind.be>
Message-ID: <fb34984c55052f386dd7e0b9534c6a39@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 2015-09-07 14:09, Arnout Vandecappelle a ?crit?:
>  Good point, you're right. Perhaps add a comment to clarify that.
> # Override value passed in the environment

OK. I'll add a comment.

>  Garbage in, garbage out :-)

Yes, but the error will only occur when it comes to compiling an 
autotools package. It may be disturbing to be notified so late, that the 
option was not correct. Well, in my case, it is simply ignored, so we're 
not notified at all... that's no better.

make V=0/1 is Buildroot "API", and althought it is the same as autotools 
"API", I think we should "translate" it, and prevent Buildroot from 
forwarding invalid values. Just my opinion, and my experience in C 
language :-)

So maybe - if you agree that it should be checked - that should be done 
at the beginning, in root Makefile.


>  If you do a git blame, you should see that all the lines with wrong 
> indentation
> are more than 2 years old. Lately we've been paying attention to 
> consistent
> indentation, but nobody has bothered to update existing Makefiles.

OK, I had noticed the two different kinds of indentation, but didn't git 
blame to check which one was the more recent.
I'll fix it.


>  Well, you can actually put the two conditions on a single line but it 
> looks
> even worse:
> 
> ifeq ("$(origin V)"$(V), "command line"1)

In fact, I thought about it, but I didn't have the idea to exclude $(V) 
out of the "" (i.e. I thought of: ifeq ("$(origin V)$(V)", "command 
line1"). And I thought that exporting 'V=command line1' in the shell 
would "hack" the test and make it invalid. Yes, I know, I'm thinking 
about very particular use cases :-)

But I agree that - even with your method that fix this problem - it 
doesn't look very nice.


>  I don't remember saying anything about BR2_VERBOSE, and I also can't 
> find it in
> the mails I sent (but I didn't check too carefully).


It was not very clear because I didn't write any code to explain what I 
meant, but I initially proposed to check $(origin V) and $(V) in the 
root Makefile, and export BR2_VERBOSE (0 or 1). Then, in 
infrastructures, it was not necessary to check $(origin V) anymore, but 
simply check BR2_VERBOSE value.

export BR2_VERBOSE=
ifeq ("$(origin V)", "command line")
ifeq ($(V),0)
BR2_VERBOSE=0
else ifeq ($(V),1)
BR2_VERBOSE=1
endif

Then, in pkg-cmake.mk:
ifeq ($(BR2_VERBOSE),1)
CMAKE_VERBOSE = VERBOSE=1
endif


> I may have said something
> about exporting such a variable - since nobody uses it there's no point
> exporting it. Also, it doesn't match the naming convention: if it is a 
> purely
> internal (non-exported) variable, it should be just VERBOSE; if it is 
> an
> exported variable, it should be BR_VERBOSE because it is not 
> user-visible or
> Kconfig related (only user-visible or Kconfig options should have the 
> BR2_
> prefix, all others should have a BR_ prefix).

OK, so I should use BR_VERBOSE.


>  Documentation updates should probably be in a separate patch since it 
> usually
> gets some more discussion about wording etc. and that shouldn't stop 
> the
> acceptance of the code change itself.

OK. 3 patches so far :-)


-- 
C?dric
