From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 09:00:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/docker-cli: fix version ldflags
In-Reply-To: <20200831010754.92051-1-christian@paral.in> (Christian Stewart's
 message of "Sun, 30 Aug 2020 18:07:54 -0700")
References: <20200831010754.92051-1-christian@paral.in>
Message-ID: <87y2lvcn9w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > The variables for the "docker version" output are located at
 > $(DOCKER_CLI_GOMOD)/cli/version - correct the path to these in the ldflags to
 > fix the following "unknown" lines in "docker version" output:

 > Client:
 >  Version:           unknown-version
 >  Git commit:        unknown-commit
 >  Built:             unknown-buildtime

 > Signed-off-by: Christian Stewart <christian@paral.in>
 > ---
 >  package/docker-cli/docker-cli.mk | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
 > index 07700809d5..147807cfc9 100644
 > --- a/package/docker-cli/docker-cli.mk
 > +++ b/package/docker-cli/docker-cli.mk
 > @@ -15,8 +15,8 @@ DOCKER_CLI_DEPENDENCIES = host-pkgconf
 
 >  DOCKER_CLI_GOMOD = github.com/docker/cli
 >  DOCKER_CLI_LDFLAGS = \
 > -	-X $(DOCKER_CLI_GOMOD).GitCommit=$(DOCKER_CLI_VERSION) \
 > -	-X $(DOCKER_CLI_GOMOD).Version=$(DOCKER_CLI_VERSION)
 > +	-X $(DOCKER_CLI_GOMOD)/cli/version.GitCommit=$(DOCKER_CLI_VERSION) \
 > +	-X $(DOCKER_CLI_GOMOD)/cli/version.Version=$(DOCKER_CLI_VERSION)

This seems to be against next. Please clearly mark such patches
(E.G. using the --subject-prefix='PATCH-NEXT' argument to git
send-email).

Master and LTS are also affected, so I sent a patch to fix it there as
well:

https://patchwork.ozlabs.org/project/buildroot/patch/20200831065842.9869-1-peter at korsgaard.com/

-- 
Bye, Peter Korsgaard
