From: Sven Klomp <mail@klomp.eu>
Date: Thu, 18 Feb 2021 14:29:37 +0100
Subject: [Buildroot] GOLANG Compilation Issue: build constraints exclude
 all Go files
In-Reply-To: <499ade29-7cfb-99d7-280b-46b58359a7f9@klomp.eu>
References: <499ade29-7cfb-99d7-280b-46b58359a7f9@klomp.eu>
Message-ID: <665eb34c-a700-a00a-dd02-bd958ac120ea@klomp.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

On 12.02.21 10:18, Sven Klomp wrote:
> can't load package: package github.com/syncthing/syncthing: build 
> constraints exclude all Go files in 
> /[...]/build/syncthing-1.13.1/_gopath/src/github.com/syncthing/syncthing

With some help from the Syncthing forum I came to the conclusion, that 
"golang-package" tries to compile the source with "go build" whereas 
Syncthing requires "go run build.do -arch arm build".

Thus, I define SYNCTHING_BUILD_CMDS
 ??? define SYNCTHING_BUILD_CMDS
 ??? ??? cd $(SYNCTHING_SRC_PATH); \
 ??? ??? $(GO_TARGET_ENV) \
 ??? ??? $(GO_BIN) run build.go build
 ??? endef

However, this fails with:
 ??? fork/exec /tmp/go-build567270573/b001/exe/build: exec format error

This error is somehow related to the environment variable "GOARCH=arm" 
introduced by $(GO_TARGET_ENV).

Best regards
