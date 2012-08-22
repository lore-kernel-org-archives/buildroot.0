From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 22 Aug 2012 10:07:24 +0200
Subject: [Buildroot] [PATCH] gpsd: fix Python-related build failure
In-Reply-To: <1345548715-16593-1-git-send-email-spdawson@gmail.com>
References: <1345548715-16593-1-git-send-email-spdawson@gmail.com>
Message-ID: <5034933C.8040005@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 21/08/2012 13:31, spdawson at gmail.com a ?crit :
> From: Simon Dawson <spdawson@gmail.com>
> 
> The gpsd build falls over on certain autobuild machines; an example follows.
> 
>   http://autobuild.buildroot.net/results/42b435c271b0d791365e18ad974c7eecca8896a0/build-end.log
> 
> ImportError: No module named simplejson:
>   File "/scratch/peko/build/gpsd-3.7/SConstruct", line 1072:
>     from leapsecond import save_leapseconds
>   File "/scratch/peko/build/gpsd-3.7/leapsecond.py", line 27:
>     import gps.misc
>   File "/scratch/peko/build/gpsd-3.7/gps/__init__.py", line 9:
>     from gps import *
>   File "/scratch/peko/build/gpsd-3.7/gps/gps.py", line 17:
>     from client import *
>   File "/scratch/peko/build/gpsd-3.7/gps/client.py", line 9:
>     import simplejson as json                        # For Python 2.4 and 2.5
> make: *** [/scratch/peko/build/gpsd-3.7/.stamp_built] Error 2
> 
> The problem appears to be the indiscriminate importing done in the module
> initialisation for the gps Python module. If the simplejson module is not
> available for the host Python, then the build fails.
> 
> For the purposes of the build, the simplejson import is superfluous; in fact,
> since SConstruct pulls in gps.misc via leapsecond.py, all of the imports in
> the gps module initialisation are superfluous.
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  .../gpsd-05-python-2.5-compat-simplejson.patch     |   40 ++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/gpsd/gpsd-05-python-2.5-compat-simplejson.patch
> 
> diff --git a/package/gpsd/gpsd-05-python-2.5-compat-simplejson.patch b/package/gpsd/gpsd-05-python-2.5-compat-simplejson.patch
> new file mode 100644
> index 0000000..f275faa
> --- /dev/null
> +++ b/package/gpsd/gpsd-05-python-2.5-compat-simplejson.patch
> @@ -0,0 +1,40 @@
> +The gpsd build falls over on certain autobuild machines; an example follows.
> +
> +  http://autobuild.buildroot.net/results/42b435c271b0d791365e18ad974c7eecca8896a0/build-end.log
> +
> +ImportError: No module named simplejson:
> +  File "/scratch/peko/build/gpsd-3.7/SConstruct", line 1072:
> +    from leapsecond import save_leapseconds
> +  File "/scratch/peko/build/gpsd-3.7/leapsecond.py", line 27:
> +    import gps.misc
> +  File "/scratch/peko/build/gpsd-3.7/gps/__init__.py", line 9:
> +    from gps import *
> +  File "/scratch/peko/build/gpsd-3.7/gps/gps.py", line 17:
> +    from client import *
> +  File "/scratch/peko/build/gpsd-3.7/gps/client.py", line 9:
> +    import simplejson as json                        # For Python 2.4 and 2.5
> +make: *** [/scratch/peko/build/gpsd-3.7/.stamp_built] Error 2
> +
> +The problem appears to be the indiscriminate importing done in the module
> +initialisation for the gps Python module. If the simplejson module is not
> +available for the host Python, then the build fails.
> +
> +For the purposes of the build, the simplejson import is superfluous; in fact,
> +since SConstruct pulls in gps.misc via leapsecond.py, all of the imports in
> +the gps module initialisation are superfluous.
> +
> +Signed-off-by: Simon Dawson <spdawson@gmail.com>
> +diff -Nurp a/gps/__init__.py b/gps/__init__.py
> +--- a/gps/__init__.py	2012-05-23 22:06:40.000000000 +0100
> ++++ b/gps/__init__.py	2012-08-03 09:09:54.096816764 +0100
> +@@ -6,8 +6,8 @@
> + api_major_version = 5   # bumped on incompatible changes
> + api_minor_version = 0   # bumped on compatible changes
> + 
> +-from gps import *
> +-from misc import *
> ++#from gps import *
> ++#from misc import *
> + 
> + # The 'client' module exposes some C utility functions for Python clients.
> + # The 'packet' module exposes the packet getter via a Python interface.
> 

I'm not very fond of that approach. I guess one of the purpose of these
bindings are precisely to provide a python API, and you break it here
since instead of including gps.foo, you will need to include gps.bar.foo
(if I remember my Python correctly).

I guess the real problem that we have to address here is why scons uses
the interpreter from the distribution and not the buildroot-generated one.

I guess, we could just make scons depends on host-python and force the
$(SCONS) variable as "$(HOST_DIR)/usr/bin/python
$(HOST_DIR)/usr/bin/scons ?"

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
