From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Sep 2017 21:45:08 +0200
Subject: [Buildroot] [PATCH] bash: fix static build
In-Reply-To: <20170919181932.o4ih6ppwwbdqwetb@tarshish> (Baruch Siach's
 message of "Tue, 19 Sep 2017 21:19:32 +0300")
References: <e61b7469d3048416c7e3c681a75f773843fe48a6.1505759427.git.baruch@tkos.co.il>
 <87k20u27at.fsf@dell.be.48ers.dk>
 <20170919181932.o4ih6ppwwbdqwetb@tarshish>
Message-ID: <877ewu1ni3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> So that probably explains why it doesn't fail in the autobuilders.
 >> 
 >> Does it really fail the build for you?

 > It doesn't. I should have checked that. This patch is not really needed then.

Ok, good.

 >> Have you looked into why SHOBJ_STATUS doesn't get expanded correctly,
 >> and if this can fixed more nicely upstream / is already fixed?

 > SHOBJ_STATUS is not set when the "$ac_cv_func_dlopen" = "yes" condition 
 > evaluates to false. This is the case when building statically. Current bash 
 > code is not fixes, as far as I can see.

 > Something like this should fix the issue:

 > diff -Nuar bash-4.4-orig/configure.ac bash-4.4/configure.ac
 > --- bash-4.4-orig/configure.ac	2016-09-07 23:56:28.000000000 +0300
 > +++ bash-4.4/configure.ac	2017-09-19 21:15:00.376316006 +0300
 > @@ -1151,6 +1151,9 @@
 >  	AC_SUBST(SHOBJ_LIBS)
 >  	AC_SUBST(SHOBJ_STATUS)
 >  	AC_MSG_RESULT($SHOBJ_STATUS)
 > +else
 > +	SHOBJ_STATUS=unsupported
 > +	AC_SUBST(SHOBJ_STATUS)
 >  fi
 
 >  # try to create a directory tree if the source is elsewhere

 > But bash does not autoreconf nicely, so I didn't test that approach.

Ok, thanks.

-- 
Bye, Peter Korsgaard
