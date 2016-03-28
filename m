From: Mason <slash.tmp@free.fr>
Date: Mon, 28 Mar 2016 14:49:04 +0200
Subject: [Buildroot] [PATCH] ltp-testsuite: build kernel modules when
 appropriate
In-Reply-To: <20160324222555.21f04320@free-electrons.com>
References: <56F3F393.6020407@free.fr>
 <20160324222555.21f04320@free-electrons.com>
Message-ID: <56F92840.9090206@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/03/2016 22:25, Thomas Petazzoni wrote:

> On Thu, 24 Mar 2016 15:02:59 +0100, Mason wrote:
>
>> +ifeq ($(BR2_LINUX_KERNEL),y)
>> +LTP_TESTSUITE_DEPENDENCIES += linux
>> +LTP_TESTSUITE_CONF_OPTS += --with-linux-dir=$(LINUX_DIR)
>> +else
>> +LTP_TESTSUITE_CONF_OPTS += --without-modules
>> +endif
> 
> It looks good in principle, but unfortunately in practice it doesn't
> work. Try to build the following configuration: [snip]
> 
> And you will see that the LTP kernel modules are not built. And the
> reason is that it tries to build them without passing the appropriate
> ARCH= variable, so it falls back to x86, and therefore fails to build
> them. Here is what I see: [snip]
> 
> And then lots and lots of errors about arch/x86 related headers. And
> indeed, my kernel is configured/built for ARM.
> 
> So maybe it worked if you tested for a x86 target, but I'm a bit
> confused since I know you're working on ARM stuff. Maybe you have
> ARCH=arm defined globally in your environment and therefore it makes
> things work?

Yes, you hit the nail on the head. Since I work exclusively with
ARM platforms, I have ARCH=arm exported in my environment.

> Could you look into this and send an updated patch?

I'm not sure what the correct solution is. We discussed the issue
a few days ago, and you mentioned KERNEL_ARCH.

Should I just export ARCH=$(KERNEL_ARCH) in the environment?

But I'm not sure how to do it globally, or whether that is the
appropriate solution... Could someone provide some guidance?

Regards.
