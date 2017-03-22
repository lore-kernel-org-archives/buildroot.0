From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 21 Mar 2017 17:49:06 -0700
Subject: [Buildroot] [PATCH v2 2/2] python3: Bump version to 3.6.0
In-Reply-To: <20170319155314.3ca86764@free-electrons.com>
References: <20170314234228.3744-1-andrew.smirnov@gmail.com>
 <20170314234228.3744-2-andrew.smirnov@gmail.com>
 <20170319155314.3ca86764@free-electrons.com>
Message-ID: <CAHQ1cqFB2UnahiSC_hL7Enu1L2jtNV7ZGQt7AKMLzCU9tyKwgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 19, 2017 at 7:53 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 14 Mar 2017 16:42:28 -0700, Andrey Smirnov wrote:
>> python3: Bump version to 3.6.0
>
> Thanks for this new version, with updated explanations. It's almost
> ready, but I still have a few comments.
>
>
>> +define PKG_PYTHON_SYSCONFIGDATA_NAME
>> +$(shell basename $(shell find $(TARGET_DIR)/ -name "_sysconfigdata_m_linux_*.pyc" | head -n 1) .pyc)
>> +endef
>
> Could you replace this with:
>
> +PKG_PYTHON_SYSCONFIGDATA_NAME = \
> +       $(basename $(notdir $(wildcard $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata_*.py)))
>
> It does the same, but using make code.

Good idea. Will do.

>
> To be honest, I find it really annoying that we have to do this to find
> the name of the sysconfigdata package. I've thought about the following:
>
>  - Have the Python build system output somewhere the name of the
>    sysconfigdata module that has been generated.
>

Sure, you can do that, but that would mean another custom patch
against CPython's build system which is very likely to break and
require manual intervention next time there's at least a major version
update. After going through all of BR's patches in the process of
rebasing on 3.6 and having to manually fix at least half of them I
didn't want to make the problem worse, so that's why I didn't go that
route.

>  - Compute the name of the sysconfigdata module: it's always going to be:
>
>     sysconfigdata_m_linux_<output of gcc -dumpmachine>
>

I don't think this would work. CPython's build system does not use
-dumpmachine output directly to come up with that suffix and instead
relies on specially crafted dummy .c file and CPP:

https://github.com/python/cpython/blob/master/configure.ac#L762

So for example on my target -dumpmachine would result in
"powerpc-e500v2-linux-gnuspe", where as suffix of sysconfigdata would
be "powerpc-linux-gnuspe".


> But well, your solution is as simple, so let's go for it.
>
>> -Subject: [PATCH] setup.py: do not add invalid header locations
>> +Subject: [PATCH 01/31] setup.py: do not add invalid header locations
>
> Please generate patches with "git format-patch -N" to get rid of the
> numbering, i.e to have [PATCH] instead of [PATCH 01/31].
>

OK, will do.

>
>> --- a/package/python3/0003-Make-the-build-of-pyc-files-conditional.patch
>> +++ b/package/python3/0002-Make-the-build-of-pyc-files-conditional.patch
>> @@ -1,22 +1,24 @@
>> -From 5df8e9556e8026dd19cf932fa8f2b726f56182d1 Mon Sep 17 00:00:00 2001
>> -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> -Date: Wed, 23 Dec 2015 11:29:35 +0100
>> -Subject: [PATCH] Make the build of pyc files conditional
>> +From a3aedafc04a81c5a6406c60e82d072377fee0cd1 Mon Sep 17 00:00:00 2001
>> +From: Andrey Smirnov <andrew.smirnov@gmail.com>
>
> Why are all patches you have changed now re-assigned with your From?
> You should preserve the authorship of the original author.
>

Because I manually applied those patches and committed them in my
local CPython repo and didn't go out of my way to prevent "From" from
being set to committer when I git format-patch'ed them, since the
authorship/copyright information is preserved in "Signed-off-by"
lines. Will change in v3.

>>  # Provided to other packages
>> -PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/
>> +PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/:$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/
>
> Why do we now need
> $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/ ?

Because that's where _sysconfigdata_m_linux_*.pyc file is located.

Thanks,
Andrey Smirnov
