From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 22:43:22 +0100
Subject: [Buildroot] [PATCH 15/15] ejabberd: Bump to version 18.09
In-Reply-To: <20181126110807.31431-16-johan.oudinet@gmail.com>
References: <20181126110807.31431-1-johan.oudinet@gmail.com>
 <20181126110807.31431-16-johan.oudinet@gmail.com>
Message-ID: <20181128224322.42641f73@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Nov 2018 12:08:07 +0100, Johan Oudinet wrote:
> This version requires much less patches than the previous one packaged
> in Buildroot. It is compatible with Erlang OTP 21.
> There are two remainning patches to:
> - change the Makefile rules so dependencies are not downloaded/compiled;
> - fix ejabberd user and load a default file in ejabberdctl script.
> 
> The patch 0006-fix-install-permissions has been replaced by setting
> permissions on /etc/ejabberd directory via EJABBERD_PERMISSIONS.
> 
> The patch 0009-disable-mod_avatar has been removed because eimp is
> a mandatory dependency since 0f86559d.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

I don't have a specific issue with that patch, but when doing a build,
I realized that some dependencies of ejabberd are built *after*
ejabberd itself.

Comparing ejabberd/Config.in selects and ejabberd/ejabberd.mk
DEPENDENCIES variable, I found that erlang-jiffy and erlang-p1-oauth2
were selected by ejabberd/Config.in, but not mentioned in
EJABBERD_DEPENDENCIES. In my build, they ended up being built after
ejabberd, so they are clearly not build dependencies.

The question is: are these runtime dependencies (in which case a #
runtime comment in the Config.in file would be nice), or are they
stale/useless dependencies ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
