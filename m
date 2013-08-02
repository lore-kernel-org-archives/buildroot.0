From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 2 Aug 2013 10:45:19 +0200
Subject: [Buildroot] [PATCH 2 of 4] host-ccache: turn into a proper
	dependency
In-Reply-To: <CAHXCMM+DtuDr4OBq7e5zdj4+pQnu2uOXP9bj_COxt=hWkwre=w@mail.gmail.com>
References: <patchbomb.1375428832@BEANTN0L019720>
 <f72fc9db6ce74195608e.1375428834@BEANTN0L019720>
 <CAHXCMM+DtuDr4OBq7e5zdj4+pQnu2uOXP9bj_COxt=hWkwre=w@mail.gmail.com>
Message-ID: <CAAXf6LXjMKUZ_Q6N9m=cU=30=3eqzUb_bEvyEHgx4+c00etXdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Fri, Aug 2, 2013 at 10:27 AM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Thomas (both), all,
>
> 2013/8/2 Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>:
>> This patch moves the host-ccache build target from BASE_TARGETS in Makefile
>> to an actual host prerequisite in support/dependencies. This causes
>> host-ccache to be built as part of the dependencies, before any real package
>> is built.
>> Since the dependencies are built without ccache anyway, there is no need to
>> set HOST_CCACHE_CONF_ENV anymore.
>>
>> Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Acked-by: Samuel Martin <s.martin49@gmail.com>
>
>>
>> ---
>>
>>  Makefile                             |  4 ----
>>  package/ccache/ccache.mk             |  6 ------
>>  support/dependencies/dependencies.mk |  4 ++++
>>  3 files changed, 4 insertions(+), 10 deletions(-)
>>
>>
>> Note: this in itself works, when the dependencies are built (regular 'make'
>> for example, or explicit 'make dependencies'). However, if we want to
>> supersede patch http://patchwork.ozlabs.org/patch/257372/, that wants
>> the following to work:
>>
>> $ make clean menuconfig
>> $ make {barebox,busybox,ctng,linux,uclibc}-menuconfig
>>
>> then I think something additional is necessary. In the above flow, the
>> dependencies target is never used, so host-ccache doesn't get a chance to
>> build.
> Humm... I don't think so. This patch should be enough to fix the bug #5678.
> I mean, to run *-menuconfig, the package need to be extracted beforehand.
> I expect the 'dependencies' target is part of dependency list of the
> *-extract target (because of host-tar).
> If it's done so, then it's ok tm.

I may be missing something, but I don't see a dependency of *-extract
on 'dependencies'.
Also, I tried the scenario and it doesn't work. The compiler used to
do the linux-menuconfig is with ccache, and it isn't built
automatically, unless you specify 'dependencies' manually.
