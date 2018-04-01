From: Charles Hardin <charles.hardin@storagecraft.com>
Date: Sun, 1 Apr 2018 22:52:42 +0000
Subject: [Buildroot] [PATCH 1/1] rust: make sure the cxx compiler is
 also set for the target
In-Reply-To: <20180402004857.7e7e46c1@windsurf>
References: <20180228173852.66069-1-charles.hardin@storagecraft.com>
 <20180402004857.7e7e46c1@windsurf>
Message-ID: <F8479AD1-B731-4235-A6C6-A517165DD553@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have a problem where we build on a HOST with x86_64 and RUST
doesn?t realize the difference between the host tool chain and the buildroot
toolchain.

In the old days - we had to patch rust to make a ?x86_64-buildroot-linux-gnu?
target that would be recognized, but the latest patches removed that around
rust 1.9 or so.

This was literally just looking at the logs and seeing the ?cc? was the buildroot
cc and the the cxx was ?c++?, so it is just what we hacked together to get
things to work.

But - definitely need to set ?cxx? in some appropriate fashion for rust to get
compiled correctly.

> On Apr 1, 2018, at 3:48 PM, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> Hello Charles,
> 
> Eric: could you review the patch below ?
> 
> On Wed, 28 Feb 2018 09:38:52 -0800, charles.hardin at storagecraft.com
> wrote:
>> From: Charles Hardin <charles.hardin@storagecraft.com>
>> 
>> Noticed that building the LLVM build -DCMAKE_CXX_COMPILER=c++
>> during the rust build which the C compiler was set to the
>> expected buildroot compiler.
> 
> I am sorry, but I don't understand this sentence. Could you explain in
> more details what is going on ?
> 
>> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
>> index ff2634b996..9ea4c79af5 100644
>> --- a/package/rust/rust.mk
>> +++ b/package/rust/rust.mk
>> @@ -62,7 +62,10 @@ define HOST_RUST_CONFIGURE_CMDS
>> 		echo '[rust]'; \
>> 		echo 'use-jemalloc = $(HOST_RUST_JEMALLOC_ENABLED)'; \
>> 		echo '[target.$(RUSTC_TARGET_NAME)]'; \
>> -		echo 'cc = "$(TARGET_CROSS)gcc"'; \
>> +		if [ "x$(RUSTC_HOST_NAME)" != "x$(RUSTC_TARGET_NAME)" ]; then \
>> +			echo 'cc = "$(TARGET_CROSS)gcc"'; \
>> +			echo 'cxx = "$(TARGET_CROSS)g++"'; \
>> +		fi; \
> 
> This is doing two things:
> 
> 1. Defining cxx, like the commit title says
> 
> 2. Only defining cc and cxx when RUSTC_HOST_NAME and
>    RUSTC_TARGET_NAME, which is not explained anywhere.
> 
> Could you clarify what this patch does, and why it is needed, with a
> better commit log ?
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
