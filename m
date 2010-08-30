From: Malte Starostik <m-starostik@versanet.de>
Date: Tue, 31 Aug 2010 00:15:04 +0200
Subject: [Buildroot]
 =?iso-8859-1?q?Make_3=2E82_does_behave_differently_th?=
 =?iso-8859-1?q?an_make_3=2E81=09for_sure=2C_but_=2E=2E=2E?=
In-Reply-To: <4C7C1E28.1060806@jdines.net>
References: <4C7B99D5.9010703@jdines.net> <87y6bnx1h8.fsf@macbook.be.48ers.dk>
	<4C7C1E28.1060806@jdines.net>
Message-ID: <201008310015.04723.m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Montag, 30. August 2010, 23:10:00 schrieb James J. Dines:
> I went for a third option (applying Yann's patch) and it indeed allows
> the 'make clean' to work.  I remain confused why we did not need this
> patch to do a complete build with make 3.81 however.  I just tried it
> again, and I do not get the error message on my other machine with 3.81
> even without the patch.

From make 3.82's NEWS file:

* WARNING: Backward-incompatibility!
  As a result of parser enhancements, three backward-compatibility issues
  exist: first, a prerequisite containing an "=" cannot be escaped with a
  backslash any longer.  [...].  Second, variable names can no
  longer contain whitespace, unless you put the whitespace in a variable and
  use the variable.  Third, in previous versions of make it was sometimes
  not flagged as an error for explicit and pattern targets to appear in the
  same rule.  Now this is always reported as an error.


What you're referring to re the kernel Makefile is the third mentioned issue.  
What happens with atk.mk is the second one instead:

The incorrent Makefile snippet:

ATK_CONF_OPT =  --enable-shared \
                --enable-static
                --disable-glibtest --enable-explicit-deps=no \
                --disable-debug

assigns the vaue "--enable-shared --enable-static" to a variable named 
"ATK_CONF_OPT" and the value "no --disable-debug" to a variable named "--
disable-glibtest --enable-explicit-deps".

I didn't know variable names with spaces (and even leading hyphens) were 
allowed prior to 3.82, but that made make not barf on the above while of 
course depriving $(ATK_CONF_OPT) of some of the options.

Cheers
Malte
