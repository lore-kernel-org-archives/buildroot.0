From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Sep 2011 16:04:15 +0200
Subject: [Buildroot] User-enabled host packages?
In-Reply-To: <4E79E001.7010409@lucaceresoli.net>
References: <4E79E001.7010409@lucaceresoli.net>
Message-ID: <20110930160415.69616a8d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In this e-mail, I'll try to summarize what I understand to be the
consensus on this issue and also what I, as a Buildroot contributor,
consider acceptable for integration :

 * It is desirable to have *some* host packages visible in the
   menuconfig interface, but *most* host packages should remain
   invisible as they are today, when those are solely used as build
   dependencies.

   The criteria on deciding whether an host package should be made
   visible or not depends on whether this host package contains
   utilities that are directly useful for development. Things like
   image generators, debugging or flashing utilities that run on the
   host but interact with a target, etc. are the typical types of
   host packages that are expected to be visible.

 * From a .mk file perspective, exposing some host packages requires no
   change to the existing infrastructure. All host packages must be
   stored in the package/ subdirectory, just like any other package. So
   even the omap-u-boot-utils proposed by Luca should be in
   package/omap-u-boot-utils, just like package/uboot-tools.

 * From a Config.in perspective, the host packages that need to be
   visible should implement a package/<foo>/Config.in.host file
   describing the configuration options. Those configuration options
   should have the BR2_HOST_PACKAGE_* prefix. All these Config.in.host
   files are included in a single "Packages -> Host utitities" submenu,
   from package/Config.in. There is no need to create subsections in
   this menu at the moment, since the number of utilities shown here is
   suspected to remain limited.

 * The package infrastructure is modified so that when a
   BR2_HOST_PACKAGE_<foo> option is enabled, then host-foo is added to
   the global TARGETS variable.

What do others think of this proposal? Peter, what is your feeling
about the general idea and this proposal? Can we go ahead and implement
something like proposed in this e-mail?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
