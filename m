From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:50:03 +0200
Subject: [Buildroot] [PATCH 1/2] kconfig: added support for optional
 file sourcing
In-Reply-To: <1467711737-5651-1-git-send-email-david.corvoysier@intel.com>
References: <1467711737-5651-1-git-send-email-david.corvoysier@intel.com>
Message-ID: <20160718235003.31c301d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jul 2016 11:42:16 +0200, David Corvoysier wrote:
> Following the GNU Make pattern for sourcing files, add a new '-source'
> keyword that will fail silently if the target file does not exist.
> 
> The goal is to ease the 'external' extension process, removing for
> instance the need for a dummy external Config.in:
> 
> -source "$BR2_EXTERNAL/Config.in"
> 
> The _shipped versions of bison, flex and gperf zconf files have been
> regenerated with the following commands:
> 
> flex -ozconf.lex.ci_shipped -L -P zconf ./zconf.l
> bison -ozconf.tab.c_shipped -t -l -p zconf ./zconf.y
> gperf -t --output-file ./zconf.hash.c_shipped -a -C -E -g -k '1,3,$' -p
> -t ./zconf.gperf
> 
> Some of these files have also been edited manually to match the Linux
> tree paths.
> 
> Signed-off-by: David Corvoysier <david.corvoysier@intel.com>

Thanks for your contribution. However, we really want to avoid adding
our own features to the kconfig code base, as it makes it harder to
sync the kconfig code base from the Linux kernel original copy.

Moreover, specifically regarding the need of a dummy Config.in file for
BR2_EXTERNAL, this is something that may very well disappear in the
future when we'll merge the multi-BR2_EXTERNAL support. With
multi-BR2_EXTERNAL support, a snippet of Config.in is generated to
include the relevant BR2_EXTERNAL Config.in files, which removes the
need for this dummy Config.in.

So unless there is a better argument for adding the -source keyword,
and a hope that it gets merged upstream in the Linux kernel, I'd prefer
to not take those patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
