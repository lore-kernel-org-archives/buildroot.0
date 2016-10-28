From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Fri, 28 Oct 2016 18:25:10 -0300
Subject: [Buildroot] [PATCH 00/51] TLP/PPS: intro, package cleanup.
In-Reply-To: <d37629a7-1570-9065-9a3b-5f768761cd2a@mind.be>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <d8e3ec4c46175ca4d852efcfdea65c19@free-electrons.com>
 <c6791be8-032d-f800-0d2d-3b9597d05415@mind.be> <3048503.7rCYbyTDax@sagittea>
 <d37629a7-1570-9065-9a3b-5f768761cd2a@mind.be>
Message-ID: <40a7e360-8c7e-0e25-53fd-d4d3c84989a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/10/16 06:29, Arnout Vandecappelle wrote:

>  I don't think it will, because $$PPID will be the same make process for all
> packages that are built in parallel. So when starting the build of package 1,
> you're redirecting to logfile 1; as soon as package 2 starts to build, the
> output is redirected to logfile 2, so any new process spawned for package 1 will
> also be redirected. It will probably seem to work in many cases, because
> _BUILD_CMDS typically contains only a single call to $(MAKE) and that *probably*
> gets executed before the hook of package 2 is called. But I think you will get
> some occasional weird mixups of different packages.
>
>
>  But I have thought of a possible approach:
>
> export BR_CURRENT_LOGFILE = $(BUILD_DIR)/$($(PKG)_RAWNAME).log
> export SHELL = $(TOPDIR)/support/scripts/shell_logwrapper

Hi Arnout.
I'd use $($(PKG)_NAME).log or you risk the host/target packages writing 
the same log file at the same time, besides a single file being more 
"noisy".

> and in shell_logwrapper:
>
> exec >> $(BR_CURRENT_LOGFILE) 2>&1
> exec /bin/bash "$@"

This generally results in a forkbomb, it should work, but it doesn't :)
Using exec file descriptor copying results in the same forkbomb.
But i've got an alternative, RFC/test patchset incoming.

Regards.
