From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 20 Jul 2017 16:08:34 +0200
Subject: [Buildroot] [PATCH v7 2/9] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <6994b7c9-7714-4941-8efc-ffb31f1adbb1@mind.be>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-3-git-send-email-wg@grandegger.com>
 <b381421f-9595-ad2d-defb-f94b7d325c09@mind.be>
 <16f616fc-173d-a201-8342-cda48dc102fe@grandegger.com>
 <a8c548d5-d6d0-53bf-2c6b-17e5a5f3101b@mind.be>
 <75ca9a71-aaf5-dd21-f71f-4bcfc2880faa@grandegger.com>
 <6994b7c9-7714-4941-8efc-ffb31f1adbb1@mind.be>
Message-ID: <ee017453-259f-5e1c-0028-9d3b51b21376@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Am 20.07.2017 um 15:45 schrieb Arnout Vandecappelle:
> 
> 
> On 20-07-17 11:03, Wolfgang Grandegger wrote:
>>      case "${tree}" in
>>          host)
>>              ...
>>              # we always want $ORIGIN-based rpaths to make it relocatable.
> 
>   Perfect. Just please start the sentence with a capital (it ends with a .)

Well, I followed the style of the original script... just to be 
consistent... otherwise we will have an ugly mix.

> 
>>              sanitize_extra_args+=( "--relative-to-file" )
>>              ;;
>>
>>          staging)
>>              ...
>>              # should be like for the target tree below
> 
>   s/like/the same as/
> 
>>              sanitize_extra_args+=( "--no-standard-lib-dirs" )
>>              ;;
>>
>>          target)
>>              ...
>>              # we don't want $ORIGIN-based rpaths but absolute paths without rootdir.
>>              # we also want to remove rpaths pointing to /lib or /usr/lib.
> 
>   Capitalization, otherwise perfect.
> 
> [snip]
>> As I said, the execution time comes form scanning for ELF files. The rest doesn't
>> matter a lot.
> 
>   Instead of the patch you attached, it might actually make more sense to create
> a tiny C file that does this, and execute that as part of the find command. Or
> you could just create support/scripts/elfmagic with those 4 bytes and use "cmp
> -n 4 {} ${0%/*}/elfmagic".

Yes, I had that idea as well and I have already hacked something. The 
problem is that it does not check if it does have an rpath. "cmp" is not 
faster, I already tried!

>   By the way, I believe filtering with -exec is much faster than doing it with
> while/if. Unfortunately you can't use that with patchelf --print-rpath because
> the output of patchelf would be mixed up with the find output.

I already tried various other solutions.

Just preparing v8...

Wolfgang.
