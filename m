From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Feb 2013 22:29:22 +0100
Subject: [Buildroot] Adding a ModemManager package
In-Reply-To: <51210E6F.6000504@gmail.com>
References: <51210E6F.6000504@gmail.com>
Message-ID: <51214BB2.4090907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/02/13 18:07, Shawn J. Goff wrote:
> I'm trying to add a ModemManager package. While building, I'm getting
> this error during the installation step: "/usr/lib/libgcc_s.so: file not
> recognized: File format not recognized". This looks like it's looking at
> my host's libgcc_s.so instead of the target's version. If that's the case
> I'm not sure why or how to fix it. I did have to use autogen.sh to create
> the configure script and lots of other stuff; I did this on my host
> system, so I'm not sure if that is affecting it.

  Hi Shawn,

  I haven't been able to reproduce your issue because your patch didn't 
include the libqmi package. However, it is very well possible that the 
issue is caused by running 'autogen.sh'. Is it possible that the libtool 
patch doesn't get applied? I see that libtool adds "-rpath /usr/lib" to 
the link command, and I believe the libtool patch removes exactly that.

  To create configure properly, you need to set _AUTORECONF to YES, as 
mentioned by Thomas. Unfortunately, that is not so easy...

- modem-manager uses gettext macros provided by the gettext package, so 
you need to add host-gettext to the dependencies. But host-gettext 
doesn't exist yet - I'll send a patch to add it.

- modem-manager requires gtkdocize to be run. We certainly don't want to 
add gtkdocize to buildroot. But since it just generates two files for a 
total of 350 lines, it's easy to add that with a package patch.

  Hopefully this will help you to solve the problem.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
