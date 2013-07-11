From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jul 2013 15:32:15 +0200
Subject: [Buildroot] [PATCH] Makefile: unset MAKEFLAGS
In-Reply-To: <CAAXf6LUoX1iSW94RREcyOrX1_4QQf1dHFhDmynLoOy18js4fwA@mail.gmail.com>
References: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
 <CAAXf6LVC=vqL0mCFVMpKs2A99QtBviHXsmXZp3B+fo+32-+dXA@mail.gmail.com>
 <20130711130113.02ef2730@skate>
 <CAAXf6LUoX1iSW94RREcyOrX1_4QQf1dHFhDmynLoOy18js4fwA@mail.gmail.com>
Message-ID: <20130711153215.3d617c16@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 11 Jul 2013 13:36:28 +0200, Thomas De Schampheleire wrote:

> dependencies.sh does not complain on the existence of LD_LIBRARY_PATH
> in the environment, only on the presence of the current working
> directory inside of it. But of course, if we decide to unexport this
> variable, then checking its contents is no longer needed.
> Is there any valid use case for someone setting LD_LIBRARY_PATH during
> a buildroot build?

I guess it could be used if someone is building manually some host
tools needed by Buildroot, and a special LD_LIBRARY_PATH is needed to
run such tools. But it really seems like a corner case.

> For the check on the presence of the current working dir in PATH, we
> could question whether it makes sense to raise a message and exit, or
> to manipulate PATH during the build and continue.

True.

> Another variable checked in dependencies.sh is PERL_MM_OPT. This seems
> a good candidate to add to the existing list in Makefile.

Indeed. I'm the one to blame here, I'm the one who added this variable
check in dependencies.sh, if I remember correctly :)

> Is there any particular reason why some unexports are done always, and
> some are done inside a check on BR2_HAVE_DOT_CONFIG ?

So, PKG_CONFIG_PATH, PKG_CONFIG_SYSROOT_DIR and DESTDIR get unset
outside of the BR2_HAVE_DOT_CONFIG conditional, all the other are
inside. I don't really see why we're doing that.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
