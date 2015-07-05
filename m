From: Mike <mikez@OpenPlayer.org>
Date: Sun, 5 Jul 2015 08:32:53 -0500
Subject: [Buildroot] Hash checking infrastructure
In-Reply-To: <20150705111007.63ff239b@free-electrons.com>
References: <20150704140142.3aa5c982@core2quad.morethan.org>
 <20150704214734.GC3634@free.fr>
 <20150704213628.21ff7e6e@core2quad.morethan.org>
 <20150705000050.7c2be969@core2quad.morethan.org>
 <20150705111007.63ff239b@free-electrons.com>
Message-ID: <20150705083253.1bfaefa5@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 5 Jul 2015 11:10:07 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear Mike,
> 

- - - - -

> I.e, it works perfectly fine.
> 
> So there is something else you are doing, or that is special in your
> setup.
> 

This should allow duplication of the problem I am seeing:

Setup:

Brand new (2 hours ago) clone of buildroot.git and luajit.git
Both with heads left on master.

Brand new out-of-tree working directory.

Content of local.mk:

LUAJIT_OVERRIDE_SRCDIR = /var1/arm/luajit-2.0.git

The defconfig (from make savedefconfig):

BR2_PACKAGE_LUAJIT=y
BR2_PACKAGE_LUALOGGING=y
BR2_PACKAGE_LUAPOSIX=y

The (relevant) progress highlights, up to the failure:

>>> luajit custom Syncing from source dir /var1/arm/luajit-2.0.git
>>> luajit custom Configuring
>>> luajit custom Building
>>> luajit custom Installing to staging directory
>>> luajit custom Installing to target

The problem area:

>>> host-luajit custom Downloading
--2015-07-05 08:15:09--  http://luajit.org/download/LuaJIT-custom.tar.gz
Resolving luajit.org... 94.23.39.66
Connecting to luajit.org|94.23.39.66|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2015-07-05 08:15:10 ERROR 404: Not Found.

--2015-07-05 08:15:10--  http://sources.buildroot.net/LuaJIT-custom.tar.gz
Resolving sources.buildroot.net... 176.9.16.109
Connecting to sources.buildroot.net|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2015-07-05 08:15:10 ERROR 404: Not Found.

make: *** [/var1/arm/new-i386/build/host-luajit-custom/.stamp_downloaded] Error 1
make: Leaving directory `/var1/arm/buildroot.git'

- - - -

I was not imagining this problem.  ;)
And that does look like it is from the LuaRocks infrastructure.

I.E: the host-luajit (required to execute the lua-rocks install
in /host).

Mike

> Best regards,
> 
> Thomas
