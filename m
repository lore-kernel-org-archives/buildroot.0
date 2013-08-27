From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 22:08:19 +0200
Subject: [Buildroot] SELinux Buildroot Additions
In-Reply-To: <OF965741C3.D223706B-ON86257BD4.0066A1F9-86257BD4.00680C50@rockwellcollins.com>
References: <OFC105562B.76AF62E8-ON86257BD4.005985FE-86257BD4.0059C2DD@rockwellcollins.com>
 <20130827190459.1eb3e4d9@skate>
 <OF340CA870.4409C997-ON86257BD4.005E13D7-86257BD4.0061A29C@rockwellcollins.com>
 <20130827202505.22f5ee46@skate>
 <OF965741C3.D223706B-ON86257BD4.0066A1F9-86257BD4.00680C50@rockwellcollins.com>
Message-ID: <20130827220819.6ea4fcae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clayton,

On Tue, 27 Aug 2013 13:56:28 -0500, clshotwe at rockwellcollins.com wrote:

> > Can you expand on what is the huge issue between Busybox and the
> > SELinux Refpolicy? The fact that the Refpolicy doesn't include a policy
> > for Busybox? If so, isn't it possible to contribute a policy that would
> > be suitable for usage with Busybox? A quick Google search returns
> > http://code.google.com/p/sebusybox/.
> 
> Since Busybox is one executable that runs a bunch of different commands, 
> there is an issue with the SELinux type transitions happening correctly. 
> Programs, including init, end up running in an incorrect context and break 
> SELinux rules. A policy could probably be created to let Busybox do what 
> it needs to do but then that opens up the issue of having one application 
> do everything. A lot of potential security vulnerabilities can be blocked 
> by having a bunch of different applications that cannot all be compromised 
> at once.  It would be really easy to use busybox if it was possible to 
> build separate executables for security critical applications but I don't 
> think that feature is available yet.

This is actually possible, with the option CONFIG_FEATURE_INDIVIDUAL of
Busybox. It creates a libbusybox shared library, and then creates one
small (~6 KB) binary for each busybox program. This way, each program
is really separate, even though the program code is really within
libbusybox.

Wouldn't this make SELinux handling easier? If yes, then I believe we
could certainly decide to build and install Busybox this way when
SELinux support is enabled.

However, it seems like this Busybox feature installs those binary
programs in a directory called 0_lib/ in the source directory, and
"make install" keeps installing symbolic links. Well, I guess this is
probably something we can improve/fix.

> The packages that I will be adding are all from Tresys (
> http://userspace.selinuxproject.org/trac/).  I looked into the sebusybox 
> stuff a while ago but it looks like no one has done any development on it 
> in a while. 

Ok.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
