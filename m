From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 21 Apr 2020 20:51:40 +0300
Subject: [Buildroot] [PATCH] package/linux-tools: selftests: add numactl
 dependency for net tests
In-Reply-To: <20200411152649.3830039d@windsurf.home>
References: <20200325164240.22747-1-vadim4j@gmail.com>
 <20200411152649.3830039d@windsurf.home>
Message-ID: <20200421175140.n5l3vn7rh642widp@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Apr 11, 2020 at 03:26:49PM +0200, Thomas Petazzoni wrote:
> Hello Vadym,
> 
> On Wed, 25 Mar 2020 18:42:40 +0200
> Vadym Kochan <vadim4j@gmail.com> wrote:
> 
> > Linux selftests/net/reuseport_bpf_numa.c requires numa.h header which
> > is provided by numactl package. Otherwise net tests are failed to
> > install.
> > 
> > Signed-off-by: Vadym Kochan <vadim4j@gmail.com>
> 
> Thanks for your patch. However, I think this is not going in the right
> direction. Indeed, the selftests have many more dependencies:
> 
>  - The BPF tests need libcap and libelf
> 
>  - The gpio tests require libmount from util-linux
> 
>  - The memfd tests require fuse
> 
>  - The netfilter tests require libmnl
> 
> etc.
> 
> So, I think we should:
> 
>  - Pass FORCE_TARGETS=1 during the build so that the build aborts if a
>    required dependency is not found.
> 
>  - Switch to using more optional dependencies, and disable the TARGETS
>    that we cannot build by passing the appropriate SKIP_TARGETS value
>    to the Makefile.
> 
> Could you work on this ? We probably need to make libcap-ng optional,
> but also popt. The other options that are selected by
> BR2_PACKAGE_LINUX_TOOLS_SELFTESTS might also need to be revisited.
> 
> An alternative is to just say that we don't care about making all of
> that optional, and simply unconditionally enable all the dependencies
> that selftests need, to build everything. Easier, but that's not the
> normal Buildroot design principle.
> 
> Best regards,
> 
> Thomas

Yes, I understand your point. I think it would be useful to add config
options per each selftests subsystem to easy turn it on.

Regards,
Vadym Kochan
