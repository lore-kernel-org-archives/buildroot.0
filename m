From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Tue, 22 Nov 2016 07:44:57 -0800
Subject: [Buildroot] auto-detecting toolchain metadata?
In-Reply-To: <20161122092919.502273aa@free-electrons.com>
References: <c1d1dc6d-c815-1ea2-3de9-13a1da0adaec@mentor.com>
 <20161101184626.GB30593@free.fr>
 <6e24245a-9c73-ea34-e899-f19f16346d0e@mentor.com>
 <20161122092919.502273aa@free-electrons.com>
Message-ID: <ca906326-1a51-56db-7411-dcf5408c9255@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/22/2016 12:29 AM, Thomas Petazzoni wrote:
> On Mon, 21 Nov 2016 17:04:57 -0800, Hollis Blanchard wrote:
>>> with that output to be used as a base defconfig, then that would be
>>> tremendously useful, indeed.
>> My use case is slightly different; I already have a defconfig; I just
>> want this script to replace the toolchain-related bits of it. Would
>> editing defconfig "in place" (e.g. create .defconfig.new, copy it over
>> the original) be acceptable?
> How are you going to filter out all the toolchain-related options from
> the original defconfig? It's not like all of them are prefixed by
> "BR2_TOOLCHAIN" for example. So I hardly see how you can achieve what
> you want in a reliable way.
My defconfig contains this:
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-linux-gnu"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_7=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y

There are no other toolchain-related options (prefixed with 
BR2_TOOLCHAIN or otherwise). Can you elaborate on why I can't just 
replace these?
>> Here's one complexity: once we know the version, which GCC_AT_LEAST_X_Y
>> should be emitted? (Probably the same question for the other "AT_LEAST"
>> variables too.)
>>
>> We could make a new list that matches toolchain/toolchain-common.in, but
>> that will undoubtedly lead to mismatches in the future...
>>
>> We could just auto generate every major/minor version from 4.0 up to
>> <toolchain version>, but then how many minors for each major? 10? That
>> would yield 4.0 -> 4.10, 5.0 -> 5.10, 6.0 -> 6.10, ...
> For gcc versions >= 5, we don't have an option for each minor version.
> So it's actually pretty easy:
>
>   if major < 5:
>     option = BR2_TOOLCHAIN_GCC_AT_LEAST_<major>_<minor>
>   else
>     option = BR2_TOOLCHAIN_GCC_AT_LEAST_<major>
Oops, yeah, I only need to generate the options for defconfig, not 
.config. That will be much easier, thanks. :-)

Hollis Blanchard <hollis_blanchard@mentor.com>
Mentor Graphics Emulation Division
