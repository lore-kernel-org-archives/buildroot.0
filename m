From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2009 09:51:52 +0200
Subject: [Buildroot] [RFC] *clean targets
In-Reply-To: <20091007162422.GI10261@mx.loc>
References: <20091007162422.GI10261@mx.loc>
Message-ID: <20091009095152.555ceed2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Good to get a discussion on clean targets. They are currently a mess.
Thanks for raising the topic and starting a discussion on this topic.

Le Wed, 7 Oct 2009 18:24:22 +0200,
Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> a ?crit :

> # wipe target
> clean:

I'm not a fan of a make target that only cleans the target. People
might think that by doing so, there are able to remove packages from
their system. However, previously selected packages will still be
present in the staging/ directory, which is not clean. Consider the
following scenario :

 * We have package A that has an optional dependency on package B. I.e,
   A does not depend on B, but when A ./configure detects that B is
   present, then it uses B features, otherwise it just disables this
   feature flawlessly.

 * The user select A and B, and compiles the system. In the staging/
   and target/ directories, we have both A and B

 * The user removes B, and does "make clean" with the semantic of your
   proposal. So target/ is empty, but staging/ still contains A and B

 * The user runs "make" to regenerate the target/. This will reinstall
   a version of A that thinks that B will be present on the target,
   which is not longer the case.

Moreover, just removing the target/ directory doesn't trigger the
reinstallation of packages using the Makefile.autotools.in machinery,
since this machinery uses stamp files outside of the target/ directory.

Until we have a proven working way of cleanly removing packages, I'd
prefer not to let the user think that he can remove packages safely.

> # remove generated files, retain configs
> realclean:

Could you specify "remove generated files" ? And the semantic when O=
is used ?

> # remove generated files, including configs (but not DL_DIR!)
> distclean:

Agreed on realclean vs. distclean concerning the removal of .config,
and the fact that DL_DIR must be kept.

But still need to define what are the ? generated files ? and how you
plan to remove them.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
