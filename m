From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 6 Apr 2016 13:01:45 -0300
Subject: [Buildroot] Project configuration management
In-Reply-To: <20160406165217.07547fff@free-electrons.com>
References: <24791852-D548-43A1-8E3D-C39D69F479BB@vestiacom.com>
 <20160404204429.472fb279@free-electrons.com> <5702D279.3050904@mind.be>
 <20160406165217.07547fff@free-electrons.com>
Message-ID: <570532E9.6040401@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/16 11:52, Thomas Petazzoni wrote:

> That's not exactly the sort of script I was thinking of. I was thinking
> of a more high-level, project specific script, like maybe:
>
> 	genconfig -h <hwplatform> -s <softwarestack> -r <releasetype>
>
> or anything like that, which would internally have the knowledge of
> which fragments to use for which aspect (HW platform, software stack,
> etc.). Of course, internally, this script can use merge_config.sh, but
> having a more high-level script might help users to more easily
> generate their Buildroot configuration.
>
> Thomas

Hi.
Adding a bit on this since you CCed me, this customer has multiple 
platforms (boards/architectures), with multiple capabilities (different 
video in/out frontends) and localized features.
What i've used is pretty much what Thomas says, a script that takes 
several parameters as input:

genconfig -p platform -b build_type -c capabilities -l localization ...

Where platform would be different hardware targets, build_type is what 
kind of rootfs/image/firmware it's building (debug, release, etc), which 
capabilities (isdb-t, dvb-s2, etc), and which localization (target 
country, for language, menus, logos, etc).

The script then combines different defconfig fragments according to 
these parameters and validates the different combinations (for instance 
some platform X can't have isdb-t or so on), generating a suitable 
defconfig and setting up an out-of-tree build ready to go.

Of course the "chunkization" of the defconfig fragments requires some 
knowledge, but it essentially boils down to:

* Hardware platform
   + Toolchain setup (varies for debug & release)
   + Target filesystem setup (might be different for debug & release)
   + Kernel setup (ditto above)

* Apps
   + Open-source apps for the target (might vary for debug & release)
   + Propietary apps (varies according to capabilities and localization)

* Localization
   + Language packs, certificates, default settings, marketing stuff, etc

Regards.
