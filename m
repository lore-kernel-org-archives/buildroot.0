From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Sep 2011 19:58:05 +0200
Subject: [Buildroot] User-enabled host packages?
In-Reply-To: <CAAXf6LUvj5gJxmLa1gL1WssYJUs9fvWa30cAEBFpscQF_QXMoA@mail.gmail.com>
References: <4E79E001.7010409@lucaceresoli.net> <20110930160415.69616a8d@skate>
 <CAAXf6LUvj5gJxmLa1gL1WssYJUs9fvWa30cAEBFpscQF_QXMoA@mail.gmail.com>
Message-ID: <20110930195805.0677ff0b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 30 Sep 2011 18:46:17 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> > ?* From a Config.in perspective, the host packages that need to be
> > ? visible should implement a package/<foo>/Config.in.host file
> > ? describing the configuration options. Those configuration options
> > ? should have the BR2_HOST_PACKAGE_* prefix.
> 
> Is this really needed?
> If you use BR2_PACKAGE_HOST_FOO, then the existing infrastructure will
> add host-foo to the targets.

Ah, ah, you're right! This works well unless there are packages whose
names starts with host-, but this would be strange and we can just
state that it is not supported.

> Of course, explicit host packages will be treated the same way as
> dependency-host-packages on Config.in level, but I don't think this is
> a problem.

Not sure what you mean here, but that raises the question of
dependencies between host packages.

I would say that there shouldn't be dependencies of non-visible host
packages on visible host packages (what I call 'visible' are host
packages that we list in menuconfig).

When there is a dependency of a visible host package on another visible
host package, then the dependency must be expressed in both the
Config.in.host *and* the .mk file, as we do for target packages.

When there is a dependency of a visible host package on another
invisible host package, then the dependency is only expressed in
the .mk file, as we do for the dependency of current host packages.

When there is a dependency of an invisible host package on another
invisible host package, then the dependency is also only expressed in
the .mk file, as we do for the dependency of current host packages.

Does that sounds correct?

> > All these Config.in.host
> > ? files are included in a single "Packages -> Host utitities"
> > submenu, from package/Config.in. There is no need to create
> > subsections in this menu at the moment, since the number of
> > utilities shown here is suspected to remain limited.
> 
> If you want to add the new menu under Packages, then the description
> of that menu should change. Currently it is:
> "Package Selection for the target"
> A proposal is simply:
> "Package selection"
> 
> The alternative is as proposed earlier: to put the menu at top-level.

No strong opinion here. Perhaps a new top-level menu is better, I don't
know.

> > ?* The package infrastructure is modified so that when a
> > ? BR2_HOST_PACKAGE_<foo> option is enabled, then host-foo is added
> > to the global TARGETS variable.
> 
> Unless I'm misunderstanding the infrastructure, this would not be
> needed if the option name is different, as I wrote above.

Yes, sure.

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
