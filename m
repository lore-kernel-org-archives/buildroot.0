From: clshotwe at rockwellcollins.com <clshotwe@rockwellcollins.com>
Date: Tue, 1 Oct 2013 15:32:26 -0500
Subject: [Buildroot] [PATCH v3 00/16] SELinux Buildroot Additions
In-Reply-To: <20131001215120.0b4d0d0a@skate>
References: <1380137571-688-1-git-send-email-clshotwe@rockwellcollins.com>
 <20131001215120.0b4d0d0a@skate>
Message-ID: <OFAC6B3EED.92F90C8E-ON86257BF7.006FECE1-86257BF7.0070C86C@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 10/01/2013 
02:51:20 PM:

> > For this implementation, I have added a package hierarchy that will 
allow
> > for both a debugging and a paired down release version.  The debugging
> > version required Python support, and is therefore much larger while 
the
> > release version does not.  To enable the release version, simply 
select
> > the refpolicy package (BR2_PACKAGE_REFPOLICY) and it selects all of 
the 
> > necessary packages to enable SELinux. For the debugging version, 
select
> > the policycoreutils debugging configure option
> > (BR2_PACKAGE_POLICYCOREUTILS_POLICY_DEBUGGING).  This will pull in 
Python
> > and a bunch of other packages into the build to debug the SELinux 
policy 
> > on target. 
> 
> I still don't quite understand when Python is needed exactly. For
> example, in your PATCH 02/16 that adds the libselinux package, the
> Python support is enabled as soon as the Python interpreter is enabled.
> 
> Is this libselinux Python stuff only needed to *debug* SELinux on the
> target?

That is correct.  The Python bindings are not used for standard system 
operation. The libselinux build creates the bindings that allow the 
audit2allow (part of they policycoreutils package) to analyze the SELinux 
audit logs and generate policy fixes. This is a very handy tool for 
creating fixes to the SELinux policy. 

> If so, then we clearly don't want to enable it as soon as Python is
> enabled in the Buildroot configuration: an user can perfectly want a
> Python interpreter to be installed on the target and to use SELinux,
> but not to have the SELinux debugging stuff.

There will not be many files added when Python is enabled.  I could also 
see somebody wanting to build a Python application that leverages the 
libselinux bindings (less likely). I can add back in the SELinux debugging 
handles to each of the packages to make it a configuration option. I 
removed that feature after the first revision. 

> I'd really like to understand this point before moving on with those
> packages.

Sounds like I really need to get that documentation completed.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 
