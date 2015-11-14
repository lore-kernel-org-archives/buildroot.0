From: Rodrigo Rebello <rprebello@gmail.com>
Date: Sat, 14 Nov 2015 01:32:05 -0200
Subject: [Buildroot] [PATCH v2 1/1] qemu: add patch to fix SSP support
	detection
In-Reply-To: <56458CCD.6030305@mind.be>
References: <1447280301-9225-1-git-send-email-rprebello@gmail.com>
 <5643CF83.6000800@mind.be>
 <CABLs7GXMFP-vm1tRx1zcQZAsJ+KXUV8JNqxLN+3qPhGbNDL50w@mail.gmail.com>
 <56444B9D.3060501@mind.be>
 <CABLs7GU_RV8FOsFBqPB+Rz8nfHXFUaRF8PQrksk1MsrHQ7b4JA@mail.gmail.com>
 <56458CCD.6030305@mind.be>
Message-ID: <CABLs7GXiOVap1qiJw4URKFMusfBe6FRuejb9eCHt02aiMz_okQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

2015-11-13 5:10 GMT-02:00 Arnout Vandecappelle <arnout@mind.be>:
[snip]
>>>  I wonder what would happen if LTO were enabled, since in that case the function
>>> could be elided again...
>>>
>>
>> Indeed, I've run a test with LTO enabled and no stack protection code
>> gets emitted due to the optimizations. Finding a test code fragment
>> that works for all possibilities isn't so simple after all.
>>
>> Maybe we should stick to the original v1 of this patch which disables
>> SSP detection when it's known to be unsupported in the toolchain? Far
>> from perfect, but at least it's more robust.
>
>  It would be nicer to find a fundamental upstreamable solution, but yes, the
> original solution was more robust.
>

Well, I've improved on the test code and the new version is not only
shorter (no need for foo()), but it also works with LTO enabled:

[snip]
  cat > $TMPC << EOF
int main(int argc, char *argv[])
{
    char arr[64], *p = arr, *c = argv[0];
    while (*c) {
        *p++ = *c++;
    }
    return 0;
}
EOF
[snip]

As this is more robust than the previous one, I've sent a new patch
upstream. It's already been reviewed by one person, but not yet
accepted:
https://patchwork.ozlabs.org/patch/543357/

I suspect I should wait for a while before submitting an update to the
buildroot list. However, given the great amount of patches the QEMU
project receives every day, I wonder if that will be looked@anytime
soon (if ever).

On the other hand, modifying the gcc wrapper to error out on
-fstack-protector-* when SSP is unsupported is straightforward and
I've already cooked up a patch for that. I could send it immediately
and maybe mark this qemu-specific patch as rejected or superseded.

Thoughts?

Regards,
Rodrigo

>>
>>>  To solve this fundamentally in buildroot, perhaps we should patch the gcc
>>> wrapper to fail when -fstack-protector-* is passed when SSP is not enabled.
>>>
>>
>> Yes, that would be nice since it would serve as a solution to many
>> other similar SSP detection failure cases. Perhaps I should look into
>> that? Or wait until more people provide their views on this?
>
>  Feel free to look into that. It shouldn't be too hard, we're already iterating
> over all the arguments in the wrapper so you have an example of how to do it.
> Just exit(1) immediately when you encounter an option that is not allowed.
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
