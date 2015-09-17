From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Sep 2015 22:15:46 +0200
Subject: [Buildroot] [PATCH 1/2] Add dependency on bash to gzip for
 runtime
In-Reply-To: <20150917190424.GU11632@tarshish>
References: <1442501193-6059-1-git-send-email-yba@tkos.co.il>
 <20150917150112.GR11632@tarshish>
 <alpine.DEB.2.02.1509171814510.13941@orcam81.orcam.lan>
 <20150917162003.GT11632@tarshish>
 <alpine.DEB.2.02.1509171922410.13941@orcam81.orcam.lan>
 <20150917192315.6db18115@free-electrons.com>
 <20150917190424.GU11632@tarshish>
Message-ID: <20150917221546.247fe210@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Thu, 17 Sep 2015 22:04:24 +0300, Baruch Siach wrote:

> Based on the following snippet from Buildroot top level Makefile I would 
> assume that $(SHELL) is /bin/bash on my host machine:
> 
> # we want bash as shell
> SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
>          else if [ -x /bin/bash ]; then echo /bin/bash; \
>          else echo sh; fi; fi)
> 
> However, 'make printvars' shows
> 
>    SHELL=/bin/sh (/bin/sh)

Here:

SHELL=/bin/bash (/bin/bash)

> $(SHELL) expands to /bin/sh in the gzip Makefile, and generated scripts carry 
> the /bin/sh shebang. I have no idea how.
> 
> As for the original problem, I managed to override the environment $(SHELL) as 
> indicated in the gzip INSTALL file:
> 
>    GZIP_CONF_ENV = CONFIG_SHELL=/bin/bash
> 
> So the right fix, I guess, is just
> 
>    GZIP_CONF_ENV = CONFIG_SHELL=/bin/sh

It is not a completely correct fix. According to
https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/config_002estatus-Invocation.html,
CONFIG_SHELL is:

"""
The shell with which to run configure. It must be Bourne-compatible,
and the absolute name of the shell should be passed. The default is a
shell that supports LINENO if available, and /bin/sh otherwise.
"""

I believe there is no proper way with the current gzip build system to
fix the problem. It is inherently wrong to assume that the $(SHELL)
used on the host will be available on the target. The only sane option
I believe is to have a --with-shell=<foo> option, which if not given
defaults to $(SHELL) to retain the existing behavior.

Another simpler option is to simply add a post-install target hook that
will adjust the shebang of the shell scripts installed by gzip.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
