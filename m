From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 19:38:49 +0200
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <201210141631.29399.yann.morin.1998@free.fr>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <20121014160547.09c493d7@skate>
 <201210141631.29399.yann.morin.1998@free.fr>
Message-ID: <20121014193849.019347dd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, 14 Oct 2012 16:31:29 +0200, Yann E. MORIN wrote:
> > Looking at the first one, it seems to be caused by the fact that all
> > Python external packages are enclosed inside a "if BR2_PACKAGE_PYTHON"
> > in package/Config.in, so this Python dependency is already available.
> 
> Strange. I do not recall all those recursive deps issues. I'll check here.

Ok.

> My gut feeling is that the "if BR2_PACKAGE_PYTHON" should go, now that
> we have _AVAILABLE.

Yes, it's a possible solution that sounds reasonable.

> > But then in that case, we should also have a
> > BR2_PACKAGE_PYTHON_ZLIB_AVAILABLE symbol, so that python-dpkt can
> > depend on it instead of forcefully selecting BR2_PACKAGE_PYTHON_ZLIB,
> > without knowing if zlib is available or not.
> > 
> > This problem however is going to be present in many many places, so I
> > don't know if manual intervention is reasonable for it. But on the
> > other hand, I am not sure it is possible to write an automated script
> > to solve this problem.
> 
> As much as I remember, there were not so much cases like that. But, except
> for manual intervention, I do not see how we could differentiate that case.
> 
> The problem is (form my script's point of view): 
>   Is BR2_PACKAGE_PYTHON_ZLIB representing:
>     - the package "python-zlib", or
>     - the option "zlib" of the package "python"?
> 
> Except for intrumenting the option symbol (eg.: BR2_PACKAGE_PYTHON_OPT_ZLIB)
> which I doubt we want to, there is no easy way for the script to detect
> this situation.
> 
> And then, do we want to push the _AVAILABLE semantic dow to sub-option?
> I doubt we do.
> 
> So, depending on sub-options should be as:
> 
> config BR2_PACKAGE_PYTHON_DPKT_AVAILABLE
>     def_bool y
>     depends on BR2_PACKAGE_PYTHON_AVAILABLE
>     depends on BR2_PACKAGE_PYTHON_ZLIB # Sub-option

Unfortunately this is not what we want:

 * We want the python-dpkt package to be visible to the user only if
   Python (BR2_PACKAGE_PYTHON) has been enabled;

 * However, when one enables BR2_PACKAGE_PYTHON, we want the
   python-dpkt package to be visible even if the
   BR2_PACKAGE_PYTHON_ZLIB option is not selected, and we want this
   option to be automatically enabled when the user enables the
   python-dpkt package. However, we have to be careful not to show the
   python-dpkt option if for some reason the BR2_PACKAGE_PYTHON_ZLIB
   option cannot be selected due to a dependency that isn't available
   (in our zlib is available on all architectures, but we could imagine
   depending on, say, libfoobar that is only available on certain
   architectures)

The reasoning is that:

 * We can assume that a user knows that the Python interpreter should
   be enabled in order to see all Python external packages;

 * However, we don't want to have the user to know about the need to
   enable the BR2_PACKAGE_PYTHON_ZLIB suboption in order to get access
   to python-dpkt.

In other words: we can assume the user knows about big subsystems
(X.org, Python, Perl, etc.), but we don't want him to know the fine
details of the dependencies on sub-options.

> > Here, I don't think an automated process is possible, a human
> > intervention will be needed to find out if those legacy dependencies
> > can be removed or not, on a case by case basis.
> 
> Yep, manual intervention, one of the corener-cases I wrote about in my
> intro mail.

Ok.

> > So all in all, the problem I'm most worried about is problem (2). Have
> > you thought about it already?
> 
> Yep, I've thought about it. Answer: manual review.
> ( Don't worry, *I* will have to do it before I submit a final series! ;-) )

Ok.

So, for me, problem (2) remains unsolved at the moment. I guess the
only solution is to add _AVAILABLE kconfig knobs for all the package
sub-options that select other packages. But this means adding a lot
more _AVAILABLE knobs than we initially thought.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
