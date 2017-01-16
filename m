From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Mon, 16 Jan 2017 10:36:25 -0800
Subject: [Buildroot] [RFC] external toolchain scanner
In-Reply-To: <87wpdv9ht6.fsf@dell.be.48ers.dk>
References: <303be768-557b-3b02-c4fd-ae11ec2858ec@mentor.com>
 <8037285d-a8b2-39c9-30c4-cba364583ae9@mentor.com>
 <20161208210228.GA27341@free.fr>
 <df15f689-fb98-5710-6c90-2ee0e5efb0be@mentor.com>
 <c542e7c5-39e9-5d1f-1611-63ad49d26371@mentor.com>
 <20170112173223.GA3716@free.fr>
 <ef0f8d40-903d-1859-aa45-d99b8fe49887@mentor.com>
 <fd01b978-5aea-2794-047c-968c7697b1bb@mind.be>
 <20170116084812.5e7bafeb@free-electrons.com>
 <87wpdv9ht6.fsf@dell.be.48ers.dk>
Message-ID: <35bcfb7d-f5dc-8889-4a55-ee38da545a51@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/16/2017 06:54 AM, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> Hi,
>
>   >> But it's probably best to implement the first scenario and see where we go from
>   >> there.
>
>   > To be honest, I find all of this very complicated, and even more
>   > confusing than what we have today. Using custom external toolchain is
>   > already an "advanced" feature, which users just getting started with
>   > Buildroot are unlikely to use. To me, using custom external toolchain
>   > is a bit of an advanced functionality, and people who need that will
>   > surely be able to understand the information they need to fill in
>   > "menuconfig" to make Buildroot "accept" the toolchain.
>
> Yes, I'm also not really sure what realistic use cases this scripts
> covers.
Sure, I can elaborate.

My team provides target software in binary and source form, which our 
users can rebuild. Our users are accustomed to using an external 
toolchain to rebuild the source, and so already have a toolchain 
installed that they've been using (in some cases for years). In other 
words, using an external toolchain is quite the opposite of "advanced": 
being able to use their known/trusted toolchain is step 1.

So that's perspective #1, for our users. Our team has a different 
perspective (#2): we have target software expertise, but not a lot of 
toolchain expertise. We would prefer to let producers of toolchains 
distribute and maintain them. Given Buildroot's limitations on providing 
host tools (which we've discussed in separate threads), we certainly 
don't want to have Buildroot create an internal toolchain. We can 
probably build and distribute a completely external toolchain (e.g. via 
crosstool-ng), but then we need to a) maintain it and b) convince our 
users that they should use ours instead of the one they've already 
obtained from toolchain people who know what they're doing. :-) That 
creates more work for us, so we don't want that either.

To summarize, our users want to rebuild our source using the toolchain 
of their choice. They don't want a toolchain from us, and we don't want 
to give them a toolchain. Buildroot currently makes this difficult. 
Therefore, I have written a script that will make it easier to use 
arbitrary external toolchains, and since it can help other people too 
I'm offering to contribute it. Right now we are distributing this script 
outside Buildroot, which works for us but doesn't help any other 
Buildroot users.

Hollis Blanchard <hollis_blanchard@mentor.com>
Mentor Graphics Emulation Division
