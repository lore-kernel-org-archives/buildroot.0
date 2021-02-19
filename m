From: Sven Klomp <mail@klomp.eu>
Date: Fri, 19 Feb 2021 14:26:51 +0100
Subject: [Buildroot] GOLANG Compilation Issue: build constraints exclude
 all Go files
In-Reply-To: <3c664bae-5c1b-36cc-4c8b-e65d9af20cab@mind.be>
References: <499ade29-7cfb-99d7-280b-46b58359a7f9@klomp.eu>
 <665eb34c-a700-a00a-dd02-bd958ac120ea@klomp.eu>
 <3c664bae-5c1b-36cc-4c8b-e65d9af20cab@mind.be>
Message-ID: <55c237b8-562c-d44f-ee18-25edced41e9c@klomp.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18.02.21 20:08, Arnout Vandecappelle wrote:
>
>   Without looking at the details, I suspect that this attempts to build a Go
> binary for the host, and then run it to start the build for the target. That
> makes it impossible to pass in environment variables meant for the target.
>
>   If this is just for yourself, you can probably get away with just using
> HOST_GO_COMMON_ENV or HOST_GO_CROSS_ENV instead of HOST_GO_TARGET_ENV - at
> least, if it doesn't need cgo.
>
>   For upstream, however, we would want a proper solution. That probably means
> building the host executable with HOST_GO_HOST_ENV, then "manually" running the
> generated executable with HOST_GO_TARGET_ENV.
>
Thanks for the hints. I got it compiled in two runs as you proposed:

define SYNCTHING_BUILD_CMDS

 ??? cd $(SYNCTHING_SRC_PATH); \
 ????? $(GO_HOST_ENV) \
 ????? GOPATH="$(@D)/$(SYNCTHING_WORKSPACE)" \
 ????? $(SYNCTHING_GO_ENV) \
 ??????? $(GO_BIN) build build.go

 ??? cd $(SYNCTHING_SRC_PATH); \
 ????? $(GO_TARGET_ENV) \
 ????? GOARCH= \
 ????? GO111MODULE=on \
 ????? GOPATH="$(@D)/$(SYNCTHING_WORKSPACE)" \
 ????? $(SYNCTHING_GO_ENV) \
 ??????? ./build -goarch arm -gocmd $(GO_BIN) -version v1.13.1 
-no-upgrade build

endef

However, I had to overwrite GO111MODULE=on which conflicts with the 
statement here:
https://git.busybox.net/buildroot/commit/?id=f7a2870dd1fef9ee41e78ea1bcbb2ec61e82eb67
"It is not desirable to have Go modules enabled in Buildroot in the 
normal case, as Buildroot manages downloading the sources, and third 
party dependency managers are typically not used."

How to handle modules without automatically download it? Syncthing uses 
dozens of modules...

Sven
