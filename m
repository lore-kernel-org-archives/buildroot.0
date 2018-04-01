From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 16:36:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/pkg-golang: use 'build' instead
 of 'install'
In-Reply-To: <20180401115136.1345-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 1 Apr 2018 13:51:35 +0200")
References: <20180401115136.1345-1-thomas.petazzoni@bootlin.com>
Message-ID: <877eprro2r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > So far, we were using the 'go install' mechanism to build a package
 > and have its binary installed in
 > $$($(2)_WORKSPACE)/bin/linux_$$(GO_GOARCH). This worked fine when
 > building on x86-64 for ARM, but failed when building on x86-64 for
 > x86-64 because the binaries were installed in $$($(2)_WORKSPACE)/bin/.

 > Instead of doing some complicated logic to guess whether Go is going
 > to put our binaries in $$($(2)_WORKSPACE)/bin/ or in
 > $$($(2)_WORKSPACE)/bin/linux_$$(GO_GOARCH), we revert back to using
 > "go build", as it was done before the introduction of the golang
 > package infrastructure. "go build" lets us pass explicitly the
 > destination path of the binary to be generated.

 > There's just one complexity with how to decide on the name of the
 > binary that should be produced, and we have two cases:

 >  - <pkg>_BUILD_TARGETS is the default, i.e ".". In this case we assume
 >    a single binary is produced by "go build", and we name if after the
 >    lower case package name. We allow this to be overridden thanks to
 >    <pkg>_BIN_NAME.

 >  - <pkg>_BUILD_TARGETS is non-default, and typically contains
 >    something like "foo bar" or "cmd/foo cmd/bar". In this case, we
 >    assume the binaries to be produced are "foo" and "bar", i.e we take
 >    the non-directory part of the build target to name the binaries.

 > Because we're using this -o option, we no longer need to explicitly
 > create the binary directory, it is done by "go build".

 > Fixes:

 >   http://autobuild.buildroot.net/results/1f9cd7c48e8c8f41326632a9c0de83915d72c45b/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed after changing the logic to use $(if as suggested by Arnout,
thanks.

-- 
Bye, Peter Korsgaard
