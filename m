From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jun 2014 10:25:31 +0200
Subject: [Buildroot] [ANNOUNCE] Autobuilder script available,
 join the autobuilder effort!
In-Reply-To: <CAAXf6LVfQJvMQjHdvD+M_3HVLtD=h_bVoq=x8UP1WrPDYGc_Uw@mail.gmail.com>
References: <20140614212341.5306ead8@free-electrons.com>
 <CAAXf6LWy4ysqMhrQ=FMZszUoyYzd_711VfCCgSUTO_WwTQ8vbA@mail.gmail.com>
 <20140617130025.664a1df6@free-electrons.com>
 <CAAXf6LVfQJvMQjHdvD+M_3HVLtD=h_bVoq=x8UP1WrPDYGc_Uw@mail.gmail.com>
Message-ID: <20140618102531.34c6f3ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 18 Jun 2014 09:31:07 +0200, Thomas De Schampheleire wrote:

> > Do not hesitate to send me patches, the Git repository is at
> > git://git.busybox.net/buildroot-test.
> 
> Sure, once I tested the script some more I will send you patches.

Great. And thanks a lot again for working on this, very useful!

> For my current needs it's a bit overkill to set it all up.

Yeah, I guessed so.

> With the following simple script I can get a quick overview of status:
> 
> for i in *.tar.bz2; do echo -n "$i: "; tar xf $i results/status -O ; echo ; done
> 
> And following script shows the build-end.log files for each run:
> 
> for i in *.tar.bz2; do echo "$i:"; tar xf $i results/build-end.log -O
> ; echo ; done

Maybe we could have an option of autobuild-run that is not used to
start the builds, but dump the results of the available local build
results? Maybe autobuild-run --show-results or something similar.

> I have been running one instance between 11am yesterday and 9am today,
> and here are some observations:
> 
> 0. A total of 25 result tarballs have been generated during this time
> (22 hours). There was one timeout (4 hours) due to a hanging git
> download (see below) and one failure to save a defconfig.

Ok.

> Many builds are under the 30 min range, some lasted for about 2 hours.

There is a randomization of the KCONFIG_PROBABILITY, which means that
builds can have between 1% and 30% of the packages enabled. So a wide
variation in the build duration is not surprising.

> This machine was running just one instance with jlevel 4 (just testing).
> The machine has 8 Intel i7 cores @ 3.4GHz. I have another such machine
> at my disposal.
> I also have 2 machines available with each 4 Intel i7 cores @ 2.8 GHz.
> Note that I cannot make any promises yet.

Sure, but if that happens, it would be awesome :)

> 1. One run showed the following error, any ideas?
> 
> [Tue, 17 Jun 2014 21:39:33] INFO: preparing a new build
> [Tue, 17 Jun 2014 21:39:33] INFO: removing cmake-2.8.12.2.tar.gz from downloads
> [Tue, 17 Jun 2014 21:39:33] INFO: removing sam-ba_2.12_patch5.gz from downloads
> [Tue, 17 Jun 2014 21:39:33] INFO: removing m4-1.4.17.tar.xz from downloads
> [Tue, 17 Jun 2014 21:39:33] INFO: removing libcdio-0.92.tar.gz from downloads
> [Tue, 17 Jun 2014 21:39:33] INFO: removing wsapi-1.6.1-1.src.rock from downloads
> Already up-to-date.
> [Tue, 17 Jun 2014 21:42:42] INFO: generate the configuration
> [Tue, 17 Jun 2014 21:42:45] ERROR: cannot savedefconfig

No, not at this point. I guess I should redirect more of the output to
the logfile instead of /dev/null. You can try the following patch to
store in the logfile the output of the savedefconfig:

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 06fb430..7dba760 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -302,7 +302,7 @@ def gen_config(instance, njobs, log):
         return -1
 
     ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "savedefconfig"],
-                          stdout=devnull, stderr=devnull)
+                          stdout=log, stderr=log)
     if ret != 0:
         log_write(log, "ERROR: cannot savedefconfig")
         return -1

> 2. As this machine is behind a git-blocking firewall, I will also have
> to set the 'gitp' wrapper script as BR2_GIT. I think the best way is
> to allow to set arbitrary settings from the autobuild config file. Of
> course these shouldn't be used to change the build itself, as it could
> render the problem irreproducible for others, but if we worry about
> such abuse we could add this info into the results tarball.
> I will add such an option (for the first part that is) and see if it works well.

I'd prefer to not have the custom BR2_GIT defined inside the
configuration file, because it means that people downloading that
configuration file and trying to reproduce the build with not be able
to do so. This problem already exists today for BR2_JLEVEL and
BR2_DL_DIR which are both defined inside the configuration file, and
it's part of my TODO list (visible at the beginning of the script) to
pass them through the environment instead of through the .config file.

I believe the same should be done for your BR2_GIT. We have to see how
to allow such configuration to be done through the configuration file.
Maybe:

[environment-variables]
BR2_GIT = ...
BR2_FOO = ...

and then the script makes sure to pass all these variables in the
environment when calling make on Buildroot.

> 3. If I get permission to run this officially, I will run it outside
> working hours only. This means that I want to set a start time and end
> time of the script. Ideally, the script is aware of this, so that I do
> not have to interrupt a running build (and lose the results) when
> stopping. I imagine a check when starting a new build whether we are
> still within the defined time interval and stop if needed.
> The starting of the script could be done with a simple cron job and
> does not need to be taken into account by the script I think. It could
> of course, in which case the script would sleep until it can start
> again.
> If you have a preference, let me know.

Wouldn't it be simpler to simply kill the build process when the time
happens? So you have a cronjob that starts autobuild-run at 7 PM or 8
PM in the evening, and another one that kills autobuild-run at 7 AM or
8 AM. I've tried to handle killing only the main autobuild-run script
and make sure it kills the building sub-processes, but it doesn't work
completely well so far. It needs to be investigated.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
