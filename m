From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 21:27:53 +0200
Subject: [Buildroot] [PATCH 2/3] package/runc: fix shared only build
 when libseccomp is enabled.
In-Reply-To: <1467916777-29220-2-git-send-email-romain.naour@gmail.com>
References: <1467916777-29220-1-git-send-email-romain.naour@gmail.com>
 <1467916777-29220-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20160708212753.55d3c2ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Geoff in Cc.

On Thu,  7 Jul 2016 20:39:36 +0200, Romain Naour wrote:
> When BR2_PACKAGE_LIBSECCOMP is set, the go build system will try to
> find static library libseccomp.a since "static_build" and
> "extldflags '-static'" are used.

Indeed, in BR2_SHARED_LIBS=y builds, libseccomp.a will not be produced.

> Link runc statically only for static only build and prefer dynamic
> linking otherwise.

That's interesting, I thought Go was making static linking *mandatory*.
If that's not the case, then I would indeed prefer if we handled this
like all other packages: static linking only when BR2_STATIC_LIBS.

However, this should be done consistently for all packages: flannel and
docker-containerd also pass -extldflags '-static' unconditionally.

Geoff, Christian, do you see a problem with Romain's proposal?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
