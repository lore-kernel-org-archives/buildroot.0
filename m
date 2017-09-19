From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 19 Sep 2017 21:19:32 +0300
Subject: [Buildroot] [PATCH] bash: fix static build
In-Reply-To: <87k20u27at.fsf@dell.be.48ers.dk>
References: <e61b7469d3048416c7e3c681a75f773843fe48a6.1505759427.git.baruch@tkos.co.il>
 <87k20u27at.fsf@dell.be.48ers.dk>
Message-ID: <20170919181932.o4ih6ppwwbdqwetb@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Sep 19, 2017 at 02:37:30PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > When building bash statically, configure does not initialize the
>  > SHOBJ_STATUS variable. The SHOBJ_STATUS make variable in
>  > examples/loadables/Makefile.in must resolve to either 'supported' or
>  > 'unsupported'. Otherwise, the install-$(SHOBJ_STATUS) target does not
>  > exist.
> 
>  > This leads to the following build failure:
> 
>  > make[2]: Entering directory '.../output/build/bash-4.4/examples/loadables'
>  > make[2]: *** No rule to make target 'install-', needed by 'install'.  Stop.
>  > make[2]: Leaving directory '.../output/build/bash-4.4/examples/loadables'
>  > Makefile:793: recipe for target 'install' failed
> 
> Hmm, while this is correct it doesn't really error out here:
> 
> ( cd /home/peko/source/buildroot/output-bash/build/bash-4.4/examples/loadables && /usr/bin/make -j --jobserver-fds=3,4 --no-print-directory DESTDIR=/home/peko/source/buildroot/output-bash/target install )
> make[3]: *** No rule to make target 'install-', needed by 'install'.  Stop.
> Makefile:793: recipe for target 'install' failed
> make[2]: [install] Error 2 (ignored)
> rm -f /home/peko/source/buildroot/output-bash/target/bin/bashbug
> 
> So that probably explains why it doesn't fail in the autobuilders.
> 
> Does it really fail the build for you?

It doesn't. I should have checked that. This patch is not really needed then.

> Have you looked into why SHOBJ_STATUS doesn't get expanded correctly,
> and if this can fixed more nicely upstream / is already fixed?

SHOBJ_STATUS is not set when the "$ac_cv_func_dlopen" = "yes" condition 
evaluates to false. This is the case when building statically. Current bash 
code is not fixes, as far as I can see.

Something like this should fix the issue:

diff -Nuar bash-4.4-orig/configure.ac bash-4.4/configure.ac
--- bash-4.4-orig/configure.ac	2016-09-07 23:56:28.000000000 +0300
+++ bash-4.4/configure.ac	2017-09-19 21:15:00.376316006 +0300
@@ -1151,6 +1151,9 @@
 	AC_SUBST(SHOBJ_LIBS)
 	AC_SUBST(SHOBJ_STATUS)
 	AC_MSG_RESULT($SHOBJ_STATUS)
+else
+	SHOBJ_STATUS=unsupported
+	AC_SUBST(SHOBJ_STATUS)
 fi
 
 # try to create a directory tree if the source is elsewhere

But bash does not autoreconf nicely, so I didn't test that approach.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
