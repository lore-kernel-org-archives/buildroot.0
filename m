From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jan 2021 15:51:42 +0100
Subject: [Buildroot] [PATCH] package/openblas: allow disabling
 multithreading
In-Reply-To: <CAAXf6LVWOhFzBERunt5OdHhDkaKG1OGR4dxEzr48v52da7gJ-w@mail.gmail.com>
References: <20201202145024.13436-1-patrickdepinguin@gmail.com>
 <20210102173437.3bc0698f@windsurf>
 <CAAXf6LVWOhFzBERunt5OdHhDkaKG1OGR4dxEzr48v52da7gJ-w@mail.gmail.com>
Message-ID: <20210105155142.5c40b74b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 5 Jan 2021 15:19:22 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> First of all, best wishes for 2021 and thanks for applying my patches recently!

Best wishes to you as well!

> > Should this instead be:
> >
> >         depends on !BR2_PACKAGE_OPENBLAS_USE_THREAD
> >
> > indeed, as you're explaining in the help text, when USE_THREAD=1, the
> > USE_LOCKING option has no effect, as it is forcefully enabled.  
> 
> We can indeed add this inverse dependency on
> BR2_PACKAGE_OPENBLAS_USE_THREAD, this is more clear.
> However, I think we also have to retain the dependency on
> BR2_TOOLCHAIN_HAS_THREADS, right? Because if there is no thread
> support, it does not make sense to lock.
> If only depending on !BR2_PACKAGE_OPENBLAS_USE_THREAD, then the
> USE_LOCKING option becomes visible if !BR2_TOOLCHAIN_HAS_THREADS .
> Right?

Right, seems a good idea.

> > And perhaps drop the "default y" ?  
> 
> I added 'default y' because the introduction of USE_LOCKING in
> openblas actually lead to a regression if you were using it in
> single-threaded mode from a multi-threaded application. The regression
> is only at run-time and causes incorrect math results in some cases
> (ugh!).
> So, the 'default y' would help existing users in this situation when
> upgrading Buildroot and its contained openblas.
> 
> We could remove the 'default y' too. In my own repo I can make sure to
> enable USE_LOCKING explicitly. This may be fine if we assume there are
> few users that use openblas, and even fewer that use it in
> single-threaded mode from a multithreaded application.

Right, fair enough with "default y" then.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
