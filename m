From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Aug 2019 15:33:38 +0200
Subject: [Buildroot] [PATCH 00/23] package/harfbuzz: needs gcc >= 4.8
In-Reply-To: <20190803191501.5412-1-bernd.kuhls@t-online.de>
References: <20190803191501.5412-1-bernd.kuhls@t-online.de>
Message-ID: <20190814153338.6cc33087@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Eric Le Bihan in Cc. Eric there is some question below related to work
you've done.

On Sat,  3 Aug 2019 21:14:38 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> bumping harfbuzz to 2.5.2
> https://git.buildroot.net/buildroot/commit/package/harfbuzz?id=c04e5cb16e3de688dfee585f47f22db4232acb3e
> 
> added a dependency on gcc >= 4.8:
> 
> https://github.com/harfbuzz/harfbuzz/blob/master/NEWS#L34
> https://github.com/harfbuzz/harfbuzz/blob/master/NEWS#L14
> 
> This series adds this dependency to harfbuzz, host-harfbuzz and
> (hopefully) to all reverse dependencies.

With this series, we are still getting some failures with host-harfbuzz. I noted one:

  http://autobuild.buildroot.net/results/a8d/a8d6a4e96b2949247e4cc43055520d65ba705972/build-end.log

The problem is that adwaita-icon-theme can be enable either when
libgtk2 *or* libgtk3 are enabled, but depends on host-libgtk3, which
ultimately will need host-harfbuzz. And host-harfbuzz needs host gcc >=
4.8.

So the most immediate solution is obviously to add a host gcc >= 4.8
dependency to adwaita-icon-theme.

However, the fact that adwaita-icon-theme can be used with libgtk2, but
needs host-libgtk3 got my attention, so I looked at the history of this
package.

Initially, it was added by Eric in commit
edc92b68afb66ea8ec562afc8bbe3d5ae10b74c8, with no special dependency.
Not longer after that, in commit
704c540203ddd217d7bcf6d371fc87a079c0be9b, Eric made the package depend
on BR2_PACKAGE_LIBGTK3 and added host-libgtk3 to the dependencies.

About half a year later, in commit
32ac8fb04875f94b7f0c6a48e3dd9f3f6c2cfa93, Gustavo Zacarias then changed
the Config.in dependency to libgtk2 || libgtk3, but kept the
host-libgtk3 dependency in the makefile. It is not clear to me if this
is correct.

Eric, do you know why the dependency on host-libgtk3 is needed ? I can
imagine because of the need for gtk-update-icon-cache ? But what
happens in the libgtk2 situation ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
