From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2016 14:59:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.6.2
In-Reply-To: <CABa6e=oxJ48BAe9c9itArAB-7CLHw71gKjNiMO0s0jigqH2DvA@mail.gmail.com>
References: <1462551812-8952-1-git-send-email-christian@paral.in>
 <20160507144313.4e7112af@free-electrons.com>
 <20160507184514.GA2419@tarshish>
 <20160507214016.5592aea2@free-electrons.com>
 <CABa6e=og-BDA_VY=wJ17uc9=-S0D34SEstRv1W_FyFVUU=ehcw@mail.gmail.com>
 <20160508143956.4b5a4db0@free-electrons.com>
 <CABa6e=oxJ48BAe9c9itArAB-7CLHw71gKjNiMO0s0jigqH2DvA@mail.gmail.com>
Message-ID: <20160508145944.09f42d02@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 8 May 2016 22:46:14 +1000, Cam Hutchison wrote:

> I don't know anything about bootstraping the compiler with anything other
> than go 1.4 - as far as my limited understanding goes, that is still necessary.
> 
> What I meant was that it should not be necessary to backport the patch
> as you suggested, but instead compile the bootstrap compiler with
> CGO_ENABLED=0 in the environment. That worked for me when I
> saw the same problem building the bootstrap compiler (but the problem
> was not consistent and no one else seemed to have it, so I just assumed
> there was an issue in my build environment - so I never posted this
> fix).

Aah, OK! I can indeed confirm that the following patch fixes the build
problem for me.

Geoff, if that's OK for you, could you send a proper patch that does
this?

diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
index e404cb6..2b46694 100644
--- a/package/go-bootstrap/go-bootstrap.mk
+++ b/package/go-bootstrap/go-bootstrap.mk
@@ -17,7 +17,8 @@ HOST_GO_BOOTSTRAP_MAKE_ENV = \
        GOOS=linux \
        GOROOT_FINAL="$(HOST_GO_BOOTSTRAP_ROOT)" \
        GOROOT="$(@D)" \
-       GOBIN="$(@D)/bin"
+       GOBIN="$(@D)/bin" \
+       CGO_ENABLED=0
 
 define HOST_GO_BOOTSTRAP_BUILD_CMDS
        cd $(@D)/src && $(HOST_GO_BOOTSTRAP_MAKE_ENV) ./make.bash

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
