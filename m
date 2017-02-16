From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 16 Feb 2017 09:36:28 +0100
Subject: [Buildroot] [PATCH v3 2/5] package: add generic support for lz
	archives
In-Reply-To: <20170215221520.41e4c66e@free-electrons.com>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
 <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
 <20170215221520.41e4c66e@free-electrons.com>
Message-ID: <CAAXf6LXLKBVDDoU6QcqspBnaQm2-wrWtP50Ot5knU0=oLwz62w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 15, 2017 at 10:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun, 12 Feb 2017 22:15:39 +0200, Baruch Siach wrote:
>
>> diff --git a/Makefile b/Makefile
>> index df3b64eb03ec..b4550e098958 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -431,6 +431,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
>>  ZCAT := $(call qstrip,$(BR2_ZCAT))
>>  BZCAT := $(call qstrip,$(BR2_BZCAT))
>>  XZCAT := $(call qstrip,$(BR2_XZCAT))
>> +LZCAT := $(call qstrip,$(BR2_LZCAT))
>
> So here, we use the value of the config option BR2_LZCAT.
>
>> diff --git a/support/dependencies/check-host-lzip.mk b/support/dependencies/check-host-lzip.mk
>> new file mode 100644
>> index 000000000000..708105acd892
>> --- /dev/null
>> +++ b/support/dependencies/check-host-lzip.mk
>> @@ -0,0 +1,5 @@
>> +ifeq (,$(call suitable-host-package,lzip,$(LZCAT)))
>> +DEPENDENCIES_HOST_PREREQ += host-lzip
>> ++EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .lz
>> +LZCAT = $(HOST_DIR)/usr/bin/lzip -d -c
>
> But here in the case where we are building our own host-lzip, we
> completely ignore BR2_LZCAT, and use a hardcoded
> $(HOST_DIR)/usr/bin/lzip -d -c.
>
> Since there is already the exact same pattern for XZCAT, I decided to
> apply your patch anyway. I also don't really understand the use case
> for all those BR2_ZCAT, BR2_BZCAT, BR2_XZCAT, etc. config options.
> Peter, maybe you can shed some light on why we have these?

The background for the xzcat case is **drumroll** old RHEL machines
which do not have xz.
If the host does have xzcat, then the definition of XZCAT from the
config is used.
If the host does NOT have xzcat, then buildroot is instructed to build
it for us, as a host package, and the result will be set in
$(HOST_DIR)/usr/bin/. This is the reason for the 'hardcoded' path. In
this scenario, the variable XZCAT from Makefile does not point to
something valid.

The reason why in general we have config options for some tools like
git, zcat, etc. is to let the user decide what they should be. This is
not only to be able to add certain options, but also because the user
may want to point to a differently named tool with the same behavior.
We can argue that this is too much flexibility and the user could just
as well use a custom wrapper added in PATH.

I personally don't use the flexibility of the config options, but I do
rely on the host-xzcat handling.

>
> Also Baruch: there was one too many "+" at the beginning of:
>
>> ++EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .lz
>
> so I've fixed that before applying.

Sorry, I also missed that in my review...

/Thomas
