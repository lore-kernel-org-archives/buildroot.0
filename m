From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Feb 2021 20:08:11 +0100
Subject: [Buildroot] GOLANG Compilation Issue: build constraints exclude
 all Go files
In-Reply-To: <665eb34c-a700-a00a-dd02-bd958ac120ea@klomp.eu>
References: <499ade29-7cfb-99d7-280b-46b58359a7f9@klomp.eu>
 <665eb34c-a700-a00a-dd02-bd958ac120ea@klomp.eu>
Message-ID: <3c664bae-5c1b-36cc-4c8b-e65d9af20cab@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/02/2021 14:29, Sven Klomp wrote:
> Hello
> 
> On 12.02.21 10:18, Sven Klomp wrote:
>> can't load package: package github.com/syncthing/syncthing: build constraints
>> exclude all Go files in
>> /[...]/build/syncthing-1.13.1/_gopath/src/github.com/syncthing/syncthing
> 
> With some help from the Syncthing forum I came to the conclusion, that
> "golang-package" tries to compile the source with "go build" whereas Syncthing
> requires "go run build.do -arch arm build".
> 
> Thus, I define SYNCTHING_BUILD_CMDS
> ??? define SYNCTHING_BUILD_CMDS
> ??? ??? cd $(SYNCTHING_SRC_PATH); \
> ??? ??? $(GO_TARGET_ENV) \
> ??? ??? $(GO_BIN) run build.go build
> ??? endef
> 
> However, this fails with:
> ??? fork/exec /tmp/go-build567270573/b001/exe/build: exec format error

 Without looking at the details, I suspect that this attempts to build a Go
binary for the host, and then run it to start the build for the target. That
makes it impossible to pass in environment variables meant for the target.

 If this is just for yourself, you can probably get away with just using
HOST_GO_COMMON_ENV or HOST_GO_CROSS_ENV instead of HOST_GO_TARGET_ENV - at
least, if it doesn't need cgo.

 For upstream, however, we would want a proper solution. That probably means
building the host executable with HOST_GO_HOST_ENV, then "manually" running the
generated executable with HOST_GO_TARGET_ENV.

 Regards,
 Arnout


> 
> This error is somehow related to the environment variable "GOARCH=arm"
> introduced by $(GO_TARGET_ENV).
> 
> Best regards
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
