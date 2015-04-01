From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Wed, 01 Apr 2015 22:24:15 +0200
Subject: [Buildroot] [PATCH 1/1] build host lz4 to support lz4
 compression in the kernel.
In-Reply-To: <20150401150237.4cabd12a@free-electrons.com>
References: <1427884257-20151-1-git-send-email-sagaert.johan@proximus.be>
 <20150401133722.6d6ab6c9@free-electrons.com> <551BE3C2.8020508@proximus.be>
 <20150401150237.4cabd12a@free-electrons.com>
Message-ID: <551C53EF.6070806@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas ,
Posted v2 patch minutes ago.

Thomas Petazzoni schreef op 1/04/2015 om 15:02:

> Dear Johan Sagaert,
>
> On Wed, 01 Apr 2015 14:25:38 +0200, Johan Sagaert wrote:
>
>>> I think it's time to add some Config.in options in linux/Config.in to
>>> select the compression tools to be made available, and enforce their
>>> usage/availability in the Linux .config file. It is annoying to bvuild
>>> host-lzop and host-lz4 every time you're building a kernel if you don't
>>> care about those compressions algos.
>> I am not sure if all kernel releases have the lz4 compression option, so
>> this
>> seemed the most simple solution, lz4 is not taking large resources in
>> terms of build time
>> This works fine for me now.
> Yes, it works. But everyone now needs to build host-lzop and host-lz4
> before building a kernel even if they don't work.
>
>> Not sure about this : could host-lz4 be build in a kernel_pre_build hook ?
>> checking the kernels .config  before the kernel build starts.
> Unfortunately, no. The dependencies have to be known before the kernel
> configuration is generated.
Changed the patch so that host-lz4 is only build when the target is ARM .
That should reduce clutter.
If some make expert could show me how to use the LINUX_VERSION_PROBED 
variable
to check for >=3.11 it would further reduce unneeded builds.
>> I don't want lz4 on the target , that is why i have done it this way,
>> lz4 that can be selected via the menu
>> if needed on the target , and a host-lz4 that is always build when
>> building a kernel.
>> Sent me your suggestion, and i will try to fix this patch. (have to do
>> all buildroot patchwork in free-time )
> Just don't do *any* change to the lz4 package. Add your host-lz4
> dependency to LINUX_DEPENDENCIES, and this is enough. It will only
> build the host variant of lz4. The target variant will only be built if
> BR2_PACKAGE_LZ4 is enabled in your Buildroot .config.
>
> You seem to believe that because the target and host variant of lz4 are
> implemented in the same .mk file, both of them are always built
> together. But this is not the case. Even with both defined in the
> same .mk file, it perfectly supports building only the host variant,
> only the target variant, or both.
>
> So your change to lz4.mk and creating a host-lz4.mk is completely
> unnecessary.
Yes, i was in this misconception.

> Best regards,
>
> Thomas

Best Regards , Johan
