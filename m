From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Jun 2014 09:31:07 +0200
Subject: [Buildroot] [ANNOUNCE] Autobuilder script available,
 join the autobuilder effort!
In-Reply-To: <20140617130025.664a1df6@free-electrons.com>
References: <20140614212341.5306ead8@free-electrons.com>
 <CAAXf6LWy4ysqMhrQ=FMZszUoyYzd_711VfCCgSUTO_WwTQ8vbA@mail.gmail.com>
 <20140617130025.664a1df6@free-electrons.com>
Message-ID: <CAAXf6LVfQJvMQjHdvD+M_3HVLtD=h_bVoq=x8UP1WrPDYGc_Uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jun 17, 2014 at 1:00 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>>
>> I used an environment variable because it seemed superfluous to add a
>> configuration variable for it, but if you prefer I can do that too.
>
> I don't have a very strong preference here. Perhaps having it defined
> in the configuration file would be better, as it is more similar to
> what we do for the other configuration parameters?
>
> Do not hesitate to send me patches, the Git repository is at
> git://git.busybox.net/buildroot-test.

Sure, once I tested the script some more I will send you patches.

>
>> Is there an easy way to get a web interface like that on
>> autobuild.buildroot.org, for the locally created builds? This would
>> make it easy to inspect the results while testing (for example to see
>> that some host package like 'bzr' needed to be installed, ...).
>
> Well, the autobuild.buildroot.org interface is itself available in
> git://git.busybox.net/buildroot-test. However, setting it up will
> require a bit of configuration (PHP, MySQL + one database). You could
> then submit your builds to your own autobuilder instance for testing,
> and then decide to switch to the main autobuilder instance at
> autobuild.buildroot.org once you believe things are stable enough.

For my current needs it's a bit overkill to set it all up.
With the following simple script I can get a quick overview of status:

for i in *.tar.bz2; do echo -n "$i: "; tar xf $i results/status -O ; echo ; done

And following script shows the build-end.log files for each run:

for i in *.tar.bz2; do echo "$i:"; tar xf $i results/build-end.log -O
; echo ; done


I have been running one instance between 11am yesterday and 9am today,
and here are some observations:

0. A total of 25 result tarballs have been generated during this time
(22 hours). There was one timeout (4 hours) due to a hanging git
download (see below) and one failure to save a defconfig.
Many builds are under the 30 min range, some lasted for about 2 hours.
This machine was running just one instance with jlevel 4 (just testing).
The machine has 8 Intel i7 cores @ 3.4GHz. I have another such machine
at my disposal.
I also have 2 machines available with each 4 Intel i7 cores @ 2.8 GHz.
Note that I cannot make any promises yet.


1. One run showed the following error, any ideas?

[Tue, 17 Jun 2014 21:39:33] INFO: preparing a new build
[Tue, 17 Jun 2014 21:39:33] INFO: removing cmake-2.8.12.2.tar.gz from downloads
[Tue, 17 Jun 2014 21:39:33] INFO: removing sam-ba_2.12_patch5.gz from downloads
[Tue, 17 Jun 2014 21:39:33] INFO: removing m4-1.4.17.tar.xz from downloads
[Tue, 17 Jun 2014 21:39:33] INFO: removing libcdio-0.92.tar.gz from downloads
[Tue, 17 Jun 2014 21:39:33] INFO: removing wsapi-1.6.1-1.src.rock from downloads
Already up-to-date.
[Tue, 17 Jun 2014 21:42:42] INFO: generate the configuration
[Tue, 17 Jun 2014 21:42:45] ERROR: cannot savedefconfig


2. As this machine is behind a git-blocking firewall, I will also have
to set the 'gitp' wrapper script as BR2_GIT. I think the best way is
to allow to set arbitrary settings from the autobuild config file. Of
course these shouldn't be used to change the build itself, as it could
render the problem irreproducible for others, but if we worry about
such abuse we could add this info into the results tarball.
I will add such an option (for the first part that is) and see if it works well.

In fact, there was one run that timed out, while it was doing a shallow clone.


3. If I get permission to run this officially, I will run it outside
working hours only. This means that I want to set a start time and end
time of the script. Ideally, the script is aware of this, so that I do
not have to interrupt a running build (and lose the results) when
stopping. I imagine a check when starting a new build whether we are
still within the defined time interval and stop if needed.
The starting of the script could be done with a simple cron job and
does not need to be taken into account by the script I think. It could
of course, in which case the script would sleep until it can start
again.
If you have a preference, let me know.


Best regards,
Thomas
