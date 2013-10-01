From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Mon, 30 Sep 2013 19:06:55 -0500
Subject: [Buildroot] [PATCHv2 0/4] Add a BR2_EXTERNAL mechanism
In-Reply-To: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <OFC0A50B26.EB508415-ON86257BF6.007D5E0E-86257BF7.0000A279@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas/Yann/All,

Today on the IRC channel there was a discussion about BR2_EXTERNAL
and the remaining issues with the patch. Thomas Petazonni said that he
is waiting for the following two things:

1. The opinion of Jacmet (Peter Korsgaard), the Buildroot maintainer

2. A consensus with Arnout on whether BR2_EXTERNAL should be stored
   or not in the .config

For #1 - Thomas P. said that he was confident that he could convince
Peter K. of including BR2_EXTERNAL into buildroot.

For #2 - there was some dicussion on how to store BR2_EXTERNAL between
Thomas P., Yann E MORIN and myself about how best to accomplish this.

The discussion started with why BR2_EXTERNAL can't be a part of the
".config" file. As Thomas P. has stated many times before, there exists
a chicken-and-egg problem with BR2_EXTERNAL in that we can't store it
in the .config because menuconfig needs BR2_EXTERNAL to display the
external packages in the menuconfig and there is no way to pull
BR2_EXTERNAL's definition into menuconfig if it is in the config file.

The discussion then progressed with myself suggesting that we could put
a check to search if BR2_EXTERNAL is in the ".config" and then prompt a
warning when BR2_EXTERNAL exists in the ".config" but isn't defined in
the environment. However, I quickly realized that this wouldn't cover
the case where packages have been added to the .config from BR2_EXTERNAL
and are now no longer defined.

The discussion then continued with Thomas P. and myself talking about my
suggestion of having the wrapper makefile (out-of-tree (OOT) builds) 
store the value of BR2_EXTERNAL. Thomas P. said that storing 
BR2_EXTERNAL in the wrapper makefile is not good because non-OOT builds
don't work the same OOT builds. I then made the point that having to 
ensure BR2_EXTERNAL is defined everytime you call make is annoying and 
that defining in your shell environment is dangerous. This is when you 
are managing multiple builds (OOT builds) with different BR2_EXTERNALs 
and using same buildroot source.

Yann then asked me to the sum up what this issue was with in-tree builds
and BR2_EXTERNAL. Thomas P. then responded with "you have to pass the 
BR2_EXTERNAL value on the command line (or environment) at each 
Buildroot command"

I then suggested that BR2_EXTERNAL have a pre-requisite of being used
with only out-of-tree builds. The documentation for BR2_EXTERNAL should
then be updated to reflect this requirement and say something about this
requirement. 

Yann saw two options moving forward with this issue - 1) always require
BR2_EXTERNAL (in env or on command line) or 2) only support BR2_EXTERNAL
in OOT, stored in the wrapper.

Yann put the discussion of BR2_EXTERNAL on the agenda for the DevDays
coming up at the end of October:

http://elinux.org/Buildroot:DeveloperDaysELCE2013

Thomas P. suggested that maybe the wrapper makefile could be
genreated in the default output directory (O=output). Which, if a user
wanted to have the BR2_EXTERNAL remembered, they would have to change
their working directory to the default output directory (output) to use
the wrapper.

Finally, Thomas P. suggested that make BR2_EXTERNAL should be contained
in a file. I responded with asking how it would work with having
different BR2_EXTERNAL for different builds while using the same
buildroot source. To this question there was no response and that is
where things stand today.

To expand on Thomas P.'s idea of having a file, I'm starting to warm to
this idea as we could have buildroot default to look for a BR2_EXTERNAL
in the top-level of the buildroot source. If present, it would use the
directory that is listed there. However, we could override the location
of this file by specifying a variable fo the file in the wrapper 
makefile.

I hope I did a decent job capturing this discussion becuase I rushed
to put this together before I left for the day. 

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 
09/14/2013 02:03:49 PM:

[Thomas P.'s cover page]

Thanks,
-Ryan

------------------------------------------------------------------------------------------
Ryan J Barnett / Software Engineer / Platform SW
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
rjbarnet at rockwellcollins.com
www.rockwellcollins.com
