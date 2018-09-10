From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 17:49:00 +0200
Subject: [Buildroot] [PATCH 2/2] package/gdb: use stat() privided by the
 system
In-Reply-To: <20180909163750.14196-2-romain.naour@gmail.com>
References: <20180909163750.14196-1-romain.naour@gmail.com>
 <20180909163750.14196-2-romain.naour@gmail.com>
Message-ID: <20180910174900.0b9f4133@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Sep 2018 18:37:50 +0200, Romain Naour wrote:
> Use the same workaround [1] as gnulib use to get the original
> definition of stat. Otherwise with musl toolchains, gnulib try to use
> rpl_stat which is not defined.
> 
> Fixes:
> https://gitlab.com/free-electrons/toolchains-builder/-/jobs/95552308
> 
> [1] http://git.savannah.gnu.org/cgit/gnulib.git/commit/lib/stat.c?id=c9d72f69bd201a1ab31464d91f234ea1817fe0e1
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I am confused by this patch. Why do we need that? The <sys/stat.h> on
my system doesn't test __need_system_sys_stat_h. Is this a workaround
to force gnulib to not provide its own stat() replacement ?

Why is gnulib misbehaving here ? We have tons of gnulib related hacks
in gdb.mk, and this start to pile up quite a bit. Why do we have all
those gnulib issues with gdb ? Why not with tons of other packages that
also use gnulib ?

> +Use the same workaround [1] as gnulib use to get the original
> +definition of stat. Otherwise with musl toolchains, gnulib try to use
> +rpl_stat which is not defined.

Well rpl_stat() is supposed to be implemented by gnulib. So basically
gnulib tells gdb: please don't use stat() but my rpl_stat() wrapper,
but then gnulib doesn't provide rpl_stat().

Any idea what's happening here ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
