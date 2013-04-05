From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Apr 2013 14:22:49 +0200
Subject: [Buildroot] Quick analysis of the last build failures
In-Reply-To: <CAG2jQ8iCYNPGcT=frmjx-zJtkFyKceCWi9csbEtj8BQk1_3Nqg@mail.gmail.com>
References: <20130405141247.67149ee7@skate>
 <CAG2jQ8iCYNPGcT=frmjx-zJtkFyKceCWi9csbEtj8BQk1_3Nqg@mail.gmail.com>
Message-ID: <20130405142249.4c97e61f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Fri, 5 Apr 2013 13:17:54 +0100, Markos Chandras wrote:

> LTP will try to link to libcap if it is present, but until some time
> ago, libcap did not link against libattr which is required in order
> for
> these symbols to be exported. This was recently fixed in buildroot[1].
> So in order for this problem to go away, you need both libcap and attr
> in your buildroot config.
> 
> http://git.buildroot.net/buildroot/commit/package/libcap/libcap.mk?id=1bf3d6f8cf3a2dca9ce1c6f3e68b077724f21db6

So, if I understand correctly, it should be something like:

ifeq ($(BR2_PACKAGE_LIBCAP),y)
LTP_TESTSUITE_DEPENDENCIES += libcap attr
endif

And in the Config.in:

	select BR2_PACKAGE_ATTR if BR2_PACKAGE_LIBCAP

We would have two cases:

 * libcap not enabled, it uses cap_set_file() from the C library.
   Correct?

 * libcap is enabled, we add the dependency on attr so that libcap
   exposes cap_set_file().

Is this correct? Or is the dependency on libcap mandatory?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
