From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 07:46:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/glm: fix musl build
In-Reply-To: <20170612182936.8517-1-bernd.kuhls@t-online.de>
References: <20170612182936.8517-1-bernd.kuhls@t-online.de>
Message-ID: <20170621074626.2646fe85@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 20:29:36 +0200, Bernd Kuhls wrote:
> The musl-related build error occurs because -pedantic is used for gcc
> which is broken with musl, for details refer to
> https://git.buildroot.net/buildroot/commit/package/jsoncpp?id=6b462ac8bd4021dda4f84198a127f1be7b46087d
> 
> Glm uses this option only if GLM_TEST_ENABLE_LANG_EXTENSIONS=OFF, to
> solve the problem we set it to ON in order to use another code path
> in CMakeLists.txt which causes no other changes to compiler options
> because GLM_TEST_ENABLE_FAST_MATH defaults to OFF.
> 
> To sum up, this patch only prevents -pedantic being added to gcc
> options which fixes
> http://autobuild.buildroot.net/results/890/8900d0c45c859edd95bb3610b224b9f222ef7493/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

The problem fixed by this patch no longer exists with the latest
rebuild of the musl toolchains, which use gcc 6.x over gcc 5.x.
However, I haven't been able to identify which commit in gcc is fixing
this. Could you investigate this a little bit?

Also, I would prefer a patch to the package that removes -pedantic
rather than the fragile solution you proposed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
