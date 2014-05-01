From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 1 May 2014 21:46:32 +0200
Subject: [Buildroot] [PATCH] Rebuild busybox when an external config is
	updated
In-Reply-To: <1396469147-21713-1-git-send-email-sojka@merica.cz>
References: <1396469147-21713-1-git-send-email-sojka@merica.cz>
Message-ID: <CAAXf6LVyQfj8Z=RQkfq_tyjN-e305bZSpKaOg5N5FpVSsc1Tbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michal,

On Wed, Apr 2, 2014 at 10:05 PM, Michal Sojka <sojka@merica.cz> wrote:
> This patch adds dependency of busybox configure target to the
> configuration file specified with BUSYBOX_CONFIG_FILE variable. This
> means that the following sequence of commands rebuilds busybox after
> the busybox.config is changed:
>
>   make BUSYBOX_CONFIG_FILE=$PWD/busybox.config
>   echo SOME_OPTION=y >> busybox.config
>   make BUSYBOX_CONFIG_FILE=$PWD/busybox.config
>
> This behaviour is handy when a per-project busybox config is
> maintained in another repository and the config gets updated by
> another user (e.g. after git pull).
>
> Without this patch, the last command above does not rebuild busybox.
>
> This patch also modifies bysubox-update-config target to preserve the
> timestamp of "exported" config. This is to ensure, that the following
> sequence of commands builds busybox only once.
>
>   make BUSYBOX_CONFIG_FILE=$PWD/busybox.config
>   make BUSYBOX_CONFIG_FILE=$PWD/busybox.config busybox-update-config
>   make BUSYBOX_CONFIG_FILE=$PWD/busybox.config
>

The issue you're describing is not limited to busybox alone. There are
other packages using config files that have the same limitation: linux
and uclibc for example.

In general, buildroot is mainly aimed at building a given
configuration completely. It is not really targeted at development
environment, where you change part of the configuration (like the
busybox config file) and then can rebuild all necessary components
automatically.
In fact, there are many different type of situations related to this:
for example, if you start from an existing built system, and then
enable one package (like a library), not all of the other packages
that have optional dependencies are automatically rebuilt. Buildroot
does not even attempt to do this.

So I'm not sure if this patch is desirable given the above.
Other contributors may think otherwise, of course.

Best regards,
Thomas
