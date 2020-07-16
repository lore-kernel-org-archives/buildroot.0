From: Tomas V. Arredondo <surf_fanatico@yahoo.com>
Date: Thu, 16 Jul 2020 09:20:35 +0000 (UTC)
Subject: [Buildroot] audit2allow BR support
In-Reply-To: <20200716110524.5214d23a@windsurf.home>
References: <5696376.2474933.1594878993118.ref@mail.yahoo.com>
 <5696376.2474933.1594878993118@mail.yahoo.com>
 <20200716094540.27274cf4@windsurf.home>
 <159488904315.3198.6229972988341724924@kwain>
 <20200716110524.5214d23a@windsurf.home>
Message-ID: <883924338.2521657.1594891236003@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi,?
    On Thursday, July 16, 2020, 05:05:27 AM EDT, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:  
 
 On Thu, 16 Jul 2020 10:44:03 +0200
Antoine Tenart <antoine.tenart@bootlin.com> wrote:

> > Which Python version have you chosen ? Python 3.x or Python 2.x, i.e
> > BR2_PACKAGE_PYTHON=y or BR2_PACKAGE_PYTHON3=y ?? 
> 
> I did not encounter such an issue, but I only used versions 3.0+. If I
> think about something, I'll let you know.

Hm, I see that package/selinux-python/Config.in has:

? ? ? ? depends on !BR2_PACKAGE_PYTHON
? ? ? ? select BR2_PACKAGE_PYTHON3

so anyway, this is all only Python 3.x.
So yeah, I'm not sure how Tomas got into this build issue. Tomas: could
share the Buildroot .config being used ?

[TA] Here is the python stuff:
# BR2_PACKAGE_PYTHON is not setBR2_PACKAGE_PYTHON3=y# BR2_PACKAGE_PYTHON3_PY_ONLY is not setBR2_PACKAGE_PYTHON3_PYC_ONLY=y# BR2_PACKAGE_PYTHON3_PY_PYC is not set
## core python3 modules#
## The following modules are unusual or require extra libraries## BR2_PACKAGE_PYTHON3_BZIP2 is not set# BR2_PACKAGE_PYTHON3_CODECSCJK is not set# BR2_PACKAGE_PYTHON3_CURSES is not set# BR2_PACKAGE_PYTHON3_DECIMAL is not set# BR2_PACKAGE_PYTHON3_OSSAUDIODEV is not set# BR2_PACKAGE_PYTHON3_READLINE is not set# BR2_PACKAGE_PYTHON3_SSL is not set# BR2_PACKAGE_PYTHON3_SQLITE is not set# BR2_PACKAGE_PYTHON3_PYEXPAT is not set# BR2_PACKAGE_PYTHON3_XZ is not set
BR2_PACKAGE_PYTHON3_UNICODEDATA=yBR2_PACKAGE_PYTHON3_ZLIB=y
[TA] Any Options of more interest??

> > > 2- /var/lib/selinux directory missing
> > > $ semodule -llibsemanage.semanage_create_store: Could not create module store at /var/lib/selinux/targeted. (No such file or directory).libsemanage.semanage_direct_connect: could not establish direct connection (No such file or directory).semodule: Could not connect to policy handler
> > > ls /var/lib/selinuxls: /var/lib/selinux: No such file or directory? 
> > > ==> looks like the directory can just be added? ? 
> > 
> > On this one, I'm not sure, would need testing. I don't immediately see
> > anything creating /var/lib/selinux in Buildroot, so if it's not done by
> > the build system of one the SELinux packages, indeed /var/lib/selinux
> > will be missing.
> > 
> > Antoine: you are working on building systems with SELinux supports, did
> > you face the /var/lib/selinux missing problem ? Or perhaps because
> > you're testing with systemd, the situation is different ?? 
> 
> Using a modular policy at runtime isn't supported by the current
> refpolicy support in BR. When playing with it, I had similar issues with
> directories missing. Also, I don't think adding those directories alone
> will make it working, there's probably more work to do.

How could have Tomas encountered this with the current Buildroot, where
we don't even have the logic to build a modular policy ?
[TA] Could he mean that calling semodule is not supported I guess?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200716/4d9c6e89/attachment.html>
