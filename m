From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2011 09:11:36 +0200
Subject: [Buildroot] [PATCH 08/15] package: remove useless arguments
 from AUTOTARGETS
In-Reply-To: <87vcsrwu8u.fsf@macbook.be.48ers.dk>
References: <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
 <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
 <4c5d5efafbb287dcf231d5abed7ab0095ee6f94c.1314826231.git.thomas.petazzoni@free-electrons.com>
 <87vcsrwu8u.fsf@macbook.be.48ers.dk>
Message-ID: <20110917091136.4a05f81d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 17 Sep 2011 08:36:17 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Does those functions do the right thing here or do we need to rename
> the directory to libfuse?

Good catch: those functions make the assumption that the directory is
named after the name of the package. Actually, the name of the .mk is
not important to these macros, it is the directory name that is
important:

+define pkgmakefile
+$(dir $(lastword $(MAKEFILE_LIST)))
+endef

For package/fuse/libfuse.mk, the output of this macro is package/fuse/.
In fact, I think we could rename this macro "pkgmakefiledir" or
something like that.

+define pkgname
+$(lastword $(subst /, ,$(call pkgmakefile)))
+endef

And therefore the output of this if "fuse". So you're correct that the
fuse package need to be changed.

Should I rebase my changes on master (to include new packages) and fix
those issues ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
