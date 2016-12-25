From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Dec 2016 23:16:36 +0100
Subject: [Buildroot] [PATCH 1/1] docker-engine: fix docker version output
In-Reply-To: <20161224060246.4288-1-christian@paral.in> (Christian Stewart's
 message of "Fri, 23 Dec 2016 22:02:46 -0800")
References: <20161224060246.4288-1-christian@paral.in>
Message-ID: <878tr3ejsr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > At compile-time the docker build scripts generate a version file used
 > to build the output of the docker version command. This file is
 > generated somewhat properly by the Buildroot build system, however the
 > version number and commit ID are incorrectly formatted. This patch fixes
 > the output to the correct format.

 > This is important as some tools like WeaveWorks won't even start unless
 > they can parse the Docker Version output correctly.

 > Signed-off-by: Christian Stewart <christian@paral.in>
 > ---
 >  package/docker-engine/docker-engine.mk | 5 ++++-
 >  1 file changed, 4 insertions(+), 1 deletion(-)

 > diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
 > index ade6fbb..d60ae37 100644
 > --- a/package/docker-engine/docker-engine.mk
 > +++ b/package/docker-engine/docker-engine.mk
 > @@ -5,6 +5,7 @@
 >  ################################################################################
 
 >  DOCKER_ENGINE_VERSION = v1.12.5
 > +DOCKER_ENGINE_COMMIT = 7392c3b0ce0f9d3e918a321c66668c5d1ef4f689
 >  DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
 
 >  DOCKER_ENGINE_LICENSE = Apache-2.0
 > @@ -67,7 +68,9 @@ endif
 >  define DOCKER_ENGINE_CONFIGURE_CMDS
 >  	ln -fs $(@D) $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/docker
 >  	cd $(@D) && \
 > -		GITCOMMIT="unknown" BUILDTIME="$$(date)" VERSION="$(DOCKER_ENGINE_VERSION)" \
 > +		GITCOMMIT="$$(echo $(DOCKER_ENGINE_COMMIT) | head -c7)" \
 > +		BUILDTIME="$$(date)" \
 > +		VERSION="$$(echo $(DOCKER_ENGINE_VERSION) | tail -c +2)" \

We prefer to do text processing in make instead of shell where possible
as that is (a bit) faster, easier to read (E.G. no double $$) and easier
to debug (E.G. the make output directly shows the result of the
commands).

There is no simple way of doing head -c7, so I've left that but changed
the VERSION calculation to use patsubst.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
