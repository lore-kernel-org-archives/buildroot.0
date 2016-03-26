From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 18:28:25 +0100
Subject: [Buildroot] [PATCH] package/luajit: pass LDCONFIG=true to make
 sure dynamic library links are created
In-Reply-To: <1458770699-13316-1-git-send-email-romain.naour@gmail.com>
References: <1458770699-13316-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160326182825.328509e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Mar 2016 23:04:59 +0100, Romain Naour wrote:
> Since host-luajit is linked dynamically [1], for the same reason as for the
> target variant [2], override LDCONFIG with 'true' to create the
> libluajit-5.1.so.2 -> libluajit-5.1.so.2.0.4 symbolic link.
> 
> [1] 9ba8d1cce4ab00307827083bae234d87b37fb967
> [2] 40089283e91fc6daae1aff0346f6821bd2bcab80
> 
> Fixes:
> http://autobuild.buildroot.net/results/4dc/4dcbcde0046e265317e170a977e699e5c3a06b87/
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luajit/luajit.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've applied, but after completely rewording the commit log. Indeed,
there is a priori no reason why ldconfig should not work when building
for the host. So the argument "let's do like for the target" is not
very good.

However, it turns out that on some machines (including gcc20, where the
build failure occurs), ldconfig must be called as /sbin/ldconfig,
since /sbin is not in the PATH of normal users. And when ldconfig fails
to run, the luajit Makefile does not create the symbolic links. And
since indeed running ldconfig is not really needed for us, passing
LDCONFIG=true is a reasonable workaround.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
