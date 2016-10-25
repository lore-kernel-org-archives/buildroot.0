From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Oct 2016 11:29:22 +0200
Subject: [Buildroot] [PATCH 00/51] TLP/PPS: intro, package cleanup.
In-Reply-To: <3048503.7rCYbyTDax@sagittea>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <d8e3ec4c46175ca4d852efcfdea65c19@free-electrons.com>
 <c6791be8-032d-f800-0d2d-3b9597d05415@mind.be> <3048503.7rCYbyTDax@sagittea>
Message-ID: <d37629a7-1570-9065-9a3b-5f768761cd2a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-10-16 09:59, J?r?me Pouiller wrote:
> Hello Arnoult,
> 
> On Monday 17 October 2016 18:52:43 Arnout Vandecappelle wrote:
>> On 17-10-16 18:02, Gustavo Zacarias wrote:
>> [snip]
>>
>>> And then there's PPL (Per-Package Logging) since looking at the
>>> output when building TLP makes debugging very hard, so having a
>>> per-package configure/build/install/etc log will make life easier
>>> (with a decent playback when things go bad).
>>
>>  Would be great, but isn't that super-complicated or wouldn't it
>> require major surgery to the infrastructure? You'd need to somehow
>> amend the _CMDS to redirect their output, or run every package in a
>> separate sub-make, or something like that...
> 
> Even if I think it can't be an official solution, some time ago I 
> suggested a hack to redirect output of Buildroot in separate log files:
> 
>   http://lists.busybox.net/pipermail/buildroot/2014-November/112991.html
> 
> I think it should also work with top level parallelization.

 I don't think it will, because $$PPID will be the same make process for all
packages that are built in parallel. So when starting the build of package 1,
you're redirecting to logfile 1; as soon as package 2 starts to build, the
output is redirected to logfile 2, so any new process spawned for package 1 will
also be redirected. It will probably seem to work in many cases, because
_BUILD_CMDS typically contains only a single call to $(MAKE) and that *probably*
gets executed before the hook of package 2 is called. But I think you will get
some occasional weird mixups of different packages.


 But I have thought of a possible approach:

export BR_CURRENT_LOGFILE = $(BUILD_DIR)/$($(PKG)_RAWNAME).log
export SHELL = $(TOPDIR)/support/scripts/shell_logwrapper

and in shell_logwrapper:

exec >> $(BR_CURRENT_LOGFILE) 2>&1
exec /bin/bash "$@"


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
