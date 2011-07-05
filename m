From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Jul 2011 23:04:58 +0200
Subject: [Buildroot] [PATCH 07/28] barebox: use = instead of := and
	re-indent
In-Reply-To: <20110705093115.0d35dcb6@skate> (Thomas Petazzoni's message of
 "Tue, 5 Jul 2011 09:31:15 +0200")
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
 <b98e01894aa9475d1480f8c2337190caf1281b7e.1309815048.git.thomas.petazzoni@free-electrons.com>
 <201107050008.38502.yann.morin.1998@anciens.enib.fr>
 <20110705093115.0d35dcb6@skate>
Message-ID: <87sjqkv3ph.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Using '=' evaluates the assignemnt every time it is referenced, which
 >> can be a little bit costly when there are tons of them (like in
 >> buildroot); while using ':=' does the evaluation only once, at the
 >> time of the assignment, not evaluation.
 >> 
 >> I agree that the code should be homogeneous, but I'd think it should
 >> be fast as well. He, if I can get butter, buter's money, and a litle
 >> smile from the dairywoman! ;-)

 Thomas> Then, we should state that those variables must all be defined with :=
 Thomas> all over the place and enforce this decision. In the mean time, I will
 Thomas> drop those modifications from my patch set.

:= is only a performance advantage if variables are expensive to expand
(use) and are used more than once - E.G. stuff involving $(shell) and
similar, like the UPPERCASE macro we had calling tr.

= has a number of advantages though. As it only gets expanded at the
last possible moment you don't have to take care about variable
ordering, E.G. when you use a variable like LIBGLIB2_HOST_BINARY on
another package, whereas with := you do. This can also be interesting
when the variable contains $(shell) or other functions, as you might
only want to execute them if/when they are needed, and not right away
when the Makefiles are parsed.

I would prefer to use = by default, and only use := where it matters for
correctness or performance.

-- 
Bye, Peter Korsgaard
