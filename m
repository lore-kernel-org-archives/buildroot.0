From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 21:23:41 +0200
Subject: [Buildroot] [ANNOUNCE] Autobuilder script available,
 join the autobuilder effort!
Message-ID: <20140614212341.5306ead8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Most likely the majority of the Buildroot developers are aware of the
Autobuilder mechanism we have, for which the results are available at
http://autobuild.buildroot.org/ and posted daily on the mailing list.

Until now, both Peter and I were using ad-hoc scripts that were so ugly
that they were not published, so it was not easy for others to join the
autobuilder effort.

I'm therefore happy to announce that I've written a completely new
version of a Python script that allows to run an autobuilder instance
on a given machine. It's a single script, and its installation is very
easy (though one must of course pay attention to have the Buildroot
pre-requisites installed). So it means that from now on, it's a lot
easier for others than Peter and I to set up an autobuilder instance.
If you have some spare cycles on a server, or on your workstation, even
for just a few hours per day, this might be of interest to you!

The script is available at:

  http://git.buildroot.net/buildroot-test/plain/scripts/autobuild-run

(NOTE: I am *not* a Python developer, there are very possibly many
possible improvements to do in the script. Error handling and logging
is probably not at its best. Patches welcome!).

Getting started
===============


To get started, you can simply run it with:

  ./autobuild-run --ninstances 2 --njobs 3

This will run 2 parallel independent Buildroot builds, each using 3
parallel jobs (i.e BR2_JLEVEL=3). In this configuration, autobuild-run
will store the results in local tarballs (one for each build), they are
not submitted to the http://autobuild.buildroot.org website.

This mode is a good way to test if your autobuilder instance is working
as expected. It is also a way for people to help improve the script
without necessarily running a full-blown autobuilder instance, and also
to verify that the changes are 

What's going on
===============

Each instance runs in its own instance-<number>/ directory, with inside:

 - dl/, the download directory for this instance. In the current
   Buildroot, we cannot share the same download directory between
   parallel instances. This is being fixed by Yann.

 - buildroot/, the Buildroot source code.

 - output/, the build output.

To see what's going on while builds are running, there are two level of
log files:

 - instance-<number>/instance.log, which persists across builds and
   gives some high-level information on what's going on (build
   starting, build ended with success or not, etc.)

 - instance-<number>/output/logfile, which is valid only for the
   duration of the current build, and gives the usual Buildroot output.

Getting results submitted
=========================

If you want the results of your autobuilder instance to be submitted to
http://autobuild.buildroot.org, you should first contact me to get some
credentials to submit those results. Once this is done, you need to
write a configuration file that looks like this:

[main]
ninstances = 2
njobs = 3
http-login = <the-login>
http-password = <the-password>
submitter = Your Name (name of machine)

And start your autobuilder instance using:

  ./autobuild-run -c <configuration-file-path>

And that's it.

Testing coverage
================

 * The architecture/toolchain combinations are chosen randomly amongst
   a set of pre-defined configurations, listed at
   http://autobuild.buildroot.org/toolchains/configs/ (see the .csv
   file).

 * The packages are chosen randomly using 'randpackageconfig', and
   there are some exceptions encoded in the script to avoid known
   problematic configurations.

Current deployment
==================

The script is currently deployed on two machines:

 - The Free Electrons build server, on which it replaces the old crap I
   was using to do the autobuilds.

 - Another private server of mine, which is the one actually hosting
   the http://autobuild.buildroot.org. I'm not sure I will let builds
   run forever on this machine, but it was useful to have two machines
   using the script to test in different conditions.

It is worth mentioning that due to this deployment, there are a few
bogus results on http://autobuild.buildroot.org due to missing packages
on the new build server, issues in the script or for other reasons.
This should hopefully settle down in the next few days.

Hopefully, Peter will join the dance and convert gcc10, gcc20 and
gcc110 to use the script as well.

Contribute
==========

Feel free to test the script, help improve it, and send patches. It is
available in the Git repository at:
http://git.buildroot.net/buildroot-test/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
