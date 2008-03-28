From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Mar 2008 08:42:42 +0100
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080328025042.B52E23C31E@busybox.net> (jspence@uclibc.org's
	message of "Thu\, 27 Mar 2008 19\:50\:42 -0700 \(PDT\)")
References: <20080328025042.B52E23C31E@busybox.net>
Message-ID: <87prtfmgzx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "jspence" == jspence  <jspence@uclibc.org> writes:

 jspence> Author: jspence
 jspence> Date: 2008-03-27 19:50:42 -0700 (Thu, 27 Mar 2008)
 jspence> New Revision: 21525

 jspence> Log:
 jspence> Added ccache support and removed grub from defconfig due to
 jspence> brokenness at the moment.

How does this interact with the existing ccache support under
toolchain/ccache?
 
 jspence> +HOSTCCACHE:=$(shell $(CONFIG_SHELL) -c "which ccache")

 jspence> +ifneq ($(HOSTCCACHE),)
 jspence> +BR2_HAVE_HOST_CCACHE=y
 jspence> +endif
 jspence> +
 jspence>  ifndef HOSTAR
 jspence>  HOSTAR:=ar
 jspence>  endif
 jspence> @@ -124,6 +129,12 @@
 jspence>  ifndef FCFLAGS_FOR_BUILD
 jspence>  FCFLAGS_FOR_BUILD:=-g -O2
 jspence>  endif
 jspence> +
 jspence> +ifeq ($(BR2_HAVE_HOST_CCACHE),y)
 jspence> +HOSTCC:=$(HOSTCCACHE) $(HOSTCC)
 jspence> +HOSTCXX:=$(HOSTCCACHE) $(HOSTCXX)
 jspence> +endif

This is no good for the people (like me) that already use ccache by
prepending /usr/lib/ccache to the PATH.

Maybe you should simply add it as another option to the existing
ccache Config.in?

-- 
Bye, Peter Korsgaard
