From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Wed, 25 Jul 2018 15:10:56 -0700
Subject: [Buildroot] [PATCH 1 of 3] host-acl: build fix on RHEL6 hosts
 (GCC 4.4.7)
In-Reply-To: <20180725231245.7e1e2f99@windsurf>
References: <05bbe42a7a77f46daa8a.1532020842@cveaol6qa08.wv.mentorg.com>
 <20180725231245.7e1e2f99@windsurf>
Message-ID: <a5beffd9-7db4-1836-ba1e-a301a2ac90c6@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/25/2018 02:12 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 19 Jul 2018 10:20:42 -0700, Hollis Blanchard wrote:
>> This didn't introduce any build warnings, FWIW.
>>
>> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
>>
>> diff --git a/package/acl/0001-pragma-gcc-diagnostic-in-fn.patch b/package/acl/0001-pragma-gcc-diagnostic-in-fn.patch
>> new file mode 100644
>> --- /dev/null
>> +++ b/package/acl/0001-pragma-gcc-diagnostic-in-fn.patch
>> @@ -0,0 +1,21 @@
>> +build with old GCC versions
>> +
>> +GCC 4.4.7, as found in RHEL6, reports:
>> +	libacl/acl_from_text.c:307: error: #pragma GCC diagnostic not allowed inside functions
>> +
>> +Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
> Are you sure removing this won't break the build with newer gcc
> versions ?
I've built it with host gcc 6.3.0 and 4.4.7 and saw no warnings in 
either case. (Aside: patchelf refused to build with 6.3.0, so I had to 
manually build that.)

If some toolchain emits a warning on this code, and if the package is 
built with -Werror somehow, I suppose it's possible to break the build. 
If you'd like, I will try relocating the pragma outside the whole 
function, which could only hide more warnings and thus be less likely to 
break the build.
> In any case, for all three of your patches, could you please use Git to
> generate the package patches themselves ? All three packages being
> patched use Git upstream, and we very much like having Git formatted
> patches in this case.
OK.
> However, a larger question is: do you intend to contribute an
> autobuilder that tests Buildroot under RHEL6 ? Indeed, you are fixing
> just the few packages that are useful to you, but if we are going to
> support something as old as RHEL6, then we need to do it properly and
> have an autobuilder running on this distro. Do you think this is
> something that could be done ?
Not certain, but possible. What does it entail, exactly? Do I just have 
to run 
https://git.buildroot.net/buildroot-test/tree/scripts/autobuild-run via 
cron?

Hollis Blanchard
Mentor Graphics Emulation Division
