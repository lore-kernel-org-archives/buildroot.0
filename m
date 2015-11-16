From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Nov 2015 07:32:24 +0100
Subject: [Buildroot] [PATCH v2 1/1] qemu: add patch to fix SSP support
 detection
In-Reply-To: <CABLs7GXiOVap1qiJw4URKFMusfBe6FRuejb9eCHt02aiMz_okQ@mail.gmail.com>
References: <1447280301-9225-1-git-send-email-rprebello@gmail.com>
 <5643CF83.6000800@mind.be>
 <CABLs7GXMFP-vm1tRx1zcQZAsJ+KXUV8JNqxLN+3qPhGbNDL50w@mail.gmail.com>
 <56444B9D.3060501@mind.be>
 <CABLs7GU_RV8FOsFBqPB+Rz8nfHXFUaRF8PQrksk1MsrHQ7b4JA@mail.gmail.com>
 <56458CCD.6030305@mind.be>
 <CABLs7GXiOVap1qiJw4URKFMusfBe6FRuejb9eCHt02aiMz_okQ@mail.gmail.com>
Message-ID: <56497878.6080500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14-11-15 04:32, Rodrigo Rebello wrote:
> Arnout, All,
> 
> 2015-11-13 5:10 GMT-02:00 Arnout Vandecappelle <arnout@mind.be>:
> [snip]
>>>>  I wonder what would happen if LTO were enabled, since in that case the function
>>>> could be elided again...
>>>>
>>>
>>> Indeed, I've run a test with LTO enabled and no stack protection code
>>> gets emitted due to the optimizations. Finding a test code fragment
>>> that works for all possibilities isn't so simple after all.
>>>
>>> Maybe we should stick to the original v1 of this patch which disables
>>> SSP detection when it's known to be unsupported in the toolchain? Far
>>> from perfect, but at least it's more robust.
>>
>>  It would be nicer to find a fundamental upstreamable solution, but yes, the
>> original solution was more robust.
>>
> 
> Well, I've improved on the test code and the new version is not only
> shorter (no need for foo()), but it also works with LTO enabled:
> 
> [snip]
>   cat > $TMPC << EOF
> int main(int argc, char *argv[])
> {
>     char arr[64], *p = arr, *c = argv[0];
>     while (*c) {
>         *p++ = *c++;
>     }
>     return 0;
> }
> EOF

 Yep, this piece of code is perfect, since it _will_ smash the stack (if
strlen(argv[0]) > 64) so the SSP support _must_ be linked in. The only thing
that could happen in some distant future is that the compiler does sufficient
static analysis to detect the problem at compile time and errors out
immediately, but at the moment that's a bit far-fetched.

> [snip]
> 
> As this is more robust than the previous one, I've sent a new patch
> upstream. It's already been reviewed by one person, but not yet
> accepted:
> https://patchwork.ozlabs.org/patch/543357/
> 
> I suspect I should wait for a while before submitting an update to the
> buildroot list. However, given the great amount of patches the QEMU
> project receives every day, I wonder if that will be looked at anytime
> soon (if ever).

 No need to wait to submit it to buildroot IMHO.

> 
> On the other hand, modifying the gcc wrapper to error out on
> -fstack-protector-* when SSP is unsupported is straightforward and
> I've already cooked up a patch for that. I could send it immediately
> and maybe mark this qemu-specific patch as rejected or superseded.

 Yes, please do send that patch. It is however something that will probably only
be applied to next, while the qemu patch can be applied to master, so you should
probably send both of them.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
