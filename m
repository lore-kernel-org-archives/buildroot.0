From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 30 Sep 2011 18:46:17 +0200
Subject: [Buildroot] User-enabled host packages?
In-Reply-To: <20110930160415.69616a8d@skate>
References: <4E79E001.7010409@lucaceresoli.net> <20110930160415.69616a8d@skate>
Message-ID: <CAAXf6LUvj5gJxmLa1gL1WssYJUs9fvWa30cAEBFpscQF_QXMoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 30, 2011 at 4:04 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> In this e-mail, I'll try to summarize what I understand to be the
> consensus on this issue and also what I, as a Buildroot contributor,
> consider acceptable for integration :
>
> ?* It is desirable to have *some* host packages visible in the
> ? menuconfig interface, but *most* host packages should remain
> ? invisible as they are today, when those are solely used as build
> ? dependencies.

Agreed.

>
> ? The criteria on deciding whether an host package should be made
> ? visible or not depends on whether this host package contains
> ? utilities that are directly useful for development. Things like
> ? image generators, debugging or flashing utilities that run on the
> ? host but interact with a target, etc. are the typical types of
> ? host packages that are expected to be visible.

Agreed.

>
> ?* From a .mk file perspective, exposing some host packages requires no
> ? change to the existing infrastructure. All host packages must be
> ? stored in the package/ subdirectory, just like any other package. So
> ? even the omap-u-boot-utils proposed by Luca should be in
> ? package/omap-u-boot-utils, just like package/uboot-tools.

Agreed.

>
> ?* From a Config.in perspective, the host packages that need to be
> ? visible should implement a package/<foo>/Config.in.host file
> ? describing the configuration options. Those configuration options
> ? should have the BR2_HOST_PACKAGE_* prefix.

Is this really needed?
If you use BR2_PACKAGE_HOST_FOO, then the existing infrastructure will
add host-foo to the targets.
Of course, explicit host packages will be treated the same way as
dependency-host-packages on Config.in level, but I don't think this is
a problem.

> All these Config.in.host
> ? files are included in a single "Packages -> Host utitities" submenu,
> ? from package/Config.in. There is no need to create subsections in
> ? this menu at the moment, since the number of utilities shown here is
> ? suspected to remain limited.

If you want to add the new menu under Packages, then the description
of that menu should change. Currently it is:
"Package Selection for the target"
A proposal is simply:
"Package selection"

The alternative is as proposed earlier: to put the menu at top-level.

>
> ?* The package infrastructure is modified so that when a
> ? BR2_HOST_PACKAGE_<foo> option is enabled, then host-foo is added to
> ? the global TARGETS variable.

Unless I'm misunderstanding the infrastructure, this would not be
needed if the option name is different, as I wrote above.

>
> What do others think of this proposal? Peter, what is your feeling
> about the general idea and this proposal? Can we go ahead and implement
> something like proposed in this e-mail?

Best regards,
Thomas
