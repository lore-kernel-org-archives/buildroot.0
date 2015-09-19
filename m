From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Sat, 19 Sep 2015 23:36:47 +0300 (IDT)
Subject: [Buildroot] [PATCH 1/2] Add dependency on bash to gzip for
 runtime
In-Reply-To: <20150917221546.247fe210@free-electrons.com>
References: <1442501193-6059-1-git-send-email-yba@tkos.co.il>
 <20150917150112.GR11632@tarshish>
 <alpine.DEB.2.02.1509171814510.13941@orcam81.orcam.lan>
 <20150917162003.GT11632@tarshish>
 <alpine.DEB.2.02.1509171922410.13941@orcam81.orcam.lan>
 <20150917192315.6db18115@free-electrons.com> <20150917190424.GU11632@tarshish>
 <20150917221546.247fe210@free-electrons.com>
Message-ID: <alpine.DEB.2.11.1509192310350.1987@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
See inline comment below.

On Thu, 17 Sep 2015, Thomas Petazzoni wrote:

> Date: Thu, 17 Sep 2015 22:15:46 +0200
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Baruch Siach <baruch@tkos.co.il>
> Cc: Jonathan Ben Avraham <yba@tkos.co.il>, buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 1/2] Add dependency on bash to gzip for
>     runtime
> 
> Baruch,
>
> On Thu, 17 Sep 2015 22:04:24 +0300, Baruch Siach wrote:
>
>> Based on the following snippet from Buildroot top level Makefile I would
>> assume that $(SHELL) is /bin/bash on my host machine:
>>
>> # we want bash as shell
>> SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
>>          else if [ -x /bin/bash ]; then echo /bin/bash; \
>>          else echo sh; fi; fi)
>>
>> However, 'make printvars' shows
>>
>>    SHELL=/bin/sh (/bin/sh)
>
> Here:
>
> SHELL=/bin/bash (/bin/bash)
>
>> $(SHELL) expands to /bin/sh in the gzip Makefile, and generated scripts carry
>> the /bin/sh shebang. I have no idea how.
>>
>> As for the original problem, I managed to override the environment $(SHELL) as
>> indicated in the gzip INSTALL file:
>>
>>    GZIP_CONF_ENV = CONFIG_SHELL=/bin/bash
>>
>> So the right fix, I guess, is just
>>
>>    GZIP_CONF_ENV = CONFIG_SHELL=/bin/sh
>
> It is not a completely correct fix. According to
> https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/config_002estatus-Invocation.html,
> CONFIG_SHELL is:
>
> """
> The shell with which to run configure. It must be Bourne-compatible,
> and the absolute name of the shell should be passed. The default is a
> shell that supports LINENO if available, and /bin/sh otherwise.
> """
>
> I believe there is no proper way with the current gzip build system to
> fix the problem. It is inherently wrong to assume that the $(SHELL)
> used on the host will be available on the target. The only sane option
> I believe is to have a --with-shell=<foo> option, which if not given
> defaults to $(SHELL) to retain the existing behavior.

If I understand correctly you mean that the correct fix would require 
submitting a patch to the gzip maintainer to add the --with-shell 
configure option. This would not obviate the post-install hook you suggest 
below because we would need a heuristic to use with gzip --with-shell 
option.

> Another simpler option is to simply add a post-install target hook that
> will adjust the shebang of the shell scripts installed by gzip.

In order to do this post-install hook we would need to know the shells 
that the user selected and choose one of them using some heuristic rule 
such as:

1. If the user chose the bash package, then use /bin/bash
2. If the user chose Busybox and not bash then use /bin/ash
3. If the user chose neither Busybox nor bash then use /bin/sh and 
hope for the best

If the user then changes the configuration and un-selects bash we would 
need to cause the gzip package to be re-built.

I wonder if all of this is worth it. IMHO it would be enough to note in 
the gzip package help text that the user might need to adjust the 
hashbangs of the scripts in some post-build script.

  - yba



> Best regards,
>
> Thomas
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
